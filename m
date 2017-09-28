From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v3 2/8] platform/x86: dell-smbios: Introduce a WMI-ACPI interface
Date: Wed, 27 Sep 2017 23:02:14 -0500
Message-ID: <7b632baafbfdc6c55c4d56225c54fd441b747286.1506571188.git.mario.limonciello@dell.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506571187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506571187.git.mario.limonciello@dell.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

The driver currently uses an SMI interface which grants direct access
to physical memory to the firmware SMM methods via a pointer.

Now add a WMI-ACPI interface that is detected by WMI probe and preferred
over the SMI interface.

Changing this to operate over WMI-ACPI will use an ACPI OperationRegion
for a buffer of data storage when SMM calls are performed.

This is a safer approach to use in kernel drivers as the SMM will
only have access to that OperationRegion.

As a result, this change removes the dependency on this driver on the
dcdbas kernel module.  It's now an optional compilation option.

When modifying this, add myself to MAINTAINERS.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 MAINTAINERS                        |   6 ++
 drivers/platform/x86/Kconfig       |  14 ++--
 drivers/platform/x86/dell-smbios.c | 128 ++++++++++++++++++++++++++++++++-----
 drivers/platform/x86/dell-smbios.h |  15 ++++-
 4 files changed, 138 insertions(+), 25 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08b96f77f618..6d76b09f46cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3990,6 +3990,12 @@ S:	Maintained
 F:	drivers/hwmon/dell-smm-hwmon.c
 F:	include/uapi/linux/i8k.h
 
+DELL SMBIOS DRIVER
+M:	Pali Rohár <pali.rohar@gmail.com>
+M:	Mario Limonciello <mario.limonciello@dell.com>
+S:	Maintained
+F:	drivers/platform/x86/dell-smbios.*
+
 DELL SYSTEMS MANAGEMENT BASE DRIVER (dcdbas)
 M:	Doug Warzecha <Douglas_Warzecha@dell.com>
 S:	Maintained
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 1f7959ff055c..415886d7a857 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -92,13 +92,17 @@ config ASUS_LAPTOP
 	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
 
 config DELL_SMBIOS
-	tristate
-	select DCDBAS
+	tristate "Dell SMBIOS calling interface"
+	depends on ACPI_WMI
 	---help---
-	This module provides common functions for kernel modules using
-	Dell SMBIOS.
+	This module provides common functions for kernel modules and
+        userspace using Dell SMBIOS.
+
+	If you have a Dell computer, say Y or M here.
 
-	If you have a Dell laptop, say Y or M here.
+	If you have a machine from < 2007 without a WMI interface you
+	may also want to enable CONFIG_DCDBAS to allow this driver to
+	work.
 
 config DELL_LAPTOP
 	tristate "Dell Laptop Extras"
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index e9b1ca07c872..4472817ee045 100644
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
@@ -22,9 +23,15 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/io.h>
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
@@ -33,12 +40,14 @@ struct calling_interface_structure {
 	struct calling_interface_token tokens[];
 } __packed;
 
-static struct calling_interface_buffer *buffer;
+static void *buffer;
+static size_t bufferlen;
 static DEFINE_MUTEX(buffer_mutex);
 
 static int da_command_address;
 static int da_command_code;
 static int da_num_tokens;
+struct wmi_device *wmi_dev;
 static struct calling_interface_token *da_tokens;
 
 int dell_smbios_error(int value)
@@ -60,13 +69,15 @@ struct calling_interface_buffer *dell_smbios_get_buffer(void)
 {
 	mutex_lock(&buffer_mutex);
 	dell_smbios_clear_buffer();
+	if (wmi_dev)
+		return &((struct wmi_calling_interface_buffer *) buffer)->smi;
 	return buffer;
 }
 EXPORT_SYMBOL_GPL(dell_smbios_get_buffer);
 
 void dell_smbios_clear_buffer(void)
 {
-	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	memset(buffer, 0, bufferlen);
 }
 EXPORT_SYMBOL_GPL(dell_smbios_clear_buffer);
 
@@ -76,7 +87,36 @@ void dell_smbios_release_buffer(void)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_release_buffer);
 
-void dell_smbios_send_request(int class, int select)
+static int run_wmi_smbios_call(struct wmi_calling_interface_buffer *buf)
+{
+	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
+	struct acpi_buffer input;
+	union acpi_object *obj;
+	acpi_status status;
+
+	input.length = sizeof(struct wmi_calling_interface_buffer);
+	input.pointer = buf;
+
+	status = wmidev_evaluate_method(wmi_dev, 0, 1, &input, &output);
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
+
+	return 0;
+}
+
+#ifdef CONFIG_DCDBAS
+static void run_smi_smbios_call(struct calling_interface_buffer *buf)
 {
 	struct smi_cmd command;
 
@@ -85,12 +125,28 @@ void dell_smbios_send_request(int class, int select)
 	command.command_code = da_command_code;
 	command.ebx = virt_to_phys(buffer);
 	command.ecx = 0x42534931;
-
-	buffer->class = class;
-	buffer->select = select;
-
 	dcdbas_smi_request(&command);
 }
+#else
+static void run_smi_smbios_call(struct calling_interface_buffer *buf) {}
+#endif /* CONFIG_DCDBAS */
+
+void dell_smbios_send_request(int class, int select)
+{
+	if (wmi_dev) {
+		struct wmi_calling_interface_buffer *buf = buffer;
+
+		buf->smi.class = class;
+		buf->smi.select = select;
+		run_wmi_smbios_call(buf);
+	} else {
+		struct calling_interface_buffer *buf = buffer;
+
+		buf->class = class;
+		buf->select = select;
+		run_smi_smbios_call(buf);
+	}
+}
 EXPORT_SYMBOL_GPL(dell_smbios_send_request);
 
 struct calling_interface_token *dell_smbios_find_token(int tokenid)
@@ -170,10 +226,43 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
 	}
 }
 
-static int __init dell_smbios_init(void)
+static int dell_smbios_wmi_probe(struct wmi_device *wdev)
+{
+	/* no longer need the SMI page */
+	free_page((unsigned long)buffer);
+
+	/* WMI buffer should be 32k */
+	buffer = (void *)__get_free_pages(GFP_KERNEL, 3);
+	if (!buffer)
+		return -ENOMEM;
+	bufferlen = sizeof(struct wmi_calling_interface_buffer);
+	wmi_dev = wdev;
+	return 0;
+}
+
+static int dell_smbios_wmi_remove(struct wmi_device *wdev)
 {
-	int ret;
+	wmi_dev = NULL;
+	free_pages((unsigned long)buffer, 3);
+	return 0;
+}
 
+static const struct wmi_device_id dell_smbios_wmi_id_table[] = {
+	{ .guid_string = DELL_WMI_SMBIOS_GUID },
+	{ },
+};
+
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
@@ -181,34 +270,39 @@ static int __init dell_smbios_init(void)
 		return -ENODEV;
 	}
 
+#ifdef CONFIG_DCDBAS
 	/*
 	 * Allocate buffer below 4GB for SMI data--only 32-bit physical addr
 	 * is passed to SMI handler.
 	 */
 	buffer = (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
+	bufferlen = sizeof(struct calling_interface_buffer);
+#else
+	buffer = NULL;
+#endif /* CONFIG_DCDBAS */
+	wmi_driver_register(&dell_wmi_smbios_driver);
+
 	if (!buffer) {
-		ret = -ENOMEM;
-		goto fail_buffer;
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
 	free_page((unsigned long)buffer);
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
