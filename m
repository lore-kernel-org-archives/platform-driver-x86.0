From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v3 3/5] dell-wmi: enable receiving WMI events on Dell
 Vostro V131
Date: Mon, 22 Feb 2016 10:13:50 +0100
Message-ID: <20160222091350.GA8471@eudyptula.hq.kempniu.pl>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1455634230-1487-4-git-send-email-kernel@kempniu.pl>
 <20160220012457.GC23707@dvhart-mobl5.amr.corp.intel.com>
 <20160222085650.GA8322@eudyptula.hq.kempniu.pl>
 <20160222090314.GB4606@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160222090314.GB4606@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> > > Pali's point about documenting the hardcoded values and eliminati=
ng the code
> > > duplication with a function (inline) is a good one.
> >=20
> > I plan to only put a comment next to 0x51534554 as 0x10000 is appar=
ently
> > just something pulled out of a hat (as the link provided in the com=
mit
> > message proves) and input[3] should be self-explanatory due to the =
name
> > of the variable whose value is put into it.
>=20
> Maybe you can add documentation which we got from Dell on some ML abo=
ut
> this SMI call. Similarly what I added in dell-laptop.c...

Sure, I can do that.

> > By the way, is there any kernel-wide or subsystem-wide policy for
> > marking a function inline?  I mean, this is hardly time-critical co=
de,
> > so is your suggestion to make it inline just a preference or am I
> > unaware of some rule?
>=20
> IIRC recent versions of gcc ignores "inline" keyword and inline
> functions as needed when doing optimizations.

This was my hunch as well, but I couldn't find any proof immediately,
hence the question.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
