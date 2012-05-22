From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] asus-wmi: enable resume on lid open
Date: Tue, 22 May 2012 11:14:08 +0800
Message-ID: <1337656448-30200-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:36747 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753970Ab2EVDOQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 May 2012 23:14:16 -0400
Received: by yhmm54 with SMTP id m54so5066688yhm.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 May 2012 20:14:15 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

According to the ASUS WMI spec., to enable resume on lid open should
use the device ID(0x00120032), but it doesn't work indeed.

After discussing with ASUS' BIOS engineer, they say wake on lid open
doesn't have a uniq device ID(0x00120032) in the BIOS. It shares the same
device ID with deep S3(0x00120031), and the deep S3(resume on lid open)
is disable by default.

Adding this option in asus wmi sysfs
   /sys/devices/platform/<platform>/lid_resume
so that userspace apps can enable/disable this feature by themselves.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 Documentation/ABI/testing/sysfs-platform-asus-wmi |    7 +++++++
 drivers/platform/x86/asus-wmi.c                   |    7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
index 2e7df91..019e1e2 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
@@ -29,3 +29,10 @@ KernelVersion:	2.6.39
 Contact:	"Corentin Chary" <corentincj@iksaif.net>
 Description:
 		Control the card touchpad. 1 means on, 0 means off.
+
+What:		/sys/devices/platform/<platform>/lid_resume
+Date:		May 2012
+KernelVersion:	3.5
+Contact:	"AceLan Kao" <acelan.kao@canonical.com>
+Description:
+		Resume on lid open. 1 means on, 0 means off.
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index b1b8b0b..f0c273f 100644
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
-- 
1.7.9.5
