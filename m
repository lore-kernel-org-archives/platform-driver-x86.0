From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 1/2] sony-laptop: warn on multiple KBD backlight handles
Date: Wed, 13 Nov 2013 08:17:35 +0900
Message-ID: <1384298256-14103-2-git-send-email-malattia@linux.it>
References: <1384298256-14103-1-git-send-email-malattia@linux.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:46808 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754386Ab3KLXSA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Nov 2013 18:18:00 -0500
In-Reply-To: <1384298256-14103-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>, =?UTF-8?q?Marco=20Kr=C3=BCger?= <krgsch@gmail.com>

Some BIOS versions/Vaio models apparently ship with two nearly identica=
l
functions to handle backlight related controls.
The only difference seems to be:
        If (LEqual (BUF1, 0x40))
        {
            Store (0x40, P80H)
            Store (BUF2, Local0)
-           And (Local0, One, Local0)
+           And (Local0, 0x03, Local0)
            Store (Local0, ^^H_EC.KLPC)
        }

Avoid erroring out on initialization and messing things up on cleanup
for now since we never call into these methods with anything different
than 1 or 0.
This issue was found on a Sony VPCSE1V9E/BIOS R2087H4.

Cc: Marco Kr=C3=BCger <krgsch@gmail.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/=
sony-laptop.c
index 13ec195..6b63329 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -145,7 +145,8 @@ static void sony_nc_thermal_resume(void);
 #endif
 static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
 		unsigned int handle);
-static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd);
+static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd,
+		unsigned int handle);
=20
 static int sony_nc_battery_care_setup(struct platform_device *pd,
 		unsigned int handle);
@@ -1444,7 +1445,7 @@ static void sony_nc_function_cleanup(struct platf=
orm_device *pd)
 		case 0x014b:
 		case 0x014c:
 		case 0x0163:
-			sony_nc_kbd_backlight_cleanup(pd);
+			sony_nc_kbd_backlight_cleanup(pd, handle);
 			break;
 		default:
 			continue;
@@ -1825,6 +1826,12 @@ static int sony_nc_kbd_backlight_setup(struct pl=
atform_device *pd,
 	int result;
 	int ret =3D 0;
=20
+	if (kbdbl_ctl) {
+		pr_warn("handle 0x%.4x: keyboard backlight setup already done for 0x=
%.4x\n",
+				handle, kbdbl_ctl->handle);
+		return -EBUSY;
+	}
+
 	/* verify the kbd backlight presence, these handles are not used for
 	 * keyboard backlight only
 	 */
@@ -1884,9 +1891,10 @@ outkzalloc:
 	return ret;
 }
=20
-static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd)
+static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd,
+		unsigned int handle)
 {
-	if (kbdbl_ctl) {
+	if (kbdbl_ctl && handle =3D=3D kbdbl_ctl->handle) {
 		device_remove_file(&pd->dev, &kbdbl_ctl->mode_attr);
 		device_remove_file(&pd->dev, &kbdbl_ctl->timeout_attr);
 		kfree(kbdbl_ctl);
--=20
1.8.4.2
