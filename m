From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/3] toshiba_haps: Make use of DEVICE_ATTR_{RW, WO} macros
Date: Thu, 26 Feb 2015 10:58:31 -0700
Message-ID: <1424973511-3090-3-git-send-email-coproscefalo@gmail.com>
References: <1424973511-3090-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:52940 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472AbbBZR6p (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Feb 2015 12:58:45 -0500
In-Reply-To: <1424973511-3090-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch makes use of DEVICE_ATTR_{RW, WO} macros, simplifying
device attributes creation.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_haps.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/toshiba_haps.c b/drivers/platform/x86/toshiba_haps.c
index db6cc53..7f2afc6 100644
--- a/drivers/platform/x86/toshiba_haps.c
+++ b/drivers/platform/x86/toshiba_haps.c
@@ -100,6 +100,7 @@ static ssize_t protection_level_store(struct device *dev,
 
 	return count;
 }
+static DEVICE_ATTR_RW(protection_level);
 
 static ssize_t reset_protection_store(struct device *dev,
 				      struct device_attribute *attr,
@@ -123,10 +124,7 @@ static ssize_t reset_protection_store(struct device *dev,
 
 	return count;
 }
-
-static DEVICE_ATTR(protection_level, S_IRUGO | S_IWUSR,
-		   protection_level_show, protection_level_store);
-static DEVICE_ATTR(reset_protection, S_IWUSR, NULL, reset_protection_store);
+static DEVICE_ATTR_WO(reset_protection);
 
 static struct attribute *haps_attributes[] = {
 	&dev_attr_protection_level.attr,
-- 
2.2.2
