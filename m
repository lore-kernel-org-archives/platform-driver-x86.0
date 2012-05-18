From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] asus-wmi: enable resume on lid open
Date: Fri, 18 May 2012 16:56:57 +0800
Message-ID: <1337331418-6616-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:43812 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966886Ab2ERI5E (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 May 2012 04:57:04 -0400
Received: by pbbrp8 with SMTP id rp8so3681770pbb.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 May 2012 01:57:03 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

According to the ASUS WMI spec., to enable resume on lid open should
use the device ID(0x00120032), but it doesn't work indeed.

After discussing with ASUS' BIOS engineer, they say wake on lid open
doesn't have a uniq device ID(0x00120032) in the BIOS. It shares the same
device ID with deep S3(0x00120031), and the deep S3(resume on lid open)
is disable by default.

It's reasonable to resume the system while opening the lid, so add it
in the asus-wmi driver and tested the code on ASUS X100CH and ASUS 1015CX.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index b1b8b0b..7f31f44 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -137,6 +137,9 @@ MODULE_LICENSE("GPL");
 /* Power */
 #define ASUS_WMI_DEVID_PROCESSOR_STATE	0x00120012
 
+/* Deep S3 / Resume on LID open */
+#define ASUS_WMI_DEVID_LID_RESUME	0x00120031
+
 /* DSTS masks */
 #define ASUS_WMI_DSTS_STATUS_BIT	0x00000001
 #define ASUS_WMI_DSTS_UNKNOWN_BIT	0x00000002
@@ -1372,6 +1375,7 @@ static ssize_t show_sys_wmi(struct asus_wmi *asus, int devid, char *buf)
 ASUS_WMI_CREATE_DEVICE_ATTR(touchpad, 0644, ASUS_WMI_DEVID_TOUCHPAD);
 ASUS_WMI_CREATE_DEVICE_ATTR(camera, 0644, ASUS_WMI_DEVID_CAMERA);
 ASUS_WMI_CREATE_DEVICE_ATTR(cardr, 0644, ASUS_WMI_DEVID_CARDREADER);
+ASUS_WMI_CREATE_DEVICE_ATTR(lid_resume, 0644, ASUS_WMI_DEVID_LID_RESUME);
 
 static ssize_t store_cpufv(struct device *dev, struct device_attribute *attr,
 			   const char *buf, size_t count)
@@ -1397,6 +1401,7 @@ static struct attribute *platform_attributes[] = {
 	&dev_attr_camera.attr,
 	&dev_attr_cardr.attr,
 	&dev_attr_touchpad.attr,
+	&dev_attr_lid_resume.attr,
 	NULL
 };
 
@@ -1415,6 +1420,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 		devid = ASUS_WMI_DEVID_CARDREADER;
 	else if (attr == &dev_attr_touchpad.attr)
 		devid = ASUS_WMI_DEVID_TOUCHPAD;
+	else if (attr == &dev_attr_lid_resume.attr)
+		devid = ASUS_WMI_DEVID_LID_RESUME;
 
 	if (devid != -1)
 		ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
@@ -1488,6 +1495,9 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 		asus_wmi_set_devstate(ASUS_WMI_DEVID_CWAP,
 				      asus->driver->quirks->wapf, NULL);
 
+	/* Enable resume on lid open */
+	asus_wmi_set_devstate(ASUS_WMI_DEVID_LID_RESUME, 1, &rv);
+
 	return asus_wmi_sysfs_init(asus->platform_device);
 }
 
-- 
1.7.9.5
