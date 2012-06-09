From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 6/7] sony-laptop: fix sony_nc_sysfs_store()
Date: Sat,  9 Jun 2012 13:18:13 +0900
Message-ID: <1339215494-4020-7-git-send-email-malattia@linux.it>
References: <20120531220257.GA3986@kamineko.org>
 <1339215494-4020-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:33918 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750835Ab2FIESh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Jun 2012 00:18:37 -0400
In-Reply-To: <1339215494-4020-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Mattia Dongili <malattia@linux.it>

From: Dan Carpenter <dan.carpenter@oracle.com>

We made this an unsigned long and it causes a bug on 64 bit big endian
systems when we try to pass the value to sony_nc_int_call().

Also value has to be signed because validate() returns negative error
codes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 534c295..6123987 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -973,7 +973,7 @@ static ssize_t sony_nc_sysfs_store(struct device *dev,
 			       struct device_attribute *attr,
 			       const char *buffer, size_t count)
 {
-	unsigned long value = 0;
+	int value;
 	int ret = 0;
 	struct sony_nc_value *item =
 	    container_of(attr, struct sony_nc_value, devattr);
@@ -984,7 +984,7 @@ static ssize_t sony_nc_sysfs_store(struct device *dev,
 	if (count > 31)
 		return -EINVAL;
 
-	if (kstrtoul(buffer, 10, &value))
+	if (kstrtoint(buffer, 10, &value))
 		return -EINVAL;
 
 	if (item->validate)
@@ -994,7 +994,7 @@ static ssize_t sony_nc_sysfs_store(struct device *dev,
 		return value;
 
 	ret = sony_nc_int_call(sony_nc_acpi_handle, *item->acpiset,
-			(int *)&value, NULL);
+			       &value, NULL);
 	if (ret < 0)
 		return -EIO;
 
-- 
1.7.10
