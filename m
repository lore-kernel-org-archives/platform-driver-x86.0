From: Martin Kepplinger <martink@posteo.de>
Subject: [PATCH] acer-wmi: update removal notice for sysfs interface
Date: Wed, 17 Jun 2015 03:36:24 +0200
Message-ID: <1434504984-4918-1-git-send-email-martink@posteo.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx02.posteo.de ([89.146.194.165]:40931 "EHLO mx02.posteo.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754418AbbFQBh6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Jun 2015 21:37:58 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@suse.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kepplinger <martink@posteo.de>

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
These just look odd when out of date. The proper fix would probably be
to create a Documentation/ABI/testing/sysfs-platform-acer-wmi file and
remove the deprecated ones.


 drivers/platform/x86/acer-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 3ac29a1..83c4850 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1670,7 +1670,7 @@ static ssize_t show_bool_threeg(struct device *dev,
 	u32 result; \
 	acpi_status status;
 
-	pr_info("This threeg sysfs will be removed in 2014 - used by: %s\n",
+	pr_info("This threeg sysfs will be removed in 2015 - used by: %s\n",
 		current->comm);
 	status = get_u32(&result, ACER_CAP_THREEG);
 	if (ACPI_SUCCESS(status))
@@ -1683,7 +1683,7 @@ static ssize_t set_bool_threeg(struct device *dev,
 {
 	u32 tmp = simple_strtoul(buf, NULL, 10);
 	acpi_status status = set_u32(tmp, ACER_CAP_THREEG);
-	pr_info("This threeg sysfs will be removed in 2014 - used by: %s\n",
+	pr_info("This threeg sysfs will be removed in 2015 - used by: %s\n",
 		current->comm);
 	if (ACPI_FAILURE(status))
 		return -EINVAL;
@@ -1695,7 +1695,7 @@ static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, show_bool_threeg,
 static ssize_t show_interface(struct device *dev, struct device_attribute *attr,
 	char *buf)
 {
-	pr_info("This interface sysfs will be removed in 2014 - used by: %s\n",
+	pr_info("This interface sysfs will be removed in 2015 - used by: %s\n",
 		current->comm);
 	switch (interface->type) {
 	case ACER_AMW0:
-- 
2.1.4
