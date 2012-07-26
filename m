From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 2/2] asus-wmi: update wlan LED through rfkill led trigger
Date: Thu, 26 Jul 2012 11:34:00 +0800
Message-ID: <1343273640-13033-2-git-send-email-acelan.kao@canonical.com>
References: <1343273640-13033-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:52865 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751849Ab2GZDeK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Jul 2012 23:34:10 -0400
Received: by yhmm54 with SMTP id m54so1503246yhm.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jul 2012 20:34:10 -0700 (PDT)
In-Reply-To: <1343273640-13033-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

For those machines with wapf=4, BIOS won't update the wireless LED,
since wapf=4 means user application will take in chage of the wifi and bt.
So, we have to update wlan LED status explicitly.

But I found there is another wireless LED bug in launchpad and which is
not in the wapf=4 quirk.
So, it might be better to set wireless LED status explicitly for all
machines.

BugLink: https://launchpad.net/bugs/901105

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a13eb45..6ddfb0b 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -183,6 +183,7 @@ struct asus_wmi {
 	struct device *hwmon_device;
 	struct platform_device *platform_device;
 
+	struct led_classdev wlan_led;
 	struct led_classdev tpd_led;
 	int tpd_led_wk;
 	struct led_classdev kbd_led;
@@ -452,12 +453,20 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 	return value;
 }
 
+static void wlan_led_set(struct led_classdev *led_cdev,
+			 enum led_brightness value)
+{
+	asus_wmi_set_devstate(ASUS_WMI_DEVID_WIRELESS_LED, value, NULL);
+}
+
 static void asus_wmi_led_exit(struct asus_wmi *asus)
 {
 	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
 		led_classdev_unregister(&asus->kbd_led);
 	if (!IS_ERR_OR_NULL(asus->tpd_led.dev))
 		led_classdev_unregister(&asus->tpd_led);
+	if (!IS_ERR_OR_NULL(asus->wlan_led.dev))
+		led_classdev_unregister(&asus->wlan_led);
 	if (asus->led_workqueue)
 		destroy_workqueue(asus->led_workqueue);
 }
@@ -465,6 +474,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
 static int asus_wmi_led_init(struct asus_wmi *asus)
 {
 	int rv = 0;
+	u32 result;
 
 	asus->led_workqueue = create_singlethread_workqueue("led_workqueue");
 	if (!asus->led_workqueue)
@@ -498,6 +508,17 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
+	asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_WIRELESS_LED, &result);
+	if (result & ASUS_WMI_DSTS_PRESENCE_BIT) {
+		asus->wlan_led.name = "asus-wmi::wlan";
+		asus->wlan_led.brightness_set = wlan_led_set;
+		asus->wlan_led.flags = LED_CORE_SUSPENDRESUME;
+		asus->wlan_led.max_brightness = 1;
+		asus->wlan_led.default_trigger = "asus-wlan";
+		rv = led_classdev_register(&asus->platform_device->dev,
+					   &asus->wlan_led);
+
+	}
 error:
 	if (rv)
 		asus_wmi_led_exit(asus);
@@ -811,6 +832,9 @@ static int asus_new_rfkill(struct asus_wmi *asus,
 	if (!*rfkill)
 		return -EINVAL;
 
+	if (dev_id == ASUS_WMI_DEVID_WLAN)
+		rfkill_set_led_trigger_name(*rfkill, "asus-wlan");
+
 	rfkill_init_sw_state(*rfkill, !result);
 	result = rfkill_register(*rfkill);
 	if (result) {
-- 
1.7.9.5
