From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Sat, 25 Jun 2016 11:15:22 +0200
Message-ID: <20160625091522.GA6423@eudyptula.hq.kempniu.pl>
References: <20160623111819.GA4284@eudyptula.hq.kempniu.pl>
 <576BD150.6050304@fbihome.de>
 <20160623123506.GA4461@eudyptula.hq.kempniu.pl>
 <576C1B0C.5050206@fbihome.de>
 <20160624071224.GA5289@eudyptula.hq.kempniu.pl>
 <576CFBC6.2000309@fbihome.de>
 <20160624102024.GA5461@eudyptula.hq.kempniu.pl>
 <576D5523.7030309@fbihome.de>
 <20160624201737.GA5843@eudyptula.hq.kempniu.pl>
 <20160625085052.GA5137@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:37231 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082AbcFYJPa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 25 Jun 2016 05:15:30 -0400
Received: by mail-wm0-f42.google.com with SMTP id a66so52683683wme.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Jun 2016 02:15:29 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160625085052.GA5137@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>

> > ...though if you think about it, the whole thing is absolutely hide=
ous:
> > an *ACPI* driver requires cooperation from a *video* driver to noti=
fy
> > the operating system about a *key press*.
>=20
> Yeah.  On one hand I'm utterly amazed.  On the other, I've seen and r=
ead
> about other really bizarre things which go on in the BIOSes of comput=
ers
> over the years, so nothing really surprises me anymore. :-)

Yes, I am a rookie in this field, so perhaps I simply have not seen
enough weirdness yet to just get over something like this.

> My understanding based on this latest information is that the patch t=
o the
> i915 driver fixes the brightness control on these laptops and that no
> changes to fujitsu-laptop are required for this.  Is this correct?

This is my understanding as well.

> As to
> the touch keys, it sounds like this might be a BIOS thing to - is it?

Are you referring to the "touchpad toggle" key?  If you are, I will soo=
n
post a patch adding support for this key so that Jan-Marek can test it.
I just need to find some time to actually write it.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
