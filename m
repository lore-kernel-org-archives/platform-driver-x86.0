From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 09/11] backlight: introduce inter-driver notification of changes
Date: Fri, 21 Mar 2014 08:01:20 +0900
Message-ID: <1395356482-7446-10-git-send-email-malattia@linux.it>
References: <1395356482-7446-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:42140 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759504AbaCTXJM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Mar 2014 19:09:12 -0400
In-Reply-To: <1395356482-7446-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>, Jingoo Han <jg1.han@samsung.com>

Allow registered backlight drivers to receive a notification when a
backlight change is triggered via one of the siblings.
sony-laptop needs this notification to be able to set backlight when ALS
is enabled and setting brightness via _BCM becomes a no-op and only
notifies SNC that "a change to the brightness level" was requested
without giving any actual value.

Cc: Jingoo Han <jg1.han@samsung.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/video/backlight/backlight.c | 10 ++++++++++
 include/linux/backlight.h           |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 5d05555..0f9d6ce 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -88,6 +88,7 @@ static inline void backlight_unregister_fb(struct backlight_device *bd)
 static void backlight_generate_event(struct backlight_device *bd,
 				     enum backlight_update_reason reason)
 {
+	struct backlight_device *obd;
 	char *envp[2];
 
 	switch (reason) {
@@ -104,6 +105,15 @@ static void backlight_generate_event(struct backlight_device *bd,
 	envp[1] = NULL;
 	kobject_uevent_env(&bd->dev.kobj, KOBJ_CHANGE, envp);
 	sysfs_notify(&bd->dev.kobj, NULL, "actual_brightness");
+
+	/* notify other bl devices */
+	list_for_each_entry(obd, &backlight_dev_list, entry) {
+		if (bd == obd || !obd->ops || !obd->ops->brightness_changed)
+			continue;
+
+		obd->ops->brightness_changed(obd, bd->props.brightness,
+				bd->props.max_brightness);
+	}
 }
 
 static ssize_t bl_power_show(struct device *dev, struct device_attribute *attr,
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 5f9cd96..974ae3c 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -55,6 +55,9 @@ struct backlight_ops {
 	/* Check if given framebuffer device is the one bound to this backlight;
 	   return 0 if not, !=0 if it is. If NULL, backlight always matches the fb. */
 	int (*check_fb)(struct backlight_device *, struct fb_info *);
+	/* Callback to receive notification of a backlight change triggered by
+	   a different backlight driver */
+	void (*brightness_changed)(struct backlight_device *, int, int);
 };
 
 /* This structure defines all the properties of a backlight */
-- 
1.9.0
