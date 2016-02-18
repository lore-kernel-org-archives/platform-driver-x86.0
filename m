From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v3 5/5] dell-wmi: support Dell Inspiron M5110
Date: Thu, 18 Feb 2016 09:25:25 +0100
Message-ID: <20160218082525.GA4385@eudyptula.hq.kempniu.pl>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1455634230-1487-6-git-send-email-kernel@kempniu.pl>
 <20160216152246.GL1476@pali>
 <20160216220312.GB2741@eudyptula.hq.kempniu.pl>
 <20160217114230.GS1476@pali>
 <20160217120158.GA3494@eudyptula.hq.kempniu.pl>
 <20160217120848.GT1476@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160217120848.GT1476@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> > Please note that except for the first 5 entries, the keymap is sort=
ed by
> > event code in ascending order.
>=20
> I have prepared some patches which sort all event codes plus adds
> missing comments... So after all dell patches are in Darren tree, I w=
ill
> rewrite/rebase my and can send them.
>=20
> > If I understand correctly, doing what you ask would break that orde=
ring:
> >=20
> >     /* Dell Instant Launch key */
> >     { KE_KEY, 0xe025, { KEY_PROG4 } },
> >     { KE_KEY, 0xe029, { KEY_PROG4 } },
> >=20
> >     /* Audio panel key */
> >     { KE_IGNORE, 0xe026, { KEY_RESERVED } },
> >=20
> > Is this acceptable?  Or perhaps you had something else on your mind=
?
>=20
> Thats better, now we know which event is audio and which launch key.

Ok, then I will do that in v4.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
