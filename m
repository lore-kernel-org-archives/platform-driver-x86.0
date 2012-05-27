From: joeyli <jlee@suse.com>
Subject: Re: Acer-WMI: Iconia TAB W500 gyrosensor
Date: Mon, 28 May 2012 00:21:07 +0800
Message-ID: <1338135667.9751.3872.camel@linux-s257.site>
References: <201205011731.24642.marek.vasut@gmail.com>
	 <1336436380.5272.5047.camel@linux-s257.site>
	 <201205080345.44070.marek.vasut@gmail.com>
	 <201205271028.55484.marek.vasut@gmail.com>
	 <1338133547.9751.3824.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from nat.nue.novell.com ([195.135.221.2]:25796 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752332Ab2E0QZH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 May 2012 12:25:07 -0400
In-Reply-To: <1338133547.9751.3824.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

=E6=96=BC =E6=97=A5=EF=BC=8C2012-05-27 =E6=96=BC 23:45 +0800=EF=BC=8Cjo=
eyli =E6=8F=90=E5=88=B0=EF=BC=9A
> =E6=96=BC =E6=97=A5=EF=BC=8C2012-05-27 =E6=96=BC 10:28 +0200=EF=BC=8C=
Marek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
> > Dear joeyli,
> >=20
> > > > Hi Marek,
> > > >=20
> > > > =E6=96=BC =E4=B8=80=EF=BC=8C2012-05-07 =E6=96=BC 21:38 +0200=EF=
=BC=8CMarek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
> > > >=20
> > > > > > > >=20
> > > > > > > > Now it gets interesting ;-)
> > > > > > > >=20
> > > > > > > > The obj->buffer.pointer contains the following:
> > > > > > > > 0x05 0x01 0x00 0x00 0x00 0x00 0x00 0x00
> > > > > > > >=20
> > > > > > > > That means, return_value.function is 0x05, instead of 0=
x01
> > > > > > > > (WMID_HOTKEY_EVENT).
> > > > > > >=20
> > > > > > > Yes, the 0x05 event is a event reflect to g-sensor, but I=
 don't
> > > > > > > have any hardware can test it.
> > > > > > >=20
> > > > > > > Did you see any other value but not just "0x05 0x01 0x00 =
0x00 0x00
> > > > > > > 0x00 0x00 0x00" ?
> > > > > >=20
> > > > > > Nope, nothing at all. I flipped it back and forth, no resul=
t :(
> > > > > >=20
> > > > > > > I mean if you invert your table, did you see other return=
 value?
> > > > > > > The return data must point to Portrait or Landscape view.
> > > > > >=20
> > > > > > Nope, still zeroes. This is only some interrupt-like event =
I believe.
> > > > > > My opinion is, I need to call some WMI method to actually r=
ead-back
> > > > > > the data.
> > > > > >=20
> > > > > >=20
=2E..
> > > >=20
> > > > Sorry! I am sticking on another critical issue. I will find a t=
ime to
> > > > trace TAB's DSDT at this week.
> > >=20
> > > No need to be sorry, I know exactly what you mean :) No need to r=
ush, I'm
> > > stuck with a few bugs at work too.
> >=20
> > Hi, I'm starting to get curious again. Did you had time to look int=
o it? Thanks=20
> > in advance!
> >=20
>=20
> Sorry for I am late to reply you!
=2E..
> >=20
>=20
> I checked your DSDT, unfortunately I found the logic is empty for
> G-sesor in W500's DSDT.
>=20
> I mean, that's right we got only g-sensor event but didn't have senso=
r
> state data, because they didn't put the return value in DSDT!
>=20
> On you TAB W500, the _Q7C method should run by EC when G-sensor detec=
ted
> state change:
>=20
>         Method (_Q7C, 0, NotSerialized)
>         {
>             If (LEqual (^^SENR.GSLC, Zero))                     /* G =
sensor enabled? */
>             {
>                 Store (0x05, Index (^^^WMID.FEBC, Zero))        /* 0x=
05 is Sensor Event */
>                 Store (One, Index (^^^WMID.FEBC, One))          /* 0x=
01 is G-Sensor */
>                 Notify (WMID, 0xBC)
>             }
>=20
>             If (LMST)
>             {
>                 Return (Zero)
>             }
>         }
>=20
> You can enable ACPI debug message to verify _Q7C method run when you =
reverse TAB, add the
> following kernel parameter and reboot:
>=20
>  acpi.debug_level=3D0x0000000F acpi.debug_layer=3D0xffffffff log_buf_=
len=3D5M
>=20
>=20
> The WMI event code in DSDT like this:
>=20
>             Method (EVBC, 0, NotSerialized)             /* call by _W=
ED */
>             {
> ...
>                 If (LEqual (Local0, One))               /* hotkey eve=
nt */
>                 {
> ...
>                         If (LEqual (Local0, 0x05)) {}                =
   /* 0x05 is Sensor Event, why empty? */
> ...
>                 Store (Zero, Index (FEBC, 0x04))		/* all set to zero =
*/
>                 Store (Zero, Index (FEBC, 0x05))
>                 Store (Zero, Index (FEBC, 0x06))
>                 Store (Zero, Index (FEBC, 0x07))
> ...
>                 Return (FEBC)
>             }
>=20
>=20
> That's why we receive a G-sensor event but didn't have orientation in=
formation of TAB.
> On windows platform, I believe there have another driver listen and h=
andle this g-sensor event when tab turned.
>=20

OK, there havse a "BST0001" acpi device should handle by a g-sensor
driver or a special acpi driver:

    Scope (_SB.PCI0.LPC0)
    {
        Device (SENR)
        {
            Name (_HID, "BST0001")
            Name (_UID, Zero)
            Name (_STA, 0x0F)
            Name (GSLC, Zero)           /* G-sensor lock? */
            Name (GSLX, Zero)		/* X */
            Name (GSLY, Zero)		/* Y */
            Name (GSLZ, Zero)		/* Z */
=2E..
            Method (_INI, 0, NotSerialized)
=2E..
            Method (RDST, 0, NotSerialized)
            {
=2E..
            Method (RDVL, 0, NotSerialized)
            {
=2E..
            Method (WRVL, 1, NotSerialized)
            {
=2E..


There have 3 methods "RDST", "RDVL" and "WRVL", currently, no idea for
what functions provided by those 3 methods.

my _GUESS_:
	"RDST" is read state?
	"RDVL" is read value(what!?)
	"WRVL" is write value?

My idea is just find out which method is for read the orientation of
G-sensor then we can use a driver raise it to userland.


Thanks a lot!
Joey Lee
