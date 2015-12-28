From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 0/2] Fixes for dell-wmi
Date: Mon, 28 Dec 2015 14:33:17 +0100
Message-ID: <20151228133317.GA7540@eudyptula.hq.kempniu.pl>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34884 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751357AbbL1NdX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Dec 2015 08:33:23 -0500
Received: by mail-lf0-f49.google.com with SMTP id c192so21955595lfe.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Dec 2015 05:33:22 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> This patch series adds check if Dell WMI descriptor structure is vali=
d and
> fixes processing WMI events on devices with WMI interface version 0.
>=20
> After testing, second patch is good candidate for backporting into st=
able
> kernels, but problem is that it cannot be used without first patch. S=
o I
> let decision to other people.
>=20
> Gabriele and Micha=C5=82, this patch series should fix processing eve=
nts on
> yours Dell laptops (you have in DSDT defined version 0). Can you test=
 it?

My Vostro V131 (and any other as well, judging from the DSDT dumps I
found scattered around the web) has the WMI Interface Version field set
to 1, as the first one of your patches correctly asserts.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
