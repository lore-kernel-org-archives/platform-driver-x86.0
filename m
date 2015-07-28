From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2] toshiba_acpi: Add set_fan_status function
Date: Mon, 27 Jul 2015 19:22:23 -0600
Message-ID: <1438046548-3081-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:36543 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754483AbbG1BWn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Jul 2015 21:22:43 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch adds a new function named "set_fan_status" to complement
its get* counterpart, as well as to avoid code duplication between
"fan_proc_write" and "fan_store".

Also, both functions (get*, set*) are now checking for TOS_FAILURE,
TOS_NOT_SUPPORTED and TOS_SUCCESS (to be on par with the rest of the
HCI/SCI functions), printing an error message, returning -ENODEV and
zero respectively.

The proc and sysfs functions were updated to reflect these changes as
well, returning -EIO for proc, and propagating the error value on the
sysfs functions.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
Changes since v1:
- Updated patch description
- Updated proc and sysfs functions to the changes made on this patch
  to ensure not to break userspace

 drivers/platform/x86/toshiba_acpi.c | 66 ++++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 3bfdfdd..f722898 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1422,27 +1422,47 @@ static const struct file_operations video_proc_fops = {
 	.write		= video_proc_write,
 };
 
+/* Fan status */
 static int get_fan_status(struct toshiba_acpi_dev *dev, u32 *status)
 {
-	u32 hci_result;
+	u32 result = hci_read(dev, HCI_FAN, status);
 
-	hci_result = hci_read(dev, HCI_FAN, status);
-	return hci_result == TOS_SUCCESS ? 0 : -EIO;
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to get Fan status failed\n");
+	else if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+	else if (result == TOS_SUCCESS)
+		return 0;
+
+	return -EIO;
+}
+
+static int set_fan_status(struct toshiba_acpi_dev *dev, u32 status)
+{
+	u32 result = hci_write(dev, HCI_FAN, status);
+
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to set Fan status failed\n");
+	else if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+	else if (result == TOS_SUCCESS)
+		return 0;
+
+	return -EIO;
 }
 
 static int fan_proc_show(struct seq_file *m, void *v)
 {
 	struct toshiba_acpi_dev *dev = m->private;
-	int ret;
 	u32 value;
 
-	ret = get_fan_status(dev, &value);
-	if (!ret) {
-		seq_printf(m, "running:                 %d\n", (value > 0));
-		seq_printf(m, "force_on:                %d\n", dev->force_fan);
-	}
+	if (get_fan_status(dev, &value))
+		return -EIO;
 
-	return ret;
+	seq_printf(m, "running:                 %d\n", (value > 0));
+	seq_printf(m, "force_on:                %d\n", dev->force_fan);
+
+	return 0;
 }
 
 static int fan_proc_open(struct inode *inode, struct file *file)
@@ -1457,23 +1477,20 @@ static ssize_t fan_proc_write(struct file *file, const char __user *buf,
 	char cmd[42];
 	size_t len;
 	int value;
-	u32 hci_result;
 
 	len = min(count, sizeof(cmd) - 1);
 	if (copy_from_user(cmd, buf, len))
 		return -EFAULT;
 	cmd[len] = '\0';
 
-	if (sscanf(cmd, " force_on : %i", &value) == 1 &&
-	    value >= 0 && value <= 1) {
-		hci_result = hci_write(dev, HCI_FAN, value);
-		if (hci_result == TOS_SUCCESS)
-			dev->force_fan = value;
-		else
-			return -EIO;
-	} else {
+	if (sscanf(cmd, " force_on : %i", &value) != 1 &&
+	    value != 0 && value != 1)
 		return -EINVAL;
-	}
+
+	if (set_fan_status(dev, value))
+		return -EIO;
+
+	dev->force_fan = value;
 
 	return count;
 }
@@ -1610,7 +1627,6 @@ static ssize_t fan_store(struct device *dev,
 			 const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
-	u32 result;
 	int state;
 	int ret;
 
@@ -1621,11 +1637,9 @@ static ssize_t fan_store(struct device *dev,
 	if (state != 0 && state != 1)
 		return -EINVAL;
 
-	result = hci_write(toshiba, HCI_FAN, state);
-	if (result == TOS_FAILURE)
-		return -EIO;
-	else if (result == TOS_NOT_SUPPORTED)
-		return -ENODEV;
+	ret = set_fan_status(toshiba, state);
+	if (ret)
+		return ret;
 
 	return count;
 }
-- 
2.4.6
