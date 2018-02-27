From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 4/7] platform/x86: fujitsu-laptop: Rename constants defining hotkey codes
Date: Tue, 27 Feb 2018 22:15:36 +0100
Message-ID: <20180227211539.5708-5-kernel@kempniu.pl>
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

Rename KEYx_CODE constants to EVENT_HKx, so that their names better fit
the OP_GET_EVENTS operation they are used with.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 36 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 3e824e961260..5f8c89155b51 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -120,11 +120,11 @@
 #define STATE_BACKLIGHT_ON		0
 
 /* Scancodes read from the GIRB register */
-#define KEY1_CODE			0x410
-#define KEY2_CODE			0x411
-#define KEY3_CODE			0x412
-#define KEY4_CODE			0x413
-#define KEY5_CODE			0x420
+#define EVENT_HK1			0x410
+#define EVENT_HK2			0x411
+#define EVENT_HK3			0x412
+#define EVENT_HK4			0x413
+#define EVENT_HK5			0x420
 
 /* Hotkey ringbuffer limits */
 #define MAX_HOTKEY_RINGBUFFER_SIZE	100
@@ -470,28 +470,28 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 /* ACPI device for hotkey handling */
 
 static const struct key_entry keymap_default[] = {
-	{ KE_KEY, KEY1_CODE, { KEY_PROG1 } },
-	{ KE_KEY, KEY2_CODE, { KEY_PROG2 } },
-	{ KE_KEY, KEY3_CODE, { KEY_PROG3 } },
-	{ KE_KEY, KEY4_CODE, { KEY_PROG4 } },
-	{ KE_KEY, KEY5_CODE, { KEY_RFKILL } },
+	{ KE_KEY, EVENT_HK1, { KEY_PROG1 } },
+	{ KE_KEY, EVENT_HK2, { KEY_PROG2 } },
+	{ KE_KEY, EVENT_HK3, { KEY_PROG3 } },
+	{ KE_KEY, EVENT_HK4, { KEY_PROG4 } },
+	{ KE_KEY, EVENT_HK5, { KEY_RFKILL } },
 	{ KE_KEY, BIT(26),   { KEY_TOUCHPAD_TOGGLE } },
 	{ KE_END, 0 }
 };
 
 static const struct key_entry keymap_s64x0[] = {
-	{ KE_KEY, KEY1_CODE, { KEY_SCREENLOCK } },	/* "Lock" */
-	{ KE_KEY, KEY2_CODE, { KEY_HELP } },		/* "Mobility Center */
-	{ KE_KEY, KEY3_CODE, { KEY_PROG3 } },
-	{ KE_KEY, KEY4_CODE, { KEY_PROG4 } },
+	{ KE_KEY, EVENT_HK1, { KEY_SCREENLOCK } },	/* "Lock" */
+	{ KE_KEY, EVENT_HK2, { KEY_HELP } },		/* "Mobility Center */
+	{ KE_KEY, EVENT_HK3, { KEY_PROG3 } },
+	{ KE_KEY, EVENT_HK4, { KEY_PROG4 } },
 	{ KE_END, 0 }
 };
 
 static const struct key_entry keymap_p8010[] = {
-	{ KE_KEY, KEY1_CODE, { KEY_HELP } },		/* "Support" */
-	{ KE_KEY, KEY2_CODE, { KEY_PROG2 } },
-	{ KE_KEY, KEY3_CODE, { KEY_SWITCHVIDEOMODE } },	/* "Presentation" */
-	{ KE_KEY, KEY4_CODE, { KEY_WWW } },		/* "WWW" */
+	{ KE_KEY, EVENT_HK1, { KEY_HELP } },		/* "Support" */
+	{ KE_KEY, EVENT_HK2, { KEY_PROG2 } },
+	{ KE_KEY, EVENT_HK3, { KEY_SWITCHVIDEOMODE } },	/* "Presentation" */
+	{ KE_KEY, EVENT_HK4, { KEY_WWW } },		/* "WWW" */
 	{ KE_END, 0 }
 };
 
-- 
2.16.2
