From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v2 12/14] platform/x86: dell-wmi-smbios: introduce character device for userspace
Date: Tue, 26 Sep 2017 13:50:10 -0500
Message-ID: <dcc096b40d4a7084be54942270984159d09abe1e.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

This userspace character device will be used to perform SMBIOS calls
from any applications.

It contains 3 operating IOCTL's
1) sending a properly formatted 4k calling interface buffer.
2) Querying number of tokens in the given system
3) Copying the status of all these tokens to a properly formatted
   userspace buffer.

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
 Documentation/ABI/testing/dell-wmi-smbios |  10 +++
 drivers/platform/x86/dell-wmi-smbios.c    | 110 +++++++++++++++++++++++++++---
 drivers/platform/x86/dell-wmi-smbios.h    |  28 +-------
 include/uapi/linux/dell-wmi-smbios.h      |  55 +++++++++++++++
 4 files changed, 165 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/ABI/testing/dell-wmi-smbios
 create mode 100644 include/uapi/linux/dell-wmi-smbios.h

diff --git a/Documentation/ABI/testing/dell-wmi-smbios b/Documentation/ABI/testing/dell-wmi-smbios
new file mode 100644
index 000000000000..8ec98e9b7b34
--- /dev/null
+++ b/Documentation/ABI/testing/dell-wmi-smbios
@@ -0,0 +1,10 @@
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
\ No newline at end of file
diff --git a/drivers/platform/x86/dell-wmi-smbios.c b/drivers/platform/x86/dell-wmi-smbios.c
index 699757f3e154..232a9dd482b1 100644
--- a/drivers/platform/x86/dell-wmi-smbios.c
+++ b/drivers/platform/x86/dell-wmi-smbios.c
@@ -21,6 +21,7 @@
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/wmi.h>
+#include <linux/uaccess.h>
 #include "dell-wmi-smbios.h"
 
 #ifdef CONFIG_DCDBAS
@@ -39,7 +40,8 @@ struct calling_interface_structure {
 } __packed;
 
 static struct calling_interface_buffer *smi_buffer;
-static struct wmi_calling_interface_buffer *wmi_buffer;
+static struct wmi_calling_interface_buffer *internal_wmi_buffer;
+static struct wmi_calling_interface_buffer *sysfs_wmi_buffer;
 static DEFINE_MUTEX(buffer_mutex);
 
 static int da_command_address;
@@ -68,7 +70,7 @@ struct calling_interface_buffer *dell_smbios_get_buffer(void)
 	mutex_lock(&buffer_mutex);
 	dell_smbios_clear_buffer();
 	if (has_wmi)
-		return &wmi_buffer->smi;
+		return &internal_wmi_buffer->smi;
 	return smi_buffer;
 }
 EXPORT_SYMBOL_GPL(dell_smbios_get_buffer);
@@ -76,7 +78,7 @@ EXPORT_SYMBOL_GPL(dell_smbios_get_buffer);
 void dell_smbios_clear_buffer(void)
 {
 	if (has_wmi)
-		memset(wmi_buffer, 0,
+		memset(internal_wmi_buffer, 0,
 		       sizeof(struct wmi_calling_interface_buffer));
 	else
 		memset(smi_buffer, 0,
@@ -122,9 +124,9 @@ int run_wmi_smbios_call(struct wmi_calling_interface_buffer *buf)
 void dell_smbios_send_request(int class, int select)
 {
 	if (has_wmi) {
-		wmi_buffer->smi.class = class;
-		wmi_buffer->smi.select = select;
-		run_wmi_smbios_call(wmi_buffer);
+		internal_wmi_buffer->smi.class = class;
+		internal_wmi_buffer->smi.select = select;
+		run_wmi_smbios_call(internal_wmi_buffer);
 	}
 
 #ifdef CONFIG_DCDBAS
@@ -224,6 +226,74 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
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
+	struct token_ioctl_buffer *tokens_buffer;
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
+		if (copy_from_user(sysfs_wmi_buffer, p, size)) {
+			ret = -EFAULT;
+			goto fail_smbios_cmd;
+		}
+		ret = run_wmi_smbios_call(sysfs_wmi_buffer);
+		if (ret != 0)
+			goto fail_smbios_cmd;
+		if (copy_to_user(p, sysfs_wmi_buffer, size))
+			ret = -EFAULT;
+fail_smbios_cmd:
+		mutex_unlock(&buffer_mutex);
+		break;
+	case DELL_WMI_SMBIOS_GET_NUM_TOKENS_CMD:
+		if (copy_to_user(p, &da_num_tokens, sizeof(u32)))
+			ret = -EFAULT;
+		break;
+	case DELL_WMI_SMBIOS_GET_TOKENS_CMD:
+		tokens_buffer = kmalloc(sizeof(struct token_ioctl_buffer),
+					GFP_KERNEL);
+		size = sizeof(struct token_ioctl_buffer);
+		if (copy_from_user(tokens_buffer, p, size)) {
+			ret = -EFAULT;
+			goto fail_get_tokens_cmd;
+		}
+		if (tokens_buffer->num_tokens < da_num_tokens) {
+			ret = -EOVERFLOW;
+			goto fail_get_tokens_cmd;
+		}
+		size = sizeof(struct calling_interface_token) * da_num_tokens;
+		if (copy_to_user(tokens_buffer->tokens, da_tokens, size)) {
+			ret = -EFAULT;
+			goto fail_get_tokens_cmd;
+		}
+fail_get_tokens_cmd:
+		kfree(tokens_buffer);
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
@@ -301,11 +371,17 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 	int ret;
 	u32 interface_version;
 
-	/* WMI buffer should be 32k */
-	wmi_buffer = (void *)__get_free_pages(GFP_KERNEL, 3);
-	if (!wmi_buffer)
+	/* WMI buffers should be 32k */
+	internal_wmi_buffer = (void *)__get_free_pages(GFP_KERNEL, 3);
+	if (!internal_wmi_buffer)
 		return -ENOMEM;
 
+	sysfs_wmi_buffer = (void *)__get_free_pages(GFP_KERNEL, 3);
+	if (!sysfs_wmi_buffer) {
+		ret = -ENOMEM;
+		goto fail_sysfs_wmi_buffer;
+	}
+
 	ret = dell_wmi_check_descriptor_buffer(wdev, &interface_version);
 	if (ret)
 		goto fail_wmi_probe;
@@ -320,13 +396,17 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 	return 0;
 
 fail_wmi_probe:
-	free_pages((unsigned long)wmi_buffer, 3);
+	free_pages((unsigned long)sysfs_wmi_buffer, 3);
+
+fail_sysfs_wmi_buffer:
+	free_pages((unsigned long)internal_wmi_buffer, 3);
 	return ret;
 }
 
 static int dell_smbios_wmi_remove(struct wmi_device *wdev)
 {
-	free_pages((unsigned long)wmi_buffer, 3);
+	free_pages((unsigned long)internal_wmi_buffer, 3);
+	free_pages((unsigned long)sysfs_wmi_buffer, 3);
 	return 0;
 }
 
@@ -335,6 +415,13 @@ static const struct wmi_device_id dell_smbios_wmi_id_table[] = {
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
 		.name = "dell-wmi-smbios",
@@ -342,6 +429,7 @@ static struct wmi_driver dell_wmi_smbios_driver = {
 	.probe = dell_smbios_wmi_probe,
 	.remove = dell_smbios_wmi_remove,
 	.id_table = dell_smbios_wmi_id_table,
+	.file_operations = &dell_wmi_smbios_fops,
 };
 
 static int __init dell_wmi_smbios_init(void)
diff --git a/drivers/platform/x86/dell-wmi-smbios.h b/drivers/platform/x86/dell-wmi-smbios.h
index 0e8b57f7d0f0..9bc9c42db167 100644
--- a/drivers/platform/x86/dell-wmi-smbios.h
+++ b/drivers/platform/x86/dell-wmi-smbios.h
@@ -18,36 +18,10 @@
 #define _DELL_WMI_SMBIOS_H_
 
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
-struct calling_interface_token {
-	u16 tokenID;
-	u16 location;
-	union {
-		u16 value;
-		u16 stringlength;
-	};
-};
-
 int dell_smbios_error(int value);
 
 struct calling_interface_buffer *dell_smbios_get_buffer(void);
diff --git a/include/uapi/linux/dell-wmi-smbios.h b/include/uapi/linux/dell-wmi-smbios.h
new file mode 100644
index 000000000000..743035d9443a
--- /dev/null
+++ b/include/uapi/linux/dell-wmi-smbios.h
@@ -0,0 +1,55 @@
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
+struct calling_interface_token {
+	u16 tokenID;
+	u16 location;
+	union {
+		u16 value;
+		u16 stringlength;
+	};
+};
+
+struct token_ioctl_buffer {
+	struct calling_interface_token *tokens;
+	u32 num_tokens;
+};
+
+#define DELL_WMI_SMBIOS_IOC			'D'
+/* run SMBIOS calling interface command
+ * note - 32k is too big for size, so this can not be encoded in macro properly
+ */
+#define DELL_WMI_SMBIOS_CALL_CMD	_IOWR(DELL_WMI_SMBIOS_IOC, 0, u8)
+
+/* query the number of DA tokens on system */
+#define DELL_WMI_SMBIOS_GET_NUM_TOKENS_CMD	_IOR(DELL_WMI_SMBIOS_IOC, 1, \
+						      u32)
+/* query the status, location, and value of all DA tokens from bootup
+ * expects userspace to prepare buffer in advance with the number of tokens
+ * from DELL_WMI_SMBIOS_GET_NUM_TOKENS_CMD
+ */
+#define DELL_WMI_SMBIOS_GET_TOKENS_CMD		_IOWR(DELL_WMI_SMBIOS_IOC, 2, \
+						      struct token_ioctl_buffer)
+
+
+#endif /* _UAPI_DELL_WMI_SMBIOS_H_ */
-- 
2.14.1
