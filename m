From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH v2] acer-wmi: schedule threeg and interface sysfs for feature removal
Date: Tue, 31 May 2011 14:52:22 +0800
Message-ID: <1306824742-26952-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:33391 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757971Ab1EaHFO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 31 May 2011 03:05:14 -0400
Received: by vws1 with SMTP id 1so3049595vws.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 May 2011 00:05:13 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>

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
Acked-by: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 Documentation/feature-removal-schedule.txt |   13 +++++++++++++
 drivers/platform/x86/acer-wmi.c            |   11 +++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/feature-removal-schedule.txt b/Documentation/feature-removal-schedule.txt
index ff31b1c..c8c18d7 100644
--- a/Documentation/feature-removal-schedule.txt
+++ b/Documentation/feature-removal-schedule.txt
@@ -564,3 +564,16 @@ Why:	Superseded by the UVCIOC_CTRL_QUERY ioctl.
 Who:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 
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
index 005417b..9408cd5 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1400,6 +1400,9 @@ static ssize_t show_bool_threeg(struct device *dev,
 {
 	u32 result; \
 	acpi_status status;
+
+	pr_info("This threeg sysfs will be removed in 2012"
+		" - used by: %s\n", current->comm);
 	if (wmi_has_guid(WMID_GUID3))
 		status = wmid3_get_device_status(&result,
 				ACER_WMID3_GDS_THREEG);
@@ -1415,8 +1418,10 @@ static ssize_t set_bool_threeg(struct device *dev,
 {
 	u32 tmp = simple_strtoul(buf, NULL, 10);
 	acpi_status status = set_u32(tmp, ACER_CAP_THREEG);
-		if (ACPI_FAILURE(status))
-			return -EINVAL;
+	pr_info("This threeg sysfs will be removed in 2012"
+		" - used by: %s\n", current->comm);
+	if (ACPI_FAILURE(status))
+		return -EINVAL;
 	return count;
 }
 static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, show_bool_threeg,
@@ -1425,6 +1430,8 @@ static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, show_bool_threeg,
 static ssize_t show_interface(struct device *dev, struct device_attribute *attr,
 	char *buf)
 {
+	pr_info("This interface sysfs will be removed in 2012"
+		" - used by: %s\n", current->comm);
 	switch (interface->type) {
 	case ACER_AMW0:
 		return sprintf(buf, "AMW0\n");
-- 
1.6.0.2
