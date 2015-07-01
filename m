From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Wed, 1 Jul 2015 10:40:02 +0200
Message-ID: <20150701084002.GC17577@pali>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150624132303.GK21149@pali>
 <20150625090206.GA2554@eudyptula.hq.kempniu.pl>
 <201506272050.24352@pali>
 <20150630073835.GA3612@eudyptula.hq.kempniu.pl>
 <20150630080004.GB27720@pali>
 <20150701083201.GA3300@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:36025 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750768AbbGAIkG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jul 2015 04:40:06 -0400
Received: by widjy10 with SMTP id jy10so51019009wid.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jul 2015 01:40:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150701083201.GA3300@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Wednesday 01 July 2015 10:32:01 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > Are you able to detect if Windows receive keypress via WMI or keybo=
ard
> > controller or from other driver?
>=20
> I believe it's done via WMI. In the first message in this thread, I
> wrote:
>=20
> "While in Windows, I copied a sample VBScript from MSDN for receiving
> event notifications via WMI, set proper namespace ("root\wmi") and
> notification query ("SELECT * FROM BIOSEvent") and it worked."
>=20

Ok, I do not know all these windows internals, but it would be cool to
check if WMI event is really received with correct mask in that NEVT
method. No idea if this is possible to debug/test on windows...

> > Also what you can try is to dump EC registers and DSDT table from
> > Windows and compare it with Linux.
>=20
> Well, here's the catch: there is no PNP0C09 device in the DSDT and th=
us
> the EC driver isn't even loaded in Linux and I can't dump EC register=
s.
> Yet Windows tools seem to be able to do it, using ports 0x66/0x62. I'=
m
> confused.
>=20

Hm... could be this reason? And windows read pressed hotkeys from EC
registers?

Can you ask acpi guys what could *not* work if acpi ec driver is not
loaded?

> DSDT tables dumped from Windows and Linux are identical.
>=20

Ok, then we should be able to do it also from Linux.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
