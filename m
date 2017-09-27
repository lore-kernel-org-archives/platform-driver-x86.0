From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH 06/12] platform/x86: dell-wmi-smbios: Add a sysfs
 interface for SMBIOS tokens
Date: Wed, 27 Sep 2017 18:27:15 +0000
Message-ID: <f4d8e4a5df5c4648a60392fc31c00766@ausx13mpc120.AMER.DELL.COM>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <1342f21a4f2c9af86d3033a9af9d9a4d05d27106.1505999739.git.mario.limonciello@dell.com>
 <20170925162333.GL22190@pali>
 <CAHp75Vd-mwn5O696XM7_F5-HMc2iztxibqQA0D4vOrMQO+WQRg@mail.gmail.com>
 <bb85503730a1479c94810a12802e8027@ausx13mpc120.AMER.DELL.COM>
 <20170927165051.GE23572@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:46779 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751754AbdI0S1R (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 14:27:17 -0400
In-Reply-To: <20170927165051.GE23572@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, September 27, 2017 12:51 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: andy.shevchenko@gmail.com; pali.rohar@gmail.com; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> quasisec@google.com
> Subject: Re: [PATCH 06/12] platform/x86: dell-wmi-smbios: Add a sysfs int=
erface
> for SMBIOS tokens
>=20
> On Mon, Sep 25, 2017 at 05:31:05PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > -----Original Message-----
> > > From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
> > > Sent: Monday, September 25, 2017 1:04 PM
> > > To: Pali Roh=E1r <pali.rohar@gmail.com>
> > > Cc: Limonciello, Mario <Mario_Limonciello@Dell.com>; dvhart@infradead=
.org;
> > > LKML <linux-kernel@vger.kernel.org>; Platform Driver <platform-driver=
-
> > > x86@vger.kernel.org>; quasisec@google.com
> > > Subject: Re: [PATCH 06/12] platform/x86: dell-wmi-smbios: Add a sysfs
> interface
> > > for SMBIOS tokens
> > >
> > > On Mon, Sep 25, 2017 at 7:23 PM, Pali Roh=E1r <pali.rohar@gmail.com> =
wrote:
> > > > On Thursday 21 September 2017 08:57:11 Mario Limonciello wrote:
> > > >> Currently userspace tools can access system tokens via the dcdbas
> > > >> kernel module and a SMI call that will cause the platform to execu=
te
> > > >> SMM code.
> > > >>
> > > >> With a goal in mind of deprecating the dcdbas kernel module a diff=
erent
> > > >> method for accessing these tokens from userspace needs to be creat=
ed.
> > > >>
> > > >> This is intentionally marked to only be readable as root as it can
> > > >> contain sensitive information about the platform's configuration.
> > > >
> > > > Darren, Andy, any comments? I'm not quite sure if such API is suita=
ble
> > > > for long term in kernel.
> > >
> > > I would try to avoid sysfs interfaces for some particular devices.
> > > Besides we are creating a character device. Would it be suitable ther=
e?
> >
> > If the character device having 2 different ioctls for different needs i=
s
> > acceptable I'm happy to adjust the series to do this instead.
>=20
> One piece of feedback I had re the char device was to see if we could avo=
id the
> need for the IOCTL altogether, I'd like to have that discussion before we=
 add
> another.

My original design was sysfs files for everything but it was raised by seve=
ral folks
that you run into the potential of two userspace processes stomping on each
other's data when they run the ACPI call.  That's why I need to have a mute=
x to
protect and make sure that userspace calls get the right results.

>=20
> >
> > >
> > > > Basically tokens are list of tuples <id, location, value> with
> > > > possibility to active them, right?
> > > >
> >
> > I didn't add a way to activate them through this, it was only for
> > reading purpose.  Activating them should be possible through the
> > SMBIOS calling interface though.
> >
>=20
> These are read-only as I understood it, and only with the right privilege=
s.
> Sysfs seemed appropriate for this to me.

Andy S was against having this data as another sysfs file.   From a userspa=
ce
perspective I think it's simpler to just parse a sysfs file with read only =
static
data as root.  With the current ioctl based solution it requires userspace =
to run=20
an ioctl to determine how many tokens exist, then allocate a chunk of memor=
y=20
big enough to hold all the token data and then run another ioctl to get all=
 the tokens.

Andy S, given this change between v1 and v2 what do you feel is better?
