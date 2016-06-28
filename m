From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v3] fujitsu-laptop: Support touchpad toggle hotkey on Skylake-based models
Date: Tue, 28 Jun 2016 09:25:50 +0200
Message-ID: <1467098750-2742-1-git-send-email-kernel@kempniu.pl>
References: <20160628010609.GC26713@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36016 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752021AbcF1H0B (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 03:26:01 -0400
Received: by mail-wm0-f65.google.com with SMTP id c82so3368722wme.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jun 2016 00:26:00 -0700 (PDT)
In-Reply-To: <20160628010609.GC26713@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Haswell-based Fujitsu laptops (Lifebook E734/E744/E754) have a touchpad
toggle hotkey (Fn+F4) which is handled transparently to the operating
system: while an ACPI notification is sent to FUJ02B1 when Fn+F4 is
pressed, touchpad state is properly toggled without any explicit suppor=
t
for this operation in fujitsu-laptop.

Skylake-based models (Lifebook E736/E746/E756) also have that hotkey,
but the touchpad is not toggled transparently to the operating system.
When Fn+F4 is pressed, an ACPI notification is sent to FUJ02E3.  A
subsequent call to S000 (FUNC_RFKILL) can be used to determine whether
the touchpad toggle hotkey was pressed so that an input event can be
sent to userspace.

Relevant ACPI code:

    Method (_L21, 0, NotSerialized)
    {
        ...
        If (AHKF)
        {
            Notify (\_SB.FEXT, 0x80)
        }
        ...
    }

    Method (S000, 3, Serialized)
    {
        Name (_T_0, Zero)
        Local0 =3D Zero
        While (One)
        {
            _T_0 =3D Arg0
            If (_T_0 =3D=3D Zero)
            {
                Local0 |=3D 0x04000000
                Local0 |=3D 0x02000000
                Local0 |=3D 0x00020000
                Local0 |=3D 0x0200
                Local0 |=3D 0x0100
                Local0 |=3D 0x20
            }
            ElseIf (_T_0 =3D=3D One)
            {
                ...
                If (AHKF & 0x08)
                {
                Local0 |=3D 0x04000000
                AHKF ^=3D 0x08
                }
                ...
            } ...
            Break
        }
        Return (Local0)
    }

Pressing Fn+F4 raises GPE 0x21 and sets bit 3 in AHKF.  This in turn
results in bit 26 being set in the value returned by FUNC_RFKILL called
with 1 as its first argument.  On Skylake-based models, bit 26 is also
set in the value returned by FUNC_RFKILL called with 0 as its first
argument (this value is saved in fujitsu_hotkey->rfkill_supported upon
module initialization), which suggests that this bit is set on models
which do not handle touchpad toggling transparently to the operating
system.

Note that bit 3 is cleared in AHKF once FUNC_RFKILL is called with 1 as
its first argument, which requires fujitsu-laptop to handle this hotkey
in a different manner than the other, GIRB-based hotkeys: two input
events (press and release) are immediately sent once Fn+F4 is pressed.

Reported-and-tested-by: Jan-Marek Glogowski <glogow@fbihome.de>
Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---

Changes from v2:

  - edited code comment so that it defines "some models" more precisely=
=2E

Changes from v1:

  - added KEY_TOUCHPAD_TOGGLE to the FUJ02E3 input device's key bitmap,

  - added code comment.

 drivers/platform/x86/fujitsu-laptop.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x=
86/fujitsu-laptop.c
index ce41bc3..36cd743 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -856,6 +856,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_devi=
ce *device)
 	set_bit(fujitsu->keycode3, input->keybit);
 	set_bit(fujitsu->keycode4, input->keybit);
 	set_bit(fujitsu->keycode5, input->keybit);
+	set_bit(KEY_TOUCHPAD_TOGGLE, input->keybit);
 	set_bit(KEY_UNKNOWN, input->keybit);
=20
 	error =3D input_register_device(input);
@@ -1060,6 +1061,19 @@ static void acpi_fujitsu_hotkey_notify(struct ac=
pi_device *device, u32 event)
 			}
 		}
=20
+		/* On some models (first seen on the Skylake-based Lifebook
+		 * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
+		 * handled in software; its state is queried using FUNC_RFKILL
+		 */
+		if ((fujitsu_hotkey->rfkill_supported & BIT(26)) &&
+		    (call_fext_func(FUNC_RFKILL, 0x1, 0x0, 0x0) & BIT(26))) {
+			keycode =3D KEY_TOUCHPAD_TOGGLE;
+			input_report_key(input, keycode, 1);
+			input_sync(input);
+			input_report_key(input, keycode, 0);
+			input_sync(input);
+		}
+
 		break;
 	default:
 		keycode =3D KEY_UNKNOWN;
--=20
1.7.10.4
