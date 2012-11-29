From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 11/11] asus-laptop: always report brightness key events
Date: Thu, 29 Nov 2012 09:12:39 +0100
Message-ID: <1354176759-630-12-git-send-email-corentin.chary@gmail.com>
References: <1354176759-630-1-git-send-email-corentin.chary@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1354176759-630-1-git-send-email-corentin.chary@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/asus-laptop.c |   24 ++++++++++++++++--------
 1 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 0fc4e30..a8a7755 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -128,10 +128,12 @@ MODULE_PARM_DESC(als_status, "Set the ALS status on boot "
 /*
  * Some events we use, same for all Asus
  */
-#define ATKD_BR_UP	0x10	/* (event & ~ATKD_BR_UP) = brightness level */
-#define ATKD_BR_DOWN	0x20	/* (event & ~ATKD_BR_DOWN) = britghness level */
-#define ATKD_BR_MIN	ATKD_BR_UP
-#define ATKD_BR_MAX	(ATKD_BR_DOWN | 0xF)	/* 0x2f */
+#define ATKD_BRNUP_MIN		0x10
+#define ATKD_BRNUP_MAX		0x1f
+#define ATKD_BRNDOWN_MIN	0x20
+#define ATKD_BRNDOWN_MAX	0x2f
+#define ATKD_BRNDOWN		0x20
+#define ATKD_BRNUP		0x2f
 #define ATKD_LCD_ON	0x33
 #define ATKD_LCD_OFF	0x34
 
@@ -301,6 +303,8 @@ static const struct key_entry asus_keymap[] = {
 	{KE_KEY, 0x17, { KEY_ZOOM } },
 	{KE_KEY, 0x1f, { KEY_BATTERY } },
 	/* End of Lenovo SL Specific keycodes */
+	{KE_KEY, ATKD_BRNDOWN, { KEY_BRIGHTNESSDOWN } },
+	{KE_KEY, ATKD_BRNUP, { KEY_BRIGHTNESSUP } },
 	{KE_KEY, 0x30, { KEY_VOLUMEUP } },
 	{KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
 	{KE_KEY, 0x32, { KEY_MUTE } },
@@ -1544,15 +1548,19 @@ static void asus_acpi_notify(struct acpi_device *device, u32 event)
 					dev_name(&asus->device->dev), event,
 					count);
 
-	/* Brightness events are special */
-	if (event >= ATKD_BR_MIN && event <= ATKD_BR_MAX) {
+	if (event >= ATKD_BRNUP_MIN && event <= ATKD_BRNUP_MAX)
+		event = ATKD_BRNUP;
+	else if (event >= ATKD_BRNDOWN_MIN &&
+		 event <= ATKD_BRNDOWN_MAX)
+		event = ATKD_BRNDOWN;
 
-		/* Ignore them completely if the acpi video driver is used */
+	/* Brightness events are special */
+	if (event == ATKD_BRNDOWN && event == ATKD_BRNUP) {
 		if (asus->backlight_device != NULL) {
 			/* Update the backlight device. */
 			asus_backlight_notify(asus);
+			return ;
 		}
-		return ;
 	}
 
 	/* Accelerometer "coarse orientation change" event */
-- 
1.7.8.6
