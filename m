From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH] platform/x86: dell-laptop: Fix bogus keyboard backlight sysfs interface
Date: Fri, 16 Jun 2017 15:35:39 +0800
Message-ID: <20170616073539.1185-1-kai.heng.feng@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:48093 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752124AbdFPHf5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jun 2017 03:35:57 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pali.rohar@gmail.com
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>

Dell Latitude 3160 does not have keyboard backlight, but there is a
sysfs interface for it, which does nothing at all.

KBD_LED_OFF_TOKEN is the only token can be found. Since it doesn't have
KBD_LED_ON_TOKEN or KBD_LED_AUTO_*_TOKEN, it should be safe to assume it
does not support keyboard backlight.

Reports keyboard backlight is supported only when tokens other than
KBD_LED_OFF_TOKEN can be found.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/platform/x86/dell-laptop.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index ec202094bd50..743d7ce8c0c8 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1510,7 +1510,11 @@ static void kbd_init(void)
 	ret = kbd_init_info();
 	kbd_init_tokens();
 
-	if (kbd_token_bits != 0 || ret == 0)
+	/*
+	 * If KBD_LED_OFF_TOKEN is the only token,
+	 * consider there is no keyboard backlight.
+	 */
+	if ((kbd_token_bits & ~BIT(5)) != 0 || ret == 0)
 		kbd_led_present = true;
 }
 
-- 
2.13.1
