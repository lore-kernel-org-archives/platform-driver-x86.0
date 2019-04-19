From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH v3 11/11] platform/x86: asus-wmi: Do not disable keyboard
 backlight on unloading
Date: Fri, 19 Apr 2019 12:16:33 +0200
Message-ID: <e97ae7b4-1d55-a7d0-f401-120316224a54@gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The keyboard backlight is automatically disabled when the module is
unloaded as it is exposed as a ledclass device. Change this behavior to
ignore setting brightness when the device is in unloading state.

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 7974283b7b12..02c9639bf54f 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -483,6 +483,10 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 static void kbd_led_set(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
+	/* Prevent disabling keyboard backlight on module unregister */
+	if (led_cdev->flags & LED_UNREGISTERING)
+		return;
+
 	do_kbd_led_set(led_cdev, value);
 }
 
-- 
2.17.1
