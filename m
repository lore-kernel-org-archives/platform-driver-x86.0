From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Fri, 24 Jun 2016 13:39:27 +0200
Message-ID: <576D1BEF.1030709@fbihome.de>
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
Received: from ironchief.h-da.de ([141.100.10.235]:11011 "EHLO
	ironchief.h-da.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750951AbcFXLjb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jun 2016 07:39:31 -0400
In-Reply-To: <20160624102024.GA5461@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

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
>=20
>> I'll point them to this thread.
>=20
> Please do, I will be happy to help.
>=20
>> No news yet about the touchpad key.
>=20
> Let me think about a patch which would support it.  I will get back t=
o
> you once I have actual code.

There is a key event in input.h called KEY_TOUCHPAD_TOGGLE.

Calling the S000 function as

call_fext_func(FUNC_RFKILL, 0x0, 0x0, 0x0) should give you the indicato=
r
mask
call_fext_func(FUNC_RFKILL, 0x1, 0x0, 0x0) should give you the touchpad
and brightness indicator and actually reset both indicator states

=46rom the asl, valid first parameters are 0x01 (touch + bright), 0x04
(rfkill) and 0x05 (? something else regarding RF, as it also uses FSMI =
0x91)

Regards,

Jan-Marek

P.S. after rebuilding my kernel I can finally build external modules
again. Building the deb-pkg target on amd64 for i386 kernel, results in
the correct kernel, but amd64-compiled tools needed for modpost.
