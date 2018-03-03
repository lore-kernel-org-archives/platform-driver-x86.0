From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3 3/3] platform/x86: dell-smbios: Link all dell-smbios-*
 modules together
Date: Sat, 3 Mar 2018 01:48:40 +0000
Message-ID: <28c6c11b71774cd8921d188194d86344@ausx13mpc124.AMER.DELL.COM>
References: <1519755784-2155-1-git-send-email-mario.limonciello@dell.com>
 <1519755784-2155-3-git-send-email-mario.limonciello@dell.com>
 <20180303002135.GD25613@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180303002135.GD25613@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, March 2, 2018 6:22 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; pali.rohar@gmail.com; LK=
ML
> <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org
> Subject: Re: [PATCH v3 3/3] platform/x86: dell-smbios: Link all dell-smbi=
os-*
> modules together
>=20
> On Tue, Feb 27, 2018 at 12:23:04PM -0600, Mario Limonciello wrote:
> > Some race conditions were raised due to dell-smbios and its backends
> > not being ready by the time that a consumer would call one of the
> > exported methods.
> >
> > To avoid this problem, guarantee that all initialization has been
> > done by linking them all together and running init for them all.
> >
> > As part of this change the Kconfig needs to be adjusted so that
> > CONFIG_DELL_SMBIOS_SMM and CONFIG_DELL_SMBIOS_WMI are boolean
> > rather than modules.
> >
> > CONFIG_DELL_SMBIOS is a visually selectable option again and both
> > CONFIG_DELL_SMBIOS_WMI and CONFIG_DELL_SMBIOS_SMM are optional.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > ---
> > Changes from v2:
> >  * Move rest of #ifdef out of source files
> >  * Only compile units as necessary
> >
> >  drivers/platform/x86/Kconfig            | 11 ++++++++---
> >  drivers/platform/x86/Makefile           |  4 ++--
> >  drivers/platform/x86/dell-smbios-base.c | 21 ++++++++++++++++++++-
> >  drivers/platform/x86/dell-smbios-smm.c  | 18 ++++--------------
> >  drivers/platform/x86/dell-smbios-wmi.c  | 14 ++++----------
> >  drivers/platform/x86/dell-smbios.h      | 27 +++++++++++++++++++++++++=
+-
> >  6 files changed, 64 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
> > index 9a8f964..0c0897e 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -106,10 +106,15 @@ config ASUS_LAPTOP
> >  	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
> >
> >  config DELL_SMBIOS
> > -	tristate
> > +	tristate "Dell SMBIOS driver"
> > +	---help---
> > +	This provides support for the Dell SMBIOS calling interface.
> > +	If you have a Dell computer you should enable this option.
> > +
> > +	Be sure to select at least one backend for it to work properly.
> >
> >  config DELL_SMBIOS_WMI
> > -	tristate "Dell SMBIOS calling interface (WMI implementation)"
> > +	bool "Dell SMBIOS driver WMI support"
>=20
> Would you be happy with using "backend" here and for SMM?
>=20
> 	bool "Dell SMBIOS driver WMI backend"
>=20
> It makes it obvious what the help text is referring to by "select at
> least one backend".
>=20
> Happy to just make this change locally, no need to resubmit.
>=20

Yeah, fine by me.

Thanks,
