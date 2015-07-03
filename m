From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 03 Jul 2015 22:30:07 +0200
Message-ID: <239328042.6BAts8fff1@xps13>
References: <20150702204122.GA2610@eudyptula.hq.kempniu.pl> <2310738.zonLnARZZM@xps13> <20150703200709.GA2408@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:32846 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755088AbbGCUaL convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jul 2015 16:30:11 -0400
Received: by wgck11 with SMTP id k11so95921953wgc.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2015 13:30:10 -0700 (PDT)
In-Reply-To: <20150703200709.GA2408@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Friday 03 July 2015 22:07:09 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > here below there's what I could get from my XPS13 9333.
>=20
> Gabriele, is any of the WMI events you listed accompanied by an i8042
> interrupt? If so, could you check the generated keycode?

Yes, volume down, volume up and mute.

If you take a look at dell-wmi.c, you'll see that the driver ignores
the WMI events associated to those keys (legacy keymap), so only the
i8042 events are taken into account. The generated keycodes are the
expected ones: KEY_VOLUMEDOWN, KEY_VOLUMEUP and KEY_MIN_INTERESTING.
