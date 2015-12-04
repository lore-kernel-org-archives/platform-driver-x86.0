From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell
 Vostro V131
Date: Fri, 4 Dec 2015 13:55:21 +0100
Message-ID: <20151204125521.GA13406@eudyptula.hq.kempniu.pl>
References: <20151130211542.GE30553@malice.jf.intel.com>
 <1654e7bcde98f1cf89f698a1e359110c06c6fcd4.1448999372.git.kernel@kempniu.pl>
 <20151204011606.GI1800@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:36098 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751889AbbLDMzZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Dec 2015 07:55:25 -0500
Received: by lfs39 with SMTP id 39so107952537lfs.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Dec 2015 04:55:24 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151204011606.GI1800@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

> > On some laptop models (e.g. Dell Vostro V131), pressing the Dell In=
stant
> > Launch hotkey does not raise an i8042 interrupt - only WMI event 0x=
e025
> > is generated.  As there seems to be no ACPI method or SMI call to
> > determine without possible side effects whether a given machine is
> > capable of simulating a keypress when this hotkey is pressed, DMI
> > matching is used to whitelist the models for which an input event s=
hould
> > be generated when WMI event 0xe025 is received.
> >=20
> > Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> > ---
> > Changes from v1:
> >=20
> >   - Use DMI matching instead of a module parameter
> >   - Change flag name to improve readability
> >=20
> > Darren, I am aware this patch conflicts with Andy's WMI rework seri=
es
> > posted yesterday, so please just let me know if you want me to reba=
se.
>=20
> Thanks for the heads' up. Andy's series is longer and likely going to=
 need more
> review from more people, so I don't necessarily want to hold this one=
 up on it -
> unless it makes sense to include it in that series so they can evolve=
 together.
> I'll leave that to you and Andy to decide.

As merging my patch with Andy's work is just a matter of moving code
around, not actually changing it, personally I don't feel this patch
should be somehow linked to the WMI rework.  Andy, please let me know i=
f
you disagree, I don't really have any strong feelings about this.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
