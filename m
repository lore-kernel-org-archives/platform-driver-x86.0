From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] platform/x86: asus-nb-wmi: Support left round button on N56VB
Date: Mon, 13 Jan 2020 19:39:27 -0300
Message-ID: <20200113223927.102509-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: platform-driver-x86.vger.kernel.org

The N56VB laptop has a round button located on the left side above the
keyboard. Map it to F13 since it does not have any predeterminated
purpose.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/platform/x86/asus-nb-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index b361c73636a4..6f12747a359a 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -471,6 +471,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV */
 	{ KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
 	{ KE_IGNORE, 0x6E, },  /* Low Battery notification */
+	{ KE_KEY, 0x71, { KEY_F13 } }, /* General-purpose button */
 	{ KE_KEY, 0x7a, { KEY_ALS_TOGGLE } }, /* Ambient Light Sensor Toggle */
 	{ KE_KEY, 0x7c, { KEY_MICMUTE } },
 	{ KE_KEY, 0x7D, { KEY_BLUETOOTH } }, /* Bluetooth Enable */
-- 
2.24.1
