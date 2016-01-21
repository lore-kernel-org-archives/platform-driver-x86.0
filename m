From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell
 Vostro V131
Date: Thu, 21 Jan 2016 16:42:48 +0100
Message-ID: <20160121154248.GI7192@pali>
References: <20151130211542.GE30553@malice.jf.intel.com>
 <20151204132745.GA13441@eudyptula.hq.kempniu.pl>
 <20160111191226.GF10643@malice.jf.intel.com>
 <201601112107.43510@pali>
 <20160121090401.GR7192@pali>
 <20160121105203.GA4312@eudyptula.hq.kempniu.pl>
 <20160121134425.GG7192@pali>
 <20160121145612.GA4684@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160121145612.GA4684@eudyptula.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thursday 21 January 2016 15:56:12 Micha=C5=82 K=C4=99pie=C5=84 wrote=
:
> > > > Micha=C5=82, can you prepare new (v3) version of this patch? No=
w required
> > > > acpi video changes are included and so dell-wmi changes should =
go to...
> > > > To finally fix this keypress bug on Dell Vostro V131 machine.
> > >=20
> > > I keep this on my to-do list, but the updated patch will depend o=
n the
> > > final version of the SMBIOS API rework, so I guess there is littl=
e point
> > > in posting it now as that API is subject to change.  But rest ass=
ured
> > > that as soon as the final version of the API rework series (which=
 I have
> > > yet to prepare, of course) gets applied by Darren, I will post a =
v3 of
> > > this patch - after all, it is the very reason I am working on the=
 API
> > > rework.
> >=20
> > There is still need to patch dell-wmi.c? And this change does not d=
epend
> > on another SMBIOS change (in dell-laptop), right?
>=20
> Well, back in December, you wrote [1]:
>=20
> > This patch is not enough for enabling 0xe025 key on that Vostro mac=
hine.
> > Some extra SMBIOS call is needed, without them ACPI will not send W=
MI
> > keypress event.
> >=20
> > (...)
> >=20
> > Maybe now it could make sense to unify Dell SMBIOS API in kernel an=
d
> > move common functions to one place and let drivers to use just comm=
on
> > functions. According to older Dell ACPI WMI documentation in DMI is=
 bit
> > which specify if BIOS support SMBIOS via WMI or not.
> >=20
> > At least I think this one patch should not be included into kernel =
until
> > there will be full support for 0xe025 key (adding that SMBIOS call)=
=2E
>=20
> From the above I understood that first you want to unify the Dell SMB=
IOS
> API used throughout the kernel (that's currently in progress), so tha=
t
> it can then be used in dell-wmi as well to perform the SMBIOS call
> needed on the Vostro V131.
>=20
> If you want me to just rework the patch so that it doesn't introduce =
a
> quirk structure, I recalled another reason to use it after all: there
> are other Dell laptops which require the special SMI for enabling WMI
> events, but report the Dell Instant Launch Hotkey using a different W=
MI
> event code [2].  So I'd say that two separate issues should be fixed
> using DMI matching:
>=20
>   * whether the special SMBIOS call is required,
>   * whether the 0x0e25 event should be translated into a keypress.
>=20
> A quirk structure looks like an elegant way to deal with this.
>=20
> Could you please advise how you would like me to proceed with this?
>=20
> [1] http://www.spinics.net/lists/platform-driver-x86/msg07845.html
> [2] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1205791/comm=
ents/12
>=20

Hm...

=46or full support we need:

1) invoke special SMBIOS call for some machine

2) patch dell-wmi.c to do not drop some events for some machines

Part 2) needs to touch only dell-wmi.c code, this is obvious. But I
thought that part 1) will be done in dell-laptop.c code where are all
others SMBIOS calls. Reason is just because dell-wmi.c is doing WMI
stuff. Do you want to include this is part 1) also to dell-wmi.c file?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
