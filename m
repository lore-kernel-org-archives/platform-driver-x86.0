From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Thu, 23 Jun 2016 14:35:06 +0200
Message-ID: <20160623123506.GA4461@eudyptula.hq.kempniu.pl>
References: <5763C0DF.3030302@fbihome.de>
 <20160621081229.GE19735@marvin.atrad.com.au>
 <20160622073213.GD3056@eudyptula.hq.kempniu.pl>
 <576A6604.8010907@fbihome.de>
 <20160622105333.GD25599@marvin.atrad.com.au>
 <576A7519.9040703@fbihome.de>
 <20160622123941.GB2466@eudyptula.hq.kempniu.pl>
 <576A90FB.9090506@fbihome.de>
 <20160623111819.GA4284@eudyptula.hq.kempniu.pl>
 <576BD150.6050304@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:38067 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751122AbcFWMfO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 08:35:14 -0400
Received: by mail-wm0-f53.google.com with SMTP id r201so47999887wme.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2016 05:35:13 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <576BD150.6050304@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

> > I looked at the ACPI tables you sent me and it looks like
> > brightness-related keys should be handled by ACPI method _L21 on
> > Skylakes.  As far as I can tell without playing with the hardware
> > myself, the ACPI code doesn't strike me as outright broken, so the =
first
> > step would be to confirm whether the relevant GPE is raised at all =
when
> > you press brightness-related keys.  To check it, launch the followi=
ng
> > command in a terminal:
> >=20
> >     watch -n 1 cat /sys/firmware/acpi/interrupts/gpe21
> >=20
> > and press Fn+F6 or Fn+F7.  The counter should get increased by one.
>=20
> Yup - great. This works :-)
> I would be interested to know, how you came to this conclusion. Is th=
is
> encoded in the ssdt tables?

=46irst I figured out (using a command almost identical to the one I
suggested to you) which GPE is used for signalling brightness-related
key presses on my Haswell machine.  This immediately led me to ACPI
method _L11.  I selectively commented out ACPI code from this method,
recompiling and overriding it using /sys/kernel/debug/acpi/custom_metho=
d
after every change until I figured out exactly which method invocation
causes the key events to be generated.  Once I knew that, I searched fo=
r
a similar invocation in a Skylake DSDT dump.  This led me to ACPI metho=
d
_L21, which is very similar to Haswell's _L11.

> I really want to understand this. Should I
> read the ACPI specs?

Well, I cannot stop you from doing that, but I would advise against it
if you value your own mental health.  Unless you have a very specific
reason to do otherwise, just follow the code.  If you would like to
learn a bit more about GPEs specifically, I recommend this great blog
post by Matthew Garrett:

    http://mjg59.livejournal.com/117532.html

> > If it does, try overriding ACPI method _L21 [3] so that you can rea=
d
> > the value of BSWF when the method is invoked.
>=20
> I'll read [3] and report back later.
>=20
> > If that value is 0, it's
> > obviously a vendor bug as it would prevent the ACPI video device fr=
om
> > being notified.  If the GPE count isn't increased when
> > brightness-related keys are pressed, it means some hardware
> > initialization may be required before these keys are handled.  In t=
hat
> > case we would likely be screwed without assistance from Fujitsu.
> >=20
> > To sum up, I see no immediate reason for brightness control not to =
work
> > on Skylakes, so you will have to get your hands a bit dirty to get =
to
> > the bottom of this (and it might still not yield a solution).
>=20
> The brightness buttons work in Windows 7 with the Fujitsu button driv=
er.
> Didn't check, if they even work without. I can get my hands on a Wind=
ows
> 7 laptop, but that'll take some time, if this additional info would h=
elp.

No need to do that, at least for now.  The sole fact that something
works on Windows is not much of a help if we don't know the technology
used behind the scenes.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
