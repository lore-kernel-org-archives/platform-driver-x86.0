From: =?UTF-8?q?Maxime=20Belleng=C3=A9?= <maxime.bellenge@gmail.com>
Subject: [PATCH v2] Asus WMI : Add lightbar led support
Date: Sat, 23 Sep 2017 18:23:37 +0200
Message-ID: <20170923162337.2748-1-maxime.bellenge@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36678 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750778AbdIWQYG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 23 Sep 2017 12:24:06 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Maxime=20Belleng=C3=A9?= <maxime.bellenge@gmail.com>

Some asus laptops (ROG series for example) are provided
with a lightbar behind the monitor.
This patch make possible to switch it on and off.
This lightbar works exactly as any other led.

V2 : fix whitespaces and typo

Signed-off-by: Maxime Bellengé <maxime.bellenge@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 63 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 709e3a67391a..6837e7fa52ba 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -119,6 +119,7 @@ MODULE_LICENSE("GPL");
 #define ASUS_WMI_DEVID_BRIGHTNESS	0x00050012
 #define ASUS_WMI_DEVID_KBD_BACKLIGHT	0x00050021
 #define ASUS_WMI_DEVID_LIGHT_SENSOR	0x00050022 /* ?? */
+#define ASUS_WMI_DEVID_LIGHTBAR		0x00050025
 
 /* Misc */
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
@@ -148,6 +149,7 @@ MODULE_LICENSE("GPL");
 #define ASUS_WMI_DSTS_BIOS_BIT		0x00040000
 #define ASUS_WMI_DSTS_BRIGHTNESS_MASK	0x000000FF
 #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK	0x0000FF00
+#define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
 
 #define ASUS_FAN_DESC			"cpu_fan"
 #define ASUS_FAN_MFUN			0x13
@@ -222,10 +224,13 @@ struct asus_wmi {
 	int tpd_led_wk;
 	struct led_classdev kbd_led;
 	int kbd_led_wk;
+	struct led_classdev lightbar_led;
+	int lightbar_led_wk;
 	struct workqueue_struct *led_workqueue;
 	struct work_struct tpd_led_work;
 	struct work_struct kbd_led_work;
 	struct work_struct wlan_led_work;
+	struct work_struct lightbar_led_work;
 
 	struct asus_rfkill wlan;
 	struct asus_rfkill bluetooth;
@@ -567,6 +572,48 @@ static enum led_brightness wlan_led_get(struct led_classdev *led_cdev)
 	return result & ASUS_WMI_DSTS_BRIGHTNESS_MASK;
 }
 
+static void lightbar_led_update(struct work_struct *work)
+{
+	int ctrl_param;
+	struct asus_wmi *asus;
+
+	asus = container_of(work, struct asus_wmi, lightbar_led_work);
+
+	ctrl_param = asus->lightbar_led_wk;
+	asus_wmi_set_devstate(ASUS_WMI_DEVID_LIGHTBAR, ctrl_param, NULL);
+}
+
+static void lightbar_led_set(struct led_classdev *led_cdev,
+			     enum led_brightness value)
+{
+	struct asus_wmi *asus;
+
+	asus = container_of(led_cdev, struct asus_wmi, lightbar_led);
+
+	asus->lightbar_led_wk = !!value;
+	queue_work(asus->led_workqueue, &asus->lightbar_led_work);
+}
+
+static enum led_brightness lightbar_led_get(struct led_classdev *led_cdev)
+{
+	struct asus_wmi *asus;
+	u32 result;
+
+	asus = container_of(led_cdev, struct asus_wmi, lightbar_led);
+	asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_LIGHTBAR, &result);
+
+	return result & ASUS_WMI_DSTS_LIGHTBAR_MASK;
+}
+
+static int lightbar_led_presence(struct asus_wmi *asus)
+{
+	u32 result;
+
+	asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_LIGHTBAR, &result);
+
+	return result & ASUS_WMI_DSTS_PRESENCE_BIT;
+}
+
 static void asus_wmi_led_exit(struct asus_wmi *asus)
 {
 	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
@@ -575,6 +622,8 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
 		led_classdev_unregister(&asus->tpd_led);
 	if (!IS_ERR_OR_NULL(asus->wlan_led.dev))
 		led_classdev_unregister(&asus->wlan_led);
+	if (!IS_ERR_OR_NULL(asus->lightbar_led.dev))
+		led_classdev_unregister(&asus->lightbar_led);
 	if (asus->led_workqueue)
 		destroy_workqueue(asus->led_workqueue);
 }
@@ -630,6 +679,20 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 
 		rv = led_classdev_register(&asus->platform_device->dev,
 					   &asus->wlan_led);
+		if (rv)
+			goto error;
+	}
+
+	if (lightbar_led_presence(asus)) {
+		INIT_WORK(&asus->lightbar_led_work, lightbar_led_update);
+
+		asus->lightbar_led.name = "asus::lightbar";
+		asus->lightbar_led.brightness_set = lightbar_led_set;
+		asus->lightbar_led.brightness_get = lightbar_led_get;
+		asus->lightbar_led.max_brightness = 1;
+
+		rv = led_classdev_register(&asus->platform_device->dev,
+					   &asus->lightbar_led);
 	}
 
 error:
-- 
2.13.5
