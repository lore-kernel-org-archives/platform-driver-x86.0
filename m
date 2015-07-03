From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 3 Jul 2015 15:32:27 +0200
Message-ID: <20150703133227.GM1841@pali>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150701105544.GD17577@pali>
 <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
 <20150703112611.GA3030@eudyptula.hq.kempniu.pl>
 <20150703114356.GL1841@pali>
 <20150703132341.GA3129@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:36549 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754969AbbGCNcb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jul 2015 09:32:31 -0400
Received: by widjy10 with SMTP id jy10so110237449wid.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2015 06:32:30 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150703132341.GA3129@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Friday 03 July 2015 15:23:41 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > I would like to wait for documentation and not to invent/mess somet=
hing
> > again and more.
>=20
> I get your point, but even getting our hands on the docs would most
> likely do nothing for the fact that hotkey behavior differs between
> models.
>=20
> > Creating big list with DMI names and associate hooks for
> > them based on "our" observation is good way to hell!
>=20
> Obviously it's not an elegant solution. Obviously using WMI for
> something as simple as handling a keypress is insane. Yet, this is th=
e
> way vendors (at least some of them) chose. I guess the decision to be
> made is whether to try to support it anyway or accept the fact that
> arbitrary hardware will not be fully functional, even though we know
> exactly why.
>=20
> Of course that's not my call to make and I respect your decision. Jus=
t
> putting my two cents in as I despise the idea of letting the vendor
> decide which features of the hardware I bought from them I can use an=
d
> which ones I can't.
>=20
> > We even do not know:
> >=20
> > 1) how to activate code for receiving events
>=20
> Oh, but we do! At least for some models ;) We just don't know _why_ i=
t
> should be done the way it is done. It sure would be nice to know that=
,
> but should it stop us from implementing a working solution?
>=20
> > 2) what is format of which event
>=20
> Well, dell-wmi.ko seems to be decoding the events pretty well. And
> again, the format differs between models (and is probably subject to
> change in yet to be released hardware) and we can't really do a thing
> about it. We can either support it or not.
>=20
> > 3) which keypress should be reported by i8042 bus and which via ACP=
I/WMI
>=20
> That depends on the model ;)
>=20

There are two different things:

1) Vendor said that laptop models with specific DMI should be handled b=
y
   code XYZ...

2) Vendor said that all laptop models which report in register ABC valu=
e
   47 should be handled by code XYZ.

And we are thing to fix above facts with solution:

3) See how one model reacts and from this information create specific
   hook for that one model.

I'm really against solution 3) if we already know that every model uses
different event handling.

If for model Dell Vostro V131 vendor say 1) I'm fine with solution to
hardcode DMI name and hook for it. 2) is of course better, but 3) for
lot of machines is non go.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
