From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 3 Jul 2015 16:09:01 +0200
Message-ID: <20150703140901.GN1841@pali>
References: <20150701105544.GD17577@pali>
 <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
 <20150703112611.GA3030@eudyptula.hq.kempniu.pl>
 <20150703114356.GL1841@pali>
 <20150703132341.GA3129@eudyptula.hq.kempniu.pl>
 <20150703133227.GM1841@pali>
 <20150703135047.GA3530@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:34378 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755262AbbGCOJE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jul 2015 10:09:04 -0400
Received: by wgqq4 with SMTP id q4so89534486wgq.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2015 07:09:03 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150703135047.GA3530@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Friday 03 July 2015 15:50:47 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > There are two different things:
> >=20
> > 1) Vendor said that laptop models with specific DMI should be handl=
ed by
> >    code XYZ...
> >=20
> > 2) Vendor said that all laptop models which report in register ABC =
value
> >    47 should be handled by code XYZ.
> >=20
> > And we are thing to fix above facts with solution:
> >=20
> > 3) See how one model reacts and from this information create specif=
ic
> >    hook for that one model.
> >=20
> > I'm really against solution 3) if we already know that every model =
uses
> > different event handling.
> >=20
> > If for model Dell Vostro V131 vendor say 1) I'm fine with solution =
to
> > hardcode DMI name and hook for it. 2) is of course better, but 3) f=
or
> > lot of machines is non go.
>=20
> I couldn't agree more. Here's the thing, though: the vendor doesn't s=
eem
> to be saying anything. I guess I'll have to get over it.
>=20

Yes, "vendor does not say anything" is also what could happen...

Then in your case, I would need to know format of *all* events which ca=
n
your laptop via WMI receive. If we collect as more as possible events
from different laptops we can try to abstract format/interface.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
