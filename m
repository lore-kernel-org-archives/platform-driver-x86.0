From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] dell-wmi: add module param to control Dell Instant
 Launch hotkey processing
Date: Tue, 1 Dec 2015 09:47:42 +0100
Message-ID: <20151201084742.GA6263@eudyptula.hq.kempniu.pl>
References: <1f6ac54784b39ebb6ce02a9fb9e944c840fddb7b.1448547341.git.kernel@kempniu.pl>
 <20151130211542.GE30553@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151130211542.GE30553@malice.jf.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> Module parameters are to be avoided wherever possible, especially for=
 things
> like this which set precedent and don't scale well. If we cannot dete=
ct which
> machines use the EC and which only use WMI, then we can fall back to =
checking
> DMI for specific models.
>=20
> Per the above, and Pali's feedback. I'll be dropping this one in anti=
cipation of
> a V2.

Thanks for reviewing, I'll prepare version 2 using DMI matching.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
