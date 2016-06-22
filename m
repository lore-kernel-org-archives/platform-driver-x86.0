From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Wed, 22 Jun 2016 09:32:13 +0200
Message-ID: <20160622073213.GD3056@eudyptula.hq.kempniu.pl>
References: <575FC4E0.7080501@fbihome.de>
 <20160616234630.GB4764@marvin.atrad.com.au>
 <5763C0DF.3030302@fbihome.de>
 <20160621081229.GE19735@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:35235 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750970AbcFVHdx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 03:33:53 -0400
Received: by mail-lf0-f47.google.com with SMTP id l188so62863035lfe.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2016 00:32:18 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160621081229.GE19735@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org

> > A backlight device is available via /sys/class/backlight/intel_back=
light
> > and you can change brightness manually. AFAIK this device is provid=
ed by
> > the i915 driver.
>=20
> So perhaps the intent on other systems is to respond to the ACPI butt=
on
> notifications by manipulating the intel backlight hardware.  If this =
is the
> case we'd need a way to do this from within the fujitsu-laptop driver=
 in
> response to the buttons you've identified.

Is implementing this in the kernel really worth the effort?  I ended up
using xbacklight bound (in my window manager) to the brightness hotkeys
for both my Lifebook E744 and my Vostro V131, which has a royally borke=
d
ACPI backlight control implementation.  It seems using userspace helper=
s
for backlight control is the new normal [1].  Yes, you lose console
brightness control; I can live with that, YMMV.

[1] https://www.spinics.net/lists/platform-driver-x86/msg07902.html

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
