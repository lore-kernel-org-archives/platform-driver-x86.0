From: Oleksij Rempel <linux@rempel-privat.de>
Subject: [PATCH] asus-wmi: restore kbd led level after resume
Date: Mon, 14 Sep 2015 11:16:30 +0200
Message-ID: <1442222190-8591-1-git-send-email-linux@rempel-privat.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:64902 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752588AbbINJQ4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Sep 2015 05:16:56 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Oleksij Rempel <linux@rempel-privat.de>

Afters suspend/resume cycle with closed lid the kbd backlight level
is lost. This patch will will restore this value to last known level.

Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
---
 drivers/platform/x86/asus-wmi.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index efbc3f0..1f7d80f 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -582,7 +582,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
 
 static int asus_wmi_led_init(struct asus_wmi *asus)
 {
-	int rv = 0;
+	int rv = 0, led_val;
 
 	asus->led_workqueue = create_singlethread_workqueue("led_workqueue");
 	if (!asus->led_workqueue)
@@ -602,9 +602,11 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (kbd_led_read(asus, NULL, NULL) >= 0) {
+	led_val = kbd_led_read(asus, NULL, NULL);
+	if (led_val >= 0) {
 		INIT_WORK(&asus->kbd_led_work, kbd_led_update);
 
+		asus->kbd_led_wk = led_val;
 		asus->kbd_led.name = "asus::kbd_backlight";
 		asus->kbd_led.brightness_set = kbd_led_set;
 		asus->kbd_led.brightness_get = kbd_led_get;
@@ -2160,6 +2162,16 @@ static int asus_hotk_thaw(struct device *device)
 	return 0;
 }
 
+static int asus_hotk_resume(struct device *device)
+{
+	struct asus_wmi *asus = dev_get_drvdata(device);
+
+	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
+		queue_work(asus->led_workqueue, &asus->kbd_led_work);
+
+	return 0;
+}
+
 static int asus_hotk_restore(struct device *device)
 {
 	struct asus_wmi *asus = dev_get_drvdata(device);
@@ -2190,6 +2202,8 @@ static int asus_hotk_restore(struct device *device)
 		bl = !asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_UWB);
 		rfkill_set_sw_state(asus->uwb.rfkill, bl);
 	}
+	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
+		queue_work(asus->led_workqueue, &asus->kbd_led_work);
 
 	return 0;
 }
@@ -2197,6 +2211,7 @@ static int asus_hotk_restore(struct device *device)
 static const struct dev_pm_ops asus_pm_ops = {
 	.thaw = asus_hotk_thaw,
 	.restore = asus_hotk_restore,
+	.resume = asus_hotk_resume,
 };
 
 static int asus_wmi_probe(struct platform_device *pdev)
-- 
2.5.0
