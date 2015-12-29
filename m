From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 0/2] Fixes for dell-wmi
Date: Tue, 29 Dec 2015 13:18:49 +0100
Message-ID: <20151229121849.GA2467@eudyptula.hq.kempniu.pl>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
 <20151228133317.GA7540@eudyptula.hq.kempniu.pl>
 <201512281446.36868@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:36364 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752156AbbL2MSz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Dec 2015 07:18:55 -0500
Received: by mail-lf0-f50.google.com with SMTP id z124so206512072lfa.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Dec 2015 04:18:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <201512281446.36868@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> > > This patch series adds check if Dell WMI descriptor structure is
> > > valid and fixes processing WMI events on devices with WMI
> > > interface version 0.
> > >=20
> > > After testing, second patch is good candidate for backporting int=
o
> > > stable kernels, but problem is that it cannot be used without
> > > first patch. So I let decision to other people.
> > >=20
> > > Gabriele and Micha=C5=82, this patch series should fix processing=
 events
> > > on yours Dell laptops (you have in DSDT defined version 0). Can
> > > you test it?
> >=20
> > My Vostro V131 (and any other as well, judging from the DSDT dumps =
I
> > found scattered around the web) has the WMI Interface Version field
> > set to 1, as the first one of your patches correctly asserts.
>=20
> Ok, great. Can you post DEBUG output when receiving events before and=
=20
> after patch (to check that processing is correct)?=20

After applying your patches on my Vostro V131, the WMI events reported
are exactly the same as they were when I originally posted them [1].

[1] http://www.spinics.net/lists/platform-driver-x86/msg07191.html

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
