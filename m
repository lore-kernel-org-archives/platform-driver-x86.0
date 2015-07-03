From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 3 Jul 2015 15:50:47 +0200
Message-ID: <20150703135047.GA3530@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150701105544.GD17577@pali>
 <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
 <20150703112611.GA3030@eudyptula.hq.kempniu.pl>
 <20150703114356.GL1841@pali>
 <20150703132341.GA3129@eudyptula.hq.kempniu.pl>
 <20150703133227.GM1841@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:32838 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754894AbbGCNuw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jul 2015 09:50:52 -0400
Received: by laar3 with SMTP id r3so86204871laa.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2015 06:50:50 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150703133227.GM1841@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

> There are two different things:
>=20
> 1) Vendor said that laptop models with specific DMI should be handled=
 by
>    code XYZ...
>=20
> 2) Vendor said that all laptop models which report in register ABC va=
lue
>    47 should be handled by code XYZ.
>=20
> And we are thing to fix above facts with solution:
>=20
> 3) See how one model reacts and from this information create specific
>    hook for that one model.
>=20
> I'm really against solution 3) if we already know that every model us=
es
> different event handling.
>=20
> If for model Dell Vostro V131 vendor say 1) I'm fine with solution to
> hardcode DMI name and hook for it. 2) is of course better, but 3) for
> lot of machines is non go.

I couldn't agree more. Here's the thing, though: the vendor doesn't see=
m
to be saying anything. I guess I'll have to get over it.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
