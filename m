From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Fri, 24 Jun 2016 11:22:14 +0200
Message-ID: <576CFBC6.2000309@fbihome.de>
References: <20160622073213.GD3056@eudyptula.hq.kempniu.pl>
 <576A6604.8010907@fbihome.de> <20160622105333.GD25599@marvin.atrad.com.au>
 <576A7519.9040703@fbihome.de> <20160622123941.GB2466@eudyptula.hq.kempniu.pl>
 <576A90FB.9090506@fbihome.de> <20160623111819.GA4284@eudyptula.hq.kempniu.pl>
 <576BD150.6050304@fbihome.de> <20160623123506.GA4461@eudyptula.hq.kempniu.pl>
 <576C1B0C.5050206@fbihome.de> <20160624071224.GA5289@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironman.h-da.de ([141.100.10.250]:13381 "EHLO ironman.h-da.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751121AbcFXJWp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jun 2016 05:22:45 -0400
In-Reply-To: <20160624071224.GA5289@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

Am 24.06.2016 um 09:12 schrieb Micha=C5=82 K=C4=99pie=C5=84:
>> Hmm - so I got
>> [  561.809723] [ACPI Debug 64952760]  Integer 0x0000000000000000
>> for my Store (BSWF, Debug) call.
>=20
> This is the core issue.
>=20
>> Then I had a look at the \_SB.PCI0.GFX0.LCD.BLNF () function in my
>> ssdt7.dsl, and it sets "BSWF =3D Zero" as the 2nd last call. And it'=
s the
>> same in the ssdt6.dsl of the Haswell hardware, except there the call=
 to
>> BLNF is guarded by an "LGreaterEqual(OSYS, 0x07D6)" guard, so I gues=
s
>> for newer operating systems, all the functionality is also disabled =
on
>> Haswell.
>=20
> Sorry, you lost me.  What functionality do you think is disabled wher=
e,
> specifically?

Probably the day was too long.

I just saw, that the code path is the same for Haswell and Skylake, if
OSYS >=3D 0x07D6
I missed that on Haswell BSWF is not 0, when a key is pressed, wight?

>> But BLNF also sets "AHKF |=3D One", which triggers this code path
>> containing just a "Notify (\_SB.FEXT, 0x80)", but since it's actuall=
y
>> never called, I get no notifications - how did I ever get notificati=
ons?
>>
>> ...
>>
>> until I have pressed the "touchpad" button, which changes AHKF to 8 =
-
>> permanently - and now I get notifications from all buttons, since al=
l
>> use _L11 :-(
>=20
> Did you mean _L21?  I assume you were talking about Skylakes above, b=
ut
> _L11 is not used on these.

Yup.

> Also, what do you mean you "get notifications from all buttons"?  Ple=
ase
> clarify.

All three key combinations are handled via _L21.
I originally thought that "Notify (\_SB.FEXT, 0x80)" was generated for
all of them, but I was wrong.

If I don't press the touchpad key, which sets AHKF to 0x8, AHKF stays a=
t
0, and I don't get any notify call for the brightness keys. And since
AHKF is stuck to 0x8, until a driver calls the S000 function, it seemed
to me, that the brightness keys generate the notify events, which they
"logically" don't do.

>> So I actually never got any direct ACPI events from the brightness
>> control, but this was just toggled because of the "touchpad" key,
>> enabling the notifications=E2=80=A6
>>
>> And then I "instrumented" all if's by dumping the value just before =
the
>> if =3D> everything is always 0, except the permanent 8 in AHKF after
>> pressing the "touchpad" button.
>=20
> What do you mean by "everything"?  Please be specific, reading ACPI c=
ode
> is already hard as it is.  I would guess you meant BSWF, RFHF, AHKF a=
nd
> IRBF, but guessing will not get us far.

My _L21:

DefinitionBlock ("", "DSDT", 2, "FUJ   ", "FJNB293 ", 0x010A0000)
{
    External (AHKF)
    External (BSWF)
    External (DSEN)
    External (DSWF)
    External (GINT)
    External (IRBC)
    External (IRBF)
    External (LCDA)
    External (RFHF)
    External (RFSW)
    External (\_SB.FEXT)
    External (\_SB.PCI0.GFX0.DD1F._DCS)
    External (WSEF)

    External (\FSMI, MethodObj)
    External (\_GPE.SWPC, MethodObj)
    External (\_SB.FEXT.SIRB, MethodObj)
    External (\_SB.PCI0.GFX0.DD1F.BLNF, MethodObj)

    Method (\_GPE._L21, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
    {
        Store (0xDEADBEAF, Debug)
        Store (Zero, DSWF)
        If (LEqual (\_SB.PCI0.GFX0.DD1F._DCS, 0x1F))
        {
            Store (One, LCDA)
        }
        Else
        {
            Store (Zero, LCDA)
        }
        Store (LCDA, Debug)

        FSMI (0x89, Zero, Zero)

        Store (DSEN, Debug)
        Store (DSWF, Debug)

        If (LAnd (LEqual (And (DSEN, 0x03), Zero), DSWF))
        {
            Store (One, Debug)
            SWPC ()
        }

        Store (BSWF, Debug)
        If (BSWF)
        {
            \_SB.PCI0.GFX0.DD1F.BLNF ()
        }

        Store (RFHF, Debug)
        If (RFHF)
        {
            Store (One, WSEF)
            Notify (\_SB.FEXT, 0x80)
            Store (ShiftRight (RFHF, One), RFSW)
            Store (Zero, RFHF)
        }

        Store (AHKF, Debug)
        If (AHKF)
        {
            Notify (\_SB.FEXT, 0x80)
        }

        Store (IRBF, Debug)
        If (IRBF)
        {
            If (LEqual (IRBC, 0xFD00))
            {
                Store (One, GINT)
            }
            Else
            {
                \_SB.FEXT.SIRB (IRBC)
            }

            Notify (\_SB.FEXT, 0x80)
            Store (Zero, IRBF)
        }
    }
}

dmesg output

Press brightness
[ 4924.223692] [ACPI Debug 65675410]  Integer 0x00000000DEADBEAF
[ 4924.224258] [ACPI Debug 65675982]  Integer 0x0000000000000000
[ 4924.228018] [ACPI Debug 65679741]  Integer 0x0000000000000000
[ 4924.228065] [ACPI Debug 65679791]  Integer 0x0000000000000000
[ 4924.228175] [ACPI Debug 65679901]  Integer 0x0000000000000000
[ 4924.228250] [ACPI Debug 65679977]  Integer 0x0000000000000000
[ 4924.228325] [ACPI Debug 65680052]  Integer 0x0000000000000000
[ 4924.228400] [ACPI Debug 65680127]  Integer 0x0000000000000000
Press touchpad
[ 4942.346856] [ACPI Debug 16690175]  Integer 0x00000000DEADBEAF
[ 4942.347414] [ACPI Debug 16690739]  Integer 0x0000000000000000
[ 4942.351169] [ACPI Debug 16694492]  Integer 0x0000000000000000
[ 4942.351216] [ACPI Debug 16694542]  Integer 0x0000000000000000
[ 4942.351327] [ACPI Debug 16694653]  Integer 0x0000000000000000
[ 4942.351403] [ACPI Debug 16694730]  Integer 0x0000000000000000
[ 4942.351479] [ACPI Debug 16694806]  Integer 0x0000000000000008
[ 4942.351572] [ACPI Debug 16694898]  Integer 0x0000000000000000
Press brightness
[ 4943.381885] [ACPI Debug 17725230]  Integer 0x00000000DEADBEAF
[ 4943.382553] [ACPI Debug 17725902]  Integer 0x0000000000000000
[ 4943.386264] [ACPI Debug 17729614]  Integer 0x0000000000000000
[ 4943.386310] [ACPI Debug 17729662]  Integer 0x0000000000000000
[ 4943.386418] [ACPI Debug 17729771]  Integer 0x0000000000000000
[ 4943.386495] [ACPI Debug 17729848]  Integer 0x0000000000000000
[ 4943.386569] [ACPI Debug 17729922]  Integer 0x0000000000000008
[ 4943.386621] [ACPI Debug 17729975]  Integer 0x0000000000000000

>> So - just for the sake of it, I had a look for some AHKF code and th=
e
>> button function S000 got new code to handle AHKF - both brightness (=
AKA
>> BSWF AKA AHKF & One) and the touchpad (AKA AHKF & 0x08)
>=20
> I think you are missing the point.  The fact that BLNF always sets so=
me
> bit in AHKF is meaningless, because even if you got notified about th=
at
> in some manner, you still wouldn't know whether brightness is suppose=
d
> to be increased or decreased.  The only way ACPI code makes that
> distinction is using BSWF, which is apparently broken.

Yup - I didn't actually look at the Haswell ACPI handling.

>> But this is just called, if you call the ACPI button function in the
>> device driver.
>>
>> Which leaves me with the problem, that BSWF is always 0.
>=20
> This looks awfully like the issue I had with a Dell machine and a
> certain hotkey [1].  It later turned out that ACPI variables are set =
to
> different values after a certain "magical" SMBIOS call is made.
> Meanwhile the same hotkey worked just fine on other models without an=
y
> prior initialization.  The case we are looking at here might be simil=
ar,
> i.e. something worked on Haswells without any initialization, but
> Skylakes require some special call before brightness-related key pres=
ses
> are properly reported.
>=20
>>>>> To sum up, I see no immediate reason for brightness control not t=
o work
>>>>> on Skylakes, so you will have to get your hands a bit dirty to ge=
t to
>>>>> the bottom of this (and it might still not yield a solution).
>>
>> That's enough for today.
>>
>> I'm quite sure Fujitsu changed the in-ACPI-HW-touchpad-disable-handl=
ing
>> to be done by the driver.
>=20
> Sorry, the above sentence does not parse for me.

I wanted to express, that currently the only conclusion I took from all
the reading and testing of ACPI code snippets is, that Fujitsu moved th=
e
former touchpad disable handling from "in hardware" to "to be handled b=
y
the driver", as there is now code in the S000 function:

// Brightness
If (And (AHKF, One))
{
    Or (Local0, 0x02000000, Local0)
    XOr (AHKF, One, AHKF)
}

// Touchpad
If (And (AHKF, 0x08))
{
    Or (Local0, 0x04000000, Local0)
    XOr (AHKF, 0x08, AHKF)
}

So you still have to call another function from the driver to know, if
the brightness level went up or down, but a key indication is there.

And they added the 0x02000000 and 0x04000000 values to the bitmask they
generate when you call S000 with Arg0 =3D 0

>> I don't know, why / how the brightness keys are working in Windows.
>=20
> Perhaps this is the time to explore the Windows path after all.  My
> guess would be brightness-related hotkeys do not work on a Windows
> instance with no Fujitsu-supplied software.
>=20
> BTW, I did some more fiddling with _L11 on my Haswell and it seems it=
s
> code run before the BSWF check is identical to that found in _L21 on
> Skylakes.  Moreover, BSWF equals 0 before the FSMI call.

So for you the FSMI call changes the BSWF value.

> Which means
> that BSWF is written to by the processor in response to an SMM call.
> Which in turn means we will not be able to debug why it writes 0 and =
not
> 1 or 2 without assistance from Fujitsu or a successful attempt to fig=
ure
> out how the Fujitsu-supplied Windows software works.

Hmm.

So I got a reply from my vendor CC some Fujitsu persons.

They claim the non-working brightness buttons is an error in an Intel
driver and they are going to contact the Linux/Ubuntu community.

I'll point them to this thread.

No news yet about the touchpad key.

Regards,

Jan-Marek
