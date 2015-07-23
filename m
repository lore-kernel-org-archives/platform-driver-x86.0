From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/1] toshiba_acpi: Add set_fan_status function
Date: Wed, 22 Jul 2015 19:37:48 -0600
Message-ID: <1437615474-27936-3-git-send-email-coproscefalo@gmail.com>
References: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:36609 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753196AbbGWBiE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jul 2015 21:38:04 -0400
In-Reply-To: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch adds a new function named "set_fan_status" to complement
its get* counterpart, as well as to avoid code duplication between
"fan_proc_write" and "fan_store".

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 55 ++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 6013a11..08fc867 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1422,12 +1422,33 @@ static const struct file_operations video_proc_fops = {
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
@@ -1457,23 +1478,22 @@ static ssize_t fan_proc_write(struct file *file, const char __user *buf,
 	char cmd[42];
 	size_t len;
 	int value;
-	u32 hci_result;
+	int ret;
 
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
+	ret = set_fan_status(dev, value);
+	if (ret)
+		return ret;
+
+	dev->force_fan = value;
 
 	return count;
 }
@@ -1610,7 +1630,6 @@ static ssize_t fan_store(struct device *dev,
 			 const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
-	u32 result;
 	int state;
 	int ret;
 
@@ -1621,11 +1640,9 @@ static ssize_t fan_store(struct device *dev,
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
2.4.5
