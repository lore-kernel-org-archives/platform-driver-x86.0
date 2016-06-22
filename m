From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Wed, 22 Jun 2016 09:15:17 +0200
Message-ID: <20160622071517.GC3056@eudyptula.hq.kempniu.pl>
References: <575FC4E0.7080501@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:32797 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750970AbcFVHQT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 03:16:19 -0400
Received: by mail-lb0-f178.google.com with SMTP id xp5so16905009lbb.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2016 00:15:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <575FC4E0.7080501@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

> I recently got new Skylake hardware (e7x6) from Fujitsu. Compared to
> previous Haswell generation (e7x4), some of the Fn+X key combination
> stopped working. This includes the brightness and "touchpad dis-/enab=
le"
> key combinations.

As you used the phrase "stopped working", I'm wondering whether you wer=
e
ever able to get ACPI brightness control to work on a Haswell machine?
It seems to be broken on my Lifebook E744 (BIOS version 1.19): pressing
the brightness keys causes acpi_fujitsu_notify() to call GBLL, which
always returns the same brightness level, even though it sets the
highest bit in its return value (which denotes a brightness change).
Also, calling set_lcd_level() with various values causes the value
subsequently returned by GBLL to change, but the actual screen
brightness is identical all the time.

> For the brightness control it's understandable, as this was handled b=
y a
> ACPI device FUJ02B1, which is no longer available. I don't know how t=
he
> touchpad disable key was actually working, as I don't get any scan co=
des
> or ACPI events in userspace - probably I'm missing something here.

It looks like it is handled purely in hardware because I'm not getting
any scan codes or ACPI events either on a Lifebook E744 and the hotkey
works correctly.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
