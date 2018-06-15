From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Fri, 15 Jun 2018 21:09:15 +0200
Message-ID: <20180615190915.cdntdeesc52ei35u@pali>
References: <20180608111057.4wxpg7m7nm7suf6n@pali>
 <20180615112606.GA3986@amd>
 <20180615113728.h7snxhe2juaqvjyx@pali>
 <20180615123007.nxsymdvr3nj3it5i@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nxzveii33etgxj24"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180615123007.nxsymdvr3nj3it5i@khazad-dum.debian.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Pavel Machek <pavel@ucw.cz>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--nxzveii33etgxj24
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Friday 15 June 2018 09:30:07 Henrique de Moraes Holschuh wrote:
> On Fri, 15 Jun 2018, Pali Roh=C3=A1r wrote:
> > Henrique, any idea why there are no exported led classes for mute and
> > micmute? And how are suppose to be controlled?
>=20
> I have to look into the code, it was contributed by someone who had
> access to the proper hardware to test it.
>=20
> But the way *I* would like it to work is this:
>=20
> 1. When implemented in *hardware* or *EC*, let the hardware and EC take
>    full control, and never allow the operating system to mess with it.
>    So, it becomes much harder for that LED to "lie".

This means that kernel should not export any led class device. Or when
exported, then "set" operation should always fail.

> 2. Otherwise implement it in-kernel, so that userspace cannot unmute
>    when the human has activated the "mute" switch, and the LED cannot be
>    controlled by userspace to lie (report mute when it is not mute).

This looks like a good candidate to use led "trigger" interface. Create
a mute trigger and attach it to that led device.

I hope that this is what Pavel means.

> It might, or might not be possible to achieve the above.
>=20
> > > With thinkpad_acpi.ko unloaded, hardware drives the LEDs, so nothing
> > > for us to do...
> >=20
> > So somehow tell thinkpad_acpi.ko to let hardware control those LEDs when
> > thinkpad_acpi.ko is loaded?
>=20
> I.e. look into the DSDT and XSDT, to find out what it is doing.  It will
> be there: it is very rare for the thinkpad EC itself to implement these
> behavior changes.

DSDT helped. Thanks!

Function with "EC.LED" name is self explaining and also "EC.HKEY". I
used acpi_call.ko for debugging and here are results how to control
these two leds on ThinkPad T480s:

        Scope (\_SB.PCI0.LPCB.EC.HKEY)
        {
            Method (MMTG, 0, NotSerialized)
            {
                Local0 =3D 0x0101
                If (HDMC)
                {
                    Local0 |=3D 0x00010000
                }

                Return (Local0)
            }

            Method (MMTS, 1, NotSerialized)
            {
                If (HDMC)
                {
                    Noop
                }
                ElseIf (Arg0 =3D=3D 0x02)
                {
                    \_SB.PCI0.LPCB.EC.LED (0x0E, 0x80)
                }
                ElseIf (Arg0 =3D=3D 0x03)
                {
                    \_SB.PCI0.LPCB.EC.LED (0x0E, 0xC0)
                }
                Else
                {
                    \_SB.PCI0.LPCB.EC.LED (0x0E, 0x00)
                }
            }
        }

        Scope (\_SB.PCI0.LPCB.EC.HKEY)
        {
            Method (GSMS, 1, NotSerialized)
            {
                Return (\AUDC (0x00, 0x00))
            }

            Method (SSMS, 1, NotSerialized)
            {
                Return (\AUDC (0x01, (Arg0 & 0x01)))
            }

            Method (SHDA, 1, NotSerialized)
            {
                Local0 =3D Arg0
                If ((OSYS >=3D 0x07DF) && (Local0 =3D=3D 0x01))
                {
                    Local0 =3D 0x02
                }

                Return (\AUDC (0x02, (Local0 & 0x03)))
            }
        }

    Method (AUDC, 2, NotSerialized)
    {
        Return (SMI (0x14, 0x07, Arg0, Arg1, 0x00))
    }

MMTS controls mic mute led. When Arg0 is 0x02 then mic mute led is
turned on. When it is 0x03 then it starts blinking. And otherwise is
turned off. MM in name probably means MicMute and S as set. I guess that
MMTG (G as get) would return capabilities as it returns constant.

blink: echo "\_SB.PCI0.LPCB.EC.HKEY.MMTS 3" > /proc/acpi/call
on:    echo "\_SB.PCI0.LPCB.EC.HKEY.MMTS 2" > /proc/acpi/call
off:   echo "\_SB.PCI0.LPCB.EC.HKEY.MMTS 0" > /proc/acpi/call

SSMS controls mute led. It calls some SMI method via AUDC. When Arg0 has
first bit set to one then mute led is turned on. When set to zero then
is turned off. GSMS takes one parameter, but ignores it. When mute led
is turned off then it returns 0x100. When mute led is turned on then it
return 0x101. So looks like that "G" in GSMS means "get" and "S" in SSMS
means set. What is SHDA doing, I have not figured out. It does not
change GSMS result nor led status. When called with argument 1..10 then
it returns always returned 0x0 except for 3 and 7 it returned
0x80000000. There is no blinking support (or at least I have not figured
out).

on:    echo "\_SB.PCI0.LPCB.EC.HKEY.SSMS 1" > /proc/acpi/call
off:   echo "\_SB.PCI0.LPCB.EC.HKEY.SSMS 0" > /proc/acpi/call

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nxzveii33etgxj24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCWyQO2AAKCRCL8Mk9A+RD
UsbLAJ9Z/rS7vsdYqcH3z2t3XJ/NaSbjDwCfXG/D1KRqD6yO8rv0s/CCEfKLJcM=
=lPFY
-----END PGP SIGNATURE-----

--nxzveii33etgxj24--
