From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Thu, 23 Jun 2016 15:42:30 +0200
Message-ID: <576BE746.2010504@fbihome.de>
References: <20160622073213.GD3056@eudyptula.hq.kempniu.pl>
 <576A6604.8010907@fbihome.de> <20160622105333.GD25599@marvin.atrad.com.au>
 <576A7519.9040703@fbihome.de> <20160622123941.GB2466@eudyptula.hq.kempniu.pl>
 <576A90FB.9090506@fbihome.de> <20160623111819.GA4284@eudyptula.hq.kempniu.pl>
 <576BD150.6050304@fbihome.de> <20160623123506.GA4461@eudyptula.hq.kempniu.pl>
 <576BE187.7060603@fbihome.de> <20160623133146.GA4558@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironman.h-da.de ([141.100.10.250]:29563 "EHLO ironman.h-da.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750885AbcFWNme (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 09:42:34 -0400
In-Reply-To: <20160623133146.GA4558@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

Am 23.06.2016 um 15:31 schrieb Micha=C5=82 K=C4=99pie=C5=84:
>>> First I figured out (using a command almost identical to the one I
>>> suggested to you) which GPE is used for signalling brightness-relat=
ed
>>> key presses on my Haswell machine.  This immediately led me to ACPI
>>> method _L11.  I selectively commented out ACPI code from this metho=
d,
>>> recompiling and overriding it using /sys/kernel/debug/acpi/custom_m=
ethod
>>> after every change until I figured out exactly which method invocat=
ion
>>> causes the key events to be generated.  Once I knew that, I searche=
d for
>>> a similar invocation in a Skylake DSDT dump.  This led me to ACPI m=
ethod
>>> _L21, which is very similar to Haswell's _L11.
>>
>> Thanks for this info. I guess I can also debug the "disable touchpad=
"
>> button with this method.
>=20
> If that button is supposed to be handled by ACPI, then yes, this shou=
ld
> help.

I'm not sure if it's supposed to be handled by ACPI and not completely
in HW, like in the Haswell line, but I get Notify events for the fujits=
u
driver.

>> I'm currently to recompiling my Ubuntu kernel, as it doesn't set
>> CONFIG_ACPI_CUSTOM_METHOD
>=20
> Right, you are going to need that.
>=20
>> Reading _L21, there are quite a few calls to Notify (\_SB.FEXT, 0x80=
),
>> which is exactly the notify function for the Fujitsu ACPI device.
>>
>> Actually there are a few more GPEs, which emit Notify (\_SB.FEXT, 0x=
80)
>> calls, which are caught by the fujitsu-notebook driver.
>>
>>>>> If it does, try overriding ACPI method _L21 [3] so that you can r=
ead
>>>>> the value of BSWF when the method is invoked.
>>
>> What's the easiest way to report the value to userspace? I don't thi=
nk I
>> can add variables.
>>
>> My idea was to add a Notify (\_SB.FEXT, 0x80) into the BSWF branch, =
and
>> remove the Notify calls from all other branches.
>>
>> Probably even start by removing all Notify calls to be sure the func=
tion
>> actually is overwritten.
>=20
> Just use the ACPI debug object.  Everything you need is in the
> documentation I have already referred you to (method-customizing.txt)=
=2E

Ups. Sorry - too much parallel stuff going on today.
I'll really read the document and not just skim through it (which I did
after realizing my kernel misses the needed modules.

> I would simply use the original _L21 method with a "Store (BSWF, Debu=
g)"
> line inserted just before the "If (BSWF)" conditional expression.

Yup.

Regards,

Jan-Marek
