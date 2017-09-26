From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v2 08/14] platform/x86: dell-smbios: Introduce a WMI-ACPI interface
Date: Tue, 26 Sep 2017 13:50:06 -0500
Message-ID: <7c68f8592eaccecb599a5b21b97b9db5a79a0053.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

The driver currently uses an SMI interface which grants direct access
to physical memory to the platform via a pointer.

Now add a WMI-ACPI interface that is detected by WMI probe and preferred
over the SMI interface.

Changing this to operate over WMI-ACPI will use an ACPI OperationRegion
for a buffer of data storage when platform calls are performed.

This is a safer approach to use in kernel drivers as the platform will
only have access to that OperationRegion.

As a result, this change removes the dependency on this driver on the
dcdbas kernel module.  It's now an optional compilation option.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/Kconfig       |   8 +-
 drivers/platform/x86/dell-smbios.c | 150 ++++++++++++++++++++++++++++++-------
 drivers/platform/x86/dell-smbios.h |  15 +++-
 3 files changed, 140 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9e52f05daa2e..81d61c0f4ef8 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -92,13 +92,13 @@ config ASUS_LAPTOP
 	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
 
 config DELL_SMBIOS
-	tristate
-	select DCDBAS
+	tristate "Dell WMI SMBIOS calling interface"
+	depends on ACPI_WMI
 	---help---
 	This module provides common functions for kernel modules using
-	Dell SMBIOS.
+	Dell SMBIOS over ACPI-WMI.
 
-	If you have a Dell laptop, say Y or M here.
+	If you have a Dell computer, say Y or M here.
 
 config DELL_LAPTOP
 	tristate "Dell Laptop Extras"
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index 579be67de2a3..1fbc40791a48 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -4,6 +4,7 @@
  *  Copyright (c) Red Hat <mjg@redhat.com>
  *  Copyright (c) 2014 Gabriele Mazzotta <gabriele.mzt@gmail.com>
  *  Copyright (c) 2014 Pali Rohár <pali.rohar@gmail.com>
+ *  Copyright (c) 2017 Dell Inc.
  *
  *  Based on documentation in the libsmbios package:
  *  Copyright (C) 2005-2014 Dell Inc.
@@ -19,9 +20,15 @@
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
-#include "../../firmware/dcdbas.h"
+#include <linux/wmi.h>
 #include "dell-smbios.h"
 
+#ifdef CONFIG_DCDBAS
+#include "../../firmware/dcdbas.h"
+#endif
+
+#define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
+
 struct calling_interface_structure {
 	struct dmi_header header;
 	u16 cmdIOAddress;
@@ -30,12 +37,14 @@ struct calling_interface_structure {
 	struct calling_interface_token tokens[];
 } __packed;
 
-static struct calling_interface_buffer *buffer;
+static struct calling_interface_buffer *smi_buffer;
+static struct wmi_calling_interface_buffer *wmi_buffer;
 static DEFINE_MUTEX(buffer_mutex);
 
 static int da_command_address;
 static int da_command_code;
 static int da_num_tokens;
+static int has_wmi;
 static struct calling_interface_token *da_tokens;
 
 int dell_smbios_error(int value)
@@ -57,13 +66,20 @@ struct calling_interface_buffer *dell_smbios_get_buffer(void)
 {
 	mutex_lock(&buffer_mutex);
 	dell_smbios_clear_buffer();
-	return buffer;
+	if (has_wmi)
+		return &wmi_buffer->smi;
+	return smi_buffer;
 }
 EXPORT_SYMBOL_GPL(dell_smbios_get_buffer);
 
 void dell_smbios_clear_buffer(void)
 {
-	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	if (has_wmi)
+		memset(wmi_buffer, 0,
+		       sizeof(struct wmi_calling_interface_buffer));
+	else
+		memset(smi_buffer, 0,
+		       sizeof(struct calling_interface_buffer));
 }
 EXPORT_SYMBOL_GPL(dell_smbios_clear_buffer);
 
@@ -73,20 +89,60 @@ void dell_smbios_release_buffer(void)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_release_buffer);
 
-void dell_smbios_send_request(int class, int select)
+int run_wmi_smbios_call(struct wmi_calling_interface_buffer *buf)
 {
-	struct smi_cmd command;
+	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
+	struct acpi_buffer input;
+	union acpi_object *obj;
+	acpi_status status;
+
+	input.length = sizeof(struct wmi_calling_interface_buffer);
+	input.pointer = buf;
+
+	status = wmi_evaluate_method(DELL_WMI_SMBIOS_GUID,
+				     0, 1, &input, &output);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%x/%x [%x,%x,%x,%x] call failed\n",
+			buf->smi.class, buf->smi.select,
+			buf->smi.input[0], buf->smi.input[1],
+			buf->smi.input[2], buf->smi.input[3]);
+			return -EIO;
+	}
+	obj = (union acpi_object *)output.pointer;
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		pr_err("invalid type : %d\n", obj->type);
+		return -EIO;
+	}
+	memcpy(buf, obj->buffer.pointer, input.length);
 
-	command.magic = SMI_CMD_MAGIC;
-	command.command_address = da_command_address;
-	command.command_code = da_command_code;
-	command.ebx = virt_to_phys(buffer);
-	command.ecx = 0x42534931;
+	return 0;
+}
 
-	buffer->class = class;
-	buffer->select = select;
+void dell_smbios_send_request(int class, int select)
+{
+	if (has_wmi) {
+		wmi_buffer->smi.class = class;
+		wmi_buffer->smi.select = select;
+		run_wmi_smbios_call(wmi_buffer);
+	}
 
-	dcdbas_smi_request(&command);
+#ifdef CONFIG_DCDBAS
+	else {
+		if (!smi_buffer)
+			return;
+		struct smi_cmd command;
+
+		smi_buffer->class = class;
+		smi_buffer->select = select;
+		command.magic = SMI_CMD_MAGIC;
+		command.command_address = da_command_address;
+		command.command_code = da_command_code;
+		command.ebx = virt_to_phys(smi_buffer);
+		command.ecx = 0x42534931;
+
+		dcdbas_smi_request(&command);
+	}
+#endif
 }
 EXPORT_SYMBOL_GPL(dell_smbios_send_request);
 
@@ -167,10 +223,45 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
 	}
 }
 
-static int __init dell_smbios_init(void)
+static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 {
-	int ret;
+	/* WMI buffer should be 32k */
+	wmi_buffer = (void *)__get_free_pages(GFP_KERNEL, 3);
+	if (!wmi_buffer)
+		return -ENOMEM;
+
+#ifdef CONFIG_DCDBAS
+	/* no longer need the SMI page */
+	free_page((unsigned long)smi_buffer);
+	smi_buffer = NULL;
+#endif
+
+	has_wmi = 1;
+	return 0;
+}
+
+static int dell_smbios_wmi_remove(struct wmi_device *wdev)
+{
+	free_pages((unsigned long)wmi_buffer, 3);
+	return 0;
+}
+
+static const struct wmi_device_id dell_smbios_wmi_id_table[] = {
+	{ .guid_string = DELL_WMI_SMBIOS_GUID },
+	{ },
+};
 
+static struct wmi_driver dell_wmi_smbios_driver = {
+	.driver = {
+		.name = "dell-smbios",
+	},
+	.probe = dell_smbios_wmi_probe,
+	.remove = dell_smbios_wmi_remove,
+	.id_table = dell_smbios_wmi_id_table,
+};
+
+static int __init dell_smbios_init(void)
+{
 	dmi_walk(find_tokens, NULL);
 
 	if (!da_tokens)  {
@@ -178,34 +269,41 @@ static int __init dell_smbios_init(void)
 		return -ENODEV;
 	}
 
+#ifdef CONFIG_DCDBAS
 	/*
 	 * Allocate buffer below 4GB for SMI data--only 32-bit physical addr
 	 * is passed to SMI handler.
 	 */
-	buffer = (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
-	if (!buffer) {
-		ret = -ENOMEM;
-		goto fail_buffer;
+	smi_buffer = (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
+#else
+	smi_buffer = NULL;
+#endif
+	wmi_driver_register(&dell_wmi_smbios_driver);
+
+	if (!smi_buffer && !has_wmi) {
+		kfree(da_tokens);
+		return -ENOMEM;
 	}
-
 	return 0;
-
-fail_buffer:
-	kfree(da_tokens);
-	return ret;
 }
 
 static void __exit dell_smbios_exit(void)
 {
 	kfree(da_tokens);
-	free_page((unsigned long)buffer);
+#ifdef CONFIG_DCDBAS
+	if (!has_wmi)
+		free_page((unsigned long)smi_buffer);
+#endif
+	wmi_driver_unregister(&dell_wmi_smbios_driver);
 }
 
 subsys_initcall(dell_smbios_init);
 module_exit(dell_smbios_exit);
 
+
 MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
 MODULE_AUTHOR("Gabriele Mazzotta <gabriele.mzt@gmail.com>");
 MODULE_AUTHOR("Pali Rohár <pali.rohar@gmail.com>");
+MODULE_AUTHOR("Mario Limonciello <mario.limonciello@dell.com>");
 MODULE_DESCRIPTION("Common functions for kernel modules using Dell SMBIOS");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index 45cbc2292cd3..2f6fce81ee69 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -4,6 +4,7 @@
  *  Copyright (c) Red Hat <mjg@redhat.com>
  *  Copyright (c) 2014 Gabriele Mazzotta <gabriele.mzt@gmail.com>
  *  Copyright (c) 2014 Pali Rohár <pali.rohar@gmail.com>
+ *  Copyright (c) 2017 Dell Inc.
  *
  *  Based on documentation in the libsmbios package:
  *  Copyright (C) 2005-2014 Dell Inc.
@@ -18,9 +19,10 @@
 
 struct notifier_block;
 
-/* This structure will be modified by the firmware when we enter
- * system management mode, hence the volatiles */
-
+/* If called through fallback SMI rather than WMI this structure will be
+ * modified by the firmware when we enter system management mode, hence the
+ * volatiles
+ */
 struct calling_interface_buffer {
 	u16 class;
 	u16 select;
@@ -28,6 +30,13 @@ struct calling_interface_buffer {
 	volatile u32 output[4];
 } __packed;
 
+struct wmi_calling_interface_buffer {
+	struct calling_interface_buffer smi;
+	u32 argattrib;
+	u32 blength;
+	u8 data[32724];
+} __packed;
+
 struct calling_interface_token {
 	u16 tokenID;
 	u16 location;
-- 
2.14.1
