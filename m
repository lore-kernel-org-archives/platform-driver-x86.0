From: Anisse Astier <anisse@astier.eu>
Subject: [PATCH 2/2] msi-wmi: fix semantically incorrect use of keycode instead of scancode
Date: Thu, 18 Nov 2010 13:00:54 +0100
Message-ID: <1290081655-13945-2-git-send-email-anisse@astier.eu>
References: <1290081655-13945-1-git-send-email-anisse@astier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp4-g21.free.fr ([212.27.42.4]:54895 "EHLO smtp4-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751332Ab0KRMGs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Nov 2010 07:06:48 -0500
In-Reply-To: <1290081655-13945-1-git-send-email-anisse@astier.eu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Anisse Astier <anisse@astier.eu>

I didn't know the difference between the two when I=C2=A0wrote this cod=
e in
commit c30116c6f0d26cd6e46dfa578163d573ef4730b2.

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 drivers/platform/x86/msi-wmi.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-=
wmi.c
index bde607d..35278ad 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -43,12 +43,12 @@ MODULE_ALIAS("wmi:B6F3EEF2-3D2F-49DC-9DE3-85BCE18C6=
2F2");
=20
 #define dprintk(msg...) pr_debug(DRV_PFX msg)
=20
-#define KEYCODE_BASE 0xD0
-#define MSI_WMI_BRIGHTNESSUP   KEYCODE_BASE
-#define MSI_WMI_BRIGHTNESSDOWN (KEYCODE_BASE + 1)
-#define MSI_WMI_VOLUMEUP       (KEYCODE_BASE + 2)
-#define MSI_WMI_VOLUMEDOWN     (KEYCODE_BASE + 3)
-#define MSI_WMI_MUTE           (KEYCODE_BASE + 4)
+#define SCANCODE_BASE 0xD0
+#define MSI_WMI_BRIGHTNESSUP   SCANCODE_BASE
+#define MSI_WMI_BRIGHTNESSDOWN (SCANCODE_BASE + 1)
+#define MSI_WMI_VOLUMEUP       (SCANCODE_BASE + 2)
+#define MSI_WMI_VOLUMEDOWN     (SCANCODE_BASE + 3)
+#define MSI_WMI_MUTE           (SCANCODE_BASE + 4)
 static struct key_entry msi_wmi_keymap[] =3D {
 	{ KE_KEY, MSI_WMI_BRIGHTNESSUP,   {KEY_BRIGHTNESSUP} },
 	{ KE_KEY, MSI_WMI_BRIGHTNESSDOWN, {KEY_BRIGHTNESSDOWN} },
@@ -171,7 +171,7 @@ static void msi_wmi_notify(u32 value, void *context=
)
 			ktime_t diff;
 			cur =3D ktime_get_real();
 			diff =3D ktime_sub(cur, last_pressed[key->code -
-					KEYCODE_BASE]);
+					SCANCODE_BASE]);
 			/* Ignore event if the same event happened in a 50 ms
 			   timeframe -> Key press may result in 10-20 GPEs */
 			if (ktime_to_us(diff) < 1000 * 50) {
@@ -180,7 +180,7 @@ static void msi_wmi_notify(u32 value, void *context=
)
 					 key->code, ktime_to_us(diff));
 				return;
 			}
-			last_pressed[key->code - KEYCODE_BASE] =3D cur;
+			last_pressed[key->code - SCANCODE_BASE] =3D cur;
=20
 			if (key->type =3D=3D KE_KEY &&
 			/* Brightness is served via acpi video driver */
--=20
1.7.0.6
