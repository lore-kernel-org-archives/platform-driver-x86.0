From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v3 5/5] dell-wmi: support Dell Inspiron M5110
Date: Wed, 17 Feb 2016 13:01:58 +0100
Message-ID: <20160217120158.GA3494@eudyptula.hq.kempniu.pl>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1455634230-1487-6-git-send-email-kernel@kempniu.pl>
 <20160216152246.GL1476@pali>
 <20160216220312.GB2741@eudyptula.hq.kempniu.pl>
 <20160217114230.GS1476@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:34277 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753256AbcBQMCD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 07:02:03 -0500
Received: by mail-lf0-f44.google.com with SMTP id j78so9209361lfb.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Feb 2016 04:02:01 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160217114230.GS1476@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> > > >  	/* Shortcut and audio panel keys */
> > > >  	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> > > >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > > > +	{ KE_KEY, 0xe029, { KEY_PROG4 } },
> > >=20
> > > Hi! Above comment (Shortcut and audio panel keys) is not relevant=
 for
> > > this 0xe029, right?
> >=20
> > I believe it is relevant.  The commit which added that comment
> > (f1566f0d) was made by Seth Forshee to support Dell XPS L502X.  The=
 term
> > "shortcut key" is used in the bug report linked from that commit [1=
],
> > but the manual for that model [2] describes the hotkey in question =
as
> > "Instant launch control" (page 43), so I believe both Seth's commit=
 and
> > my patch refer to the same thing.
> >=20
> > [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/815914/com=
ments/6
> > [2] http://downloads.dell.com/Manuals/all-products/esuprt_laptop/es=
uprt_xps_laptop/xps-l502x_setup%20guide_en-us.pdf
>=20
> Then please split above group of keys and add comment which key is
> shortcut and which audio panel. Because now there will be three keys =
and
> comment just for two -- in future will not know which code 0x... is
> mapped to which key.

Please note that except for the first 5 entries, the keymap is sorted b=
y
event code in ascending order.  If I understand correctly, doing what
you ask would break that ordering:

    /* Dell Instant Launch key */
    { KE_KEY, 0xe025, { KEY_PROG4 } },
    { KE_KEY, 0xe029, { KEY_PROG4 } },

    /* Audio panel key */
    { KE_IGNORE, 0xe026, { KEY_RESERVED } },

Is this acceptable?  Or perhaps you had something else on your mind?

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
