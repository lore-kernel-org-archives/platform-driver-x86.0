From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 3 Jul 2015 16:14:54 +0200
Message-ID: <20150703141454.GO1841@pali>
References: <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
 <20150703112611.GA3030@eudyptula.hq.kempniu.pl>
 <20150703114356.GL1841@pali>
 <20150703132341.GA3129@eudyptula.hq.kempniu.pl>
 <20150703133227.GM1841@pali>
 <20150703135047.GA3530@eudyptula.hq.kempniu.pl>
 <20150703140901.GN1841@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:38355 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754653AbbGCOO7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jul 2015 10:14:59 -0400
Received: by wibdq8 with SMTP id dq8so101565322wib.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2015 07:14:57 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150703140901.GN1841@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Friday 03 July 2015 16:09:01 Pali Roh=C3=A1r wrote:
> Yes, "vendor does not say anything" is also what could happen...
>=20
> Then in your case, I would need to know format of *all* events which =
can
> your laptop via WMI receive. If we collect as more as possible events
> from different laptops we can try to abstract format/interface.
>=20

CCing Gabriele, can you please provide buffers of all possible WMI
events which can be received on your dell machine via dell-wmi.ko?
(just enable pr_debug() in dell-wmi.c)

Alex, if you still have Dell testing machines and you have time, can yo=
u
do that too?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
