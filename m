From: Mattia Dongili <malattia@linux.it>
Subject: Re: sony-laptop crash (Sony VPC SE 1V9E) for 3.8.0+
Date: Sun, 22 Sep 2013 12:10:01 +0900
Message-ID: <20130922031001.GA6901@kamineko.org>
References: <51FE2F39.4080504@gmail.com>
 <20130804221454.GB7707@kamineko.org>
 <51FEF199.7050800@gmail.com>
 <20130808221742.GA27435@kamineko.org>
 <523E1206.8080001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:45864 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752599Ab3IVDTB convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 Sep 2013 23:19:01 -0400
Content-Disposition: inline
In-Reply-To: <523E1206.8080001@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco =?iso-8859-1?Q?Kr=FCger?= <krgsch@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On Sat, Sep 21, 2013 at 11:39:18PM +0200, Marco Kr=FCger wrote:
> Hi Mattia,
>=20
> you are right!
> If I comment out either one case  (0x0143/0x014b) no crash occurs. I
> also recognized that the gfx switch value is wrong. Using the gfx
> switch toggles the value, but it is the opposite to the actual
> switch position. What can I do to help you solving this bug?

apologies, this issue flew off my radar and I essentially forgot about
it.
I had prepared this patch back then, could you see if it also works?

I think these checks should be extended to all handles not just the
keyboard backlight one but that's a bigger patch.

---=20
commit 0fcf192e1bdd396cb510bed918ee6c450396c8e4
Author: Mattia Dongili <malattia@linux.it>
Date:   Sun Aug 18 19:32:08 2013 +0900

    sony-laptop: warn on multiple KBD backlight handles
   =20
    Some BIOS versions/Vaio models apparently ship with two nearly iden=
tical
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
   =20
    Avoid erroring out on initialization and messing things up on clean=
up
    for now since we never call into those methods with anything differ=
ent
    than 1 or 0.
    This issue was found on a Sony VPCSE1V9E/BIOS R2087H4.
   =20
    Cc: Marco Kr=FCger <krgsch@gmail.com>
    Signed-off-by: Mattia Dongili <malattia@linux.it>

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/=
sony-laptop.c
index 3a1b6bf..b5a7f3c 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -146,7 +146,8 @@ static void sony_nc_thermal_resume(void);
 #endif
 static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
 		unsigned int handle);
-static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd);
+static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd,
+		unsigned int handle);
=20
 static int sony_nc_battery_care_setup(struct platform_device *pd,
 		unsigned int handle);
@@ -1448,7 +1449,7 @@ static void sony_nc_function_cleanup(struct platf=
orm_device *pd)
 		case 0x014b:
 		case 0x014c:
 		case 0x0163:
-			sony_nc_kbd_backlight_cleanup(pd);
+			sony_nc_kbd_backlight_cleanup(pd, handle);
 			break;
 		default:
 			continue;
@@ -1829,6 +1830,12 @@ static int sony_nc_kbd_backlight_setup(struct pl=
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
@@ -1886,9 +1893,10 @@ outkzalloc:
 	return ret;
 }
=20
-static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd)
+static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd,
+		unsigned int handle)
 {
-	if (kbdbl_ctl) {
+	if (kbdbl_ctl && handle =3D=3D kbdbl_ctl->handle) {
 		int result;
=20
 		device_remove_file(&pd->dev, &kbdbl_ctl->mode_attr);
--=20
mattia
:wq!
