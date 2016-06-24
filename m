From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Fri, 24 Jun 2016 17:43:31 +0200
Message-ID: <576D5523.7030309@fbihome.de>
References: <20160622105333.GD25599@marvin.atrad.com.au>
 <576A7519.9040703@fbihome.de> <20160622123941.GB2466@eudyptula.hq.kempniu.pl>
 <576A90FB.9090506@fbihome.de> <20160623111819.GA4284@eudyptula.hq.kempniu.pl>
 <576BD150.6050304@fbihome.de> <20160623123506.GA4461@eudyptula.hq.kempniu.pl>
 <576C1B0C.5050206@fbihome.de> <20160624071224.GA5289@eudyptula.hq.kempniu.pl>
 <576CFBC6.2000309@fbihome.de> <20160624102024.GA5461@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironchief.h-da.de ([141.100.10.235]:43210 "EHLO
	ironchief.h-da.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750972AbcFXPnj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jun 2016 11:43:39 -0400
In-Reply-To: <20160624102024.GA5461@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>

Am 24.06.2016 um 12:20 schrieb Micha=C5=82 K=C4=99pie=C5=84:
>> So I got a reply from my vendor CC some Fujitsu persons.
>>
>> They claim the non-working brightness buttons is an error in an Inte=
l
>> driver and they are going to contact the Linux/Ubuntu community.
>=20
> I am not sure what the Intel driver has to do with this, but hey, who=
 am
> I to tell them how their hardware works?

Got an other call from Fujitsu. They pointed me to the i915 patchset,
fixing the bug: https://www.spinics.net/lists/intel-gfx/msg98326.html

I backported the patchset to my Ubuntu Xenial i915 module, and I have
working brightness keys :-)

[ 1256.079552] [ACPI Debug 61578415]  Integer 0x00000000DEADBEAF
[ 1256.080002] [ACPI Debug 61578870]  Integer 0x0000000000000001
[ 1256.083691] [ACPI Debug 61582559]  Integer 0x0000000000000004
[ 1256.083739] [ACPI Debug 61582609]  Integer 0x0000000000000000
[ 1256.083849] [ACPI Debug 61582720]  Integer 0x0000000000000001
[ 1256.084242] [ACPI Debug 61583112]  Integer 0x0000000000000000
[ 1256.084318] [ACPI Debug 61583189]  Integer 0x0000000000000001
[ 1256.084406] [ACPI Debug 61583276]  Integer 0x0000000000000000
[ 1256.649955] [ACPI Debug 62148830]  Integer 0x00000000DEADBEAF
[ 1256.650405] [ACPI Debug 62149284]  Integer 0x0000000000000001
[ 1256.653997] [ACPI Debug 62152876]  Integer 0x0000000000000004
[ 1256.654043] [ACPI Debug 62152925]  Integer 0x0000000000000000
[ 1256.654152] [ACPI Debug 62153034]  Integer 0x0000000000000002
[ 1256.654549] [ACPI Debug 62153431]  Integer 0x0000000000000000
[ 1256.654625] [ACPI Debug 62153507]  Integer 0x0000000000000001
[ 1256.654712] [ACPI Debug 62153595]  Integer 0x0000000000000000

I'll port the patches to my Ubuntu Wily i915 module, and then weekend,
sunshine=E2=80=A6 :-)

Regards,

Jan-Marek
