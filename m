From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3 3/3] platform/x86: dell-smbios: Link all dell-smbios-*
 modules together
Date: Thu, 1 Mar 2018 20:54:31 +0000
Message-ID: <44477ede216542d89090494590ad7a2c@ausx13mpc124.AMER.DELL.COM>
References: <1519755784-2155-1-git-send-email-mario.limonciello@dell.com>
 <1519755784-2155-3-git-send-email-mario.limonciello@dell.com>
 <20180301174845.GA25613@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180301174845.GA25613@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Thursday, March 1, 2018 11:49 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; pali.rohar@gmail.com;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org
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
>=20
> In order to make the default sane, I would suggest making the above a men=
u
> (default n), nesting the two options below, and making WMI a default=3Dy.=
 This
> satisfies Linus' requirement by defaulting everything to n, but enables a=
 sane
> default IFF the DELL_SMBIOS menu is enabled.
>=20
> Alternatively, all of the above can be put under the "Dell Extras" menu I
> proposed, and DELL_SMBIOS can default to m and DELL_SMBIOS_WMI can defaul=
t
> to y.

I'm on board with moving everything to a Dell extras menu.  There are so ma=
ny
drivers now, it really seems like the best way to make sure that people get=
 them.

You'll have to actively go out of your way to turn off one of the sub-drive=
rs then
to get into the situation that was described.

Since you did the original patch for dell extras nested in a mail would you=
 mind=20
sending that as a follow up second patch on top of my patch?

I think it's probably too much to do it all in this same patch itself.
Alternatively I can re-send my series with it before my 3/3, up to you.

>=20
> >
> > +	/* register backends */
> > +	wmi =3D init_dell_smbios_wmi();
> > +	if (wmi)
> > +		pr_debug("Failed to initialize WMI backend: %d\n", wmi);
> > +	smm =3D init_dell_smbios_smm();
> > +	if (smm)
> > +		pr_debug("Failed to initialize SMM backend: %d\n", smm);
> > +	if (wmi && smm) {
> > +		pr_err("No SMBIOS backends available (wmi: %d, smm: %d)\n",
> > +			wmi, smm);
> > +		goto fail_sysfs;
> > +	}
> > +
>=20
> I like the approach of building a library instead of a bunch of separate
> modules.
>=20
> --
> Darren Hart
> VMware Open Source Technology Center
