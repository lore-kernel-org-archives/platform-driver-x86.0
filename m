From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Thu, 23 Jun 2016 15:31:46 +0200
Message-ID: <20160623133146.GA4558@eudyptula.hq.kempniu.pl>
References: <20160622073213.GD3056@eudyptula.hq.kempniu.pl>
 <576A6604.8010907@fbihome.de>
 <20160622105333.GD25599@marvin.atrad.com.au>
 <576A7519.9040703@fbihome.de>
 <20160622123941.GB2466@eudyptula.hq.kempniu.pl>
 <576A90FB.9090506@fbihome.de>
 <20160623111819.GA4284@eudyptula.hq.kempniu.pl>
 <576BD150.6050304@fbihome.de>
 <20160623123506.GA4461@eudyptula.hq.kempniu.pl>
 <576BE187.7060603@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:33416 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751347AbcFWNbx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 09:31:53 -0400
Received: by mail-wm0-f54.google.com with SMTP id r190so3798378wmr.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2016 06:31:53 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <576BE187.7060603@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

> > First I figured out (using a command almost identical to the one I
> > suggested to you) which GPE is used for signalling brightness-relat=
ed
> > key presses on my Haswell machine.  This immediately led me to ACPI
> > method _L11.  I selectively commented out ACPI code from this metho=
d,
> > recompiling and overriding it using /sys/kernel/debug/acpi/custom_m=
ethod
> > after every change until I figured out exactly which method invocat=
ion
> > causes the key events to be generated.  Once I knew that, I searche=
d for
> > a similar invocation in a Skylake DSDT dump.  This led me to ACPI m=
ethod
> > _L21, which is very similar to Haswell's _L11.
>=20
> Thanks for this info. I guess I can also debug the "disable touchpad"
> button with this method.

If that button is supposed to be handled by ACPI, then yes, this should
help.

> I'm currently to recompiling my Ubuntu kernel, as it doesn't set
> CONFIG_ACPI_CUSTOM_METHOD

Right, you are going to need that.

> Reading _L21, there are quite a few calls to Notify (\_SB.FEXT, 0x80)=
,
> which is exactly the notify function for the Fujitsu ACPI device.
>=20
> Actually there are a few more GPEs, which emit Notify (\_SB.FEXT, 0x8=
0)
> calls, which are caught by the fujitsu-notebook driver.
>=20
> >>> If it does, try overriding ACPI method _L21 [3] so that you can r=
ead
> >>> the value of BSWF when the method is invoked.
>=20
> What's the easiest way to report the value to userspace? I don't thin=
k I
> can add variables.
>=20
> My idea was to add a Notify (\_SB.FEXT, 0x80) into the BSWF branch, a=
nd
> remove the Notify calls from all other branches.
>=20
> Probably even start by removing all Notify calls to be sure the funct=
ion
> actually is overwritten.

Just use the ACPI debug object.  Everything you need is in the
documentation I have already referred you to (method-customizing.txt).

I would simply use the original _L21 method with a "Store (BSWF, Debug)=
"
line inserted just before the "If (BSWF)" conditional expression.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
