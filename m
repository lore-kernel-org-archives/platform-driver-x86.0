From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Thu, 23 Jun 2016 15:17:59 +0200
Message-ID: <576BE187.7060603@fbihome.de>
References: <5763C0DF.3030302@fbihome.de>
 <20160621081229.GE19735@marvin.atrad.com.au>
 <20160622073213.GD3056@eudyptula.hq.kempniu.pl> <576A6604.8010907@fbihome.de>
 <20160622105333.GD25599@marvin.atrad.com.au> <576A7519.9040703@fbihome.de>
 <20160622123941.GB2466@eudyptula.hq.kempniu.pl> <576A90FB.9090506@fbihome.de>
 <20160623111819.GA4284@eudyptula.hq.kempniu.pl> <576BD150.6050304@fbihome.de>
 <20160623123506.GA4461@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironman.h-da.de ([141.100.10.250]:1525 "EHLO ironman.h-da.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751188AbcFWNSD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 09:18:03 -0400
In-Reply-To: <20160623123506.GA4461@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

Am 23.06.2016 um 14:35 schrieb Micha=C5=82 K=C4=99pie=C5=84:
>>> I looked at the ACPI tables you sent me and it looks like
>>> brightness-related keys should be handled by ACPI method _L21 on
>>> Skylakes.  As far as I can tell without playing with the hardware
>>> myself, the ACPI code doesn't strike me as outright broken, so the =
first
>>> step would be to confirm whether the relevant GPE is raised at all =
when
>>> you press brightness-related keys.  To check it, launch the followi=
ng
>>> command in a terminal:
>>>
>>>     watch -n 1 cat /sys/firmware/acpi/interrupts/gpe21
>>>
>>> and press Fn+F6 or Fn+F7.  The counter should get increased by one.
>>
>> Yup - great. This works :-)
>> I would be interested to know, how you came to this conclusion. Is t=
his
>> encoded in the ssdt tables?
>=20
> First I figured out (using a command almost identical to the one I
> suggested to you) which GPE is used for signalling brightness-related
> key presses on my Haswell machine.  This immediately led me to ACPI
> method _L11.  I selectively commented out ACPI code from this method,
> recompiling and overriding it using /sys/kernel/debug/acpi/custom_met=
hod
> after every change until I figured out exactly which method invocatio=
n
> causes the key events to be generated.  Once I knew that, I searched =
for
> a similar invocation in a Skylake DSDT dump.  This led me to ACPI met=
hod
> _L21, which is very similar to Haswell's _L11.

Thanks for this info. I guess I can also debug the "disable touchpad"
button with this method.

I'm currently to recompiling my Ubuntu kernel, as it doesn't set
CONFIG_ACPI_CUSTOM_METHOD

Reading _L21, there are quite a few calls to Notify (\_SB.FEXT, 0x80),
which is exactly the notify function for the Fujitsu ACPI device.

Actually there are a few more GPEs, which emit Notify (\_SB.FEXT, 0x80)
calls, which are caught by the fujitsu-notebook driver.

>>> If it does, try overriding ACPI method _L21 [3] so that you can rea=
d
>>> the value of BSWF when the method is invoked.

What's the easiest way to report the value to userspace? I don't think =
I
can add variables.

My idea was to add a Notify (\_SB.FEXT, 0x80) into the BSWF branch, and
remove the Notify calls from all other branches.

Probably even start by removing all Notify calls to be sure the functio=
n
actually is overwritten.

>>> If that value is 0, it's
>>> obviously a vendor bug as it would prevent the ACPI video device fr=
om
>>> being notified.  If the GPE count isn't increased when
>>> brightness-related keys are pressed, it means some hardware
>>> initialization may be required before these keys are handled.  In t=
hat
>>> case we would likely be screwed without assistance from Fujitsu.
>>>
>>> To sum up, I see no immediate reason for brightness control not to =
work
>>> on Skylakes, so you will have to get your hands a bit dirty to get =
to
>>> the bottom of this (and it might still not yield a solution).

Regards,

Jan-Marek
