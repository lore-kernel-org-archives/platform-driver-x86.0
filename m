From: Martin Kepplinger <martink@posteo.de>
Subject: [PATCH] platform: acer-wmi: update notice about deprecated user interface
Date: Tue, 29 Sep 2015 08:46:38 +0200
Message-ID: <1443509198-11655-1-git-send-email-martink@posteo.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout01.posteo.de ([185.67.36.65]:60654 "EHLO mout01.posteo.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755304AbbI2GtQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Sep 2015 02:49:16 -0400
Received: from dovecot03.posteo.de (dovecot03.posteo.de [172.16.0.13])
	by mout01.posteo.de (Postfix) with ESMTPS id DDF4C20972
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2015 08:49:11 +0200 (CEST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@suse.com, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kepplinger <martink@posteo.de>

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
This just looks odd in the logs. Feel free to ignore it or act on it
differently ;)


 drivers/platform/x86/acer-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index d773b9d..43d992e 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1671,7 +1671,7 @@ static ssize_t show_bool_threeg(struct device *dev,
 	u32 result; \
 	acpi_status status;
 
-	pr_info("This threeg sysfs will be removed in 2014 - used by: %s\n",
+	pr_info("This threeg sysfs will be removed in 2016 - used by: %s\n",
 		current->comm);
 	status = get_u32(&result, ACER_CAP_THREEG);
 	if (ACPI_SUCCESS(status))
@@ -1684,7 +1684,7 @@ static ssize_t set_bool_threeg(struct device *dev,
 {
 	u32 tmp = simple_strtoul(buf, NULL, 10);
 	acpi_status status = set_u32(tmp, ACER_CAP_THREEG);
-	pr_info("This threeg sysfs will be removed in 2014 - used by: %s\n",
+	pr_info("This threeg sysfs will be removed in 2016 - used by: %s\n",
 		current->comm);
 	if (ACPI_FAILURE(status))
 		return -EINVAL;
@@ -1696,7 +1696,7 @@ static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, show_bool_threeg,
 static ssize_t show_interface(struct device *dev, struct device_attribute *attr,
 	char *buf)
 {
-	pr_info("This interface sysfs will be removed in 2014 - used by: %s\n",
+	pr_info("This interface sysfs will be removed in 2016 - used by: %s\n",
 		current->comm);
 	switch (interface->type) {
 	case ACER_AMW0:
-- 
2.1.4
