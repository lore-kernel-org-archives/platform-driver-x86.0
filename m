From: Jian-Hong Pan <jian-hong@endlessm.com>
Subject: [RFC PATCH] platform/x86: asus-wmi: Simplify the keyboard brightness updating process
Date: Thu, 16 Aug 2018 16:41:04 +0800
Message-ID: <20180816084104.434-1-jian-hong@endlessm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com
Cc: Jian-Hong Pan <jian-hong@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

The original asus-wmi queues a work which calls the ACPI/WMI methods to
update the keyboard LED brightness.  Similar drivers - acer-wmi,
dell-wmi-led just call the ACPI/WMI methods directly without workqueues.

This patch simplifies the keyboard brightness updating process which
calls the kbd_led_update function directly without workqueue in
asus-wmi.

Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 34dcc1aac4ea..d3d500851a7a 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -239,7 +239,6 @@ struct asus_wmi {
 	int lightbar_led_wk;
 	struct workqueue_struct *led_workqueue;
 	struct work_struct tpd_led_work;
-	struct work_struct kbd_led_work;
 	struct work_struct wlan_led_work;
 	struct work_struct lightbar_led_work;
 
@@ -456,12 +455,9 @@ static enum led_brightness tpd_led_get(struct led_classdev *led_cdev)
 	return read_tpd_led_state(asus);
 }
 
-static void kbd_led_update(struct work_struct *work)
+static void kbd_led_update(struct asus_wmi *asus)
 {
 	int ctrl_param = 0;
-	struct asus_wmi *asus;
-
-	asus = container_of(work, struct asus_wmi, kbd_led_work);
 
 	/*
 	 * bits 0-2: level
@@ -516,7 +512,7 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 		value = 0;
 
 	asus->kbd_led_wk = value;
-	queue_work(asus->led_workqueue, &asus->kbd_led_work);
+	kbd_led_update(asus);
 }
 
 static void kbd_led_set(struct led_classdev *led_cdev,
@@ -671,8 +667,6 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 
 	led_val = kbd_led_read(asus, NULL, NULL);
 	if (led_val >= 0) {
-		INIT_WORK(&asus->kbd_led_work, kbd_led_update);
-
 		asus->kbd_led_wk = led_val;
 		asus->kbd_led.name = "asus::kbd_backlight";
 		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
@@ -2314,7 +2308,7 @@ static int asus_hotk_resume(struct device *device)
 	struct asus_wmi *asus = dev_get_drvdata(device);
 
 	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
-		queue_work(asus->led_workqueue, &asus->kbd_led_work);
+		kbd_led_update(asus);
 
 	return 0;
 }
@@ -2350,7 +2344,7 @@ static int asus_hotk_restore(struct device *device)
 		rfkill_set_sw_state(asus->uwb.rfkill, bl);
 	}
 	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
-		queue_work(asus->led_workqueue, &asus->kbd_led_work);
+		kbd_led_update(asus);
 
 	return 0;
 }
-- 
2.11.0
