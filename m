From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/3] toshiba_haps: Replace sscanf with kstrtoint
Date: Thu, 26 Feb 2015 10:58:30 -0700
Message-ID: <1424973511-3090-2-git-send-email-coproscefalo@gmail.com>
References: <1424973511-3090-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:49974 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932338AbbBZR6o (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Feb 2015 12:58:44 -0500
In-Reply-To: <1424973511-3090-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch simply replaces the use of sscanf with kstrtoint returning
the error code in case that something went bad.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_haps.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/toshiba_haps.c b/drivers/platform/x86/toshiba_haps.c
index 65300b6..db6cc53 100644
--- a/drivers/platform/x86/toshiba_haps.c
+++ b/drivers/platform/x86/toshiba_haps.c
@@ -78,15 +78,20 @@ static ssize_t protection_level_store(struct device *dev,
 				      const char *buf, size_t count)
 {
 	struct toshiba_haps_dev *haps = dev_get_drvdata(dev);
-	int level, ret;
-
-	if (sscanf(buf, "%d", &level) != 1 || level < 0 || level > 3)
-		return -EINVAL;
+	int level;
+	int ret;
 
-	/* Set the sensor level.
-	 * Acceptable levels are:
+	ret = kstrtoint(buf, 0, &level);
+	if (ret)
+		return ret;
+	/*
+	 * Check for supported levels, which can be:
 	 * 0 - Disabled | 1 - Low | 2 - Medium | 3 - High
 	 */
+	if (level < 0 || level > 3)
+		return -EINVAL;
+
+	/* Set the sensor level */
 	ret = toshiba_haps_protection_level(haps->acpi_dev->handle, level);
 	if (ret != 0)
 		return ret;
@@ -101,9 +106,14 @@ static ssize_t reset_protection_store(struct device *dev,
 				      const char *buf, size_t count)
 {
 	struct toshiba_haps_dev *haps = dev_get_drvdata(dev);
-	int reset, ret;
+	int reset;
+	int ret;
 
-	if (sscanf(buf, "%d", &reset) != 1 || reset != 1)
+	ret = kstrtoint(buf, 0, &reset);
+	if (ret)
+		return ret;
+	/* The only accepted value is 1 */
+	if (reset != 1)
 		return -EINVAL;
 
 	/* Reset the protection interface */
-- 
2.2.2
