From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 2/2] acer-wmi: remove interface sysfs file
Date: Wed, 25 May 2011 17:58:27 +0800
Message-ID: <1306317507-11743-3-git-send-email-jlee@novell.com>
References: <1306317507-11743-1-git-send-email-jlee@novell.com>
 <1306317507-11743-2-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:33377 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751397Ab1EYKAO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 May 2011 06:00:14 -0400
Received: by mail-vx0-f174.google.com with SMTP id 39so5617069vxi.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2011 03:00:13 -0700 (PDT)
In-Reply-To: <1306317507-11743-2-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Remove interface sysfs file that exposed which ACPI-WMI interface
that was used by acer-wmi driver. It was replaced by information log
when acer-wmi initial.

Tested on Acer Travelmate 8572

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/acer-wmi.c |   59 ++++----------------------------------
 1 files changed, 7 insertions(+), 52 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index ba10dba..64b7e20 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1388,26 +1388,6 @@ static void acer_rfkill_exit(void)
 	return;
 }
 
-/*
- * sysfs interface
- */
-static ssize_t show_interface(struct device *dev, struct device_attribute *attr,
-	char *buf)
-{
-	switch (interface->type) {
-	case ACER_AMW0:
-		return sprintf(buf, "AMW0\n");
-	case ACER_AMW0_V2:
-		return sprintf(buf, "AMW0 v2\n");
-	case ACER_WMID:
-		return sprintf(buf, "WMID\n");
-	default:
-		return sprintf(buf, "Error!\n");
-	}
-}
-
-static DEVICE_ATTR(interface, S_IRUGO, show_interface, NULL);
-
 static void acer_wmi_notify(u32 value, void *context)
 {
 	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -1725,29 +1705,6 @@ static struct platform_driver acer_platform_driver = {
 
 static struct platform_device *acer_platform_device;
 
-static int remove_sysfs(struct platform_device *device)
-{
-	device_remove_file(&device->dev, &dev_attr_interface);
-
-	return 0;
-}
-
-static int create_sysfs(void)
-{
-	int retval = -ENOMEM;
-
-	retval = device_create_file(&acer_platform_device->dev,
-		&dev_attr_interface);
-	if (retval)
-		goto error_sysfs;
-
-	return 0;
-
-error_sysfs:
-		remove_sysfs(acer_platform_device);
-	return retval;
-}
-
 static void remove_debugfs(void)
 {
 	debugfs_remove(interface->debug.devices);
@@ -1791,11 +1748,15 @@ static int __init acer_wmi_init(void)
 	/*
 	 * Detect which ACPI-WMI interface we're using.
 	 */
-	if (wmi_has_guid(AMW0_GUID1) && wmi_has_guid(WMID_GUID1))
+	if (wmi_has_guid(AMW0_GUID1) && wmi_has_guid(WMID_GUID1)) {
+		pr_info("Using AMW0 v2 interface\n");
 		interface = &AMW0_V2_interface;
+	}
 
-	if (!wmi_has_guid(AMW0_GUID1) && wmi_has_guid(WMID_GUID1))
+	if (!wmi_has_guid(AMW0_GUID1) && wmi_has_guid(WMID_GUID1)) {
+		pr_info("Using WMID interface\n");
 		interface = &wmid_interface;
+	}
 
 	if (wmi_has_guid(WMID_GUID2) && interface) {
 		if (ACPI_FAILURE(WMID_set_capabilities())) {
@@ -1808,6 +1769,7 @@ static int __init acer_wmi_init(void)
 	}
 
 	if (wmi_has_guid(AMW0_GUID1) && !wmi_has_guid(WMID_GUID1)) {
+		pr_info("Using AMW0 interface\n");
 		interface = &AMW0_interface;
 
 		if (ACPI_FAILURE(AMW0_set_capabilities())) {
@@ -1868,10 +1830,6 @@ static int __init acer_wmi_init(void)
 	if (err)
 		goto error_device_add;
 
-	err = create_sysfs();
-	if (err)
-		goto error_create_sys;
-
 	if (wmi_has_guid(WMID_GUID2)) {
 		interface->debug.wmid_devices = get_wmid_devices();
 		err = create_debugfs();
@@ -1885,8 +1843,6 @@ static int __init acer_wmi_init(void)
 	return 0;
 
 error_create_debugfs:
-	remove_sysfs(acer_platform_device);
-error_create_sys:
 	platform_device_del(acer_platform_device);
 error_device_add:
 	platform_device_put(acer_platform_device);
@@ -1904,7 +1860,6 @@ static void __exit acer_wmi_exit(void)
 	if (wmi_has_guid(ACERWMID_EVENT_GUID))
 		acer_wmi_input_destroy();
 
-	remove_sysfs(acer_platform_device);
 	remove_debugfs();
 	platform_device_unregister(acer_platform_device);
 	platform_driver_unregister(&acer_platform_driver);
-- 
1.6.0.2
