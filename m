From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Wed, 1 Jul 2015 12:11:46 +0200
Message-ID: <20150701101146.GA3421@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150624132303.GK21149@pali>
 <20150625090206.GA2554@eudyptula.hq.kempniu.pl>
 <201506272050.24352@pali>
 <20150630073835.GA3612@eudyptula.hq.kempniu.pl>
 <20150630080004.GB27720@pali>
 <20150701083201.GA3300@eudyptula.hq.kempniu.pl>
 <20150701084002.GC17577@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:36822 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752960AbbGAKLt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jul 2015 06:11:49 -0400
Received: by lbbpo10 with SMTP id po10so9749248lbb.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jul 2015 03:11:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150701084002.GC17577@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

> Ok, I do not know all these windows internals, but it would be cool t=
o
> check if WMI event is really received with correct mask in that NEVT
> method. No idea if this is possible to debug/test on windows...

That was my first idea after analyzing the NEVT method, but after
skimming through the AMLI Debugger and KD docs, I got the impression
that setting up an ACPI debugging session in Windows is so much of a
hassle [1] for someone with no experience in Windows kernel-mode
debugging that I'd rather hack the hell out of the DSDT in Linux and ge=
t
on with my life.

> > Well, here's the catch: there is no PNP0C09 device in the DSDT and =
thus
> > the EC driver isn't even loaded in Linux and I can't dump EC regist=
ers.
> > Yet Windows tools seem to be able to do it, using ports 0x66/0x62. =
I'm
> > confused.
> >=20
>=20
> Hm... could be this reason? And windows read pressed hotkeys from EC
> registers?
>=20
> Can you ask acpi guys what could *not* work if acpi ec driver is not
> loaded?

Maybe I am missing something here, but even if the above turns out to b=
e
the case, how would such knowledge help in solving the issue? Suppose w=
e
learn that some magic command needs to be sent to the EC to enable even=
t
reporting via WMI, but we cannot do that as the kernel doesn't even see
the EC.

If I'm reading the DSDT dump correctly, it seems the Vostro V131 makes
heavy use of SMIs. \SB.SMII is an alias for the 0xB2 I/O port, which is
written to by the WMI and SXX6 methods. A call to the latter is made
inside ECG1 (from SX11, specifically). IOW, an SMI is generated to get
the event code. My guess would be that some magic SMI has to be
generated if events are to be reported via WMI or something among the
lines. Which gets us back to hearing from Dell as trying random values
doesn't sound like a sane thing to do.

[1] Another Windows machine is needed, debugging over a network cable i=
s
only supported since Windows 8, the Vostro V131 doesn't have any
=46irewire or serial ports, so I'd need to buy a USB debug cable, then =
get
get my hands on a checked version of Acpi.sys and pray it all works. No=
w
compare all that to recompiling the kernel with
CONFIG_ACPI_CUSTOM_METHOD and CONFIG_ACPI_DEBUG enabled.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
