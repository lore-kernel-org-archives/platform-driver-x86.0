From: Antonio Rosario Intilisano <antonio.intilisano@gmail.com>
Subject: [PATCH] platform/x86: acer-wmi: add another KEY_POWER keycode
Date: Fri, 20 Apr 2018 23:32:12 +0200
Message-ID: <20180420213212.30445-1-antonio.intilisano@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, locutusofborg@debian.org, Antonio Rosario Intilisano <antonio.intilisano@gmail.com>, Chris Chiu <chiu@endlessm.com>, Daniel Drake <drake@endlessm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

    Now that we have informed the firmware that the Power Button driver is
    active, laptops such as the Acer Swift 3 will generate
    a WMI key event with code 0x87 when the power button key is
    pressed. 
    
    Add this keycode to the table so that it is converted to an appropriate
    input event.

Signed-off-by: Antonio Rosario Intilisano <antonio.intilisano@gmail.com>
Acked-by: Gianfranco Costamagna <locutusofborg@debian.org>
Cc: Chris Chiu <chiu@endlessm.com>
Cc: Daniel Drake <drake@endlessm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
 drivers/platform/x86/acer-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 1be71f956d5c..8952173dd380 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -129,6 +129,7 @@ static const struct key_entry acer_wmi_keymap[] __initconst = { 	{KE_IGNORE, 0x83, {KEY_TOUCHPAD_TOGGLE} },
 	{KE_KEY, 0x85, {KEY_TOUCHPAD_TOGGLE} },
 	{KE_KEY, 0x86, {KEY_WLAN} },
+	{KE_KEY, 0x87, {KEY_POWER} },
 	{KE_END, 0}
 };
 
-- 
2.15.1
