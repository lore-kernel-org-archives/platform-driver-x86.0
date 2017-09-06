From: <Mario.Limonciello@dell.com>
Subject: RE: Fwd: [PATCH] Add driver to force WMI Thunderbolt controller power
 status
Date: Wed, 6 Sep 2017 21:43:36 +0000
Message-ID: <77ca02732f5c4ac1a16c82bf7c893a9b@ausx13mpc120.AMER.DELL.COM>
References: <1504720440-24423-1-git-send-email-mario.limonciello@dell.com>
 <CA+CmpXt9EtzObijHT3gmm=xUwFDF3Ec=SFbNnPAk+oRdzAUADQ@mail.gmail.com>
 <1504726863.2677.154.camel@intel.com>
 <b74a2237da254faea0377fdcb93aa3e0@ausx13mpc120.AMER.DELL.COM>
 <20170906200953.GA8298@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa3.dell-outbound.iphmx.com ([68.232.153.94]:32713 "EHLO
        esa3.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752313AbdIFVpI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2017 17:45:08 -0400
In-Reply-To: <20170906200953.GA8298@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: yehezkel.bernat@intel.com, mika.westerberg@linux.intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, September 6, 2017 3:10 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: yehezkel.bernat@intel.com; mika.westerberg@linux.intel.com; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> hughsient@gmail.com
> Subject: Re: Fwd: [PATCH] Add driver to force WMI Thunderbolt controller =
power
> status
>=20
> On Wed, Sep 06, 2017 at 07:49:32PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > -----Original Message-----
> > > From: Bernat, Yehezkel [mailto:yehezkel.bernat@intel.com]
> > > Sent: Wednesday, September 6, 2017 2:41 PM
> > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > Cc: mika.westerberg@linux.intel.com; linux-kernel@vger.kernel.org; pl=
atform-
> > > driver-x86@vger.ke; dvhart@infradead.org; hughsient@gmail.com
> > > Subject: Re: Fwd: [PATCH] Add driver to force WMI Thunderbolt control=
ler
> power
> > > status
> > >
> > >
> > > > Current implementations of Intel Thunderbolt controllers will go
> > > > into a low power mode when not in use.
> > > >
> > > > Many machines containing these controllers also have a GPIO wired u=
p
> > > > that can force the controller awake.=A0 This is offered via a ACPI-=
WMI
> > > > interface intended to be manipulated by a userspace utility.
> > >
> > >
> > > > This mechanism is provided by Intel to OEMs to include in BIOS.
> > > > It uses an industry wide GUID that is populated in a separate _WDG
> > > > entry with no binary MOF.
> > > >
> > > > This interface allow software such as fwupd to wake up thunderbolt
> > > > controllers to query the firmware version or flash new firmware.
> > >
> > > As this is a Thunderbolt specific function, maybe it's better to be
> > > exposed from the Thunderbolt driver?
> > >
> >
> > I thought about this too, but the thunderbolt driver won't load if the
> > controller doesn't exist in the first place, whereas this is a platform
> > BIOS feature.  I'll be interested to hear if Mika has a different persp=
ective
> > on if this should live in the TBT driver and the proper way to do it.
> >
>=20
> The other question I had about this was if the typical use case involves =
the OS,
> or if the firmware update (for example) would be performed as part of the
> general platform firmware update (from the UEFI update utility).
>=20
> > >
> > > > +
> > > > +static DEVICE_ATTR_WO(force_power);
> > > > +
> > >
> > > I'm not sure what is the convention for permissions for this type of
> > > attributes but I feel like this worth being root-only writable, as it
> > > can be used to power-off the controller in the middle of a FW update,
> > > for example.
> >
> > Yeah I think you're right.  I'll adjust it in a follow up patch if this=
 is the
> > correct way to go afterall.
>=20
>=20
> Ahhhrg, that was something I meant to follow up on as I was discussing us=
ing the
> macros with Mario previously, and I forgot. Sorry about that Mario.
>=20

I double checked and with the way it's done right now, permissions are:
--w-------

Looks like the macro DTRT without me needing to override.
