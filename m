From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH] fujitsu-laptop: Support radio LED
Date: Wed, 16 Mar 2016 12:28:07 +0100
Message-ID: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:34366 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754275AbcCPL2V (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Mar 2016 07:28:21 -0400
Received: by mail-lb0-f171.google.com with SMTP id k12so45693047lbb.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2016 04:28:19 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Lifebook E734/E744/E754 has a LED which the manual calls "radio
components indicator".  It should be lit when any radio transmitter is
enabled.  Its state can be read and set using ACPI (FUNC interface,
RFKILL method).

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
=46irst of all, this patch raises a couple of checkpatch warnings.  I
opted for consistency with existing code, which checkpatch doesn't like
as well.  Please let me know if you'd like me to fix the warnings (if
that's desired, I could also clean up the whole driver to make
checkpatch happy).

Now, about the LED itself.  As Lifebook E734/E744/E754 only has a butto=
n
(as compared to a slider) for enabling/disabling radio transmitters, I
believe the LED in question is meant to indicate whether all radio
transmitters are currently on or off.  However, pressing the radio
toggle button doesn't change the hardware state of the transmitters.
Consider the following scenario:

 1. Power the machine up.  Radio LED is on.
 2. Press the radio toggle button before the bootloader kicks in.
 3. Radio LED is turned off.
 4. Wait for Linux to boot.

Reading /sys/devices/platform/fujitsu-laptop/radios then yields
"killed", but you can still connect to Bluetooth devices and wireless
networks.  So it looks like this machine only relies on soft rfkill.

As for detecting whether the LED is present on a given machine, I had t=
o
resort to educated guesswork.  I assumed this LED is present on all
devices which have a radio toggle button instead of a slider.  My
Lifebook E744 holds 0x01010001 in BTNI.  By comparing the bits and
buttons with those of a Lifebook E8420 (BTNI=3D0x000F0101, has a slider=
),
I put my money on bit 24 as the indicator of the radio toggle button
being present.  I might be completely wrong and this needs testing on a
broader set of devices.  See also three paragraphs below for an
alternative.

=46iguring out how the LED is controlled was more deterministic as all =
it
took was decompiling the DSDT and taking a look at method S000 (the
RFKILL method of the FUNC interface).  Here is the relevant part:

    Method (S000, 3, Serialized)
    {
        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
        Local0 =3D Zero
        While (One)
        {
            _T_0 =3D Arg0
            If ((_T_0 =3D=3D Zero))
            {
                Local0 |=3D 0x00020000
                Local0 |=3D 0x0200
                Local0 |=3D 0x0100
                Local0 |=3D 0x20
            }
	    ...
            ElseIf ((_T_0 =3D=3D 0x04))
            {
                Arg1 =3D ((Arg2 << 0x10) | (Arg1 & 0xFFFF))
                Local0 =3D FSMI (0x91, Arg0, Arg1)
                If ((Local0 & 0x20))
                {
                    RFSW =3D One
                }
                Else
                {
                    RFSW =3D Zero
                }
   =20
                Local0 |=3D (RFSW << 0x05)
                Local0 |=3D (DKON << 0x09)
                Local0 |=3D (^^LID._LID () << 0x08)
            }
            ElseIf ((_T_0 =3D=3D 0x05))
            {
                If ((Arg1 & 0x20))
                {
                    If ((Arg2 & 0x20))
                    {
                        RFSW =3D One
                    }
                    Else
                    {
                        RFSW =3D Zero
                    }
                }
   =20
                Arg1 =3D ((Arg2 << 0x10) | (Arg1 & 0xFFFF))
                Local0 =3D FSMI (0x91, Arg0, Arg1)
            }
            ...
            Break
        }
   =20
        Return (Local0)
    }

When Arg0 is 0x04, current hardware state is queried and returned (this
is already done by the driver).  When Arg0 is 0x05 and Arg1 is 0x20, on=
e
can change the contents of RFSW (RF SWitch?), which eventually results
in turning the LED on or off (depending on the value of Arg2).  The 0x0=
5
branch is not present in a DSDT dump from a Lifebook E8420, which has a
slider instead of a radio toggle button.

Note that when called with Arg0 set to 0x00, S000 returns 0x00020320 on
a Lifebook E744 (this is the value saved in the rfkill_supported field
of struct fujitsu_hotkey_t).  Bit 16 is not set on a Lifebook E8420, so
it might mean that this is an indicator of a radio toggle button being
present.=20

Sadly, this implementation is unsuitable for use with "heavy" LED
triggers, like phy0rx.  Once blinking frequency achieves a certain
level, the system hangs.  I'm not sure how much of an issue this is as
I'm pretty sure other LEDs registered by fujitsu-laptop would also caus=
e
a hang when assigned to a similar trigger as they are also controlled
using ACPI.

While it's not essential, it would be nice to initialize soft rfkill
state of all radio transmitters to the value of RFSW upon boot.  Note
that this value is persisted between reboots until the battery is
removed, but can be changed before the kernel is booted.  I haven't
found an rfkill function which would enable one to set all rfkill
devices to a chosen initial soft state (note that fujitsu-laptop doesn'=
t
create any rfkill devices on its own).  Is this possible/desired or
should this task simply be delegated to userspace?

One last remark is that I think this LED would best be driven by an
inverted airplane mode LED trigger (as proposed by Jo=C3=A3o Paulo Rech=
i
Vita).  As the code for that trigger is not yet merged, I refrained fro=
m
setting the default_trigger field in struct led_classdev radio_led.
Perhaps it's a candidate for a follow-up patch in the future.

And finally, perhaps some of the remarks above belong in the commit
message for future reference.  Please advise.

 drivers/platform/x86/fujitsu-laptop.c |   45 +++++++++++++++++++++++++=
++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x=
86/fujitsu-laptop.c
index ffc84cc..7813e482 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -107,6 +107,7 @@
 #define KEYBOARD_LAMPS	0x100
 #define LOGOLAMP_POWERON 0x2000
 #define LOGOLAMP_ALWAYS  0x4000
+#define RADIO_LED_ON	0x20
 #endif
=20
 /* Hotkey details */
@@ -174,6 +175,7 @@ struct fujitsu_hotkey_t {
 	int rfkill_state;
 	int logolamp_registered;
 	int kblamps_registered;
+	int radio_led_registered;
 };
=20
 static struct fujitsu_hotkey_t *fujitsu_hotkey;
@@ -200,6 +202,16 @@ static struct led_classdev kblamps_led =3D {
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
@@ -275,6 +287,15 @@ static void kblamps_set(struct led_classdev *cdev,
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
@@ -299,6 +320,16 @@ static enum led_brightness kblamps_get(struct led_=
classdev *cdev)
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
@@ -895,6 +926,17 @@ static int acpi_fujitsu_hotkey_add(struct acpi_dev=
ice *device)
 			       result);
 		}
 	}
+
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
@@ -921,6 +963,9 @@ static int acpi_fujitsu_hotkey_remove(struct acpi_d=
evice *device)
=20
 	if (fujitsu_hotkey->kblamps_registered)
 		led_classdev_unregister(&kblamps_led);
+
+	if (fujitsu_hotkey->radio_led_registered)
+		led_classdev_unregister(&radio_led);
 #endif
=20
 	input_unregister_device(input);
--=20
1.7.10.4
