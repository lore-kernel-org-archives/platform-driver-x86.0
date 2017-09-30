From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3 3/8] platform/x86: dell-wmi-smbios: Use Dell WMI
 descriptor check
Date: Sat, 30 Sep 2017 19:48:39 +0000
Message-ID: <fa02a34098914fb7a31b563d8b56dcc7@ausx13mpc120.AMER.DELL.COM>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <bea602b33e27facc77ee850ef14dfa37f6894275.1506571188.git.mario.limonciello@dell.com>
 <20170930012912.GB13307@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170930012912.GB13307@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, September 29, 2017 8:29 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; LKML <linux-
> kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org; Andy Lutomi=
rski
> <luto@kernel.org>; quasisec@google.com; pali.rohar@gmail.com
> Subject: Re: [PATCH v3 3/8] platform/x86: dell-wmi-smbios: Use Dell WMI
> descriptor check
>=20
> On Wed, Sep 27, 2017 at 11:02:15PM -0500, Mario Limonciello wrote:
> > The Dell WMI descriptor check is used as an indication that WMI
> > calls are safe to run both when used with the notification
> > ASL/GUID pair as well as the SMBIOS calling ASL/GUID pair.
> >
> > As some code in dell-wmi-smbios is already a prerequisite for
> > dell-wmi, move the code for performing the descriptor check into
> > dell-wmi-smbios and let both drivers use it from there.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > ---
> ...
> > diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-
> smbios.c
> ...
> >
> > +/*
> > + * Descriptor buffer is 128 byte long and contains:
> ...
> > +	if (obj->buffer.length !=3D 128) {
> > +		dev_err(&wdev->dev,
> > +			"Dell descriptor buffer has invalid length (%d)\n",
> > +			obj->buffer.length);
>=20
> This seems odd. We call it an error (not a warning) if !=3D 128, but we o=
nly abort
> and return an error if it's < 16.
>=20
> If it's an error, we should return an error code, if anything above 16 is
> acceptable but 128 is preferred, the above should be a warning at best. (=
this
> scenario seems unlikely).

Hopefully the original author can speak up to the intentions here.  I would=
 feel
that it should have errored out if it wasn't expected length too.

>=20
> > +		if (obj->buffer.length < 16) {
> > +			ret =3D -EINVAL;
> > +			goto out;
> > +		}
> > +	}
> > +	desc_buffer =3D (u32 *)obj->buffer.pointer;
> > +
> > +	if (desc_buffer[0] !=3D 0x4C4C4544 && desc_buffer[1] !=3D 0x494D5720)
>=20
> This seems like it should be an || ?
>=20
> (I see this is fixed in a later patch)
>=20
> I would have suggested fixing it, then moving it - just from a pure ease =
of
> review perspective. Perhaps not in the comment above that this is a verba=
tim
> move, some fixes are coming in subsequent patches. This is worth noting f=
or a
> future develop who may be choosing what to backport.
>=20

I'll re-order things so that the fixes come before the move.

> >  static int dell_smbios_wmi_probe(struct wmi_device *wdev)
> >  {
> > +	int ret;
> > +	u32 interface_version;
>=20
> Declarations in order of decreasing line length please.
>=20
> > @@ -236,6 +316,7 @@ static int dell_smbios_wmi_probe(struct wmi_device
> *wdev)
> >  	if (!buffer)
> >  		return -ENOMEM;
> >  	bufferlen =3D sizeof(struct wmi_calling_interface_buffer);
> > +
>=20
> Stray whitespace, should have been in the previous patch I guess?
>=20
>=20
> --
> Darren Hart
> VMware Open Source Technology Center
