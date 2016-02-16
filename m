From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v3 5/5] dell-wmi: support Dell Inspiron M5110
Date: Tue, 16 Feb 2016 23:03:12 +0100
Message-ID: <20160216220312.GB2741@eudyptula.hq.kempniu.pl>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1455634230-1487-6-git-send-email-kernel@kempniu.pl>
 <20160216152246.GL1476@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160216152246.GL1476@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> >  	/* Shortcut and audio panel keys */
> >  	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > +	{ KE_KEY, 0xe029, { KEY_PROG4 } },
>=20
> Hi! Above comment (Shortcut and audio panel keys) is not relevant for
> this 0xe029, right?

I believe it is relevant.  The commit which added that comment
(f1566f0d) was made by Seth Forshee to support Dell XPS L502X.  The ter=
m
"shortcut key" is used in the bug report linked from that commit [1],
but the manual for that model [2] describes the hotkey in question as
"Instant launch control" (page 43), so I believe both Seth's commit and
my patch refer to the same thing.

[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/815914/comment=
s/6
[2] http://downloads.dell.com/Manuals/all-products/esuprt_laptop/esuprt=
_xps_laptop/xps-l502x_setup%20guide_en-us.pdf

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
