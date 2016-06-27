From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Mon, 27 Jun 2016 13:16:55 +0200
Message-ID: <20160627111655.GA2438@eudyptula.hq.kempniu.pl>
References: <20160623123506.GA4461@eudyptula.hq.kempniu.pl>
 <576C1B0C.5050206@fbihome.de>
 <20160624071224.GA5289@eudyptula.hq.kempniu.pl>
 <576CFBC6.2000309@fbihome.de>
 <20160624102024.GA5461@eudyptula.hq.kempniu.pl>
 <576D5523.7030309@fbihome.de>
 <20160624201737.GA5843@eudyptula.hq.kempniu.pl>
 <20160625085052.GA5137@marvin.atrad.com.au>
 <20160625091522.GA6423@eudyptula.hq.kempniu.pl>
 <5770E484.4030009@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:37938 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751721AbcF0LRA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Jun 2016 07:17:00 -0400
Received: by mail-wm0-f48.google.com with SMTP id r201so110166200wme.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2016 04:16:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5770E484.4030009@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>

> >> As to
> >> the touch keys, it sounds like this might be a BIOS thing to - is =
it?
> >=20
> > Are you referring to the "touchpad toggle" key?  If you are, I will=
 soon
> > post a patch adding support for this key so that Jan-Marek can test=
 it.
> > I just need to find some time to actually write it.
>=20
> This needs a small patch. But getting the keycode into X11 seems to b=
e
> impossible, as X / xev can't handle keycodes > 255 (KEY_TOUCHPAD_TOGG=
LE).
>=20
> I'm currently running evrouter, to call a script on the event, which
> dis-/enables the input device using xinput.

So does my patch work after the set_bit() you suggested is added?  You
have not explicitly stated that, so I can only guess it works.

> I would definitely prefer
> any HW or kernel driver solution. I couldn't find a way to map the 53=
0
> keycode to something < 255 to suit xev and skip the evrouter. Maybe
> Fujitsu will offer a better solution.

Using a single byte to hold a keycode is a limitation of the X11
protocol and there are other platform drivers using KEY_TOUCHPAD_TOGGLE=
,
so unless Fujitsu clues us in on some magical way to set the touchpad
state, I am not sure anything more can/should be done in the kernel.
Note that GMOU/SMOU ACPI methods were removed in Skylake firmware.  If
you really want to avoid using helper software, patch your kernel to
generate a different event when Fn+F4 is pressed.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
