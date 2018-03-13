From: <Mario.Limonciello@dell.com>
Subject: RE: Dell Inc. XPS 13 9343/0TM99H fails to boot v4.16-rc5
Date: Tue, 13 Mar 2018 06:12:04 +0000
Message-ID: <f78e97a8f037461ca7f5a60cb351e1af@ausx13mpc120.AMER.DELL.COM>
References: <20180312185357.GA1672@light.dominikbrodowski.net>
 <4cce64d16cab4d499dca9347c1a1f30c@ausx13mpc120.AMER.DELL.COM>
 <20180313055109.GA14542@light.dominikbrodowski.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180313055109.GA14542@light.dominikbrodowski.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux@dominikbrodowski.net
Cc: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Dominik Brodowski [mailto:linux@dominikbrodowski.net]
> Sent: Tuesday, March 13, 2018 1:51 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; platform-driver-x86@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: Dell Inc. XPS 13 9343/0TM99H fails to boot v4.16-rc5
>=20
> On Mon, Mar 12, 2018 at 10:42:01PM +0000, Mario.Limonciello@dell.com wrot=
e:
> >
> >
> > > -----Original Message-----
> > > From: Dominik Brodowski [mailto:linux@dominikbrodowski.net]
> > > Sent: Tuesday, March 13, 2018 2:54 AM
> > > To: dvhart@infradead.org; Limonciello, Mario <Mario_Limonciello@Dell.=
com>
> > > Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> > > Subject: Dell Inc. XPS 13 9343/0TM99H fails to boot v4.16-rc5
> > >
> > > Mario,
> > >
> > > unfortunately, my Dell Inc. XPS 13 9343/0TM99H, BIOS A11 12/08/2016 f=
ails to
> > > boot v4.16-rc5. More exactly, I could bisect it down to commit 25d470=
27e10
> > > ("platform/x86: dell-smbios: Link all dell-smbios-* modules together"=
).
> > > Usually, I have enabled
> > >
> > > CONFIG_SENSORS_DELL_SMM=3Dy
> > > CONFIG_DELL_SMBIOS=3Dy
> > > CONFIG_DELL_SMBIOS_WMI=3Dy
> > > CONFIG_DELL_SMBIOS_SMM=3Dy
> > > CONFIG_DELL_LAPTOP=3Dy
> > > CONFIG_DELL_WMI=3Dy
> > > CONFIG_DELL_WMI_DESCRIPTOR=3Dy
> > > # CONFIG_DELL_WMI_AIO is not set
> > > # CONFIG_DELL_WMI_LED is not set
> > > # CONFIG_DELL_SMO8800 is not set
> > > # CONFIG_DELL_RBTN is not set
> > > # CONFIG_DELL_RBU is not set
> > >
> > > For v4.16-rc5 to work, I need to manually disable DELL_SMBIOS_WMI:
> > >
> > > -CONFIG_DELL_SMBIOS_WMI=3Dy
> > > +# CONFIG_DELL_SMBIOS_WMI is not set
> > >
> > > Any ideas?
> > >
> > Dominick,
> >
> > Interesting.  Can you please change CONFIG_DELL_SMBIOS to a module
> > and see if that behavior persists?  If it does, can you please blacklis=
t it on
> > the kernel command line and try to load it manually and share any
> > backtrace?
>=20
> Mario,
>=20
> building and running it as a *module* works flawlessly. But that was
> actually expected after a 'grep "initcall"' in drivers/platform/x86:

Dominck,

Thanks for your checking and explanation of the situation.

>=20
> As Darren pointed out, DELL_SMBIOS_WMI depends on ACPI_WMI, so probably
> ACPI_WMI needs to be initialized first. However, the all-in-one
> dell-smbios.o is run as subsys_initcall(), same as wmi.o
> (subsys_initcall_sync() there).
>=20
> If both are built-ins, that means that dell-smbios.o is run first, and wm=
i.o
> second. Changing dell-smbios.o to run at the later fs_initcall() level
> instead lets me boot the kernel. HOWEVER:
>=20
> 1) Is there a reason why both the core and the dell-smbios-smm driver hav=
e
>    to run already at subsys_initcall() time? They did so previous to your
>    patch. Is it OK to defer these parts opf the all-in-one dell-smbios.o
>    to fs_initcall(), or even to the default device_initcall()?

As long as they're ready before dell-laptop's initialization which uses
late_initcall that should be fine.

Am I correct to presume you're going to propose a patch you can test and
confirm your hypothesis rather than Darren reverting my patch to bring
them together?

>=20
> 2) dell-smbios-wmi depends on (well, selects) DELL_WMI_DESCRIPTOR. The
>    dell-smbios-wmi is running at the default device_initcall() time, but
>    (AFAICS) probably later than the initialization of dell-smbios-wmi.o.
>    May I presume that this poses no additional problem?
>=20

I "think" that should actually be fine.  The driver will use deferred probi=
ng
until it's ready meaning that dell-smbios-wmi should wait until dell-wmi-de=
scriptor
is done with it's probing routine.
=20
