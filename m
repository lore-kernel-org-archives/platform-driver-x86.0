From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH 3/6] msi-laptop: Code cleanups
Date: Sun, 25 Nov 2012 00:28:58 +0200
Message-ID: <1353796141-1470-4-git-send-email-maxtram95@gmail.com>
References: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:51195 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752502Ab2KXW3U (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 24 Nov 2012 17:29:20 -0500
Received: by mail-ea0-f174.google.com with SMTP id e13so3959552eaa.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Nov 2012 14:29:19 -0800 (PST)
In-Reply-To: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@novell.com, mjg@redhat.com
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

Replaced msi_init_rfkill() by msi_update_rfkill(), removed delays by
replacing delayed works by just works and made msi_laptop_i8042_filter()
filter out KEY_TOUCHPAD_TOGGLE when sending KEY_TOUCHPAD_ON and
KEY_TOUCHPAD_OFF.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/platform/x86/msi-laptop.c | 67 ++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 7ba107a..3b6f494 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -600,8 +600,23 @@ static const struct rfkill_ops rfkill_threeg_ops = {
 	.set_block = rfkill_threeg_set
 };
 
+static void msi_update_rfkill(struct work_struct *ignored)
+{
+	get_wireless_state_ec_standard();
+
+	if (rfk_wlan)
+		rfkill_set_sw_state(rfk_wlan, !wlan_s);
+	if (rfk_bluetooth)
+		rfkill_set_sw_state(rfk_bluetooth, !bluetooth_s);
+	if (rfk_threeg)
+		rfkill_set_sw_state(rfk_threeg, !threeg_s);
+}
+static DECLARE_WORK(msi_rfkill_work, msi_update_rfkill);
+
 static void rfkill_cleanup(void)
 {
+	cancel_work_sync(&msi_rfkill_work);
+
 	if (rfk_bluetooth) {
 		rfkill_unregister(rfk_bluetooth);
 		rfkill_destroy(rfk_bluetooth);
@@ -618,19 +633,6 @@ static void rfkill_cleanup(void)
 	}
 }
 
-static void msi_update_rfkill(struct work_struct *ignored)
-{
-	get_wireless_state_ec_standard();
-
-	if (rfk_wlan)
-		rfkill_set_sw_state(rfk_wlan, !wlan_s);
-	if (rfk_bluetooth)
-		rfkill_set_sw_state(rfk_bluetooth, !bluetooth_s);
-	if (rfk_threeg)
-		rfkill_set_sw_state(rfk_threeg, !threeg_s);
-}
-static DECLARE_DELAYED_WORK(msi_rfkill_work, msi_update_rfkill);
-
 static void msi_send_touchpad_key(struct work_struct *ignored)
 {
 	u8 rdata;
@@ -644,7 +646,7 @@ static void msi_send_touchpad_key(struct work_struct *ignored)
 		(rdata & MSI_STANDARD_EC_TOUCHPAD_MASK) ?
 		KEY_TOUCHPAD_ON : KEY_TOUCHPAD_OFF, 1, true);
 }
-static DECLARE_DELAYED_WORK(msi_touchpad_work, msi_send_touchpad_key);
+static DECLARE_WORK(msi_touchpad_work, msi_send_touchpad_key);
 
 static bool msi_laptop_i8042_filter(unsigned char data, unsigned char str,
 				struct serio *port)
@@ -662,14 +664,16 @@ static bool msi_laptop_i8042_filter(unsigned char data, unsigned char str,
 		extended = false;
 		switch (data) {
 		case 0xE4:
-			schedule_delayed_work(&msi_touchpad_work,
-				round_jiffies_relative(0.5 * HZ));
-			break;
+			schedule_work(&msi_touchpad_work);
+		case 0x64:
+			/* Filter out KEY_TOUCHPAD_TOGGLE and send only
+			 * KEY_TOUCHPAD_ON and KEY_TOUCHPAD_OFF
+			 */
+			return true;
 		case 0x54:
 		case 0x62:
 		case 0x76:
-			schedule_delayed_work(&msi_rfkill_work,
-				round_jiffies_relative(0.5 * HZ));
+			schedule_work(&msi_rfkill_work);
 			break;
 		}
 	}
@@ -677,31 +681,11 @@ static bool msi_laptop_i8042_filter(unsigned char data, unsigned char str,
 	return false;
 }
 
-static void msi_init_rfkill(struct work_struct *ignored)
-{
-	if (rfk_wlan) {
-		rfkill_set_sw_state(rfk_wlan, !wlan_s);
-		rfkill_wlan_set(NULL, !wlan_s);
-	}
-	if (rfk_bluetooth) {
-		rfkill_set_sw_state(rfk_bluetooth, !bluetooth_s);
-		rfkill_bluetooth_set(NULL, !bluetooth_s);
-	}
-	if (rfk_threeg) {
-		rfkill_set_sw_state(rfk_threeg, !threeg_s);
-		rfkill_threeg_set(NULL, !threeg_s);
-	}
-}
-static DECLARE_DELAYED_WORK(msi_rfkill_init, msi_init_rfkill);
-
 static int rfkill_init(struct platform_device *sdev)
 {
 	/* add rfkill */
 	int retval;
 
-	/* keep the hardware wireless state */
-	get_wireless_state_ec_standard();
-
 	rfk_bluetooth = rfkill_alloc("msi-bluetooth", &sdev->dev,
 				RFKILL_TYPE_BLUETOOTH,
 				&rfkill_bluetooth_ops, NULL);
@@ -736,8 +720,7 @@ static int rfkill_init(struct platform_device *sdev)
 	}
 
 	/* schedule to run rfkill state initial */
-	schedule_delayed_work(&msi_rfkill_init,
-				round_jiffies_relative(1 * HZ));
+	schedule_work(&msi_rfkill_work);
 
 	return 0;
 
@@ -951,7 +934,6 @@ fail_platform_device2:
 
 	if (load_scm_model) {
 		i8042_remove_filter(msi_laptop_i8042_filter);
-		cancel_delayed_work_sync(&msi_rfkill_work);
 		rfkill_cleanup();
 	}
 	platform_device_del(msipf_device);
@@ -976,7 +958,6 @@ static void __exit msi_cleanup(void)
 	if (load_scm_model) {
 		i8042_remove_filter(msi_laptop_i8042_filter);
 		msi_laptop_input_destroy();
-		cancel_delayed_work_sync(&msi_rfkill_work);
 		rfkill_cleanup();
 	}
 
-- 
1.8.0
