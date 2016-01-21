From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell
 Vostro V131
Date: Thu, 21 Jan 2016 14:44:25 +0100
Message-ID: <20160121134425.GG7192@pali>
References: <20151130211542.GE30553@malice.jf.intel.com>
 <20151204132745.GA13441@eudyptula.hq.kempniu.pl>
 <20160111191226.GF10643@malice.jf.intel.com>
 <201601112107.43510@pali>
 <20160121090401.GR7192@pali>
 <20160121105203.GA4312@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35976 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965064AbcAUNo2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Jan 2016 08:44:28 -0500
Content-Disposition: inline
In-Reply-To: <20160121105203.GA4312@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Darren Hart <dvhart@infradead.org>

On Thursday 21 January 2016 11:52:03 Micha=C5=82 K=C4=99pie=C5=84 wrote=
:
> > Micha=C5=82, can you prepare new (v3) version of this patch? Now re=
quired
> > acpi video changes are included and so dell-wmi changes should go t=
o...
> > To finally fix this keypress bug on Dell Vostro V131 machine.
>=20
> I keep this on my to-do list, but the updated patch will depend on th=
e
> final version of the SMBIOS API rework, so I guess there is little po=
int
> in posting it now as that API is subject to change.  But rest assured
> that as soon as the final version of the API rework series (which I h=
ave
> yet to prepare, of course) gets applied by Darren, I will post a v3 o=
f
> this patch - after all, it is the very reason I am working on the API
> rework.

There is still need to patch dell-wmi.c? And this change does not depen=
d
on another SMBIOS change (in dell-laptop), right?

I still have in my mind some changes for dell-wmi.c code but I'm waitin=
g
until all other changes for dell-wmi.c will be merged to prevent
conflicts and needed rebase.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
