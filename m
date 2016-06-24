From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Fri, 24 Jun 2016 12:20:24 +0200
Message-ID: <20160624102024.GA5461@eudyptula.hq.kempniu.pl>
References: <20160622105333.GD25599@marvin.atrad.com.au>
 <576A7519.9040703@fbihome.de>
 <20160622123941.GB2466@eudyptula.hq.kempniu.pl>
 <576A90FB.9090506@fbihome.de>
 <20160623111819.GA4284@eudyptula.hq.kempniu.pl>
 <576BD150.6050304@fbihome.de>
 <20160623123506.GA4461@eudyptula.hq.kempniu.pl>
 <576C1B0C.5050206@fbihome.de>
 <20160624071224.GA5289@eudyptula.hq.kempniu.pl>
 <576CFBC6.2000309@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:38057 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751001AbcFXKUa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jun 2016 06:20:30 -0400
Received: by mail-wm0-f53.google.com with SMTP id r201so19032407wme.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jun 2016 03:20:29 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <576CFBC6.2000309@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

> >> Then I had a look at the \_SB.PCI0.GFX0.LCD.BLNF () function in my
> >> ssdt7.dsl, and it sets "BSWF =3D Zero" as the 2nd last call. And i=
t's the
> >> same in the ssdt6.dsl of the Haswell hardware, except there the ca=
ll to
> >> BLNF is guarded by an "LGreaterEqual(OSYS, 0x07D6)" guard, so I gu=
ess
> >> for newer operating systems, all the functionality is also disable=
d on
> >> Haswell.
> >=20
> > Sorry, you lost me.  What functionality do you think is disabled wh=
ere,
> > specifically?
>=20
> Probably the day was too long.
>=20
> I just saw, that the code path is the same for Haswell and Skylake, i=
f
> OSYS >=3D 0x07D6
> I missed that on Haswell BSWF is not 0, when a key is pressed, wight?

Correct.  It is either 1 ("brightness down") or 2 ("brightness up").
Though I still fail to understand your point regarding OSYS processing.
It looks pretty clear to me: Haswells send notifications to the ACPI
video object on "newer" systems and fall back to GBLS/SBLL for
everything else; Skylakes do not have the fallback branch.

> >> But BLNF also sets "AHKF |=3D One", which triggers this code path
> >> containing just a "Notify (\_SB.FEXT, 0x80)", but since it's actua=
lly
> >> never called, I get no notifications - how did I ever get notifica=
tions?
> >>
> >> ...
> >>
> >> until I have pressed the "touchpad" button, which changes AHKF to =
8 -
> >> permanently - and now I get notifications from all buttons, since =
all
> >> use _L11 :-(
> >=20
> > Did you mean _L21?  I assume you were talking about Skylakes above,=
 but
> > _L11 is not used on these.
>=20
> Yup.
>=20
> > Also, what do you mean you "get notifications from all buttons"?  P=
lease
> > clarify.
>=20
> All three key combinations are handled via _L21.
> I originally thought that "Notify (\_SB.FEXT, 0x80)" was generated fo=
r
> all of them, but I was wrong.
>=20
> If I don't press the touchpad key, which sets AHKF to 0x8, AHKF stays=
 at
> 0, and I don't get any notify call for the brightness keys. And since
> AHKF is stuck to 0x8, until a driver calls the S000 function, it seem=
ed
> to me, that the brightness keys generate the notify events, which the=
y
> "logically" don't do.

Understood, thanks for clarifying.

> >> So I actually never got any direct ACPI events from the brightness
> >> control, but this was just toggled because of the "touchpad" key,
> >> enabling the notifications=E2=80=A6
> >>
> >> And then I "instrumented" all if's by dumping the value just befor=
e the
> >> if =3D> everything is always 0, except the permanent 8 in AHKF aft=
er
> >> pressing the "touchpad" button.
> >=20
> > What do you mean by "everything"?  Please be specific, reading ACPI=
 code
> > is already hard as it is.  I would guess you meant BSWF, RFHF, AHKF=
 and
> > IRBF, but guessing will not get us far.
>=20
> My _L21:
>=20
> (...)

All clear now, thanks.

> >> I'm quite sure Fujitsu changed the in-ACPI-HW-touchpad-disable-han=
dling
> >> to be done by the driver.
> >=20
> > Sorry, the above sentence does not parse for me.
>=20
> I wanted to express, that currently the only conclusion I took from a=
ll
> the reading and testing of ACPI code snippets is, that Fujitsu moved =
the
> former touchpad disable handling from "in hardware" to "to be handled=
 by
> the driver", as there is now code in the S000 function:
>=20
> // Brightness
> If (And (AHKF, One))
> {
>     Or (Local0, 0x02000000, Local0)
>     XOr (AHKF, One, AHKF)
> }
>=20
> // Touchpad
> If (And (AHKF, 0x08))
> {
>     Or (Local0, 0x04000000, Local0)
>     XOr (AHKF, 0x08, AHKF)
> }

Ah, okay, got it.  This means I can probably prepare an experimental
patch to support the touchpad button.

> So you still have to call another function from the driver to know, i=
f
> the brightness level went up or down, but a key indication is there.

Well, yes, but two questions still remain:

 1) Why are no brightness-related notifications sent to either the ACPI
    video device or FEXT (i.e. why is BSWF constant)?

 2) You wrote "call another function from the driver to know if the
    brightness level went up or down".  The question is _which_ functio=
n
    to call - I do not see it, do you?

> And they added the 0x02000000 and 0x04000000 values to the bitmask th=
ey
> generate when you call S000 with Arg0 =3D 0
>=20
> >> I don't know, why / how the brightness keys are working in Windows=
=2E
> >=20
> > Perhaps this is the time to explore the Windows path after all.  My
> > guess would be brightness-related hotkeys do not work on a Windows
> > instance with no Fujitsu-supplied software.
> >=20
> > BTW, I did some more fiddling with _L11 on my Haswell and it seems =
its
> > code run before the BSWF check is identical to that found in _L21 o=
n
> > Skylakes.  Moreover, BSWF equals 0 before the FSMI call.
>=20
> So for you the FSMI call changes the BSWF value.

Yes.

> > Which means
> > that BSWF is written to by the processor in response to an SMM call=
=2E
> > Which in turn means we will not be able to debug why it writes 0 an=
d not
> > 1 or 2 without assistance from Fujitsu or a successful attempt to f=
igure
> > out how the Fujitsu-supplied Windows software works.
>=20
> Hmm.
>=20
> So I got a reply from my vendor CC some Fujitsu persons.
>=20
> They claim the non-working brightness buttons is an error in an Intel
> driver and they are going to contact the Linux/Ubuntu community.

I am not sure what the Intel driver has to do with this, but hey, who a=
m
I to tell them how their hardware works?

> I'll point them to this thread.

Please do, I will be happy to help.

> No news yet about the touchpad key.

Let me think about a patch which would support it.  I will get back to
you once I have actual code.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
