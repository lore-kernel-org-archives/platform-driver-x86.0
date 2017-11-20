From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: Dell Vostro 3360 multimedia keys
Date: Mon, 20 Nov 2017 22:31:18 +0100
Message-ID: <32854318.MItBFFhxJX@natalenko.name>
References: <5089742.2pBsoxBtzf@natalenko.name> <20171120170550.hvsnuwjqfakablw7@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from vulcan.natalenko.name ([104.207.131.136]:30802 "EHLO
        vulcan.natalenko.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752907AbdKTVbZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2017 16:31:25 -0500
In-Reply-To: <20171120170550.hvsnuwjqfakablw7@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario_limonciello@dell.com>

Hi, Pali et al.

Thanks for the detailed explanation. I've managed to craft the following ug=
ly=20
hack:

(I explain my thoughts on it under the snippet)

=3D=3D=3D
commit a2baeaba1657a47359efea61865aa012da509e03
Author: Oleksandr Natalenko <oleksandr@natalenko.name>
Date:   Mon Nov 20 13:25:43 2017 +0100

    dell-wmi: support Dell Vostro 3360
   =20
    Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wm=
i.c
index 28d9f8696081..23dd55a6463c 100644
=2D-- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -49,6 +49,7 @@ MODULE_LICENSE("GPL");
 #define DELL_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
=20
 static bool wmi_requires_smbios_request;
+static bool wmi_keycode_combined;
=20
 MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
 MODULE_ALIAS("wmi:"DELL_DESCRIPTOR_GUID);
@@ -64,6 +65,12 @@ static int __init dmi_matched(const struct dmi_system_id=
=20
*dmi)
 	return 1;
 }
=20
+static int __init dmi_keycode_combined_matched(const struct dmi_system_id=
=20
*dmi)
+{
+	wmi_keycode_combined =3D 1;
+	return 1;
+}
+
 static const struct dmi_system_id dell_wmi_smbios_list[] __initconst =3D {
 	{
 		.callback =3D dmi_matched,
@@ -81,6 +88,14 @@ static const struct dmi_system_id dell_wmi_smbios_list[]=
=20
__initconst =3D {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
 		},
 	},
+	{
+		.callback =3D dmi_keycode_combined_matched,
+		.ident =3D "Dell Vostro 3360",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 3360"),
+		},
+	},
 	{ }
 };
=20
@@ -189,6 +204,10 @@ static const struct key_entry dell_wmi_keymap_type_000=
0[]=20
=3D {
 	/* Dell Support Center key */
 	{ KE_IGNORE, 0xe06e, { KEY_RESERVED } },
=20
+	/* Dell Vostro 3360 combined keycode */
+	{ KE_KEY,    0xe0f1, { KEY_PROG1 } },
+	{ KE_KEY,    0xe0f2, { KEY_PROG2 } },
+
 	{ KE_IGNORE, 0xe0f7, { KEY_MUTE } },
 	{ KE_IGNORE, 0xe0f8, { KEY_VOLUMEDOWN } },
 	{ KE_IGNORE, 0xe0f9, { KEY_VOLUMEUP } },
@@ -398,7 +417,16 @@ static void dell_wmi_notify(struct wmi_device *wdev,
=20
 		switch (buffer_entry[1]) {
 		case 0x0000: /* One key pressed or event occurred */
=2D			if (len > 2)
+			pr_info("len: %d, quirk: %d\n",
+				len, wmi_keycode_combined);
+			if (len > 3) {
+				pr_info("%x, %x, %x\n",
+					buffer_entry[2], buffer_entry[3],
+					buffer_entry[2] | buffer_entry[3]);
+				if (wmi_keycode_combined)
+					dell_wmi_process_key(wdev, 0x0000,
+							     buffer_entry[2] | buffer_entry[3]);
+			} else if (len > 2)
 				dell_wmi_process_key(wdev, 0x0000,
 						     buffer_entry[2]);
 			/* Other entries could contain additional information */

=3D=3D=3D

=46irst, I've added a new quirk handler, specifically for my laptop. It hid=
es=20
all the further ugly hackery under distinct code branch.

Then, if buffer length is > 3 and if quirk is set, bitwise OR on=20
buffer_entry[2] and buffer_entry[3] is performed (IOW, on "key code" and IN=
=463=20
field in DSDT) to get new "fake" keycode, which will be different for key "=
1"=20
and "2":

code   | INF3 | fake code
=2D------+------+----------
0xe0f0 | 0x1  | 0xe0f1
0xe0f0 | 0x2  | 0xe0f2

=46inally, I add two new fake keycodes to the table, and kernel recognizes=
=20
multimedia keys like this. First key:

=3D=3D=3D
Nov 20 22:24:45 spock kernel: dell_wmi: len: 5, quirk: 1
Nov 20 22:24:45 spock kernel: dell_wmi: e0f0, 1, e0f1
=3D=3D=3D

Second key:

=3D=3D=3D
Nov 20 22:25:07 spock kernel: dell_wmi: len: 5, quirk: 1
Nov 20 22:25:07 spock kernel: dell_wmi: e0f0, 2, e0f2
=3D=3D=3D

In evtest I get this:

=3D=3D=3D
Event: time 1511213126.916920, type 4 (EV_MSC), code 4 (MSC_SCAN), value e0=
f1
Event: time 1511213126.916920, type 1 (EV_KEY), code 148 (KEY_PROG1), value=
 1
Event: time 1511213126.916920, -------------- SYN_REPORT ------------
Event: time 1511213126.916944, type 1 (EV_KEY), code 148 (KEY_PROG1), value=
 0
Event: time 1511213126.916944, -------------- SYN_REPORT ------------

Event: time 1511213127.266903, type 4 (EV_MSC), code 4 (MSC_SCAN), value e0=
f2
Event: time 1511213127.266903, type 1 (EV_KEY), code 149 (KEY_PROG2), value=
 1
Event: time 1511213127.266903, -------------- SYN_REPORT ------------
Event: time 1511213127.266919, type 1 (EV_KEY), code 149 (KEY_PROG2), value=
 0
Event: time 1511213127.266919, -------------- SYN_REPORT ------------
=3D=3D=3D

Third key (the one that is handled via PS/2 keyboard) produces this in the=
=20
kernel buffer:

=3D=3D=3D
Nov 20 22:27:08 spock kernel: atkbd serio0: Unknown key pressed (translated=
=20
set 2, code 0x60 on isa0060/serio0).
Nov 20 22:27:08 spock kernel: atkbd serio0: Use 'setkeycodes 60 <keycode>' =
to=20
make it known.
Nov 20 22:27:08 spock kernel: dell_wmi: len: 3, quirk: 1
=3D=3D=3D

But evtest remains silent.

So, kinda working?

The only question that remains is how to avoid this ugly hack with OR'ing=20
multiple values. Apparently, calling dell_wmi_process_key() with only INF2=
=20
DSDT field is insufficient to distinguish two different keys with the same=
=20
code. Also, I've noticed this remark:

=3D=3D=3D
/* Other entries could contain additional information */
=3D=3D=3D

As you may see, they indeed do. Any unimplemented idea behind this statemen=
t?

Any other ideas on how to avoid ugly hackery? Maybe, key table should be=20
extended with extra column for INF3 value, and new quirk for this should be=
=20
implemented?

Thanks.

On pond=C4=9Bl=C3=AD 20. listopadu 2017 18:05:50 CET Pali Roh=C3=A1r wrote:
> Hi!
>=20
> On Monday 20 November 2017 16:08:41 Oleksandr Natalenko wrote:
> > Hi.
> >=20
> > I've got Dell Vostro 3360 with extra multimedia keys as shown here [1],
> > but
> > have no luck to get them working.
> >=20
> > I've modified dell_wmi_smbios_list structure in drivers/platform/x86/de=
ll-
> > wmi.c adding new entry:
> >=20
> > =3D=3D=3D
> >=20
> >  84     {
> >  85         .callback =3D dmi_matched,
> >  86         .ident =3D "Dell Vostro 3360",
> >  87         .matches =3D {
> >  88             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >  89             DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 3360"),
> >  90         },
> >  91     },
> >=20
> > =3D=3D=3D
>=20
> What would happen if you do *not* add this new entry? Please do this
> test after your notebook was fully turned off to prevent some cached
> configuration in BIOS.
>=20
> > While pressing keys "1" and/or "2" I get the following notice in dmesg:
> >=20
> > =3D=3D=3D
> > Nov 20 15:53:35 spock kernel: dell_wmi: Unknown key with type 0x0000 and
> > code 0xe0f0 pressed
> > =3D=3D=3D
>=20
> This means that in dell-wmi.c is missing mapping for code 0xe0f0 in key
> type 0x0000.
>=20
> Find array dell_wmi_keymap_type_0000[] and add there line:
>=20
>   { KE_KEY, 0xe0f0, { KEY_something } },
>=20
> (where something is correct name of key)
>=20
> > (it is the same for both keys)
>=20
> So for both first and second key you got same type+code? That is bad :-(
> In this case with above definition we cannot distinguish which was was
> pressed. But at least something.
>=20
> > While pressing key "3" I get the following:
> >=20
> > =3D=3D=3D
> > Nov 20 15:36:51 spock kernel: atkbd serio0: Unknown key pressed
> > (translated
> > set 2, code 0x60 on isa0060/serio0).
> > Nov 20 15:36:51 spock kernel: atkbd serio0: Use 'setkeycodes 60 <keycod=
e>'
> > to make it known.
> > =3D=3D=3D
>=20
> This key is not received by dell-wmi.c, but rather via PS/2 keyboard.
> Use appropriate setkeycodes command line program to map that code 60 to
> some key.
>=20
> Today in most cases this mapping for PS/2 keyboards is done in udev or
> systemd at system startup. They have database for it.
>=20
> > Here is what I've found in DSDT:
> >=20
> > =3D=3D=3D
> >=20
> >                     Method (_Q70, 0, NotSerialized)  // _Qxx: EC Query
> >                     {
> >                    =20
> >                         P8XH (Zero, 0x70)
> >                         Notify (MBT1, 0x80) // Status Change
> >                         ^^^^AMW0.INF0 =3D 0x04
> >                         ^^^^AMW0.INF1 =3D Zero
> >                         ^^^^AMW0.INF2 =3D 0xE0F0
> >                         ^^^^AMW0.INF3 =3D One
> >                         Notify (AMW0, 0xD0) // Hardware-Specific
> >                    =20
> >                     }
> >                    =20
> >                     Method (_QAF, 0, NotSerialized)  // _Qxx: EC Query
> >                     {
> >                    =20
> >                         P8XH (Zero, 0xAF)
> >                         Notify (MBT, 0x80) // Status Change
> >                         ^^^^AMW0.INF0 =3D 0x04
> >                         ^^^^AMW0.INF1 =3D Zero
> >                         ^^^^AMW0.INF2 =3D 0xE0F0
> >                         ^^^^AMW0.INF3 =3D 0x02
> >                         Notify (AMW0, 0xD0) // Hardware-Specific
> >                    =20
> >                     }
> >=20
> > =3D=3D=3D
> >=20
> > These are the only 2 records that contain 0xe0f0 sequence, and if they
> > correspond to first two multimedia keys, as you can see they differ only
> > in
> > .INF3 field. Unfortunately, I do not know what it might mean.
>=20
> Just guessing... if I concatenate INF0, INF1, INF2, INF3 and treat every
> INF* as 16bit number I got this sequence:
>=20
>   0x0004 0x0000 0xE0F0 0x0001
>=20
>   0x0004 0x0000 0xE0F0 0x0002
>=20
> And it looks like a valid buffer for dell_wmi_notify() function.
>=20
> Look at this part of that function:
>=20
> 		switch (buffer_entry[1]) {
> 		case 0x0000: /* One key pressed or event occurred */
> 			if (len > 2)
> 				dell_wmi_process_key(wdev, 0x0000,
> 						     buffer_entry[2]);
> 			/* Other entries could contain additional information */
>=20
> If I'm right that above INF* sequence is put into dell_wmi_notify()
> function, then in buffer[3] you should be able to see either 0x01 or
> 0x02. And distinguish which key was pressed.
>=20
> Can you test it? Beware of "len" of buffer_entry when you would do
> tests.
>=20
> > I was monitoring /proc/interrupts file and noticed that values here:
> >=20
> > =3D=3D=3D
> >=20
> >   9:        430        293         65         24   IO-APIC   9-fasteoi =
=20
> >   acpi
> >=20
> > =3D=3D=3D
> >=20
> > are incremented by one on each key press. Also, if i press key "3" (the
> > one
> > that generates different message in kernel log), the following interrupt
> > is
> > fired too:
> >=20
> > =3D=3D=3D
> >=20
> >   1:        646       6391        358        487   IO-APIC   1-edge    =
=20
> >   i8042>=20
> > =3D=3D=3D
> >=20
> > Running evtest, I'm able to catch some output while pressing key "3":
> >=20
> > =3D=3D=3D
> > Event: time 1511189973.016907, type 4 (EV_MSC), code 4 (MSC_SCAN), value
> > e025 Event: time 1511189973.016907, type 1 (EV_KEY), code 203
> > (KEY_PROG4), value 1 Event: time 1511189973.016907, --------------
> > SYN_REPORT ------------ Event: time 1511189973.016942, type 1 (EV_KEY),
> > code 203 (KEY_PROG4), value 0 Event: time 1511189973.016942,
> > -------------- SYN_REPORT ------------ =3D=3D=3D
>=20
> So it means that third key is also received by dell-wmi? Anyway see
> function dell_wmi_process_key() and line:
>=20
> 	if (type =3D=3D 0x0000 && code =3D=3D 0xe025 && !wmi_requires_smbios_req=
uest)
> 		return;
>=20
> It is there just to ensure that key is not send via both PS/2 keyboard
> and dell-wmi.
>=20
> So I guess you should disable wmi_requires_smbios_request.
>=20
> > I think this corresponds to what I see in drivers/platform/x86/dell-wmi=
=2Ec
> > file here:
> >=20
> > =3D=3D=3D
> > 143     /* Dell Instant Launch key */
> > 144     { KE_KEY,    0xe025, { KEY_PROG4 } },
> > =3D=3D=3D
> >=20
> > Other two keys do not produce any evtest output.
> >=20
> > Here is acpidump output: [2]
> > Here is decompiled DSDT: [3]
> >=20
> > Also, I've raised this question before a couple of times (for instance,
> > [4]), but unfortunately got no result :(.
> >=20
> > Could you please help me in fixing multimedia keys?
>=20
> I Hope that this email helps you.
>=20
> > Thanks.
> >=20
> > [1] http://beta.hstor.org/files/c3b/a26/628/
> > c3ba26628409486f8b9ae16d97be7d21.jpg
> > [2] https://gist.github.com/7c04035ba2a3f0e5501af83efdb1456d
> > [3] https://gist.github.com/83687126c46417b5bc0b48529de52460
> > [4] https://www.spinics.net/lists/platform-driver-x86/msg05251.html
