From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH v2] platform/x86: dell-laptop: Fix bogus keyboard backlight sysfs interface
Date: Mon, 19 Jun 2017 15:36:29 +0800
Message-ID: <20170619073629.14239-1-kai.heng.feng@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:38854 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752531AbdFSHgi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jun 2017 03:36:38 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pali.rohar@gmail.com
Cc: andy@infradead.org, mjg59@srcf.ucam.org, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>

Dell Latitude 3160 does not have keyboard backlight, but there is a
sysfs interface for it, which does nothing at all.

KBD_LED_ON_TOKEN is the only token can be found. Since it doesn't have
KBD_LED_OFF_TOKEN or KBD_LED_AUTO_*_TOKEN, it should be safe to assume it
does not support keyboard backlight.

Models which do not use SMBIOS to control keyboard backlight, also have
this issue. Brightness level is 0 on these models. Verified on Dell
Inspiron 3565.

Reports keyboard backlight is supported only when tokens other than
KBD_LED_ON_TOKEN can be found, or brightness level is not 0.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---

v2:
The only token can be found is actually KBD_LED_ON_TOKEN, which is BIT(5),
instead of KBD_LED_OFF_TOKEN. Change commit log accordingly.

Use token bit to make the intention more clear.
Also consider kbd_mode_levels_count and kbd_info.levels, suggested by
Pali Rohár.

Use XOR to simplify the bitmask comparison, suggested by
Andy Shevchenko.

 drivers/platform/x86/dell-laptop.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index ec202094bd50..4b21fc982cb0 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1148,6 +1148,15 @@ static const int kbd_tokens[] = {
 	KBD_LED_ON_TOKEN,
 };
 
+enum kbd_led_token_bit {
+	KBD_LED_TOKEN_BIT_OFF = 0,
+	KBD_LED_TOKEN_BIT_AUTO_25,
+	KBD_LED_TOKEN_BIT_AUTO_50,
+	KBD_LED_TOKEN_BIT_AUTO_75,
+	KBD_LED_TOKEN_BIT_AUTO_100,
+	KBD_LED_TOKEN_BIT_ON,
+};
+
 static u16 kbd_token_bits;
 
 static struct kbd_info kbd_info;
@@ -1510,7 +1519,12 @@ static void kbd_init(void)
 	ret = kbd_init_info();
 	kbd_init_tokens();
 
-	if (kbd_token_bits != 0 || ret == 0)
+	/*
+	 * If brightness level is 0, or KBD_LED_ON_TOKEN is the only token,
+	 * consider there is no keyboard backlight.
+	 */
+	if ((ret == 0 && (kbd_info.levels || kbd_mode_levels_count)) ||
+	    kbd_token_bits ^ BIT(KBD_LED_TOKEN_BIT_ON))
 		kbd_led_present = true;
 }
 
-- 
2.13.1
