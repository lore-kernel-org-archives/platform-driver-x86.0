From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Wed, 1 Jul 2015 12:55:44 +0200
Message-ID: <20150701105544.GD17577@pali>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150624132303.GK21149@pali>
 <20150625090206.GA2554@eudyptula.hq.kempniu.pl>
 <201506272050.24352@pali>
 <20150630073835.GA3612@eudyptula.hq.kempniu.pl>
 <20150630080004.GB27720@pali>
 <20150701083201.GA3300@eudyptula.hq.kempniu.pl>
 <20150701084002.GC17577@pali>
 <20150701101146.GA3421@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:36155 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753969AbbGAKzs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jul 2015 06:55:48 -0400
Received: by wguu7 with SMTP id u7so33288953wgu.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jul 2015 03:55:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150701101146.GA3421@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Wednesday 01 July 2015 12:11:46 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > Ok, I do not know all these windows internals, but it would be cool=
 to
> > check if WMI event is really received with correct mask in that NEV=
T
> > method. No idea if this is possible to debug/test on windows...
>=20
> That was my first idea after analyzing the NEVT method, but after
> skimming through the AMLI Debugger and KD docs, I got the impression
> that setting up an ACPI debugging session in Windows is so much of a
> hassle [1] for someone with no experience in Windows kernel-mode
> debugging that I'd rather hack the hell out of the DSDT in Linux and =
get
> on with my life.
>=20
> > > Well, here's the catch: there is no PNP0C09 device in the DSDT an=
d thus
> > > the EC driver isn't even loaded in Linux and I can't dump EC regi=
sters.
> > > Yet Windows tools seem to be able to do it, using ports 0x66/0x62=
=2E I'm
> > > confused.
> > >=20
> >=20
> > Hm... could be this reason? And windows read pressed hotkeys from E=
C
> > registers?
> >=20
> > Can you ask acpi guys what could *not* work if acpi ec driver is no=
t
> > loaded?
>=20
> Maybe I am missing something here, but even if the above turns out to=
 be
> the case, how would such knowledge help in solving the issue? Suppose=
 we
> learn that some magic command needs to be sent to the EC to enable ev=
ent
> reporting via WMI, but we cannot do that as the kernel doesn't even s=
ee
> the EC.
>=20

It would mean that we need to write new driver for it (or extend some).

> If I'm reading the DSDT dump correctly, it seems the Vostro V131 make=
s
> heavy use of SMIs. \SB.SMII is an alias for the 0xB2 I/O port, which =
is
> written to by the WMI and SXX6 methods. A call to the latter is made
> inside ECG1 (from SX11, specifically). IOW, an SMI is generated to ge=
t
> the event code. My guess would be that some magic SMI has to be
> generated if events are to be reported via WMI or something among the
> lines. Which gets us back to hearing from Dell as trying random value=
s
> doesn't sound like a sane thing to do.
>=20

Yes, I'm still thinking about some missing init call. And for that we
need documentation: what and how.

> [1] Another Windows machine is needed, debugging over a network cable=
 is
> only supported since Windows 8, the Vostro V131 doesn't have any
> Firewire or serial ports, so I'd need to buy a USB debug cable, then =
get
> get my hands on a checked version of Acpi.sys and pray it all works. =
Now
> compare all that to recompiling the kernel with
> CONFIG_ACPI_CUSTOM_METHOD and CONFIG_ACPI_DEBUG enabled.
>=20

I know, debugging windows kernel is hard and only sometimes is possible=
=2E

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
