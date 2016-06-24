From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Fri, 24 Jun 2016 09:12:24 +0200
Message-ID: <20160624071224.GA5289@eudyptula.hq.kempniu.pl>
References: <20160622073213.GD3056@eudyptula.hq.kempniu.pl>
 <576A6604.8010907@fbihome.de>
 <20160622105333.GD25599@marvin.atrad.com.au>
 <576A7519.9040703@fbihome.de>
 <20160622123941.GB2466@eudyptula.hq.kempniu.pl>
 <576A90FB.9090506@fbihome.de>
 <20160623111819.GA4284@eudyptula.hq.kempniu.pl>
 <576BD150.6050304@fbihome.de>
 <20160623123506.GA4461@eudyptula.hq.kempniu.pl>
 <576C1B0C.5050206@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:36083 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750853AbcFXHMa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jun 2016 03:12:30 -0400
Received: by mail-wm0-f50.google.com with SMTP id f126so11007940wma.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jun 2016 00:12:29 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <576C1B0C.5050206@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

> Hmm - so I got
> [  561.809723] [ACPI Debug 64952760]  Integer 0x0000000000000000
> for my Store (BSWF, Debug) call.

This is the core issue.

> Then I had a look at the \_SB.PCI0.GFX0.LCD.BLNF () function in my
> ssdt7.dsl, and it sets "BSWF =3D Zero" as the 2nd last call. And it's=
 the
> same in the ssdt6.dsl of the Haswell hardware, except there the call =
to
> BLNF is guarded by an "LGreaterEqual(OSYS, 0x07D6)" guard, so I guess
> for newer operating systems, all the functionality is also disabled o=
n
> Haswell.

Sorry, you lost me.  What functionality do you think is disabled where,
specifically?

> But BLNF also sets "AHKF |=3D One", which triggers this code path
> containing just a "Notify (\_SB.FEXT, 0x80)", but since it's actually
> never called, I get no notifications - how did I ever get notificatio=
ns?
>=20
> ...
>=20
> until I have pressed the "touchpad" button, which changes AHKF to 8 -
> permanently - and now I get notifications from all buttons, since all
> use _L11 :-(

Did you mean _L21?  I assume you were talking about Skylakes above, but
_L11 is not used on these.

Also, what do you mean you "get notifications from all buttons"?  Pleas=
e
clarify.

> So I actually never got any direct ACPI events from the brightness
> control, but this was just toggled because of the "touchpad" key,
> enabling the notifications=E2=80=A6
>=20
> And then I "instrumented" all if's by dumping the value just before t=
he
> if =3D> everything is always 0, except the permanent 8 in AHKF after
> pressing the "touchpad" button.

What do you mean by "everything"?  Please be specific, reading ACPI cod=
e
is already hard as it is.  I would guess you meant BSWF, RFHF, AHKF and
IRBF, but guessing will not get us far.

> So - just for the sake of it, I had a look for some AHKF code and the
> button function S000 got new code to handle AHKF - both brightness (A=
KA
> BSWF AKA AHKF & One) and the touchpad (AKA AHKF & 0x08)

I think you are missing the point.  The fact that BLNF always sets some
bit in AHKF is meaningless, because even if you got notified about that
in some manner, you still wouldn't know whether brightness is supposed
to be increased or decreased.  The only way ACPI code makes that
distinction is using BSWF, which is apparently broken.

> But this is just called, if you call the ACPI button function in the
> device driver.
>=20
> Which leaves me with the problem, that BSWF is always 0.

This looks awfully like the issue I had with a Dell machine and a
certain hotkey [1].  It later turned out that ACPI variables are set to
different values after a certain "magical" SMBIOS call is made.
Meanwhile the same hotkey worked just fine on other models without any
prior initialization.  The case we are looking at here might be similar=
,
i.e. something worked on Haswells without any initialization, but
Skylakes require some special call before brightness-related key presse=
s
are properly reported.

> >>> To sum up, I see no immediate reason for brightness control not t=
o work
> >>> on Skylakes, so you will have to get your hands a bit dirty to ge=
t to
> >>> the bottom of this (and it might still not yield a solution).
>=20
> That's enough for today.
>=20
> I'm quite sure Fujitsu changed the in-ACPI-HW-touchpad-disable-handli=
ng
> to be done by the driver.

Sorry, the above sentence does not parse for me.

> I don't know, why / how the brightness keys are working in Windows.

Perhaps this is the time to explore the Windows path after all.  My
guess would be brightness-related hotkeys do not work on a Windows
instance with no Fujitsu-supplied software.

BTW, I did some more fiddling with _L11 on my Haswell and it seems its
code run before the BSWF check is identical to that found in _L21 on
Skylakes.  Moreover, BSWF equals 0 before the FSMI call.  Which means
that BSWF is written to by the processor in response to an SMM call.
Which in turn means we will not be able to debug why it writes 0 and no=
t
1 or 2 without assistance from Fujitsu or a successful attempt to figur=
e
out how the Fujitsu-supplied Windows software works.

[1] https://www.spinics.net/lists/platform-driver-x86/msg07094.html

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
