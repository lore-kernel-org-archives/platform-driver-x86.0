From: "Wang, Yong Y" <yong.y.wang@intel.com>
Subject: RE: [Acpi4asus-user] 1005PE's and backlight controls
Date: Thu, 15 Apr 2010 12:35:51 +0800
Message-ID: <FC2FB65B4D919844ADE4BE3C2BB739AD1E29AAE5@shsmsx501.ccr.corp.intel.com>
References: <y2g3b2dfeb01004131934x67e23d80vc73dfd6d5af133fa@mail.gmail.com>
	 <o2z71cd59b01004132316jd06b2a40m593ee5376e4dfa28@mail.gmail.com>
	 <r2odb599ead1004140624g56c2465qc4aaa3d1ee1c79b3@mail.gmail.com>
	 <p2t71cd59b01004140645v587098bdg2fb3628bcf2a78d3@mail.gmail.com>
 <i2tdb599ead1004140700v22d8e0c2ta01d5d130922a075@mail.gmail.com>
 <FC2FB65B4D919844ADE4BE3C2BB739AD1E216823@shsmsx501.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:55712 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752486Ab0DOEf5 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Apr 2010 00:35:57 -0400
In-Reply-To: <FC2FB65B4D919844ADE4BE3C2BB739AD1E216823@shsmsx501.ccr.corp.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chris Bagwell <chris@cnpbagwell.com>, Corentin Chary <corentin.chary@gmail.com>
Cc: "acpi4asus-user@lists.sourceforge.net" <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org
> [mailto:platform-driver-x86-owner@vger.kernel.org] On Behalf Of Wang,=
 Yong
> Y
> Sent: Thursday, April 15, 2010 11:34 AM
> To: Chris Bagwell; Corentin Chary
> Cc: acpi4asus-user@lists.sourceforge.net;
> platform-driver-x86@vger.kernel.org
> Subject: RE: [Acpi4asus-user] 1005PE's and backlight controls
>=20
> > -----Original Message-----
> > From: platform-driver-x86-owner@vger.kernel.org
> > [mailto:platform-driver-x86-owner@vger.kernel.org] On Behalf Of Chr=
is
> > Bagwell
> > Sent: Wednesday, April 14, 2010 10:00 PM
> > To: Corentin Chary
> > Cc: acpi4asus-user@lists.sourceforge.net;
> > platform-driver-x86@vger.kernel.org
> > Subject: Re: [Acpi4asus-user] 1005PE's and backlight controls
> >
> > On Wed, Apr 14, 2010 at 8:45 AM, Corentin Chary
> > <corentin.chary@gmail.com> wrote:
> > > On Wed, Apr 14, 2010 at 3:24 PM, Chris Bagwell <chris@cnpbagwell.=
com>
> > wrote:
> > >> On Wed, Apr 14, 2010 at 1:16 AM, Corentin Chary
> > >> <corentin.chary@gmail.com> wrote:
> > >>> On Wed, Apr 14, 2010 at 4:34 AM, Chris Bagwell
> <chris@cnpbagwell.com>
> > wrote:
> > >>>> Hi all,
> > >>>>
> > >>>> I've seen the following issue reported on various web pages bu=
t not sure
> if
> > >>>> it was directly reported.=A0 First up, you guys know about iss=
ue with
> > acpi_osi
> > >>>> of "Windows 2009" disables eeepc_backend and thats were eeepc_=
wmi
> > comes in.
> > >>>>
> > >>>> There is a secondary bug though if you boot with acpi_osi=3D"!=
Windows
> > 2009"
> > >>>> (or "Linux").=A0 The ACPI driver will take control of backligh=
t controls with
> > >>>> Fn-F5/F6.=A0 Those keys will work but has issues with Gnome an=
d other
> > user
> > >>>> processes.
> > >>>>
> > >>>> Anything that uses any of the /sys/* interfaces to control bac=
klight do
> not
> > >>>> work correctly.=A0 When software cycles threw levels, the beha=
vior is
> kinda
> > >>>> odd.=A0 It will cycle each time you dim to something like
> > >>>> Bright->Dim->Bight->Off->Bright->etc.=A0 Also, Gnome will give=
 no
> > feedback
> > >>>> because eeepc_laptop discards the events and it will not make =
it to
> > >>>> /dev/input/event*.=A0 And last, the status of current brightne=
ss is never
> > >>>> updated under /sys/* correctly which confuses Gnome as well.
> > >>>>
> > >>>> The secondary work around is to add acpi_backlight=3Dvendor to=
 boot
> > options.
> > >>>> Then eepc_backlight takes charge and life is good.=A0 Gnome gi=
ves visual
> > >>>> feedback and dimmer works as expected.
> > >>>>
> > >>>> Baring a firmware fix from Asus, would it be possible to enabl=
e some
> sort
> > of
> > >>>> backlist for using ACPI backlight support and have 1005P's use
> > eeepc_laptop?
> > >>>>
> > >>>> Chris
> > >>>
> > >>> Hi,
> > >>> Did you try the eeepc-wmi ? It's the long term solution and it =
don't need
> > >>> any extra kernel parameters. Yong Wang just added backlight sup=
port to
> it.
> > >>>
> > >>>
> >
> http://git.kernel.org/?p=3Dlinux/kernel/git/mjg59/platform-drivers-x8=
6.git;a=3Dsho
> > rtlog;h=3Drefs/heads/for_linus
> > >>>
> > >>
> > >> I havent't tried it yet but it looks like it has same issue that
> > >> eeepc-laptop does. =A0If ACPI reports it handles backlight then
> > >> eeepc-wmi disables controlling of backlight and I'd get buggy AC=
PI
> > >> version.
> > >>
> > >> Does Yong happen to be on this email list?
> > >
> > > I don't think, but he reads platform-x86 which is now CCed
> > >
> > > Are you sure that the backlight behavior is the same with and wit=
hout
> > > acpi_osi=3DLinux ?
> > >
> >
> > I just retested to be sure and I think this confirms my suspicion t=
hat
> > using eeepc-wmi will not work either for 1005PE's backlights.
> >
>=20
> That is correct. Eeepc-wmi does not work on 1005PE at this moment. Th=
at is
> because
> the ACPI BIOS of 1005PE has not fully implemented all the necessary W=
MI
> interfaces yet.
> If you dump the 1005PE BIOS using acpidump, you will find that many c=
ontrol
> methods
> end up calling a dummy method. We are following up this issue with AS=
US and
> hopefully
> they will fix it in later BIOS updates. Current eeepc-wmi driver has =
been tested
> on Eee PC
> 1008HA.
>=20
> > I tried no acpi_osi (same as "WIndows 2009" I guess),
> > acpi_osi=3D"!Windows 2009", and acpi_osi=3D"Linux"... all without
> > specifying acpi_backlight=3Dvendor.  They all had the same behaviou=
r.
> > The later two options allow eeepc-laptop to load and it always give=
s
> > message about ACPI controlling backlight.
> >
> > You can see bad behaviour easiest by using Gnome's Preferences->Pow=
er
> > Management and controlling dimmer.  Sliding between 0% and 100% giv=
es
> > seemingly random behaviour.  Anything software based acts bad.
> >
> > Since ACPI did seem to be controlling backlight when I didn't speci=
fy
> > an acpi_osi, I suspect that means eeepc-wmi's logic to disable
> > backlight support would be invoked for 1005PE's.
> >
>=20
> Yes, eeepc-wmi will be loaded if acpi_osi is not specified. And if yo=
u don't
> specify
> acpi_backlight=3Dvendor, the generic ACPI video driver will control e=
verything.
>=20

Another piece of information is that eeepc-wmi only works on latest 2.6=
=2E34-rc
kernels. If you are running 2.6.33 kernel on Fedora 13 (I saw that in y=
our comment
of bug 15182), you need to backport b7b30de53aef6ce773d34837ba7d8422bd3=
baeec
to make the WMI device visible so that wmi can bind to it.

--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
