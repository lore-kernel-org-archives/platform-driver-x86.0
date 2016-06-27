From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] fujitsu-laptop: Support touchpad toggle hotkey on
 Skylake-based models
Date: Mon, 27 Jun 2016 14:55:24 +0200
Message-ID: <20160627125524.GA2432@eudyptula.hq.kempniu.pl>
References: <20160625091522.GA6423@eudyptula.hq.kempniu.pl>
 <1466926895-7830-1-git-send-email-kernel@kempniu.pl>
 <20160627124821.GB1544@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:37582 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751644AbcF0Mzl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Jun 2016 08:55:41 -0400
Received: by mail-wm0-f45.google.com with SMTP id a66so114081685wme.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2016 05:55:40 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160627124821.GB1544@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> > Haswell-based Fujitsu laptops (Lifebook E734/E744/E754) have a touc=
hpad
> > toggle hotkey (Fn+F4) which is handled transparently to the operati=
ng
> > system: while an ACPI notification is sent to FUJ02B1 when Fn+F4 is
> > pressed, touchpad state is properly toggled without any explicit su=
pport
> > for this operation in fujitsu-laptop.
> > :
>=20
> I am happy with the patch code once the one-line fix from Jan-Marek i=
s
> included.  However, given the rather non-intuitive behaviour that the=
 patch
> is dealing with I wonder whether a short (2 line) comment in the code=
 might
> be justified.  There is otherwise no obvious reason why the touchpad =
button
> code must interact with the rf kill hardware.
>=20
> Please respin the patch with the above in mind (and inlude Jan-Marek'=
s fix).

Will do, thanks for the review.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
