From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 5/5] dell-wmi: support Dell Inspiron M5110
Date: Wed, 17 Feb 2016 12:42:30 +0100
Message-ID: <20160217114230.GS1476@pali>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1455634230-1487-6-git-send-email-kernel@kempniu.pl>
 <20160216152246.GL1476@pali>
 <20160216220312.GB2741@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:35477 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161300AbcBQLmd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 06:42:33 -0500
Content-Disposition: inline
In-Reply-To: <20160216220312.GB2741@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 16 February 2016 23:03:12 Micha=C5=82 K=C4=99pie=C5=84 wrote=
:
> > >  	/* Shortcut and audio panel keys */
> > >  	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> > >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > > +	{ KE_KEY, 0xe029, { KEY_PROG4 } },
> >=20
> > Hi! Above comment (Shortcut and audio panel keys) is not relevant f=
or
> > this 0xe029, right?
>=20
> I believe it is relevant.  The commit which added that comment
> (f1566f0d) was made by Seth Forshee to support Dell XPS L502X.  The t=
erm
> "shortcut key" is used in the bug report linked from that commit [1],
> but the manual for that model [2] describes the hotkey in question as
> "Instant launch control" (page 43), so I believe both Seth's commit a=
nd
> my patch refer to the same thing.
>=20
> [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/815914/comme=
nts/6
> [2] http://downloads.dell.com/Manuals/all-products/esuprt_laptop/esup=
rt_xps_laptop/xps-l502x_setup%20guide_en-us.pdf

Then please split above group of keys and add comment which key is
shortcut and which audio panel. Because now there will be three keys an=
d
comment just for two -- in future will not know which code 0x... is
mapped to which key.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
