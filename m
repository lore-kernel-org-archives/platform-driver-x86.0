From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 04/19] sony-laptop: use kstrtoul to parse sysfs values
Date: Sat, 19 May 2012 22:35:47 +0900
Message-ID: <1337434562-12283-5-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47654 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758043Ab2ESNpP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:15 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

This avoids surprises like echoing "enable" into a sysfs file and
finding that the feature was actually disabled.

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 6aefd35..d6c53c6 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -944,7 +944,8 @@ static ssize_t sony_nc_sysfs_store(struct device *dev,
 			       struct device_attribute *attr,
 			       const char *buffer, size_t count)
 {
-	int value, ret = 0;
+	unsigned long value = 0;
+	int ret = 0;
 	struct sony_nc_value *item =
 	    container_of(attr, struct sony_nc_value, devattr);
 
@@ -954,7 +955,8 @@ static ssize_t sony_nc_sysfs_store(struct device *dev,
 	if (count > 31)
 		return -EINVAL;
 
-	value = simple_strtoul(buffer, NULL, 10);
+	if (kstrtoul(buffer, 10, &value))
+		return -EINVAL;
 
 	if (item->validate)
 		value = item->validate(SNC_VALIDATE_IN, value);
@@ -962,8 +964,8 @@ static ssize_t sony_nc_sysfs_store(struct device *dev,
 	if (value < 0)
 		return value;
 
-	ret = sony_nc_int_call(sony_nc_acpi_handle, *item->acpiset, &value,
-			NULL);
+	ret = sony_nc_int_call(sony_nc_acpi_handle, *item->acpiset,
+			(int *)&value, NULL);
 	if (ret < 0)
 		return -EIO;
 
@@ -1445,7 +1447,7 @@ static ssize_t sony_nc_kbd_backlight_mode_store(struct device *dev,
 	if (count > 31)
 		return -EINVAL;
 
-	if (strict_strtoul(buffer, 10, &value))
+	if (kstrtoul(buffer, 10, &value))
 		return -EINVAL;
 
 	ret = __sony_nc_kbd_backlight_mode_set(value);
@@ -1489,7 +1491,7 @@ static ssize_t sony_nc_kbd_backlight_timeout_store(struct device *dev,
 	if (count > 31)
 		return -EINVAL;
 
-	if (strict_strtoul(buffer, 10, &value))
+	if (kstrtoul(buffer, 10, &value))
 		return -EINVAL;
 
 	ret = __sony_nc_kbd_backlight_timeout_set(value);
@@ -2439,7 +2441,9 @@ static ssize_t sony_pic_wwanpower_store(struct device *dev,
 	if (count > 31)
 		return -EINVAL;
 
-	value = simple_strtoul(buffer, NULL, 10);
+	if (kstrtoul(buffer, 10, &value))
+		return -EINVAL;
+
 	mutex_lock(&spic_dev.lock);
 	__sony_pic_set_wwanpower(value);
 	mutex_unlock(&spic_dev.lock);
@@ -2476,7 +2480,9 @@ static ssize_t sony_pic_bluetoothpower_store(struct device *dev,
 	if (count > 31)
 		return -EINVAL;
 
-	value = simple_strtoul(buffer, NULL, 10);
+	if (kstrtoul(buffer, 10, &value))
+		return -EINVAL;
+
 	mutex_lock(&spic_dev.lock);
 	__sony_pic_set_bluetoothpower(value);
 	mutex_unlock(&spic_dev.lock);
@@ -2515,7 +2521,9 @@ static ssize_t sony_pic_fanspeed_store(struct device *dev,
 	if (count > 31)
 		return -EINVAL;
 
-	value = simple_strtoul(buffer, NULL, 10);
+	if (kstrtoul(buffer, 10, &value))
+		return -EINVAL;
+
 	if (sony_pic_set_fanspeed(value))
 		return -EIO;
 
-- 
1.7.10
