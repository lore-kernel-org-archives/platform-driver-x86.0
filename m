From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Thu, 23 Jun 2016 19:23:24 +0200
Message-ID: <576C1B0C.5050206@fbihome.de>
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
Received: from ironchief.h-da.de ([141.100.10.235]:23558 "EHLO
	ironchief.h-da.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751121AbcFWRXe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 13:23:34 -0400
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
>=20
>> I really want to understand this. Should I
>> read the ACPI specs?
>=20
> Well, I cannot stop you from doing that, but I would advise against i=
t
> if you value your own mental health.  Unless you have a very specific
> reason to do otherwise, just follow the code.  If you would like to
> learn a bit more about GPEs specifically, I recommend this great blog
> post by Matthew Garrett:
>=20
>     http://mjg59.livejournal.com/117532.htmlBSWF =3D Zero
>=20
>>> If it does, try overriding ACPI method _L21 [3] so that you can rea=
d
>>> the value of BSWF when the method is invoked.
>>
>> I'll read [3] and report back later.
>>
>>> If that value is 0, it's
>>> obviously a vendor bug as it would prevent the ACPI video device fr=
om
>>> being notified.=20

Hmm - so I got
[  561.809723] [ACPI Debug 64952760]  Integer 0x0000000000000000
for my Store (BSWF, Debug) call.

Then I had a look at the \_SB.PCI0.GFX0.LCD.BLNF () function in my
ssdt7.dsl, and it sets "BSWF =3D Zero" as the 2nd last call. And it's t=
he
same in the ssdt6.dsl of the Haswell hardware, except there the call to
BLNF is guarded by an "LGreaterEqual(OSYS, 0x07D6)" guard, so I guess
for newer operating systems, all the functionality is also disabled on
Haswell.

But BLNF also sets "AHKF |=3D One", which triggers this code path
containing just a "Notify (\_SB.FEXT, 0x80)", but since it's actually
never called, I get no notifications - how did I ever get notifications=
?

=2E..

until I have pressed the "touchpad" button, which changes AHKF to 8 -
permanently - and now I get notifications from all buttons, since all
use _L11 :-(

So I actually never got any direct ACPI events from the brightness
control, but this was just toggled because of the "touchpad" key,
enabling the notifications=E2=80=A6

And then I "instrumented" all if's by dumping the value just before the
if =3D> everything is always 0, except the permanent 8 in AHKF after
pressing the "touchpad" button.

So - just for the sake of it, I had a look for some AHKF code and the
button function S000 got new code to handle AHKF - both brightness (AKA
BSWF AKA AHKF & One) and the touchpad (AKA AHKF & 0x08)

But this is just called, if you call the ACPI button function in the
device driver.

Which leaves me with the problem, that BSWF is always 0.

>>> To sum up, I see no immediate reason for brightness control not to =
work
>>> on Skylakes, so you will have to get your hands a bit dirty to get =
to
>>> the bottom of this (and it might still not yield a solution).

That's enough for today.

I'm quite sure Fujitsu changed the in-ACPI-HW-touchpad-disable-handling
to be done by the driver.
I don't know, why / how the brightness keys are working in Windows.

Jan-Marek
