From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Tue, 12 Apr 2016 22:06:34 +0930
Message-ID: <20160412123634.GA8195@marvin.atrad.com.au>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160318120418.GA29889@marvin.atrad.com.au>
 <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
 <20160324113513.GA5129@marvin.atrad.com.au>
 <20160410023020.GA27081@dvhart-mobl5.amr.corp.intel.com>
 <20160410105258.GA2922@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:35589 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756685AbcDLMjY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Apr 2016 08:39:24 -0400
Content-Disposition: inline
In-Reply-To: <20160410105258.GA2922@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Darren

On Sun, Apr 10, 2016 at 08:22:58PM +0930, Jonathan Woithe wrote:
> On Sat, Apr 09, 2016 at 07:30:20PM -0700, Darren Hart wrote:
> > Jonathan, Micha??,
> >=20
> > Where are we with this? The above reads as "Doesn't appear to break=
 existing
> > systems on hand". Jonathan, are you happy with this patch?
>=20
> Sorry, I got caught up over the last couple of weeks with other tasks=
 and
> have not yet managed to confirm the lack of regressions on the S7020.=
  It
> was on my list for this coming week though.  My comments quoted above=
 were
> theoretical rather than based on an actual test.  The patch appears f=
airly
> innoculous given that BTNI bit 24 is not set on the S7020 but for
> completeness I would prefer to give it a run on the S7020 before we m=
erge
> the patch.  I will make an effort to fit this in over the next couple=
 of
> days.

I have now tested the patch on the S7020 and unsurprisingly I have not
observed any regressions.  I'm therefore happy to take the patch more o=
r
less as is.  However, I would like to see a brief comment in
acpi_fujitsu_hotkey_add() about the use of bit 24 in BTNI to determine
whether the LED handler should be registered since the reasoning is not
obvious and is not evident from the code.  A copy of the original patch=
 with
such a comment inserted (no code changes) is below.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
Acked-by: Jonathan Woithe <jwoithe@just42.net>

Micha=C5=82 hasn't indicated that a revised patch is in the works so I'=
m fine if
you proceed with the one below.  I've selected the relevant parts of hi=
s
preamble for inclusion in the commit message, but feel free to edit fur=
ther
to your taste.

Regards
  jonathan

=46rom: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>

Lifebook E734/E744/E754 has a LED which the manual calls "radio compone=
nts
indicator".  It should be lit when any radio transmitter is enabled.  I=
ts
state can be read and set using ACPI (FUNC interface, RFKILL method).

Since the Lifebook E734/E744/E754 only has a button (as compared to a
slider) for enabling/disabling radio transmitters, I believe the LED in
question is meant to indicate whether all radio transmitters are curren=
tly
on or off.  However, pressing the radio toggle button doesn't automatic=
ally
change the hardware state of the transmitters: it looks like this machi=
ne
relies on soft rfkill.

As for detecting whether the LED is present on a given machine, I had t=
o
resort to educated guesswork.  I assumed this LED is present on all dev=
ices
which have a radio toggle button instead of a slider.  My Lifebook E744
holds 0x01010001 in BTNI.  By comparing the bits and buttons with those=
 of a
Lifebook E8420 (BTNI=3D0x000F0101, has a slider), I put my money on bit=
 24 as
the indicator of the radio toggle button being present.  Furthermore, b=
it 24
is also clear on the S7020 which does not have the toggle button or an =
RF
LED.

=46iguring out how the LED is controlled was more deterministic as all =
it
took was decompiling the DSDT and taking a look at method S000 (the
RFKILL method of the FUNC interface).

The LED control method implemented here is unsuitable for use with "hea=
vy"
LED triggers, like phy0rx.  Once blinking frequency achieves a certain
level, the system hangs.

While it's not essential, it would be nice to initialize soft rfkill st=
ate
of all radio transmitters to the value of RFSW upon boot.  Note that th=
is
value is persisted between reboots until the battery is removed, but ca=
n be
changed before the kernel is booted.  I haven't found an rfkill functio=
n
which would enable one to set all rfkill devices to a chosen initial so=
ft
state (note that fujitsu-laptop doesn't create any rfkill devices on it=
s
own).  This is probably a task best delegated to userspace.

I think this LED would best be driven by an inverted airplane mode LED
trigger (as proposed by Jo=C3=A3o Paulo Rechi Vita).  As the code for t=
hat
trigger is not yet merged, I refrained from setting the default_trigger
field in struct led_classdev radio_led.  Perhaps it's a candidate for a
follow-up patch in the future.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
Acked-by: Jonathan Woithe <jwoithe@just42.net>
---
--- a/drivers/platform/x86/fujitsu-laptop.c	2016-03-14 14:58:54.0000000=
00 +1030
+++ b/drivers/platform/x86/fujitsu-laptop.c	2016-04-12 22:39:39.9404483=
29 +0930
@@ -107,6 +107,7 @@
 #define KEYBOARD_LAMPS	0x100
 #define LOGOLAMP_POWERON 0x2000
 #define LOGOLAMP_ALWAYS  0x4000
+#define RADIO_LED_ON	0x20
 #endif
=20
 /* Hotkey details */
@@ -173,6 +174,7 @@ struct fujitsu_hotkey_t {
 	int rfkill_state;
 	int logolamp_registered;
 	int kblamps_registered;
+	int radio_led_registered;
 };
=20
 static struct fujitsu_hotkey_t *fujitsu_hotkey;
@@ -199,6 +201,16 @@ static struct led_classdev kblamps_led =3D
  .brightness_get =3D kblamps_get,
  .brightness_set =3D kblamps_set
 };
+
+static enum led_brightness radio_led_get(struct led_classdev *cdev);
+static void radio_led_set(struct led_classdev *cdev,
+			       enum led_brightness brightness);
+
+static struct led_classdev radio_led =3D {
+ .name =3D "fujitsu::radio_led",
+ .brightness_get =3D radio_led_get,
+ .brightness_set =3D radio_led_set
+};
 #endif
=20
 #ifdef CONFIG_FUJITSU_LAPTOP_DEBUG
@@ -274,6 +286,15 @@ static void kblamps_set(struct led_class
 		call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_OFF);
 }
=20
+static void radio_led_set(struct led_classdev *cdev,
+				enum led_brightness brightness)
+{
+	if (brightness >=3D LED_FULL)
+		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, RADIO_LED_ON);
+	else
+		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, 0x0);
+}
+
 static enum led_brightness logolamp_get(struct led_classdev *cdev)
 {
 	enum led_brightness brightness =3D LED_OFF;
@@ -298,6 +319,16 @@ static enum led_brightness kblamps_get(s
=20
 	return brightness;
 }
+
+static enum led_brightness radio_led_get(struct led_classdev *cdev)
+{
+	enum led_brightness brightness =3D LED_OFF;
+
+	if (call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0) & RADIO_LED_ON)
+		brightness =3D LED_FULL;
+
+	return brightness;
+}
 #endif
=20
 /* Hardware access for LCD brightness control */
@@ -893,6 +924,22 @@ static int acpi_fujitsu_hotkey_add(struc
 			       result);
 		}
 	}
+
+	/* BTNI bit 24 seems to indicate the presence of a radio toggle
+	 * button in place of a slide switch, and all such machines appear
+	 * to also have an RF LED.  Therefore use bit 24 as an indicator
+	 * that an RF LED is present.
+	 */
+	if (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
+		result =3D led_classdev_register(&fujitsu->pf_device->dev,
+						&radio_led);
+		if (result =3D=3D 0) {
+			fujitsu_hotkey->radio_led_registered =3D 1;
+		} else {
+			pr_err("Could not register LED handler for radio LED, error %i\n",
+			       result);
+		}
+	}
 #endif
=20
 	return result;
@@ -919,6 +966,9 @@ static int acpi_fujitsu_hotkey_remove(st
=20
 	if (fujitsu_hotkey->kblamps_registered)
 		led_classdev_unregister(&kblamps_led);
+
+	if (fujitsu_hotkey->radio_led_registered)
+		led_classdev_unregister(&radio_led);
 #endif
=20
 	input_unregister_device(input);
