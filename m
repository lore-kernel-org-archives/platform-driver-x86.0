From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 05/10] eeepc-wmi: add debugfs entries
Date: Mon, 29 Nov 2010 08:14:09 +0100
Message-ID: <1291014854-17961-6-git-send-email-corentincj@iksaif.net>
References: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:32818 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753562Ab0K2HPD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Nov 2010 02:15:03 -0500
Received: from relay4-v.mail.gandi.net (relay4-v.mail.gandi.net [217.70.178.78])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id E17DE862AF
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2010 08:15:01 +0100 (CET)
In-Reply-To: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, "David S. Miller" <davem@davemloft.net>, Yong Wang <yong.y.wang@intel.com>, Corentin Chary <corentincj@iksaif.net>

eeepc-wmi/    - debugfs root directory
  dev_id      - current dev_id
  ctrl_param  - current ctrl_param
  devs        - call DEVS(dev_id, ctrl_param) and print result
  dsts        - call DSTS(dev_id)  and print result

DEVS and DSTS are the main functions used in eeepc-wmi, this
will allow to test new features without patching the drivers.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/eeepc-wmi.c |  170 ++++++++++++++++++++++++++++++++++++--
 1 files changed, 164 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index a70d76a..253070a 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -36,6 +36,8 @@
 #include <linux/backlight.h>
 #include <linux/leds.h>
 #include <linux/rfkill.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
 #include <linux/platform_device.h>
 #include <acpi/acpi_bus.h>
 #include <acpi/acpi_drivers.h>
@@ -89,6 +91,19 @@ struct bios_args {
 	u32	ctrl_param;
 };
 
+/*
+ * eeepc-wmi/    - debugfs root directory
+ *   dev_id      - current dev_id
+ *   ctrl_param  - current ctrl_param
+ *   devs        - call DEVS(dev_id, ctrl_param) and print result
+ *   dsts        - call DSTS(dev_id)  and print result
+ */
+struct eeepc_wmi_debug {
+	struct dentry *root;
+	u32 dev_id;
+	u32 ctrl_param;
+};
+
 struct eeepc_wmi {
 	struct input_dev *inputdev;
 	struct backlight_device *backlight_device;
@@ -102,6 +117,8 @@ struct eeepc_wmi {
 	struct rfkill *wlan_rfkill;
 	struct rfkill *bluetooth_rfkill;
 	struct rfkill *wwan3g_rfkill;
+
+	struct eeepc_wmi_debug debug;
 };
 
 /* Only used in eeepc_wmi_init() and eeepc_wmi_exit() */
@@ -176,7 +193,8 @@ static acpi_status eeepc_wmi_get_devstate(u32 dev_id, u32 *ctrl_param)
 
 }
 
-static acpi_status eeepc_wmi_set_devstate(u32 dev_id, u32 ctrl_param)
+static acpi_status eeepc_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
+					  u32 *retval)
 {
 	struct bios_args args = {
 		.dev_id = dev_id,
@@ -185,8 +203,32 @@ static acpi_status eeepc_wmi_set_devstate(u32 dev_id, u32 ctrl_param)
 	struct acpi_buffer input = { (acpi_size)sizeof(args), &args };
 	acpi_status status;
 
-	status = wmi_evaluate_method(EEEPC_WMI_MGMT_GUID,
-			1, EEEPC_WMI_METHODID_DEVS, &input, NULL);
+	if (!retval) {
+		status = wmi_evaluate_method(EEEPC_WMI_MGMT_GUID, 1,
+					     EEEPC_WMI_METHODID_DEVS,
+					     &input, NULL);
+	} else {
+		struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+		union acpi_object *obj;
+		u32 tmp;
+
+		status = wmi_evaluate_method(EEEPC_WMI_MGMT_GUID, 1,
+					     EEEPC_WMI_METHODID_DEVS,
+					     &input, &output);
+
+		if (ACPI_FAILURE(status))
+			return status;
+
+		obj = (union acpi_object *)output.pointer;
+		if (obj && obj->type == ACPI_TYPE_INTEGER)
+			tmp = (u32)obj->integer.value;
+		else
+			tmp = 0;
+
+		*retval = tmp;
+
+		kfree(obj);
+	}
 
 	return status;
 }
@@ -208,7 +250,7 @@ static void tpd_led_update(struct work_struct *work)
 	eeepc = container_of(work, struct eeepc_wmi, tpd_led_work);
 
 	ctrl_param = eeepc->tpd_led_wk;
-	eeepc_wmi_set_devstate(EEEPC_WMI_DEVID_TPDLED, ctrl_param);
+	eeepc_wmi_set_devstate(EEEPC_WMI_DEVID_TPDLED, ctrl_param, NULL);
 }
 
 static void tpd_led_set(struct led_classdev *led_cdev,
@@ -295,7 +337,7 @@ static int eeepc_rfkill_set(void *data, bool blocked)
 	int dev_id = (unsigned long)data;
 	u32 ctrl_param = !blocked;
 
-	return eeepc_wmi_set_devstate(dev_id, ctrl_param);
+	return eeepc_wmi_set_devstate(dev_id, ctrl_param, NULL);
 }
 
 static void eeepc_rfkill_query(struct rfkill *rfkill, void *data)
@@ -434,7 +476,8 @@ static int update_bl_status(struct backlight_device *bd)
 
 	ctrl_param = bd->props.brightness;
 
-	status = eeepc_wmi_set_devstate(EEEPC_WMI_DEVID_BACKLIGHT, ctrl_param);
+	status = eeepc_wmi_set_devstate(EEEPC_WMI_DEVID_BACKLIGHT,
+					ctrl_param, NULL);
 
 	if (ACPI_FAILURE(status))
 		return -1;
@@ -614,6 +657,114 @@ static void eeepc_wmi_platform_exit(struct eeepc_wmi *eeepc)
 }
 
 /*
+ * debugfs
+ */
+struct eeepc_wmi_debugfs_node {
+	struct eeepc_wmi *eeepc;
+	char *name;
+	int (*show)(struct seq_file *m, void *data);
+};
+
+static int show_dsts(struct seq_file *m, void *data)
+{
+	struct eeepc_wmi *eeepc = m->private;
+	acpi_status status;
+	u32 retval = -1;
+
+	status = eeepc_wmi_get_devstate(eeepc->debug.dev_id, &retval);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	seq_printf(m, "DSTS(%x) = %x\n", eeepc->debug.dev_id, retval);
+
+	return 0;
+}
+
+static int show_devs(struct seq_file *m, void *data)
+{
+	struct eeepc_wmi *eeepc = m->private;
+	acpi_status status;
+	u32 retval = -1;
+
+	status = eeepc_wmi_set_devstate(eeepc->debug.dev_id,
+					eeepc->debug.ctrl_param, &retval);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	seq_printf(m, "DEVS(%x, %x) = %x\n", eeepc->debug.dev_id,
+		   eeepc->debug.ctrl_param, retval);
+
+	return 0;
+}
+
+static struct eeepc_wmi_debugfs_node eeepc_wmi_debug_files[] = {
+	{ NULL, "devs", show_devs },
+	{ NULL, "dsts", show_dsts },
+};
+
+static int eeepc_wmi_debugfs_open(struct inode *inode, struct file *file)
+{
+	struct eeepc_wmi_debugfs_node *node = inode->i_private;
+
+	return single_open(file, node->show, node->eeepc);
+}
+
+static const struct file_operations eeepc_wmi_debugfs_io_ops = {
+	.owner = THIS_MODULE,
+	.open  = eeepc_wmi_debugfs_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static void eeepc_wmi_debugfs_exit(struct eeepc_wmi *eeepc)
+{
+	debugfs_remove_recursive(eeepc->debug.root);
+}
+
+static int eeepc_wmi_debugfs_init(struct eeepc_wmi *eeepc)
+{
+	struct dentry *dent;
+	int i;
+
+	eeepc->debug.root = debugfs_create_dir(EEEPC_WMI_FILE, NULL);
+	if (!eeepc->debug.root) {
+		pr_err("failed to create debugfs directory");
+		goto error_debugfs;
+	}
+
+	dent = debugfs_create_x32("dev_id", S_IRUGO|S_IWUSR,
+				  eeepc->debug.root, &eeepc->debug.dev_id);
+	if (!dent)
+		goto error_debugfs;
+
+	dent = debugfs_create_x32("ctrl_param", S_IRUGO|S_IWUSR,
+				  eeepc->debug.root, &eeepc->debug.ctrl_param);
+	if (!dent)
+		goto error_debugfs;
+
+	for (i = 0; i < ARRAY_SIZE(eeepc_wmi_debug_files); i++) {
+		struct eeepc_wmi_debugfs_node *node = &eeepc_wmi_debug_files[i];
+
+		node->eeepc = eeepc;
+		dent = debugfs_create_file(node->name, S_IFREG | S_IRUGO,
+					   eeepc->debug.root, node,
+					   &eeepc_wmi_debugfs_io_ops);
+		if (!dent) {
+			pr_err("failed to create debug file: %s\n", node->name);
+			goto error_debugfs;
+		}
+	}
+
+	return 0;
+
+error_debugfs:
+	eeepc_wmi_debugfs_exit(eeepc);
+	return -ENOMEM;
+}
+
+/*
  * WMI Driver
  */
 static struct platform_device * __init eeepc_wmi_add(void)
@@ -662,8 +813,14 @@ static struct platform_device * __init eeepc_wmi_add(void)
 		goto fail_wmi_handler;
 	}
 
+	err = eeepc_wmi_debugfs_init(eeepc);
+	if (err)
+		goto fail_debugfs;
+
 	return eeepc->platform_device;
 
+fail_debugfs:
+	wmi_remove_notify_handler(EEEPC_WMI_EVENT_GUID);
 fail_wmi_handler:
 	eeepc_wmi_backlight_exit(eeepc);
 fail_backlight:
@@ -689,6 +846,7 @@ static int eeepc_wmi_remove(struct platform_device *device)
 	eeepc_wmi_input_exit(eeepc);
 	eeepc_wmi_led_exit(eeepc);
 	eeepc_wmi_rfkill_exit(eeepc);
+	eeepc_wmi_debugfs_exit(eeepc);
 	eeepc_wmi_platform_exit(eeepc);
 
 	kfree(eeepc);
-- 
1.7.3.2
