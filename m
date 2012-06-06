From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] sony-laptop: fix sony_nc_sysfs_store()
Date: Wed, 6 Jun 2012 09:57:12 +0300
Message-ID: <20120606065712.GA26869@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from rcsinet15.oracle.com ([148.87.113.117]:26318 "EHLO
	rcsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751971Ab2FFG5W (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Jun 2012 02:57:22 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

We made this an unsigned long and it causes a bug on 64 bit big endian
systems when we try to pass the value to sony_nc_int_call().

Also value has to be signed because validate() returns negative error
codes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker bug.  Not tested, sorry.

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 210d4ae..7cf0f3d 100644
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
 
