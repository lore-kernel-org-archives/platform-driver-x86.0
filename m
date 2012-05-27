From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: Acer-WMI: Iconia TAB W500 gyrosensor
Date: Sun, 27 May 2012 23:58:14 +0200
Message-ID: <201205272358.14249.marek.vasut@gmail.com>
References: <201205011731.24642.marek.vasut@gmail.com> <1338133547.9751.3824.camel@linux-s257.site> <1338135667.9751.3872.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:43347 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752053Ab2E0V6W convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 May 2012 17:58:22 -0400
Received: by wgbdr13 with SMTP id dr13so2396915wgb.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 May 2012 14:58:20 -0700 (PDT)
In-Reply-To: <1338135667.9751.3872.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org

Dear joeyli,

> =E6=96=BC =E6=97=A5=EF=BC=8C2012-05-27 =E6=96=BC 23:45 +0800=EF=BC=8C=
joeyli =E6=8F=90=E5=88=B0=EF=BC=9A
>=20
> > =E6=96=BC =E6=97=A5=EF=BC=8C2012-05-27 =E6=96=BC 10:28 +0200=EF=BC=8C=
Marek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
> >=20
> > > Dear joeyli,
> > >=20
> > > > > Hi Marek,
> > > > >=20
> > > > > =E6=96=BC =E4=B8=80=EF=BC=8C2012-05-07 =E6=96=BC 21:38 +0200=EF=
=BC=8CMarek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
> > > > >=20
> > > > > > > > > Now it gets interesting ;-)
> > > > > > > > >=20
> > > > > > > > > The obj->buffer.pointer contains the following:
> > > > > > > > > 0x05 0x01 0x00 0x00 0x00 0x00 0x00 0x00
> > > > > > > > >=20
> > > > > > > > > That means, return_value.function is 0x05, instead of=
 0x01
> > > > > > > > > (WMID_HOTKEY_EVENT).
> > > > > > > >=20
> > > > > > > > Yes, the 0x05 event is a event reflect to g-sensor, but=
 I
> > > > > > > > don't have any hardware can test it.
> > > > > > > >=20
> > > > > > > > Did you see any other value but not just "0x05 0x01 0x0=
0 0x00
> > > > > > > > 0x00 0x00 0x00 0x00" ?
> > > > > > >=20
> > > > > > > Nope, nothing at all. I flipped it back and forth, no res=
ult :(
> > > > > > >=20
> > > > > > > > I mean if you invert your table, did you see other retu=
rn
> > > > > > > > value? The return data must point to Portrait or Landsc=
ape
> > > > > > > > view.
> > > > > > >=20
> > > > > > > Nope, still zeroes. This is only some interrupt-like even=
t I
> > > > > > > believe. My opinion is, I need to call some WMI method to
> > > > > > > actually read-back the data.
>=20
> ...
>=20
> > > > > Sorry! I am sticking on another critical issue. I will find a=
 time
> > > > > to trace TAB's DSDT at this week.
> > > >=20
> > > > No need to be sorry, I know exactly what you mean :) No need to=
 rush,
> > > > I'm stuck with a few bugs at work too.
> > >=20
> > > Hi, I'm starting to get curious again. Did you had time to look i=
nto
> > > it? Thanks in advance!
> >=20
> > Sorry for I am late to reply you!
>=20
> ...
>=20
> > I checked your DSDT, unfortunately I found the logic is empty for
> > G-sesor in W500's DSDT.
> >=20
> > I mean, that's right we got only g-sensor event but didn't have sen=
sor
> > state data, because they didn't put the return value in DSDT!
> >=20
> > On you TAB W500, the _Q7C method should run by EC when G-sensor det=
ected
> >=20
> > state change:
> >         Method (_Q7C, 0, NotSerialized)
> >         {
> >        =20
> >             If (LEqual (^^SENR.GSLC, Zero))                     /* =
G
> >             sensor enabled? */ {
> >            =20
> >                 Store (0x05, Index (^^^WMID.FEBC, Zero))        /* =
0x05
> >                 is Sensor Event */ Store (One, Index (^^^WMID.FEBC,
> >                 One))          /* 0x01 is G-Sensor */ Notify (WMID,
> >                 0xBC)
> >            =20
> >             }
> >            =20
> >             If (LMST)
> >             {
> >            =20
> >                 Return (Zero)
> >            =20
> >             }
> >        =20
> >         }
> >=20
> > You can enable ACPI debug message to verify _Q7C method run when yo=
u
> > reverse TAB, add the
> >=20
> > following kernel parameter and reboot:
> >  acpi.debug_level=3D0x0000000F acpi.debug_layer=3D0xffffffff log_bu=
f_len=3D5M
> >=20
> > The WMI event code in DSDT like this:
> >             Method (EVBC, 0, NotSerialized)             /* call by =
_WED
> >             */ {
> >=20
> > ...
> >=20
> >                 If (LEqual (Local0, One))               /* hotkey e=
vent
> >                 */ {
> >=20
> > ...
> >=20
> >                         If (LEqual (Local0, 0x05)) {}              =
   =20
> >                         /* 0x05 is Sensor Event, why empty? */
> >=20
> > ...
> >=20
> >                 Store (Zero, Index (FEBC, 0x04))		/* all set to=20
zero */
> >                 Store (Zero, Index (FEBC, 0x05))
> >                 Store (Zero, Index (FEBC, 0x06))
> >                 Store (Zero, Index (FEBC, 0x07))
> >=20
> > ...
> >=20
> >                 Return (FEBC)
> >            =20
> >             }
> >=20
> > That's why we receive a G-sensor event but didn't have orientation
> > information of TAB. On windows platform, I believe there have anoth=
er
> > driver listen and handle this g-sensor event when tab turned.
>=20
> OK, there havse a "BST0001" acpi device should handle by a g-sensor
> driver or a special acpi driver:
>=20
>     Scope (_SB.PCI0.LPC0)
>     {
>         Device (SENR)
>         {
>             Name (_HID, "BST0001")
>             Name (_UID, Zero)
>             Name (_STA, 0x0F)
>             Name (GSLC, Zero)           /* G-sensor lock? */
>             Name (GSLX, Zero)		/* X */
>             Name (GSLY, Zero)		/* Y */
>             Name (GSLZ, Zero)		/* Z */
> ...
>             Method (_INI, 0, NotSerialized)
> ...
>             Method (RDST, 0, NotSerialized)
>             {
> ...
>             Method (RDVL, 0, NotSerialized)
>             {
> ...
>             Method (WRVL, 1, NotSerialized)
>             {
> ...
>=20
>=20
> There have 3 methods "RDST", "RDVL" and "WRVL", currently, no idea fo=
r
> what functions provided by those 3 methods.
>=20
> my _GUESS_:
> 	"RDST" is read state?
> 	"RDVL" is read value(what!?)
> 	"WRVL" is write value?
>=20
> My idea is just find out which method is for read the orientation of
> G-sensor then we can use a driver raise it to userland.

Well, I'm getting somewhere, thanks for all your hints, they really bla=
sted me=20
forward!

So, calling the _INI function, I get value of the G-Sensor kill switch =
(there's=20
a toggle on the bottom of the tablet to enable/disable input from the=20
accelerometer). So _INI returns integer, 0 for GS enabled, 1 for GS dis=
abled. I=20
didn't get further (yet). Will keep you in loop!

Thanks!

>=20
> Thanks a lot!
> Joey Lee

Best regards,
Marek Vasut
