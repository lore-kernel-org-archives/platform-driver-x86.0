From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
Subject: Re: [Bug 105051] Radeon sets max_brightness to -1, breaking GNOME
 backlight control on Macbook Pro mid-2015 11,5
Date: Sun, 25 Oct 2015 17:58:45 +0100
Message-ID: <20151025175845.0bea0f28@uranus>
References: <bug-105051-5380@https.bugzilla.kernel.org/>
	<bug-105051-5380-RlJ9dZd1ch@https.bugzilla.kernel.org/>
	<20151022093652.GA25192@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from hygieia.santi-shop.eu ([78.46.175.2]:56257 "EHLO
	hygieia.santi-shop.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751155AbbJYRFH convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 25 Oct 2015 13:05:07 -0400
In-Reply-To: <20151022093652.GA25192@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Petri Hodju <petrihodju@yahoo.com>, Bjorn Helgaas <bhelgaas@google.com>

Hi Darren,

Looks like the Apple issue with backlight working on hidden Intel IGP
(doing IO on VGA addresses) while graphics are running on visible
discrete GPU (Radeon this time instead of usual nvidia).


I should have offered a solution quite some time ago but it seem time
was running very fast.
The best solution I can think of is denying any vga_arb on Apple EFI
systems (and not trying to choose the right one which is not possible
when one of both GPUs is hidden).


The lines of interest in dmesg are:
[    0.210225] vgaarb: device added: PCI:0000:01:00.0,decodes=3Dio+mem,=
owns=3Dnone,locks=3Dnone
[    0.210227] vgaarb: loaded
[    0.210228] vgaarb: setting as boot device: PCI:0000:01:00.0
[    0.210229] vgaarb: bridge control possible 0000:01:00.0
[    0.385583] fb0: EFI VGA frame buffer device
[    7.738507] apple_gmux: Found gmux version 4.0.20 [indexed]
[    7.738514] apple_gmux: locked IO for PCI:0000:01:00.0
[    7.792805] fb: switching to radeondrmfb from EFI VGA

Not loading apple_gmux might or might not affect ability to control
backlight depending on what backlight devices go registered
(radeon backlight device probably does not affect screen, at best an
ACPI backlight device might work)

Interesting part to check is how things work when both GPU are visible
to OS.

Thanks,
Bruno

On Thu, 22 Oct 2015 11:36:52 Darren Hart wrote:
> Bruno, can you please have a look at the following regression attribu=
ted to:
>=20
> 4eebd5a apple-gmux: lock iGP IO to protect from vgaarb changes
>  2015-03-18 (7 months ago), Bruno Pr=C3=A9mont <bonbons@linux-vserver=
=2Eorg>
>=20
>=20
> On Thu, Oct 15, 2015 at 04:47:13AM +0000, bugzilla-daemon@bugzilla.ke=
rnel.org wrote:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D105051
> >=20
> > Felipe Ortiz <fortizc@gmail.com> changed:
> >=20
> >            What    |Removed                     |Added
> > -------------------------------------------------------------------=
---------
> >                  CC|                            |fortizc@gmail.com
> >=20
> > --- Comment #14 from Felipe Ortiz <fortizc@gmail.com> ---
> > I can confirm the problem with 4eebd5a4e72697aac25a8a57d3f888a9d5f8=
0370. I have
> > a MPB 11,5 with AMD/Intel graphics. I recompile the module (a previ=
ous version
> > of 4eebd5a4e72697aac25a8a57d3f888a9d5f80370) and brightness adjusts=
 is working
> > again.
> >=20
> > I see two problems:=20
> >=20
> > 1) If someone uses gpu-switch (https://github.com/0xbb/gpu-switch) =
with this
> > bug screen seem not work, after severals reboots (with different ke=
rnels) I can
> > access a terminal and execute gpu-switch -d and then screen seems w=
ork again.
> >=20
> > 2) If you use a Intel card (swiched with gpu-switch) the OSD (activ=
ated with
> > functions keys) is so slow and chromium have the same problem (temp=
orary fix is
> > deactivate chromium hw acceleration) is this a intel driver bug?
> >=20
> > --=20
> > You are receiving this mail because:
> > You are on the CC list for the bug.
> >=20
>=20
> Thanks,
>=20
