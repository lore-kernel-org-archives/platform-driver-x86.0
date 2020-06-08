From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH 3/3] platform/x86: dell-wmi: add keys to
 bios_to_linux_keycode
Date: Mon, 8 Jun 2020 15:46:44 +0000
Message-ID: <8baab72e3d2e407792c3ffa1d9fffba8@AUSX13MPC105.AMER.DELL.COM>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <13951508596a3f654c6d47f5380ddb4f38e2f6b5.1591584631.git.y.linux@paritcher.com>
 <20200608090017.4qgtbosz7oullex2@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200608090017.4qgtbosz7oullex2@pali>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: pali@kernel.org, y.linux@paritcher.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
> owner@vger.kernel.org> On Behalf Of Pali Roh=E1r
> Sent: Monday, June 8, 2020 4:00 AM
> To: Y Paritcher
> Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> Matthew Garrett
> Subject: Re: [PATCH 3/3] platform/x86: dell-wmi: add keys to
> bios_to_linux_keycode
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Hello!
>=20
> On Monday 08 June 2020 00:22:26 Y Paritcher wrote:
> > Increase length of bios_to_linux_keycode to 2 bytes to allow for a new
> > keycode 0xffff, this silences the following messages being logged at
> > startup on a Dell Inspiron 5593

Which event type?  Can you show the whole WMI buffer that came through?

> >
> > dell_wmi: firmware scancode 0x48 maps to unrecognized keycode 0xffff
> > dell_wmi: firmware scancode 0x50 maps to unrecognized keycode 0xffff
> >
> > Signed-off-by: Y Paritcher <y.linux@paritcher.com>
> > ---
> >  drivers/platform/x86/dell-wmi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-
> wmi.c
> > index f37e7e9093c2..5ef716e3034f 100644
> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
> > @@ -196,7 +196,7 @@ struct dell_dmi_results {
> >  };
> >
> >  /* Uninitialized entries here are KEY_RESERVED =3D=3D 0. */
> > -static const u16 bios_to_linux_keycode[256] =3D {
> > +static const u16 bios_to_linux_keycode[65536] =3D {
>=20
> This change dramatically increase memory usage. I guess other that
> maintainers would not like such change.
>=20
> >  	[0]	=3D KEY_MEDIA,
> >  	[1]	=3D KEY_NEXTSONG,
> >  	[2]	=3D KEY_PLAYPAUSE,
> > @@ -237,6 +237,7 @@ static const u16 bios_to_linux_keycode[256] =3D {
> >  	[37]	=3D KEY_UNKNOWN,
> >  	[38]	=3D KEY_MICMUTE,
> >  	[255]	=3D KEY_PROG3,
> > +	[65535]	=3D KEY_UNKNOWN,
>=20
> Also it seems that this change is not complete. It looks like that you
> map two different scancodes (0x48 and 0x50) to same keycodes, moreover
> both are unknown.
>=20
> Could you please describe which key presses (or events) generate
> delivering these WMI scancode events?
>=20
> Note that purpose of printing unknown/unrecognized keys messages is to
> inform that current pressed key was not processed or that it was
> ignored.
>=20
> For me it looks like this just just hide information that key was not
> processed correctly as this change does not implement correct processing
> of this key.
>=20
> Also, could you share documentation about these 0x48/0x50 events? Or it
> is under NDA?
>=20
> >  };
> >
> >  /*
> > --
> > 2.27.0
> >

I would actually question if there is value to lines in dell-wmi.c like thi=
s:

pr_info("Unknown WMI event type 0x%x\n", (int)buffer_entry[1]);

and

pr_info("Unknown key with type 0x%04x and code 0x%04x pressed\n", type, cod=
e);

In both of those cases the information doesn't actually help the user, by d=
efault it's
ignored by the driver anyway.  It just notifies the user it's something the=
 driver doesn't
comprehend.  I would think these are better suited to downgrade to debug.  =
And if
a key combination isn't doing something expected the user can use dyndbg to=
 turn it
back on and can be debugged what should be populated or "explicitly" ignore=
d.
