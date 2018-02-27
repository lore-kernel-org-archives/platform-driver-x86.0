From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 5/7] platform/x86: fujitsu-laptop: Tweak how constants are commented and laid out
Date: Tue, 27 Feb 2018 22:15:37 +0100
Message-ID: <20180227211539.5708-6-kernel@kempniu.pl>
References: <20180227211539.5708-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180227211539.5708-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Update comments used for each group of constants to better reflect their
current purpose.  Ensure the layout of groups of constants follows the
order in which call_fext_func() takes its arguments.  Use alphabetic
ordering for groups of constants.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 55 +++++++++++++++++------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 5f8c89155b51..5acf1ccc6864 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -78,15 +78,15 @@
 
 #define ACPI_FUJITSU_NOTIFY_CODE	0x80
 
-/* FUNC interface - command values */
-#define FUNC_FLAGS			BIT(12)
-#define FUNC_LEDS			(BIT(12) | BIT(0))
-#define FUNC_BUTTONS			(BIT(12) | BIT(1))
-#define FUNC_BACKLIGHT			(BIT(12) | BIT(2))
-
 /* FUNC interface - responses */
 #define UNSUPPORTED_CMD			BIT(31)
 
+/* FUNC interface - function selectors */
+#define FUNC_BACKLIGHT			(BIT(12) | BIT(2))
+#define FUNC_BUTTONS			(BIT(12) | BIT(1))
+#define FUNC_FLAGS			BIT(12)
+#define FUNC_LEDS			(BIT(12) | BIT(0))
+
 /* FUNC interface - operations */
 #define OP_GET				BIT(1)
 #define OP_GET_CAPS			0
@@ -95,41 +95,40 @@
 #define OP_SET				BIT(0)
 #define OP_SET_EXT			(BIT(2) | BIT(0))
 
-/* FUNC interface - status flags */
-#define FLAG_RFKILL			BIT(5)
-#define FLAG_LID			BIT(8)
-#define FLAG_DOCK			BIT(9)
-
-/* FUNC interface - LED control */
-#define STATE_LED_OFF			BIT(0)
-#define STATE_LED_ON			(BIT(0) | BIT(16) | BIT(17))
-#define FEAT_LOGOLAMP_POWERON		BIT(13)
-#define FEAT_LOGOLAMP_ALWAYS		BIT(14)
-#define FEAT_KEYBOARD_LAMPS		BIT(8)
-
-#define FEAT_RADIO_LED			BIT(5)
-#define STATE_RADIO_LED_OFF		0
-#define STATE_RADIO_LED_ON		BIT(5)
-
-#define FEAT_ECO_LED			BIT(16)
-#define STATE_ECO_LED_ON		BIT(19)
-
-/* FUNC interface - backlight power control */
+/* Constants related to FUNC_BACKLIGHT */
 #define FEAT_BACKLIGHT_POWER		BIT(2)
 #define STATE_BACKLIGHT_OFF		(BIT(0) | BIT(1))
 #define STATE_BACKLIGHT_ON		0
 
-/* Scancodes read from the GIRB register */
+/* Constants related to FUNC_BUTTONS */
 #define EVENT_HK1			0x410
 #define EVENT_HK2			0x411
 #define EVENT_HK3			0x412
 #define EVENT_HK4			0x413
 #define EVENT_HK5			0x420
 
-/* Hotkey ringbuffer limits */
 #define MAX_HOTKEY_RINGBUFFER_SIZE	100
 #define RINGBUFFERSIZE			40
 
+/* Constant related to FUNC_FLAGS */
+#define FLAG_DOCK			BIT(9)
+#define FLAG_LID			BIT(8)
+#define FLAG_RFKILL			BIT(5)
+
+/* Constants related to FUNC_LEDS */
+#define FEAT_KEYBOARD_LAMPS		BIT(8)
+#define FEAT_LOGOLAMP_ALWAYS		BIT(14)
+#define FEAT_LOGOLAMP_POWERON		BIT(13)
+#define STATE_LED_OFF			BIT(0)
+#define STATE_LED_ON			(BIT(0) | BIT(16) | BIT(17))
+
+#define FEAT_RADIO_LED			BIT(5)
+#define STATE_RADIO_LED_OFF		0
+#define STATE_RADIO_LED_ON		BIT(5)
+
+#define FEAT_ECO_LED			BIT(16)
+#define STATE_ECO_LED_ON		BIT(19)
+
 /* Module parameters */
 static int use_alt_lcd_levels = -1;
 static bool disable_brightness_adjust;
-- 
2.16.2
