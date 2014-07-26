From: Martin Kepplinger <martink@posteo.de>
Subject: [PATCH] Fix log message about future removal of interface
Date: Sat, 26 Jul 2014 17:46:06 +0200
Message-ID: <1406389566-9752-1-git-send-email-martink@posteo.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx02.posteo.de ([89.146.194.165]:59135 "EHLO posteo.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751895AbaGZPrI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 26 Jul 2014 11:47:08 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@suse.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kepplinger <martink@posteo.de>

If this is going away, it won't be in 2012.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
This just looked a little odd in the logs. Feel free to ignore or act
upon it differently. This applies to -next as well.

 drivers/platform/x86/acer-wmi.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index bbf78b2..cf2dda2 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1658,7 +1658,7 @@ static ssize_t show_bool_threeg(struct device *dev,
 	u32 result; \
 	acpi_status status;
 
-	pr_info("This threeg sysfs will be removed in 2012 - used by: %s\n",
+	pr_info("This threeg sysfs will be removed in 2014 - used by: %s\n",
 		current->comm);
 	status = get_u32(&result, ACER_CAP_THREEG);
 	if (ACPI_SUCCESS(status))
@@ -1671,7 +1671,7 @@ static ssize_t set_bool_threeg(struct device *dev,
 {
 	u32 tmp = simple_strtoul(buf, NULL, 10);
 	acpi_status status = set_u32(tmp, ACER_CAP_THREEG);
-	pr_info("This threeg sysfs will be removed in 2012 - used by: %s\n",
+	pr_info("This threeg sysfs will be removed in 2014 - used by: %s\n",
 		current->comm);
 	if (ACPI_FAILURE(status))
 		return -EINVAL;
@@ -1683,7 +1683,7 @@ static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, show_bool_threeg,
 static ssize_t show_interface(struct device *dev, struct device_attribute *attr,
 	char *buf)
 {
-	pr_info("This interface sysfs will be removed in 2012 - used by: %s\n",
+	pr_info("This interface sysfs will be removed in 2014 - used by: %s\n",
 		current->comm);
 	switch (interface->type) {
 	case ACER_AMW0:
-- 
1.7.10.4
