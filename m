From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] fujitsu-laptop: Add support for eco LED
Date: Wed, 22 Jun 2016 14:42:43 +0200
Message-ID: <20160622124243.GC2466@eudyptula.hq.kempniu.pl>
References: <20160621080918.GA3333@Matej-PC.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33084 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751671AbcFVM4k (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 08:56:40 -0400
Received: by mail-wm0-f68.google.com with SMTP id r201so936122wme.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2016 05:56:39 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160621080918.GA3333@Matej-PC.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matej Groma <matejgroma@gmail.com>
Cc: jwoithe@just42.net, platform-driver-x86@vger.kernel.org

> There is an indicator LED signaling activated power saving mode
> on certain Fujitsu laptop models. This has currently no use on Linux.
> Export it to userspace.
>=20
> Signed-off-by: Matej Groma <matejgroma@gmail.com>
> ---
>=20
> Notes:
>     Tested on Lifebook E756
>=20
>  drivers/platform/x86/fujitsu-laptop.c | 56 +++++++++++++++++++++++++=
++++++++++
>  1 file changed, 56 insertions(+)

On a Lifebook E744:

Tested-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
