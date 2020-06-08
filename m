From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH 1/3] platform/x86: dell-wmi: add new backlight events
Date: Mon, 8 Jun 2020 15:30:52 +0000
Message-ID: <3e0d394545954ed79b8f883e1ac93338@AUSX13MPC105.AMER.DELL.COM>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <7dbe4e9e5ed64e4704b1c4ae13ac84df644ccc13.1591584631.git.y.linux@paritcher.com>
 <20200608083503.l5g5iq52ezxkobvv@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200608083503.l5g5iq52ezxkobvv@pali>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: pali@kernel.org, y.linux@paritcher.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
> owner@vger.kernel.org> On Behalf Of Pali Roh=E1r
> Sent: Monday, June 8, 2020 3:35 AM
> To: Y Paritcher
> Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> Matthew Garrett
> Subject: Re: [PATCH 1/3] platform/x86: dell-wmi: add new backlight events
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> On Monday 08 June 2020 00:22:24 Y Paritcher wrote:
> > Ignore events with a type of 0x0010 and a code of 0x57 / 0x58,
> > this silences the following messages being logged on a
> > Dell Inspiron 5593:
> >
> > dell_wmi: Unknown key with type 0x0010 and code 0x0057 pressed
> > dell_wmi: Unknown key with type 0x0010 and code 0x0058 pressed
> >
> > Signed-off-by: Y Paritcher <y.linux@paritcher.com>
> > ---
> >  drivers/platform/x86/dell-wmi.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-
> wmi.c
> > index c25a4286d766..0b4f72f923cd 100644
> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
> > @@ -252,6 +252,10 @@ static const struct key_entry
> dell_wmi_keymap_type_0010[] =3D {
> >  	/* Fn-lock switched to multimedia keys */
> >  	{ KE_IGNORE, 0x1, { KEY_RESERVED } },
> >
> > +	/* Backlight brightness level */
> > +	{ KE_KEY,    0x57, { KEY_BRIGHTNESSDOWN } },
> > +	{ KE_KEY,    0x58, { KEY_BRIGHTNESSUP } },
> > +

For these particular events are they emitted by another interface as well i=
n this
platform?

If so they should be KE_IGNORE so you don't end up with double notification=
s to
userspace.

> >  	/* Keyboard backlight change notification */
> >  	{ KE_IGNORE, 0x3f, { KEY_RESERVED } },
>=20
> Please, keep codes sorted.
>=20
> >
> > --
> > 2.27.0
> >
