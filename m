From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: schedule threeg and interface sysfs for feature removal
Date: Mon, 30 May 2011 08:21:40 +0800
Message-ID: <1306714900-26916-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.212.179]:42445 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751251Ab1E3AXS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 29 May 2011 20:23:18 -0400
Received: by pxi2 with SMTP id 2so2130706pxi.10
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 May 2011 17:23:18 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

we can now autodetect internal 3G device and already have the threeg
rfkill device. So, we plan to remove threeg sysfs support for it's no
longer necessary.

We also plan to remove interface sysfs file that exposed which ACPI-WMI
interface that was used by acer-wmi driver. It will replaced by information
log when acer-wmi initial.

We keep it around for userspace compatibility reasons, schedule removal
in 2012.

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 Documentation/feature-removal-schedule.txt |   13 +++++++++++++
 drivers/platform/x86/acer-wmi.c            |    3 +++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/Documentation/feature-removal-schedule.txt b/Documentation/feature-removal-schedule.txt
index 492e81d..8427ad0 100644
--- a/Documentation/feature-removal-schedule.txt
+++ b/Documentation/feature-removal-schedule.txt
@@ -580,3 +580,16 @@ Why:	These legacy callbacks should no longer be used as i2c-core offers
 Who:	Jean Delvare <khali@linux-fr.org>
 
 ----------------------------
+
+What:   threeg and interface sysfs files in /sys/devices/platform/acer-wmi
+When:   2012
+Why:    In 2.6.40, we can now autodetect internal 3G device and already have
+	the threeg rfkill device. So, we plan to remove threeg sysfs support
+	for it's no longer necessary.
+
+	We also plan to remove interface sysfs file that exposed which ACPI-WMI
+	interface that was used by acer-wmi driver. It will replaced by
+	information log when acer-wmi initial.
+Who:    Lee, Chun-Yi <jlee@novell.com>
+
+----------------------------
diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 1495539..7e7e668 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1396,6 +1396,8 @@ static ssize_t show_bool_threeg(struct device *dev,
 {
 	u32 result; \
 	acpi_status status;
+
+	pr_info("This threeg sysfs will be removed in 2012.");
 	if (wmi_has_guid(WMID_GUID3))
 		status = wmid3_get_device_status(&result,
 				ACER_WMID3_GDS_THREEG);
@@ -1421,6 +1423,7 @@ static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, show_bool_threeg,
 static ssize_t show_interface(struct device *dev, struct device_attribute *attr,
 	char *buf)
 {
+	pr_info("This interface sysfs will be removed in 2012.");
 	switch (interface->type) {
 	case ACER_AMW0:
 		return sprintf(buf, "AMW0\n");
-- 
1.6.0.2
