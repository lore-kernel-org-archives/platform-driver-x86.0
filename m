From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 11/14] platform/x86: dell-smbios-wmi: Add new WMI
 dispatcher driver
Date: Thu, 5 Oct 2017 19:47:38 +0000
Message-ID: <1cf6f4e539e24b60879c8274e580cfb3@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <8b37d47244fbba75ea264d06d4e7966a1f8f8f7a.1507156392.git.mario.limonciello@dell.com>
 <20171005021434.GF25018@fury>
 <e94d06dcfaf34deab72a5170a95fe2e9@ausx13mpc120.AMER.DELL.COM>
 <20171005175745.GE31452@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:18910 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751405AbdJETrk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 15:47:40 -0400
In-Reply-To: <20171005175745.GE31452@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Thursday, October 5, 2017 12:58 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: andy.shevchenko@gmail.com; linux-kernel@vger.kernel.org; platform-
> driver-x86@vger.kernel.org; luto@kernel.org; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de;
> greg@kroah.com
> Subject: Re: [PATCH v4 11/14] platform/x86: dell-smbios-wmi: Add new WMI
> dispatcher driver
>=20
> On Thu, Oct 05, 2017 at 03:12:46PM +0000, Mario.Limonciello@dell.com wrot=
e:
>=20
> > > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kc=
onfig
> > > > index f0b97cb8e449..ef597f440d2e 100644
> > > > --- a/drivers/platform/x86/Kconfig
> > > > +++ b/drivers/platform/x86/Kconfig
> > > > @@ -93,13 +93,27 @@ config ASUS_LAPTOP
> > > >
> > > >  config DELL_SMBIOS
> > > >  	tristate "Dell SMBIOS calling interface"
> > > > -	depends on DELL_SMBIOS_SMM
> > > > +	depends on DELL_SMBIOS_WMI || DELL_SMBIOS_SMM
> > > >  	---help---
> > > >  	This module provides common functions for kernel modules using
> > > >  	Dell SMBIOS.
> > >
> > > You use select DELL_SMBIOS below, which implies this modules should b=
e
> > > invisible. Indeed, there is no need for the user to see the DELL_SMBI=
OS
> > > option at all now, they can select DELL_SMBIOS_WMI and or
> > > DELL_SMBIOS_SMM, no need to keep the DELL_SMBIOS option.
> > >
> > So when you say make invisible, does that mean that it should never sho=
w
> > up in make menuconfig and just be implicitly selected?
>=20
> Right. It shouldn't have a prompt.
>=20
> >
> > When I was adjusting Kconfig for your other feedback I noticed setting
> something
> > to "select $DRIVER" that invisible driver does show up just can't be tu=
rned off.
> > Is that what you mean?
>=20
> No, I mean eliminate the menu entry by eliminating the prompt.
Do you have an example of a driver that does it this way?=20
When I tried, CONFIG_DELL_WMI_DESCRIPTOR doesn't get saved to .config
and then doesn't compile into a module anymore.

>=20
> >
> > > > diff --git a/drivers/platform/x86/dell-smbios-wmi.c
> > > b/drivers/platform/x86/dell-smbios-wmi.c
> > > > +static void __init parse_b1_table(const struct dmi_header *dm)
> > > > +{
> > > > +	struct misc_bios_flags_structure *flags =3D
> > > > +	container_of(dm, struct misc_bios_flags_structure, header);
> > > > +
> > > > +	/* 4 bytes header, and one word of flags */
> > >
> > > Assuming specifically 8 bytes of flags, independent of arch?
> >
> > Well platform/drivers/*x86*...
>=20
> I was thinking 32b vs 64b x86 which have a different definition of word s=
ize.
>=20
I'll make this clearer.
