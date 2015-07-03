From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 3 Jul 2015 15:23:41 +0200
Message-ID: <20150703132341.GA3129@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150701105544.GD17577@pali>
 <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
 <20150703112611.GA3030@eudyptula.hq.kempniu.pl>
 <20150703114356.GL1841@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:33929 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754971AbbGCNXr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jul 2015 09:23:47 -0400
Received: by lagx9 with SMTP id x9so85150496lag.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2015 06:23:45 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150703114356.GL1841@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

> I would like to wait for documentation and not to invent/mess somethi=
ng
> again and more.

I get your point, but even getting our hands on the docs would most
likely do nothing for the fact that hotkey behavior differs between
models.

> Creating big list with DMI names and associate hooks for
> them based on "our" observation is good way to hell!

Obviously it's not an elegant solution. Obviously using WMI for
something as simple as handling a keypress is insane. Yet, this is the
way vendors (at least some of them) chose. I guess the decision to be
made is whether to try to support it anyway or accept the fact that
arbitrary hardware will not be fully functional, even though we know
exactly why.

Of course that's not my call to make and I respect your decision. Just
putting my two cents in as I despise the idea of letting the vendor
decide which features of the hardware I bought from them I can use and
which ones I can't.

> We even do not know:
>=20
> 1) how to activate code for receiving events

Oh, but we do! At least for some models ;) We just don't know _why_ it
should be done the way it is done. It sure would be nice to know that,
but should it stop us from implementing a working solution?

> 2) what is format of which event

Well, dell-wmi.ko seems to be decoding the events pretty well. And
again, the format differs between models (and is probably subject to
change in yet to be released hardware) and we can't really do a thing
about it. We can either support it or not.

> 3) which keypress should be reported by i8042 bus and which via ACPI/=
WMI

That depends on the model ;)

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
