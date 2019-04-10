From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH 01/11] platform/x86: asus-wmi: Fix hwmon device cleanup
Date: Wed, 10 Apr 2019 22:20:58 +0200
Message-ID: <f2822519-c137-560e-fe78-172202e52bfa@gmail.com>
References: <a8dd77f3-1e28-6416-5f04-aff44d5bb6d6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a8dd77f3-1e28-6416-5f04-aff44d5bb6d6@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The asus-wmi driver does not clean up the hwmon device on exit or error.
To reproduce the bug, repeat rmmod, insmod to verify that device number
/sys/devices/platform/asus-nb-wmi/hwmon/hwmon?? grows every time. Add
pointer to the device in module state and call cleanup on error.

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index ee1fa93708ec..6b736a9375ef 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -145,6 +145,7 @@ struct asus_wmi {
 
 	struct input_dev *inputdev;
 	struct backlight_device *backlight_device;
+	struct device *hwmon_device;
 	struct platform_device *platform_device;
 
 	struct led_classdev wlan_led;
@@ -1432,9 +1433,19 @@ static int asus_wmi_hwmon_init(struct asus_wmi *asus)
 		pr_err("Could not register asus hwmon device\n");
 		return PTR_ERR(hwmon);
 	}
+
+	asus->hwmon_device = hwmon;
 	return 0;
 }
 
+static void asus_wmi_hwmon_exit(struct asus_wmi *asus)
+{
+	if (asus->hwmon_device) {
+		asus_hwmon_fan_set_auto(asus);
+		hwmon_device_unregister(asus->hwmon_device);
+	}
+}
+
 /*
  * Backlight
  */
@@ -2157,6 +2168,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 fail_rfkill:
 	asus_wmi_led_exit(asus);
 fail_leds:
+	asus_wmi_hwmon_exit(asus);
 fail_hwmon:
 	asus_wmi_input_exit(asus);
 fail_input:
@@ -2178,7 +2190,7 @@ static int asus_wmi_remove(struct platform_device *device)
 	asus_wmi_rfkill_exit(asus);
 	asus_wmi_debugfs_exit(asus);
 	asus_wmi_platform_exit(asus);
-	asus_hwmon_fan_set_auto(asus);
+	asus_wmi_hwmon_exit(asus);
 
 	kfree(asus);
 	return 0;
-- 
2.17.1
