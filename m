From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] dell-laptop: Only install the i8042 filter when rfkill is active
Date: Tue, 24 Dec 2013 20:34:01 +0100
Message-ID: <1387913641-7498-2-git-send-email-hdegoede@redhat.com>
References: <1387913641-7498-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:24004 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752410Ab3LXTeJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Dec 2013 14:34:09 -0500
In-Reply-To: <1387913641-7498-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Installing the i8042 filter is not useful on machines where rfkill is not
whitelisted, so move the filter installation into dell_setup_rfkill,
after the whitelist check.

This avoids doing a needless and potentially troublesome rfkill query
(dell_send_request(buf, 17, 11)) when the wireless Fn key gets pressed on
non whitelisted laptops.

This patch was written as a result of:
https://bugzilla.redhat.com/show_bug.cgi?id=1045807
It is not yet clear if this is related, but it is a good idea to not register
the i8042 filter in general.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 63 +++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index c608b1d..49a4f37 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -559,6 +559,29 @@ static void dell_update_rfkill(struct work_struct *ignored)
 }
 static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
 
+static bool dell_laptop_i8042_filter(unsigned char data, unsigned char str,
+			      struct serio *port)
+{
+	static bool extended;
+
+	if (str & 0x20)
+		return false;
+
+	if (unlikely(data == 0xe0)) {
+		extended = true;
+		return false;
+	} else if (unlikely(extended)) {
+		switch (data) {
+		case 0x8:
+			schedule_delayed_work(&dell_rfkill_work,
+					      round_jiffies_relative(HZ / 4));
+			break;
+		}
+		extended = false;
+	}
+
+	return false;
+}
 
 static int __init dell_setup_rfkill(void)
 {
@@ -633,7 +656,16 @@ static int __init dell_setup_rfkill(void)
 			goto err_wwan;
 	}
 
+	ret = i8042_install_filter(dell_laptop_i8042_filter);
+	if (ret) {
+		pr_warn("Unable to install key filter\n");
+		goto err_filter;
+	}
+
 	return 0;
+err_filter:
+	if (wwan_rfkill)
+		rfkill_unregister(wwan_rfkill);
 err_wwan:
 	rfkill_destroy(wwan_rfkill);
 	if (bluetooth_rfkill)
@@ -755,30 +787,6 @@ static void touchpad_led_exit(void)
 	led_classdev_unregister(&touchpad_led);
 }
 
-static bool dell_laptop_i8042_filter(unsigned char data, unsigned char str,
-			      struct serio *port)
-{
-	static bool extended;
-
-	if (str & 0x20)
-		return false;
-
-	if (unlikely(data == 0xe0)) {
-		extended = true;
-		return false;
-	} else if (unlikely(extended)) {
-		switch (data) {
-		case 0x8:
-			schedule_delayed_work(&dell_rfkill_work,
-					      round_jiffies_relative(HZ / 4));
-			break;
-		}
-		extended = false;
-	}
-
-	return false;
-}
-
 static int __init dell_init(void)
 {
 	int max_intensity = 0;
@@ -828,12 +836,6 @@ static int __init dell_init(void)
 		goto fail_rfkill;
 	}
 
-	ret = i8042_install_filter(dell_laptop_i8042_filter);
-	if (ret) {
-		pr_warn("Unable to install key filter\n");
-		goto fail_filter;
-	}
-
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_init(&platform_device->dev);
 
@@ -885,7 +887,6 @@ static int __init dell_init(void)
 fail_backlight:
 	i8042_remove_filter(dell_laptop_i8042_filter);
 	cancel_delayed_work_sync(&dell_rfkill_work);
-fail_filter:
 	dell_cleanup_rfkill();
 fail_rfkill:
 	free_page((unsigned long)bufferpage);
-- 
1.8.4.2
