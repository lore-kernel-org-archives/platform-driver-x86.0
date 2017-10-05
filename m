From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 11/14] platform/x86: dell-smbios-wmi: Add new WMI
 dispatcher driver
Date: Thu, 5 Oct 2017 15:12:46 +0000
Message-ID: <e94d06dcfaf34deab72a5170a95fe2e9@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <8b37d47244fbba75ea264d06d4e7966a1f8f8f7a.1507156392.git.mario.limonciello@dell.com>
 <20171005021434.GF25018@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:54823 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750965AbdJEPMv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 11:12:51 -0400
In-Reply-To: <20171005021434.GF25018@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, October 4, 2017 9:15 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; LKML <linux-
> kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org; Andy Lutomi=
rski
> <luto@kernel.org>; quasisec@google.com; pali.rohar@gmail.com;
> rjw@rjwysocki.net; mjg59@google.com; hch@lst.de; Greg KH
> <greg@kroah.com>
> Subject: Re: [PATCH v4 11/14] platform/x86: dell-smbios-wmi: Add new WMI
> dispatcher driver
>=20
> On Wed, Oct 04, 2017 at 05:48:37PM -0500, Mario Limonciello wrote:
> > The dell-smbios stack only currently uses an SMI interface which grants
> > direct access to physical memory to the firmware SMM methods via a poin=
ter.
> >
> > This dispatcher driver adds a WMI-ACPI interface that is detected by WM=
I
> > probe and preferred over the SMI interface in dell-smbios.
> >
> > Changing this to operate over WMI-ACPI will use an ACPI OperationRegion
> > for a buffer of data storage when SMM calls are performed.
> >
> > This is a safer approach to use in kernel drivers as the SMM will
> > only have access to that OperationRegion.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > ---
> >  MAINTAINERS                            |   6 +
> >  drivers/platform/x86/Kconfig           |  16 ++-
> >  drivers/platform/x86/Makefile          |   1 +
> >  drivers/platform/x86/dell-smbios-wmi.c | 215
> +++++++++++++++++++++++++++++++++
> >  drivers/platform/x86/dell-smbios-wmi.h |  28 +++++
> >  5 files changed, 265 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/platform/x86/dell-smbios-wmi.c
> >  create mode 100644 drivers/platform/x86/dell-smbios-wmi.h
> >
> ...
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
> > index f0b97cb8e449..ef597f440d2e 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -93,13 +93,27 @@ config ASUS_LAPTOP
> >
> >  config DELL_SMBIOS
> >  	tristate "Dell SMBIOS calling interface"
> > -	depends on DELL_SMBIOS_SMM
> > +	depends on DELL_SMBIOS_WMI || DELL_SMBIOS_SMM
> >  	---help---
> >  	This module provides common functions for kernel modules using
> >  	Dell SMBIOS.
>=20
> You use select DELL_SMBIOS below, which implies this modules should be
> invisible. Indeed, there is no need for the user to see the DELL_SMBIOS
> option at all now, they can select DELL_SMBIOS_WMI and or
> DELL_SMBIOS_SMM, no need to keep the DELL_SMBIOS option.
>=20
So when you say make invisible, does that mean that it should never show
up in make menuconfig and just be implicitly selected?

When I was adjusting Kconfig for your other feedback I noticed setting some=
thing
to "select $DRIVER" that invisible driver does show up just can't be turned=
 off.
Is that what you mean?

> > diff --git a/drivers/platform/x86/dell-smbios-wmi.c
> b/drivers/platform/x86/dell-smbios-wmi.c
> > +static void __init parse_b1_table(const struct dmi_header *dm)
> > +{
> > +	struct misc_bios_flags_structure *flags =3D
> > +	container_of(dm, struct misc_bios_flags_structure, header);
> > +
> > +	/* 4 bytes header, and one word of flags */
>=20
> Assuming specifically 8 bytes of flags, independent of arch?

Well platform/drivers/*x86*...
