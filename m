From: Alexander Abrosimov <alexander.n.abrosimov@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Add 2-in-1 devices to the DMI whitelist
Date: Wed, 7 Feb 2018 16:47:36 +0300
Message-ID: <CACKjtf6eiFXeBzzfO=cjkBru4j0M3YLtAJ1b7e_nv13k1e0A8Q@mail.gmail.com>
References: <20180125224857.3622-1-alexander.n.abrosimov@gmail.com>
 <20180125230239.GA3736@fury> <20180125230615.akr2nvmmrqzfo53q@pali> <d72f1065c98d4073b3f112cf8538f508@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d72f1065c98d4073b3f112cf8538f508@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Mario.Limonciello@dell.com, Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Darren, I have checked change on git.kernel.org and it seems to be merged t=
wice:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/platform/x86/dell-laptop.c?id=3Dfe486138788ba435ffa918c8d7aba05a77b6=
289a

How it can be fixed?

2018-01-26 17:42 GMT+03:00 <Mario.Limonciello@dell.com>:
>
> > -----Original Message-----
> > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> > Sent: Thursday, January 25, 2018 5:06 PM
> > To: Darren Hart <dvhart@infradead.org>
> > Cc: Alexander Abrosimov <alexander.n.abrosimov@gmail.com>; Matthew Garr=
ett
> > <mjg59@srcf.ucam.org>; Limonciello, Mario <Mario_Limonciello@Dell.com>;=
 Andy
> > Shevchenko <andy@infradead.org>; platform-driver-x86@vger.kernel.org; l=
inux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH] platform/x86: dell-laptop: Add 2-in-1 devices to t=
he DMI
> > whitelist
> >
> > On Thursday 25 January 2018 15:02:39 Darren Hart wrote:
> > > On Fri, Jan 26, 2018 at 01:48:57AM +0300, Alexander Abrosimov wrote:
> > > > SMBIOS 3.0.0 Specification introduced new Chassis Types field value=
s for
> > > > 2-in-1 devices like tablets, convertibles and detachables. Dell's
> > > > Inspiron 2-in-1 and XPS 2-in-1 fall into this category and they hav=
e to
> > > > be added to the DMI whitelist, so rfkill and backlight can be contr=
olled
> > > > for them as for other laptops.
> > > >
> > > > Signed-off-by: Alexander Abrosimov <alexander.n.abrosimov@gmail.com=
>
> > >
> > > Thanks Alexander. Looks good - just going to give Pali and +Mario a c=
hance to
> > > respond before merging...
> >
> > I have no comments for this. This should be confirmed by Mario or
> > somebody else from Dell, which DMI names are used for a new products.
>
> Yes these chassis types from SMBIOS 3.0 are covered by Dell specs and use=
d for
> some products.
>
> This patch looks good to me.
>
> Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
> >
> > > > ---
> > > >  drivers/platform/x86/dell-laptop.c | 18 ++++++++++++++++++
> > > >  1 file changed, 18 insertions(+)
> > > >
> > > > diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/=
x86/dell-
> > laptop.c
> > > > index cd4725e7e0b5..23fc94d70ea1 100644
> > > > --- a/drivers/platform/x86/dell-laptop.c
> > > > +++ b/drivers/platform/x86/dell-laptop.c
> > > > @@ -110,6 +110,24 @@ static const struct dmi_system_id dell_device_=
table[]
> > __initconst =3D {
> > > >           },
> > > >   },
> > > >   {
> > > > +         .matches =3D {
> > > > +                 DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > > > +                 DMI_MATCH(DMI_CHASSIS_TYPE, "30"), /*Tablet*/
> > > > +         },
> > > > + },
> > > > + {
> > > > +         .matches =3D {
> > > > +                 DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > > > +                 DMI_MATCH(DMI_CHASSIS_TYPE, "31"), /*Convertible*=
/
> > > > +         },
> > > > + },
> > > > + {
> > > > +         .matches =3D {
> > > > +                 DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > > > +                 DMI_MATCH(DMI_CHASSIS_TYPE, "32"), /*Detachable*/
> > > > +         },
> > > > + },
> > > > + {
> > > >           .ident =3D "Dell Computer Corporation",
> > > >           .matches =3D {
> > > >                   DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer
> > Corporation"),
> > > > --
> > > > 2.13.6
> > > >
> > > >
> > >
> >
> > --
> > Pali Roh=C3=A1r
> > pali.rohar@gmail.com




--=20
Best Regards,
Abrosimov Alexander, mailto:alexander.n.abrosimov@gmail.com
