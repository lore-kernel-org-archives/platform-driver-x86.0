From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Fri, 24 Jun 2016 22:17:37 +0200
Message-ID: <20160624201737.GA5843@eudyptula.hq.kempniu.pl>
References: <20160622123941.GB2466@eudyptula.hq.kempniu.pl>
 <576A90FB.9090506@fbihome.de>
 <20160623111819.GA4284@eudyptula.hq.kempniu.pl>
 <576BD150.6050304@fbihome.de>
 <20160623123506.GA4461@eudyptula.hq.kempniu.pl>
 <576C1B0C.5050206@fbihome.de>
 <20160624071224.GA5289@eudyptula.hq.kempniu.pl>
 <576CFBC6.2000309@fbihome.de>
 <20160624102024.GA5461@eudyptula.hq.kempniu.pl>
 <576D5523.7030309@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:35558 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751054AbcFXURq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jun 2016 16:17:46 -0400
Received: by mail-wm0-f53.google.com with SMTP id v199so34522683wmv.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jun 2016 13:17:46 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <576D5523.7030309@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>

> Got an other call from Fujitsu. They pointed me to the i915 patchset,
> fixing the bug: https://www.spinics.net/lists/intel-gfx/msg98326.html
>=20
> I backported the patchset to my Ubuntu Xenial i915 module, and I have
> working brightness keys :-)

Great!  Kudos to Fujitsu for getting back to you so quickly with a
working solution.

=2E..though if you think about it, the whole thing is absolutely hideou=
s:
an *ACPI* driver requires cooperation from a *video* driver to notify
the operating system about a *key press*.  Please, make it more
complicated, I mean, sending i8042 interrupts when keys are pressed is
so 1985 and it simply cannot work reliably.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
