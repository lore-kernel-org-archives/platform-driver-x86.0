From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 1/2] dell-wmi: Check if Dell WMI descriptor structure is
 valid
Date: Wed, 30 Dec 2015 12:27:07 +0100
Message-ID: <20151230112707.GA3352@eudyptula.hq.kempniu.pl>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
 <201512281508.20683@pali>
 <20151229124413.GB2467@eudyptula.hq.kempniu.pl>
 <201512291705.43939@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:35594 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754019AbbL3L0p (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Dec 2015 06:26:45 -0500
Received: by mail-lf0-f43.google.com with SMTP id c192so48566944lfe.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Dec 2015 03:26:45 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <201512291705.43939@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> > If you feel like I'm nit-picking and none of the above matters,
> > please feel free to disregard my input and just follow your gut.
>=20
> It's ok. We just understand it quite differently. And in this case wh=
at=20
> about changing commit message to something like this?
>=20
> =3D=3D=3D
> dell-wmi: Check if Dell WMI descriptor structure is valid
>=20
> After examining existing DSDT ACPI tables of more laptops and looking=
=20
> into Dell WMI document mentioned in ML dicussion archived at=20
> http://www.spinics.net/lists/platform-driver-x86/msg07220.html we wil=
l=20
> parse and check WMI descriptor if contains expected data. It is becau=
se=20
> WMI descriptor contains interface version number and it is needed to=20
> know in next commit.
> =3D=3D=3D

I like it way more than the previous one.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
