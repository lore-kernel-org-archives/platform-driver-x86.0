From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: Dell Vostro 3360 multimedia keys
Date: Tue, 21 Nov 2017 15:52:28 +0100
Message-ID: <1716681.OUoELY8X92@natalenko.name>
References: <5089742.2pBsoxBtzf@natalenko.name> <32854318.MItBFFhxJX@natalenko.name> <20171121135110.nbnxc3n3xxlbvyis@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171121135110.nbnxc3n3xxlbvyis@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Mario Limonciello <mario_limonciello@dell.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi, Pali et al.

Answers go inline.

On =C3=BAter=C3=BD 21. listopadu 2017 14:51:10 CET Pali Roh=C3=A1r wrote:

> What would happen if you enable wmi_requires_smbios_request? Nothing?
> And situation is exactly same?

Yes, this is what I did with DMI quirk which enables=20
wmi_requires_smbios_request. Keys "1" and "2" behave the same, key "3" gets=
=20
reported via both atkbd and wmi (see my thoughts about this key below).

> Mario, can you comment why Dell Vostro 3360 generates same WMI keycode
> event for two different keys and distinguish key via third value in WMI
> buffer? Looks like this is first Dell machine which do such thing.
>=20
> Or is needed some magic sequence to enable those media keys on Dell
> Vostr 3360 to work correctly? We already have some special "enable" code
> for Dell Inspirion M5110 and Dell Vostro V131.

=46WIW, just as a side note, I've managed to decompile DSDT, replace keycod=
es=20
for all 3 keys, mute 3rd key via setkeycodes to make it work via wmi only (=
not=20
via atkbd), and added new keycodes to 0000 table. Now all 3 keys work.=20

> /* snip */
> > +	/* Dell Vostro 3360 combined keycode */
> > +	{ KE_KEY,    0xe0f1, { KEY_PROG1 } },
> > +	{ KE_KEY,    0xe0f2, { KEY_PROG2 } },
>=20
> What is purpose of those two keys? Does not linux kernel already have
> better description for them as KEY_PROG1 and KEY_PROG2?

Well, I didn't find KEY_PROG1/KEY_PROG2 in 0000 table. Thus, I just added=20
them. Actually, since these keys have some icons drawn on them, they have s=
ome=20
designated purpose (most likely, Windows-related), but I'd rather think of=
=20
them as of custom programmable keys without any specific function assigned.

> /* snip */
> > Third key (the one that is handled via PS/2 keyboard) produces this in =
the
> > kernel buffer:
> / *snip */
>=20
> Seems you still have not configured keycode for your internal PS/2
> keyboard to make this key working. Use 'setkeycodes 60 <keycode>' as
> written in dmesg.

Well, I've tried. The problem is that if I even configure this key via=20
setkeycodes, it doesn't work. evtest shows me "value 2" (the same value is=
=20
shown if I press and hold some ordinary key, like "A", for instance) instea=
d=20
of 0 and/or 1. Looks like key press event is not generated properly by this=
=20
key via atkbd.

That's why I think wmi_requires_smbios_request quirk must be permanently=20
enabled for this laptop, and 3rd key must be handled via wmi (like two othe=
r=20
keys), not via atkbd. And all atkbd events from this key must be just=20
suppressed via userspace.

> > The only question that remains is how to avoid this ugly hack with OR'i=
ng
> > multiple values. Apparently, calling dell_wmi_process_key() with only I=
NF2
> > DSDT field is insufficient to distinguish two different keys with the s=
ame
> > code.
>=20
> After Mario (from @Dell) clarifies how to handle your laptop, I can
> write patch for dell-wmi.c driver.
>=20
> And if there be no statement, then I would try to clean your patch.
> There is probably no better option then checking it in buffer/event
> handling.

OK, then please also consider what I've written about 3rd key above. It mus=
t=20
be handled via wmi too.

> > Also, I've noticed this remark:
> >=20
> > =3D=3D=3D
> > /* Other entries could contain additional information */
> > =3D=3D=3D
> >=20
> > As you may see, they indeed do. Any unimplemented idea behind this
> > statement?
> If you look into dell_wmi_keymap_type_0000[] array there are comments
> what is after some key codes. E.g. after key code for brightness up/down
> may be value which represent new brightness level. But all those data
> are not parsed as dell-wmi does not need it and because those data are
> send also via different interfaces (e.g. brightness level via standard
> ACPI methods...).

I see. But here those data are needed to be parsed, it seems=E2=80=A6

Thanks.

Regards,
  Oleksandr

>=20
> > Any other ideas on how to avoid ugly hackery? Maybe, key table should be
> > extended with extra column for INF3 value, and new quirk for this should
> > be
> > implemented?
> >=20
> > Thanks.
> >=20
> > On pond=C4=9Bl=C3=AD 20. listopadu 2017 18:05:50 CET Pali Roh=C3=A1r wr=
ote:
> > > Hi!
> > >=20
> > > On Monday 20 November 2017 16:08:41 Oleksandr Natalenko wrote:
> > > > Hi.
> > > >=20
> > > > I've got Dell Vostro 3360 with extra multimedia keys as shown here
> > > > [1],
> > > > but
> > > > have no luck to get them working.
> > > >=20
> > > > I've modified dell_wmi_smbios_list structure in
> > > > drivers/platform/x86/dell-
> > > > wmi.c adding new entry:
> > > >=20
> > > > =3D=3D=3D
> > > >=20
> > > >  84     {
> > > >  85         .callback =3D dmi_matched,
> > > >  86         .ident =3D "Dell Vostro 3360",
> > > >  87         .matches =3D {
> > > >  88             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > > >  89             DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 3360"),
> > > >  90         },
> > > >  91     },
> > > >=20
> > > > =3D=3D=3D
> > >=20
> > > What would happen if you do *not* add this new entry? Please do this
> > > test after your notebook was fully turned off to prevent some cached
> > > configuration in BIOS.
> > >=20
> > > > While pressing keys "1" and/or "2" I get the following notice in
> > > > dmesg:
> > > >=20
> > > > =3D=3D=3D
> > > > Nov 20 15:53:35 spock kernel: dell_wmi: Unknown key with type 0x0000
> > > > and
> > > > code 0xe0f0 pressed
> > > > =3D=3D=3D
> > >=20
> > > This means that in dell-wmi.c is missing mapping for code 0xe0f0 in k=
ey
> > > type 0x0000.
> > >=20
> > > Find array dell_wmi_keymap_type_0000[] and add there line:
> > >   { KE_KEY, 0xe0f0, { KEY_something } },
> > >=20
> > > (where something is correct name of key)
> > >=20
> > > > (it is the same for both keys)
> > >=20
> > > So for both first and second key you got same type+code? That is bad =
:-(
> > > In this case with above definition we cannot distinguish which was was
> > > pressed. But at least something.
> > >=20
> > > > While pressing key "3" I get the following:
> > > >=20
> > > > =3D=3D=3D
> > > > Nov 20 15:36:51 spock kernel: atkbd serio0: Unknown key pressed
> > > > (translated
> > > > set 2, code 0x60 on isa0060/serio0).
> > > > Nov 20 15:36:51 spock kernel: atkbd serio0: Use 'setkeycodes 60
> > > > <keycode>'
> > > > to make it known.
> > > > =3D=3D=3D
> > >=20
> > > This key is not received by dell-wmi.c, but rather via PS/2 keyboard.
> > > Use appropriate setkeycodes command line program to map that code 60 =
to
> > > some key.
> > >=20
> > > Today in most cases this mapping for PS/2 keyboards is done in udev or
> > > systemd at system startup. They have database for it.
> > >=20
> > > > Here is what I've found in DSDT:
> > > >=20
> > > > =3D=3D=3D
> > > >=20
> > > >                     Method (_Q70, 0, NotSerialized)  // _Qxx: EC Qu=
ery
> > > >                     {
> > > >                    =20
> > > >                         P8XH (Zero, 0x70)
> > > >                         Notify (MBT1, 0x80) // Status Change
> > > >                         ^^^^AMW0.INF0 =3D 0x04
> > > >                         ^^^^AMW0.INF1 =3D Zero
> > > >                         ^^^^AMW0.INF2 =3D 0xE0F0
> > > >                         ^^^^AMW0.INF3 =3D One
> > > >                         Notify (AMW0, 0xD0) // Hardware-Specific
> > > >                    =20
> > > >                     }
> > > >                    =20
> > > >                     Method (_QAF, 0, NotSerialized)  // _Qxx: EC Qu=
ery
> > > >                     {
> > > >                    =20
> > > >                         P8XH (Zero, 0xAF)
> > > >                         Notify (MBT, 0x80) // Status Change
> > > >                         ^^^^AMW0.INF0 =3D 0x04
> > > >                         ^^^^AMW0.INF1 =3D Zero
> > > >                         ^^^^AMW0.INF2 =3D 0xE0F0
> > > >                         ^^^^AMW0.INF3 =3D 0x02
> > > >                         Notify (AMW0, 0xD0) // Hardware-Specific
> > > >                    =20
> > > >                     }
> > > >=20
> > > > =3D=3D=3D
> > > >=20
> > > > These are the only 2 records that contain 0xe0f0 sequence, and if t=
hey
> > > > correspond to first two multimedia keys, as you can see they differ
> > > > only
> > > > in
> > > > .INF3 field. Unfortunately, I do not know what it might mean.
> > >=20
> > > Just guessing... if I concatenate INF0, INF1, INF2, INF3 and treat ev=
ery
> > >=20
> > > INF* as 16bit number I got this sequence:
> > >   0x0004 0x0000 0xE0F0 0x0001
> > >  =20
> > >   0x0004 0x0000 0xE0F0 0x0002
> > >=20
> > > And it looks like a valid buffer for dell_wmi_notify() function.
> > >=20
> > > Look at this part of that function:
> > > 		switch (buffer_entry[1]) {
> > > 		case 0x0000: /* One key pressed or event occurred */
> > > 	=09
> > > 			if (len > 2)
> > > 		=09
> > > 				dell_wmi_process_key(wdev, 0x0000,
> > > 			=09
> > > 						     buffer_entry[2]);
> > > 		=09
> > > 			/* Other entries could contain additional information */
> > >=20
> > > If I'm right that above INF* sequence is put into dell_wmi_notify()
> > > function, then in buffer[3] you should be able to see either 0x01 or
> > > 0x02. And distinguish which key was pressed.
> > >=20
> > > Can you test it? Beware of "len" of buffer_entry when you would do
> > > tests.
> > >=20
> > > > I was monitoring /proc/interrupts file and noticed that values here:
> > > >=20
> > > > =3D=3D=3D
> > > >=20
> > > >   9:        430        293         65         24   IO-APIC   9-fast=
eoi
> > > >   acpi
> > > >=20
> > > > =3D=3D=3D
> > > >=20
> > > > are incremented by one on each key press. Also, if i press key "3"
> > > > (the
> > > > one
> > > > that generates different message in kernel log), the following
> > > > interrupt
> > > > is
> > > > fired too:
> > > >=20
> > > > =3D=3D=3D
> > > >=20
> > > >   1:        646       6391        358        487   IO-APIC   1-edge
> > > >   i8042>
> > > >=20
> > > > =3D=3D=3D
> > > >=20
> > > > Running evtest, I'm able to catch some output while pressing key "3=
":
> > > >=20
> > > > =3D=3D=3D
> > > > Event: time 1511189973.016907, type 4 (EV_MSC), code 4 (MSC_SCAN),
> > > > value
> > > > e025 Event: time 1511189973.016907, type 1 (EV_KEY), code 203
> > > > (KEY_PROG4), value 1 Event: time 1511189973.016907, --------------
> > > > SYN_REPORT ------------ Event: time 1511189973.016942, type 1
> > > > (EV_KEY),
> > > > code 203 (KEY_PROG4), value 0 Event: time 1511189973.016942,
> > > > -------------- SYN_REPORT ------------ =3D=3D=3D
> > >=20
> > > So it means that third key is also received by dell-wmi? Anyway see
> > >=20
> > > function dell_wmi_process_key() and line:
> > > 	if (type =3D=3D 0x0000 && code =3D=3D 0xe025 && !wmi_requires_smbios=
_request)
> > > =09
> > > 		return;
> > >=20
> > > It is there just to ensure that key is not send via both PS/2 keyboard
> > > and dell-wmi.
> > >=20
> > > So I guess you should disable wmi_requires_smbios_request.
> > >=20
> > > > I think this corresponds to what I see in
> > > > drivers/platform/x86/dell-wmi.c
> > > > file here:
> > > >=20
> > > > =3D=3D=3D
> > > > 143     /* Dell Instant Launch key */
> > > > 144     { KE_KEY,    0xe025, { KEY_PROG4 } },
> > > > =3D=3D=3D
> > > >=20
> > > > Other two keys do not produce any evtest output.
> > > >=20
> > > > Here is acpidump output: [2]
> > > > Here is decompiled DSDT: [3]
> > > >=20
> > > > Also, I've raised this question before a couple of times (for
> > > > instance,
> > > > [4]), but unfortunately got no result :(.
> > > >=20
> > > > Could you please help me in fixing multimedia keys?
> > >=20
> > > I Hope that this email helps you.
> > >=20
> > > > Thanks.
> > > >=20
> > > > [1] http://beta.hstor.org/files/c3b/a26/628/
> > > > c3ba26628409486f8b9ae16d97be7d21.jpg
> > > > [2] https://gist.github.com/7c04035ba2a3f0e5501af83efdb1456d
> > > > [3] https://gist.github.com/83687126c46417b5bc0b48529de52460
> > > > [4] https://www.spinics.net/lists/platform-driver-x86/msg05251.html
