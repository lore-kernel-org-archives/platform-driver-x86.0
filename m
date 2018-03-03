From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3 3/3] platform/x86: dell-smbios: Link all dell-smbios-*
 modules together
Date: Sat, 3 Mar 2018 11:59:55 +0000
Message-ID: <2226b80b84734592bc8f4073ea12a9b2@ausx13mpc124.AMER.DELL.COM>
References: <1519755784-2155-1-git-send-email-mario.limonciello@dell.com>
 <1519755784-2155-3-git-send-email-mario.limonciello@dell.com>
 <20180303021042.GA11088@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180303021042.GA11088@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, March 2, 2018 8:11 PM
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
> >  	depends on ACPI_WMI
> >  	select DELL_WMI_DESCRIPTOR
> >  	select DELL_SMBIOS
>=20
> Blarg, this also violates the kconfig-language guidance for using select
> only for non-visible symbols with no dependencies.
>=20
> I have a patch that works, but I don't love it. We can remove the prompt
> from DELL_SMBIOS, and make DELL_SMBIOS_WMI|SMM "depend on"
> DELL_SMBIOS.
> The options just appear sort of randomly when either DELL_LAPTOP or
> DELL_WMI are selected - but they can default to y, which is nice.
>=20
> I have a subsequent patch which makes DELL_SMBIOS_WMI|SMM "depend on"
> DELL_LAPTOP, which makes this look a lot nicer. These just appear under
> DELL_LAPTOP as bool options. The problem with this approach is DELL_WMI
> also requires DELL_SMBIOS and DELL_WMI doesn't currently depend on
> DELL_LAPTOP. One option is to make it depend on DELL_LAPTOP as it seems
> unlikely for them to ever be used separately.  I don't love this either.
> Thoughts?
>=20
> Perhaps the compromise is leave the DELL_SMBIOS prompt. This doesn't
> have the negative consequences the kconfig-languages is trying to guard
> against, and it makes it obvious what the DELL_SMBIOS_* options are -
> and we can still default them to y. See below.
>=20
> This seems like it might be the least bad option at the moment. I'll
> keep thinking on it a bit...
>=20
> From: "Darren Hart (VMware)" <dvhart@infradead.org>
> Date: Fri, 2 Mar 2018 17:40:32 -0800
> Subject: [PATCH] platform/x86: Allow for SMBIOS backend defaults
>=20
> Avoid accidental configurations by setting default y for DELL_SMBIOS
> backends. Avoid this impacting the default build size, by making them
> dependent on DELL_SMBIOS, so they only appear when DELL_SMBIOS is
> manually selected, or by DELL_LAPTOP or DELL_WMI.
>=20
> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> ---
>  drivers/platform/x86/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index e3f682c..022c837 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -115,9 +115,10 @@ config DELL_SMBIOS
>=20
>  config DELL_SMBIOS_WMI
>  	bool "Dell SMBIOS driver WMI backend"
> +	default y
>  	depends on ACPI_WMI
>  	select DELL_WMI_DESCRIPTOR
> -	select DELL_SMBIOS
> +	depends on DELL_SMBIOS
>  	---help---
>  	This provides an implementation for the Dell SMBIOS calling interface
>  	communicated over ACPI-WMI.
> @@ -128,8 +129,9 @@ config DELL_SMBIOS_WMI
>=20
>  config DELL_SMBIOS_SMM
>  	bool "Dell SMBIOS driver SMM backend"
> +	default y
>  	depends on DCDBAS
> -	select DELL_SMBIOS
> +	depends on DELL_SMBIOS
>  	---help---
>  	This provides an implementation for the Dell SMBIOS calling interface
>  	communicated over SMI/SMM.
> --
> 2.9.5
>=20
>=20

Ooph. I think the compromise of leaving the dell smbios prompt and sane def=
aults
behind extras is the best.
With it being a library now there shouldn't be a way for someone to break o=
ther
modules in unexpected ways.  Init will fail for dell-smbios and then nothin=
g
else will be able to use it.
