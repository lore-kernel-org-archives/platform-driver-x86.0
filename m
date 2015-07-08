From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Wed, 8 Jul 2015 05:21:07 +0200
Message-ID: <20150708032107.GA2413@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150701105544.GD17577@pali>
 <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
 <559C1C17.3060009@dell.com>
 <20150707210141.GA20901@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:35040 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753991AbbGHDVM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jul 2015 23:21:12 -0400
Received: by labgy5 with SMTP id gy5so64208392lab.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2015 20:21:10 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150707210141.GA20901@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Mario Limonciello <mario_limonciello@dell.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

> I tried to send smbios request with:
>=20
> class=3D4
> selector=3D11
> arg1=3D64
>=20
> (0x40 hex =3D 64 dec)
>=20
> And it disabled keyboard backlight on my E6440 machine, then it set
> keyboard backlight inactivity timeout to 5 seconds and call returned:
>=20
> Res1=3D-2
>=20
> So this smbios query is not safe :-( as it set some keyboard backligh=
t
> default values and return "error not supported".

What a shame. My Vostro V131 returns 0 in both Res1 and Res2, as
anticipated, without the ill effects you described.

> So are you sure that 4, 11, 64 is call correct? Or is above side-effe=
ct
> of setting keyboard backlight values expected?

I second these questions. And if the side effects Pali wrote about are
not expected, perhaps there is a well-known subset of devices this call
can be whitelisted or blacklisted on?

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
