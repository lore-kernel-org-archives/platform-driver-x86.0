From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Wed, 24 Jun 2015 15:23:03 +0200
Message-ID: <20150624132303.GK21149@pali>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150623114659.GM31818@pali>
 <20150623194015.GA2579@eudyptula.hq.kempniu.pl>
 <201506232147.24651@pali>
 <20150624111825.GA2405@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:36553 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752542AbbFXNXH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Jun 2015 09:23:07 -0400
Received: by wicnd19 with SMTP id nd19so135314728wic.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2015 06:23:06 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150624111825.GA2405@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Wednesday 24 June 2015 13:18:25 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > Maybe we need to somehow enable receiving such events?
>=20
> ACPI method WED0, which should enable event collection, is automatica=
lly
> invoked when dell-wmi is loaded. Some WMI implementations (e.g. Asus)
> require special WMI method calls to enable hotkey event collection, b=
ut
> these should be visible in the MOF and they're not in this case.
>=20
> I suspect this is simply a firmware issue that the vendor works aroun=
d
> in Windows using some mysterious hacks. It already happened before [1=
]
> and thus I share your lack of faith in pushing this matter any furthe=
r
> until we hear from Dell...
>=20
> [1] http://www.spinics.net/lists/linux-acpi/msg34577.html
>=20

Can you try to load wmi.ko with params debug_event=3D1 and
debug_dump_wdg=3D1 if you can see something in dmesg?

Maybe we really need some hack/hook if this is firmware issue...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
