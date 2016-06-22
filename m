From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Wed, 22 Jun 2016 12:07:26 +0200
Message-ID: <576A635E.1090101@fbihome.de>
References: <575FC4E0.7080501@fbihome.de>
 <20160622071517.GC3056@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironman.h-da.de ([141.100.10.250]:8510 "EHLO ironman.h-da.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751582AbcFVKPo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 06:15:44 -0400
In-Reply-To: <20160622071517.GC3056@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

Am 22.06.2016 um 09:15 schrieb Micha=C5=82 K=C4=99pie=C5=84:
>> I recently got new Skylake hardware (e7x6) from Fujitsu. Compared to
>> previous Haswell generation (e7x4), some of the Fn+X key combination
>> stopped working. This includes the brightness and "touchpad dis-/ena=
ble"
>> key combinations.
>=20
> As you used the phrase "stopped working", I'm wondering whether you w=
ere
> ever able to get ACPI brightness control to work on a Haswell machine=
?
> It seems to be broken on my Lifebook E744 (BIOS version 1.19): pressi=
ng
> the brightness keys causes acpi_fujitsu_notify() to call GBLL, which
> always returns the same brightness level, even though it sets the
> highest bit in its return value (which denotes a brightness change).
> Also, calling set_lcd_level() with various values causes the value
> subsequently returned by GBLL to change, but the actual screen
> brightness is identical all the time.

Brightness control works for me with the Fujitsu e7x4 hardware and so
does the "touchpad" button. These notebooks run Ubuntu 12.04 with 14.04
HWE AKA some 3.13 kernel and KDE4. No extra configuration needed.

But: the brightness buttons just generate key events, which are
evaluated inside KDE, not in a terminal or the login screen, so the
actual part of the driver, which handles the LCD brightness level, isn'=
t
working - at least not the driver version in 3.13.

>> For the brightness control it's understandable, as this was handled =
by a
>> ACPI device FUJ02B1, which is no longer available. I don't know how =
the
>> touchpad disable key was actually working, as I don't get any scan c=
odes
>> or ACPI events in userspace - probably I'm missing something here.
>=20
> It looks like it is handled purely in hardware because I'm not gettin=
g
> any scan codes or ACPI events either on a Lifebook E744 and the hotke=
y
> works correctly.

Yup

Regards,

Jan-Marek
