From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 5/5] dell-wmi: support Dell Inspiron M5110
Date: Wed, 17 Feb 2016 13:08:48 +0100
Message-ID: <20160217120848.GT1476@pali>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1455634230-1487-6-git-send-email-kernel@kempniu.pl>
 <20160216152246.GL1476@pali>
 <20160216220312.GB2741@eudyptula.hq.kempniu.pl>
 <20160217114230.GS1476@pali>
 <20160217120158.GA3494@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160217120158.GA3494@eudyptula.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday 17 February 2016 13:01:58 Micha=C5=82 K=C4=99pie=C5=84 wro=
te:
> > > > >  	/* Shortcut and audio panel keys */
> > > > >  	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> > > > >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > > > > +	{ KE_KEY, 0xe029, { KEY_PROG4 } },
> > > >=20
> > > > Hi! Above comment (Shortcut and audio panel keys) is not releva=
nt for
> > > > this 0xe029, right?
> > >=20
> > > I believe it is relevant.  The commit which added that comment
> > > (f1566f0d) was made by Seth Forshee to support Dell XPS L502X.  T=
he term
> > > "shortcut key" is used in the bug report linked from that commit =
[1],
> > > but the manual for that model [2] describes the hotkey in questio=
n as
> > > "Instant launch control" (page 43), so I believe both Seth's comm=
it and
> > > my patch refer to the same thing.
> > >=20
> > > [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/815914/c=
omments/6
> > > [2] http://downloads.dell.com/Manuals/all-products/esuprt_laptop/=
esuprt_xps_laptop/xps-l502x_setup%20guide_en-us.pdf
> >=20
> > Then please split above group of keys and add comment which key is
> > shortcut and which audio panel. Because now there will be three key=
s and
> > comment just for two -- in future will not know which code 0x... is
> > mapped to which key.
>=20
> Please note that except for the first 5 entries, the keymap is sorted=
 by
> event code in ascending order.

I have prepared some patches which sort all event codes plus adds
missing comments... So after all dell patches are in Darren tree, I wil=
l
rewrite/rebase my and can send them.

> If I understand correctly, doing what you ask would break that orderi=
ng:
>=20
>     /* Dell Instant Launch key */
>     { KE_KEY, 0xe025, { KEY_PROG4 } },
>     { KE_KEY, 0xe029, { KEY_PROG4 } },
>=20
>     /* Audio panel key */
>     { KE_IGNORE, 0xe026, { KEY_RESERVED } },
>=20
> Is this acceptable?  Or perhaps you had something else on your mind?

Thats better, now we know which event is audio and which launch key.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
