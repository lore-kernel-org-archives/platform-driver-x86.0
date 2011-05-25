From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 1/2] acer-wmi: remove threeg sysfs support
Date: Wed, 25 May 2011 17:58:26 +0800
Message-ID: <1306317507-11743-2-git-send-email-jlee@novell.com>
References: <1306317507-11743-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:33377 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751397Ab1EYKAI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 May 2011 06:00:08 -0400
Received: by mail-vx0-f174.google.com with SMTP id 39so5617069vxi.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2011 03:00:08 -0700 (PDT)
In-Reply-To: <1306317507-11743-1-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

We can now autodetect internal 3G device and already have the threeg
rfkill device. So, we remove threeg sysfs support for it's no longer
necessary.

Tested on Acer Travelmate 8572

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/acer-wmi.c |   37 -------------------------------------
 1 files changed, 0 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 1495539..ba10dba 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1391,33 +1391,6 @@ static void acer_rfkill_exit(void)
 /*
  * sysfs interface
  */
-static ssize_t show_bool_threeg(struct device *dev,
-	struct device_attribute *attr, char *buf)
-{
-	u32 result; \
-	acpi_status status;
-	if (wmi_has_guid(WMID_GUID3))
-		status = wmid3_get_device_status(&result,
-				ACER_WMID3_GDS_THREEG);
-	else
-		status = get_u32(&result, ACER_CAP_THREEG);
-	if (ACPI_SUCCESS(status))
-		return sprintf(buf, "%u\n", result);
-	return sprintf(buf, "Read error\n");
-}
-
-static ssize_t set_bool_threeg(struct device *dev,
-	struct device_attribute *attr, const char *buf, size_t count)
-{
-	u32 tmp = simple_strtoul(buf, NULL, 10);
-	acpi_status status = set_u32(tmp, ACER_CAP_THREEG);
-		if (ACPI_FAILURE(status))
-			return -EINVAL;
-	return count;
-}
-static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, show_bool_threeg,
-	set_bool_threeg);
-
 static ssize_t show_interface(struct device *dev, struct device_attribute *attr,
 	char *buf)
 {
@@ -1754,9 +1727,6 @@ static struct platform_device *acer_platform_device;
 
 static int remove_sysfs(struct platform_device *device)
 {
-	if (has_cap(ACER_CAP_THREEG))
-		device_remove_file(&device->dev, &dev_attr_threeg);
-
 	device_remove_file(&device->dev, &dev_attr_interface);
 
 	return 0;
@@ -1766,13 +1736,6 @@ static int create_sysfs(void)
 {
 	int retval = -ENOMEM;
 
-	if (has_cap(ACER_CAP_THREEG)) {
-		retval = device_create_file(&acer_platform_device->dev,
-			&dev_attr_threeg);
-		if (retval)
-			goto error_sysfs;
-	}
-
 	retval = device_create_file(&acer_platform_device->dev,
 		&dev_attr_interface);
 	if (retval)
-- 
1.6.0.2
