From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH v4 13/13] platform/x86: asus-wmi: Do not disable keyboard
 backlight on unloading
Date: Tue, 14 May 2019 21:07:46 +0200
Message-ID: <8b24b62b-4271-1010-ca5f-2974088b1857@gmail.com>
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The keyboard backlight is automatically disabled when the module is
unloaded as it is exposed as a ledclass device. Change this behavior to
ignore setting brightness when the device is in unloading state.

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index feb8d72fc3c5..0c330d6a5871 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -471,6 +471,10 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
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
