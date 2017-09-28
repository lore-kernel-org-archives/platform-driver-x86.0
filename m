From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce character device for userspace
Date: Wed, 27 Sep 2017 23:02:17 -0500
Message-ID: <4a91eb76afa9cce7060bc30f5313d64bd51b66ca.1506571188.git.mario.limonciello@dell.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa7.dell-outbound.iphmx.com ([68.232.153.96]:39623 "EHLO
        esa7.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751091AbdI1ECa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Sep 2017 00:02:30 -0400
In-Reply-To: <cover.1506571187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506571187.git.mario.limonciello@dell.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>

This userspace character device will be used to perform SMBIOS calls
from any applications.

It provides an ioctl that will allow passing the 32k WMI calling
interface buffer between userspace and kernel space.

This character device is intended to deprecate the dcdbas kernel module
and the interface that it provides to userspace.

It's important for the driver to provide a R/W ioctl to ensure that
two competing userspace processes don't race to provide or read each
others data.

The character device will only be created if the WMI interface was
found.

The API for interacting with this interface is defined in documentation
as well as a uapi header provides the format of the structures.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 Documentation/ABI/testing/dell-wmi-smbios |  11 ++++
 drivers/platform/x86/dell-smbios.c        | 100 ++++++++++++++++++++++++------
 drivers/platform/x86/dell-smbios.h        |  19 +-----
 include/uapi/linux/dell-wmi-smbios.h      |  30 +++++++++
 4 files changed, 124 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/ABI/testing/dell-wmi-smbios
 create mode 100644 include/uapi/linux/dell-wmi-smbios.h

diff --git a/Documentation/ABI/testing/dell-wmi-smbios b/Documentation/ABI/testing/dell-wmi-smbios
new file mode 100644
index 000000000000..0a4200688cb0
--- /dev/null
+++ b/Documentation/ABI/testing/dell-wmi-smbios
@@ -0,0 +1,11 @@
+What:		/dev/wmi-dell-wmi-smbios
+Date:		October 2017
+KernelVersion:	4.15
+Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
+Description:
+		Perform SMBIOS calls on supported Dell machines.
+		through the Dell ACPI-WMI interface.
+
+		IOCTL's and buffer formats are defined in:
+		<uapi/linux/dell-wmi-smbios.h>
+
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index 5d793b012e5e..4174afbade13 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/wmi.h>
+#include <linux/uaccess.h>
 #include "dell-smbios.h"
 
 #ifdef CONFIG_DCDBAS
@@ -41,8 +42,9 @@ struct calling_interface_structure {
 	struct calling_interface_token tokens[];
 } __packed;
 
-static void *buffer;
-static size_t bufferlen;
+static void *internal_buffer;
+static size_t internal_bufferlen;
+static struct wmi_calling_interface_buffer *devfs_buffer;
 static DEFINE_MUTEX(buffer_mutex);
 
 static int da_command_address;
@@ -70,15 +72,15 @@ struct calling_interface_buffer *dell_smbios_get_buffer(void)
 {
 	mutex_lock(&buffer_mutex);
 	dell_smbios_clear_buffer();
-	if (wmi_dev)
-		return &((struct wmi_calling_interface_buffer *) buffer)->smi;
-	return buffer;
+	if (!wmi_dev)
+		return internal_buffer;
+	return &((struct wmi_calling_interface_buffer *) internal_buffer)->smi;
 }
 EXPORT_SYMBOL_GPL(dell_smbios_get_buffer);
 
 void dell_smbios_clear_buffer(void)
 {
-	memset(buffer, 0, bufferlen);
+	memset(internal_buffer, 0, internal_bufferlen);
 }
 EXPORT_SYMBOL_GPL(dell_smbios_clear_buffer);
 
@@ -135,13 +137,13 @@ static void run_smi_smbios_call(struct calling_interface_buffer *buf) {}
 void dell_smbios_send_request(int class, int select)
 {
 	if (wmi_dev) {
-		struct wmi_calling_interface_buffer *buf = buffer;
+		struct wmi_calling_interface_buffer *buf = internal_buffer;
 
 		buf->smi.class = class;
 		buf->smi.select = select;
 		run_wmi_smbios_call(buf);
 	} else {
-		struct calling_interface_buffer *buf = buffer;
+		struct calling_interface_buffer *buf = internal_buffer;
 
 		buf->class = class;
 		buf->select = select;
@@ -227,6 +229,49 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
 	}
 }
 
+static int dell_wmi_smbios_open(struct inode *inode, struct file *file)
+{
+	return nonseekable_open(inode, file);
+}
+
+static int dell_wmi_smbios_release(struct inode *inode, struct file *file)
+{
+	return 0;
+}
+
+static long dell_wmi_smbios_ioctl(struct file *filp, unsigned int cmd,
+	unsigned long arg)
+{
+	void __user *p = (void __user *) arg;
+	size_t size;
+	int ret = 0;
+
+	if (_IOC_TYPE(cmd) != DELL_WMI_SMBIOS_IOC)
+		return -ENOTTY;
+
+	switch (cmd) {
+	case DELL_WMI_SMBIOS_CALL_CMD:
+		size = sizeof(struct wmi_calling_interface_buffer);
+		mutex_lock(&buffer_mutex);
+		if (copy_from_user(devfs_buffer, p, size)) {
+			ret = -EFAULT;
+			goto fail_smbios_cmd;
+		}
+		ret = run_wmi_smbios_call(devfs_buffer);
+		if (ret != 0)
+			goto fail_smbios_cmd;
+		if (copy_to_user(p, devfs_buffer, size))
+			ret = -EFAULT;
+fail_smbios_cmd:
+		mutex_unlock(&buffer_mutex);
+		break;
+	default:
+		pr_err("unsupported ioctl: %d.\n", cmd);
+		ret = -ENOIOCTLCMD;
+	}
+	return ret;
+}
+
 /*
  * Descriptor buffer is 128 byte long and contains:
  *
@@ -309,22 +354,33 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 		return -ENODEV;
 
 	/* no longer need the SMI page */
-	free_page((unsigned long)buffer);
+	free_page((unsigned long)internal_buffer);
 
 	/* WMI buffer should be 32k */
-	buffer = (void *)__get_free_pages(GFP_KERNEL, 3);
-	if (!buffer)
+	internal_buffer = (void *)__get_free_pages(GFP_KERNEL, 3);
+	if (!internal_buffer)
 		return -ENOMEM;
-	bufferlen = sizeof(struct wmi_calling_interface_buffer);
+	internal_bufferlen = sizeof(struct wmi_calling_interface_buffer);
+
+	devfs_buffer = (void *)__get_free_pages(GFP_KERNEL, 3);
+	if (!devfs_buffer) {
+		ret = -ENOMEM;
+		goto fail_devfs_buffer;
+	}
 
 	wmi_dev = wdev;
 	return 0;
+
+fail_devfs_buffer:
+	free_pages((unsigned long)internal_buffer, 3);
+	return ret;
 }
 
 static int dell_smbios_wmi_remove(struct wmi_device *wdev)
 {
 	wmi_dev = NULL;
-	free_pages((unsigned long)buffer, 3);
+	free_pages((unsigned long)internal_buffer, 3);
+	free_pages((unsigned long)devfs_buffer, 3);
 	return 0;
 }
 
@@ -333,6 +389,13 @@ static const struct wmi_device_id dell_smbios_wmi_id_table[] = {
 	{ },
 };
 
+static const struct file_operations dell_wmi_smbios_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= dell_wmi_smbios_ioctl,
+	.open		= dell_wmi_smbios_open,
+	.release	= dell_wmi_smbios_release,
+};
+
 static struct wmi_driver dell_wmi_smbios_driver = {
 	.driver = {
 		.name = "dell-smbios",
@@ -340,6 +403,7 @@ static struct wmi_driver dell_wmi_smbios_driver = {
 	.probe = dell_smbios_wmi_probe,
 	.remove = dell_smbios_wmi_remove,
 	.id_table = dell_smbios_wmi_id_table,
+	.file_operations = &dell_wmi_smbios_fops,
 };
 
 static int __init dell_smbios_init(void)
@@ -356,14 +420,14 @@ static int __init dell_smbios_init(void)
 	 * Allocate buffer below 4GB for SMI data--only 32-bit physical addr
 	 * is passed to SMI handler.
 	 */
-	buffer = (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
-	bufferlen = sizeof(struct calling_interface_buffer);
+	internal_buffer = (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
+	internal_bufferlen = sizeof(struct calling_interface_buffer);
 #else
-	buffer = NULL;
+	internal_buffer = NULL;
 #endif /* CONFIG_DCDBAS */
 	wmi_driver_register(&dell_wmi_smbios_driver);
 
-	if (!buffer) {
+	if (!internal_buffer) {
 		kfree(da_tokens);
 		return -ENOMEM;
 	}
@@ -373,7 +437,7 @@ static int __init dell_smbios_init(void)
 static void __exit dell_smbios_exit(void)
 {
 	kfree(da_tokens);
-	free_page((unsigned long)buffer);
+	free_page((unsigned long)internal_buffer);
 	wmi_driver_unregister(&dell_wmi_smbios_driver);
 }
 
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index be9ec1ccf8bf..3b0e2e3f6ede 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -18,27 +18,10 @@
 #define _DELL_SMBIOS_H_
 
 #include <linux/wmi.h>
+#include <uapi/linux/dell-wmi-smbios.h>
 
 struct notifier_block;
 
-/* If called through fallback SMI rather than WMI this structure will be
- * modified by the firmware when we enter system management mode, hence the
- * volatiles
- */
-struct calling_interface_buffer {
-	u16 class;
-	u16 select;
-	volatile u32 input[4];
-	volatile u32 output[4];
-} __packed;
-
-struct wmi_calling_interface_buffer {
-	struct calling_interface_buffer smi;
-	u32 argattrib;
-	u32 blength;
-	u8 data[32724];
-} __packed;
-
 struct calling_interface_token {
 	u16 tokenID;
 	u16 location;
diff --git a/include/uapi/linux/dell-wmi-smbios.h b/include/uapi/linux/dell-wmi-smbios.h
new file mode 100644
index 000000000000..adbe57dd055b
--- /dev/null
+++ b/include/uapi/linux/dell-wmi-smbios.h
@@ -0,0 +1,30 @@
+#ifndef _UAPI_DELL_WMI_SMBIOS_H_
+#define _UAPI_DELL_WMI_SMBIOS_H_
+
+#include <linux/ioctl.h>
+
+/* If called through fallback SMI rather than WMI this structure will be
+ * modified by the firmware when we enter system management mode, hence the
+ * volatiles
+ */
+struct calling_interface_buffer {
+	u16 class;
+	u16 select;
+	volatile u32 input[4];
+	volatile u32 output[4];
+} __packed;
+
+struct wmi_calling_interface_buffer {
+	struct calling_interface_buffer smi;
+	u32 argattrib;
+	u32 blength;
+	u8 data[32724];
+} __packed;
+
+#define DELL_WMI_SMBIOS_IOC			'D'
+/* run SMBIOS calling interface command
+ * note - 32k is too big for size, so this can not be encoded in macro properly
+ */
+#define DELL_WMI_SMBIOS_CALL_CMD	_IOWR(DELL_WMI_SMBIOS_IOC, 0, u8)
+
+#endif /* _UAPI_DELL_WMI_SMBIOS_H_ */
-- 
2.14.1
