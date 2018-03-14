From: <Mario.Limonciello@dell.com>
Subject: RE: Dell Inc. XPS 13 9343/0TM99H fails to boot v4.16-rc5
Date: Wed, 14 Mar 2018 01:28:54 +0000
Message-ID: <ca61e2ba279c4bfebb17baa4fc03f13f@ausx13mpc120.AMER.DELL.COM>
References: <20180313063213.GA20710@localhost.localdomain>
 <f78e97a8f037461ca7f5a60cb351e1af@ausx13mpc120.AMER.DELL.COM>
 <20180313064334.GA1743@light.dominikbrodowski.net>
 <bddaade724054711ba4682f73ec54264@ausx13mpc120.AMER.DELL.COM>
 <20180313214259.GA9260@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180313214259.GA9260@localhost.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: linux@dominikbrodowski.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, March 14, 2018 5:43 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: linux@dominikbrodowski.net; platform-driver-x86@vger.kernel.org; linu=
x-
> kernel@vger.kernel.org
> Subject: Re: Dell Inc. XPS 13 9343/0TM99H fails to boot v4.16-rc5
>=20
> On Tue, Mar 13, 2018 at 07:07:26AM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > -----Original Message-----
> > > From: Dominik Brodowski [mailto:linux@dominikbrodowski.net]
> > > Sent: Tuesday, March 13, 2018 2:44 PM
> > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>; Darren Hart
> > > <dvhart@infradead.org>
> > > Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> > > Subject: Re: Dell Inc. XPS 13 9343/0TM99H fails to boot v4.16-rc5
> > >
> > > On Tue, Mar 13, 2018 at 06:12:04AM +0000, Mario.Limonciello@dell.com =
wrote:
> > > > As long as they're ready before dell-laptop's initialization which =
uses
> > > > late_initcall that should be fine.
> > > >
> > > > Am I correct to presume you're going to propose a patch you can tes=
t and
> > > > confirm your hypothesis rather than Darren reverting my patch to br=
ing
> > > > them together?
> > >
> > > Thanks for the input; a draft patch (which works fine on my system) i=
s
> > > attached below.
> > >
> > > On Mon, Mar 12, 2018 at 11:32:13PM -0700, Darren Hart wrote:
> > > > There is one other caveat, which you'll find documented in
> > > > dell-laptop.c, namely that dell-laptop needs to init after dell-rbt=
n
> > > > (I'm starting to appreciate the monolithic thinkpad-acpi driver).
> > > >
> > > > We need things to init in this order (items on the same line have n=
o
> > > > dependency):
> > > >
> > > > 1. DCDBAS, ACPI_WMI
> > > > 2. DELL_SMBIOS, DELL_RBTN
> > > > 3. DELL_LAPTOP, DELL_WMI
> > > >
> > > > Currently:
> > > > subsys_initcall: ACPI_WMI, DELL_SMBIOS
> > > > module_init: DCDBAS, DELL_WMI
> > > > late_initcall: DELL_LAPTOP
> > > >
> > > > From a quick naive glance, it appears as though we might be able to
> > > > address this as follows:
> > > >
> > > > subsys_initcall: DCDBAS, ACPI_WMI
> > > > module_init: DELL_SMBIOS, DELL_RBTN
> > > > late_initcall: DELL_LAPTOP, DELL_WMI
> > >
> > > Hmmm. I do not yet understand why you propose to
> > >
> > > a) advance the DCDBAS initialization to subsys_initcall, as only DELL=
_LAPTOP
> > >    (running as a late_initcall) requires it to be up and running, and
> >
> > Actually dell-smbios itself should require this too.  The SMM backend w=
ill use
> > it during initialization to determine if WSMT is enabled.  If it's not =
operational
> > yet then we may get invalid results.
> >
>=20
> Exactly.
>=20
> > So considering this I think Darren's proposal is good to move DCDBAS to=
 earlier.
> >
> > >
> > > b) delay DELL_WMI to late_initcall, as it can safely be initialized a=
s long
> > >    as ACPI_WMI is ready.
> >
> > Maybe Darren meant dell-wmi-descriptor not dell-wmi?
> > Otherwise I would agree that part isn't needed.
>=20
> Like DELL_LAPTOP, DELL_WMI depends on smbios being ready, so needs to
> init after DELL_SMBIOS as well.
>=20
> --

OK thanks for explaining.

Dominik,

Can you please verify if Darren's patch works for you too?

Darren,

If that patch works for Dominik, I'm fine with that for 4.16 if you keep
this series, otherwise we can retry for 4.17 and squash the various patches
together.

Thanks,
