From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Wed, 22 Jun 2016 12:18:44 +0200
Message-ID: <576A6604.8010907@fbihome.de>
References: <575FC4E0.7080501@fbihome.de>
 <20160616234630.GB4764@marvin.atrad.com.au> <5763C0DF.3030302@fbihome.de>
 <20160621081229.GE19735@marvin.atrad.com.au>
 <20160622073213.GD3056@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironchief.h-da.de ([141.100.10.235]:6905 "EHLO
	ironchief.h-da.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751742AbcFVKSr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 06:18:47 -0400
In-Reply-To: <20160622073213.GD3056@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

Am 22.06.2016 um 09:32 schrieb Micha=C5=82 K=C4=99pie=C5=84:
>>> A backlight device is available via /sys/class/backlight/intel_back=
light
>>> and you can change brightness manually. AFAIK this device is provid=
ed by
>>> the i915 driver.
>>
>> So perhaps the intent on other systems is to respond to the ACPI but=
ton
>> notifications by manipulating the intel backlight hardware.  If this=
 is the
>> case we'd need a way to do this from within the fujitsu-laptop drive=
r in
>> response to the buttons you've identified.
>=20
> Is implementing this in the kernel really worth the effort?  I ended =
up
> using xbacklight bound (in my window manager) to the brightness hotke=
ys
> for both my Lifebook E744 and my Vostro V131, which has a royally bor=
ked
> ACPI backlight control implementation.  It seems using userspace help=
ers
> for backlight control is the new normal [1].  Yes, you lose console
> brightness control; I can live with that, YMMV.
>=20
> [1] https://www.spinics.net/lists/platform-driver-x86/msg07902.html

The e7x6's DSTD misses the ACPI brightness control device (FUJ02B1), so
the brightness part of the fujitsu-laptop driver isn't used and
therefore - in addition to the direct brightness adjustment - generates
no keycodes for the keys.

A userspace keycode handling solution would be totally sufficient. Woul=
d
be nice, if it worked in kernel but that's clearly optional for me.

Regards,

Jan-Marek
