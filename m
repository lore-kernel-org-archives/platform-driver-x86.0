From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v7 15/15] platform/x86: dell-smbios-wmi: introduce userspace interface
Date: Wed, 11 Oct 2017 11:27:41 -0500
Message-ID: <0e86106c01700cb0cc72797ed21ca706d350110f.1507733291.git.mario.limonciello@dell.com>
References: <cover.1507733291.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507733291.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507733291.git.mario.limonciello@dell.com>
References: <cover.1507733291.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

It's important for the driver to provide a R/W ioctl to ensure that
two competing userspace processes don't race to provide or read each
others data.

This userspace character device will be used to perform SMBIOS calls
from any applications.

It provides an ioctl that will allow passing the WMI calling
interface buffer between userspace and kernel space.

This character device is intended to deprecate the dcdbas kernel module
and the interface that it provides to userspace.

To use the character device the buffer needed for the machine will
also be needed.  This information is exported to a sysfs attribute by
the WMI bus in "required_buffer_size".

The API for interacting with this interface is defined in documentation
as well as the WMI uapi header provides the format of the structures.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 Documentation/ABI/testing/dell-smbios-wmi | 41 ++++++++++++++++
 drivers/platform/x86/dell-smbios-wmi.c    | 81 ++++++++++++++++++++++++++-----
 drivers/platform/x86/dell-smbios.h        | 11 +----
 include/uapi/linux/wmi.h                  | 28 +++++++++++
 4 files changed, 140 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/ABI/testing/dell-smbios-wmi

diff --git a/Documentation/ABI/testing/dell-smbios-wmi b/Documentation/ABI/testing/dell-smbios-wmi
new file mode 100644
index 000000000000..572c3eb53c5c
--- /dev/null
+++ b/Documentation/ABI/testing/dell-smbios-wmi
@@ -0,0 +1,41 @@
+What:		/dev/wmi/dell-smbios
+Date:		November 2017
+KernelVersion:	4.15
+Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
+Description:
+		Perform SMBIOS calls on supported Dell machines.
+		through the Dell ACPI-WMI interface.
+
+		IOCTL's and buffer formats are defined in:
+		<uapi/linux/wmi.h>
+
+		1) To perform a call from userspace, you'll need to first
+		determine the minimum size of the calling interface buffer
+		for your machine.
+		Platforms that contain larger buffers can return larger
+		objects from the system firmware.
+		Commonly this size is either 4k or 32k.
+
+		To determine the size of the buffer, look in the device's
+		directory in sysfs for a "required_buffer_size" attribute.
+
+		2) After you've determined the minimum size of the calling
+		interface buffer, you can allocate a structure that represents
+		the structure documented above.
+
+		3) In the 'length' object store the size of the buffer you
+		determined above and allocated.
+
+		4) In this buffer object, prepare as necessary for the SMBIOS
+		call you're interested in.  Typically SMBIOS buffers have
+		"class", "select", and "input" defined to values that coincide
+		with the data you are interested in.
+		Documenting class/select/input values is outside of the scope
+		of this documentation. Check with the libsmbios project for
+		further documentation on these values.
+
+		6) Run the call by using ioctl() as described in the header.
+
+		7) The output will be returned in the buffer object.
+
+		8) Be sure to free up your allocated object.
diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
index 7b554ee0e9e6..c41e679da4a1 100644
--- a/drivers/platform/x86/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -29,17 +29,6 @@ struct misc_bios_flags_structure {
 
 #define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
 
-struct dell_wmi_extensions {
-	__u32 argattrib;
-	__u32 blength;
-	__u8 data[];
-} __packed;
-
-struct dell_wmi_smbios_buffer {
-	struct calling_interface_buffer std;
-	struct dell_wmi_extensions ext;
-} __packed;
-
 struct wmi_smbios_priv {
 	struct dell_wmi_smbios_buffer *buf;
 	struct list_head list;
@@ -113,6 +102,66 @@ int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
 	return ret;
 }
 
+static void _debug_ioctl(struct device *d, unsigned int expected,
+			unsigned int cmd)
+{
+	if (_IOC_DIR(expected) != _IOC_DIR(cmd))
+		dev_dbg(d, "Invalid _IOC_DIR: %d\n", _IOC_DIR(cmd));
+	if (_IOC_TYPE(expected) != _IOC_TYPE(cmd))
+		dev_dbg(d, "Invalid _IOC_TYPE: %d\n", _IOC_TYPE(cmd));
+	if (_IOC_NR(expected) != _IOC_NR(cmd))
+		dev_dbg(d, "Invalid _IOC_NR: %d\n", _IOC_NR(cmd));
+	if (_IOC_SIZE(expected) != _IOC_SIZE(cmd))
+		dev_dbg(d, "Invalid _IOC_SIZE: %d\n", _IOC_SIZE(cmd));
+}
+
+static long dell_smbios_wmi_ioctl(struct wmi_device *wdev, unsigned int cmd,
+				  unsigned long arg)
+{
+	void __user *input = (void __user *) arg;
+	struct wmi_smbios_priv *priv;
+	int ret = 0;
+
+	switch (cmd) {
+	case DELL_WMI_SMBIOS_CMD:
+		priv = dev_get_drvdata(&wdev->dev);
+		if (!priv)
+			return -ENODEV;
+		mutex_lock(&call_mutex);
+		/* read the structure from userspace */
+		if (copy_from_user(priv->buf, input, priv->req_buf_size)) {
+			dev_dbg(&wdev->dev, "Copy %d from user failed\n",
+				priv->req_buf_size);
+			ret = -EFAULT;
+			goto fail_smbios_cmd;
+		}
+		/* check for any calls we should avoid */
+		if (dell_smbios_call_filter(&wdev->dev, &priv->buf->std)) {
+			dev_err(&wdev->dev, "Invalid call %d/%d:%8x\n",
+				priv->buf->std.class, priv->buf->std.select,
+				priv->buf->std.input[0]);
+			ret = -EFAULT;
+			goto fail_smbios_cmd;
+		}
+		ret = run_smbios_call(priv->wdev);
+		if (ret != 0)
+			goto fail_smbios_cmd;
+		/* return the result (only up to our internal buffer size) */
+		if (copy_to_user(input, priv->buf, priv->req_buf_size)) {
+			dev_dbg(&wdev->dev, "Copy %d to user failed\n",
+			priv->req_buf_size);
+			ret = -EFAULT;
+		}
+fail_smbios_cmd:
+		mutex_unlock(&call_mutex);
+		break;
+	default:
+		_debug_ioctl(&wdev->dev, DELL_WMI_SMBIOS_CMD, cmd);
+		ret = -ENOIOCTLCMD;
+	}
+	return ret;
+}
+
 static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 {
 	struct wmi_smbios_priv *priv;
@@ -127,6 +176,12 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 	/* WMI buffer size will be either 4k or 32k depending on machine */
 	if (!dell_wmi_get_size(&priv->req_buf_size))
 		return -EPROBE_DEFER;
+	/* add in the length object we will use internally with ioctl */
+	priv->req_buf_size += sizeof(u64);
+
+	ret = set_required_buffer_size(wdev, 0, priv->req_buf_size);
+	if (ret)
+		return ret;
 
 	count = get_order(priv->req_buf_size);
 	priv->buf = (void *)__get_free_pages(GFP_KERNEL, count);
@@ -203,6 +258,10 @@ static struct wmi_driver dell_smbios_wmi_driver = {
 	.probe = dell_smbios_wmi_probe,
 	.remove = dell_smbios_wmi_remove,
 	.id_table = dell_smbios_wmi_id_table,
+	.unlocked_ioctl = dell_smbios_wmi_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = dell_smbios_wmi_ioctl,
+#endif
 };
 
 static int __init init_dell_smbios_wmi(void)
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index 98950298fc51..41918ff8cdde 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -17,19 +17,10 @@
 #define _DELL_SMBIOS_H_
 
 #include <linux/device.h>
+#include <uapi/linux/wmi.h>
 
 struct notifier_block;
 
-/* This structure will be modified by the firmware when we enter
- * system management mode, hence the volatiles */
-
-struct calling_interface_buffer {
-	u16 class;
-	u16 select;
-	volatile u32 input[4];
-	volatile u32 output[4];
-} __packed;
-
 struct calling_interface_token {
 	u16 tokenID;
 	u16 location;
diff --git a/include/uapi/linux/wmi.h b/include/uapi/linux/wmi.h
index d93b4f56add4..622e4004bcfc 100644
--- a/include/uapi/linux/wmi.h
+++ b/include/uapi/linux/wmi.h
@@ -10,6 +10,9 @@
 #ifndef _UAPI_LINUX_WMI_H
 #define _UAPI_LINUX_WMI_H
 
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
 /* WMI bus will filter all WMI vendor driver requests through this IOC */
 #define WMI_IOC 'W'
 
@@ -21,4 +24,29 @@ struct wmi_ioctl_buffer {
 	__u8	data[];
 };
 
+/* This structure may be modified by the firmware when we enter
+ * system management mode through SMM, hence the volatiles
+ */
+struct calling_interface_buffer {
+	__u16 class;
+	__u16 select;
+	volatile __u32 input[4];
+	volatile __u32 output[4];
+} __packed;
+
+struct dell_wmi_extensions {
+	__u32 argattrib;
+	__u32 blength;
+	__u8 data[];
+} __packed;
+
+struct dell_wmi_smbios_buffer {
+	__u64 length;
+	struct calling_interface_buffer std;
+	struct dell_wmi_extensions	ext;
+} __packed;
+
+/* Dell SMBIOS calling IOCTL command used by dell-smbios-wmi */
+#define DELL_WMI_SMBIOS_CMD	_IOWR(WMI_IOC, 0, struct dell_wmi_smbios_buffer)
+
 #endif
-- 
2.14.1
