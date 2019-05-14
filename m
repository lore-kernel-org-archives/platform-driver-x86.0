From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH v4 02/13] platform/x86: asus-wmi: Fix preserving keyboard
 backlight intensity on load
Date: Tue, 14 May 2019 20:51:25 +0200
Message-ID: <40403d07-293a-62a1-e0e9-ad6a2ba84844@gmail.com>
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

The error code and return value are mixed up. The intensity is always set
to 0 on load as kbd_led_read returns either 0 or negative value. To
reproduce set backlight to maximum, reload driver and try to increase it
using keyboard hotkey, the intensity will drop as a result. Correct the
implementation.

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 62567766bdfb..84d7fc6f941c 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -595,8 +595,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	led_val = kbd_led_read(asus, NULL, NULL);
-	if (led_val >= 0) {
+	if (!kbd_led_read(asus, &led_val, NULL)) {
 		asus->kbd_led_wk = led_val;
 		asus->kbd_led.name = "asus::kbd_backlight";
 		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
-- 
2.17.1
