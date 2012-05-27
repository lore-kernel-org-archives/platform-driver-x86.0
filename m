From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: Acer-WMI: Iconia TAB W500 gyrosensor
Date: Mon, 28 May 2012 00:47:27 +0200
Message-ID: <201205280047.27466.marek.vasut@gmail.com>
References: <201205011731.24642.marek.vasut@gmail.com> <1338135667.9751.3872.camel@linux-s257.site> <201205272358.14249.marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:44766 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751014Ab2E0Wrb convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 May 2012 18:47:31 -0400
Received: by wgbdr13 with SMTP id dr13so2413075wgb.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 May 2012 15:47:30 -0700 (PDT)
In-Reply-To: <201205272358.14249.marek.vasut@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org

Dear joeyli,

> > =E6=96=BC =E6=97=A5=EF=BC=8C2012-05-27 =E6=96=BC 23:45 +0800=EF=BC=8C=
joeyli =E6=8F=90=E5=88=B0=EF=BC=9A
> >=20
> > > =E6=96=BC =E6=97=A5=EF=BC=8C2012-05-27 =E6=96=BC 10:28 +0200=EF=BC=
=8CMarek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
> > >=20
> > > > Dear joeyli,
> > > >=20
> > > > > > Hi Marek,
> > > > > >=20
> > > > > > =E6=96=BC =E4=B8=80=EF=BC=8C2012-05-07 =E6=96=BC 21:38 +020=
0=EF=BC=8CMarek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
> > > > > >=20
> > > > > > > > > > Now it gets interesting ;-)
> > > > > > > > > >=20
> > > > > > > > > > The obj->buffer.pointer contains the following:
> > > > > > > > > > 0x05 0x01 0x00 0x00 0x00 0x00 0x00 0x00
> > > > > > > > > >=20
> > > > > > > > > > That means, return_value.function is 0x05, instead =
of
> > > > > > > > > > 0x01 (WMID_HOTKEY_EVENT).
> > > > > > > > >=20
> > > > > > > > > Yes, the 0x05 event is a event reflect to g-sensor, b=
ut I
> > > > > > > > > don't have any hardware can test it.
> > > > > > > > >=20
> > > > > > > > > Did you see any other value but not just "0x05 0x01 0=
x00
> > > > > > > > > 0x00 0x00 0x00 0x00 0x00" ?
> > > > > > > >=20
> > > > > > > > Nope, nothing at all. I flipped it back and forth, no r=
esult
> > > > > > > > :(
> > > > > > > >=20
> > > > > > > > > I mean if you invert your table, did you see other re=
turn
> > > > > > > > > value? The return data must point to Portrait or Land=
scape
> > > > > > > > > view.
> > > > > > > >=20
> > > > > > > > Nope, still zeroes. This is only some interrupt-like ev=
ent I
> > > > > > > > believe. My opinion is, I need to call some WMI method =
to
> > > > > > > > actually read-back the data.
> >=20
> > ...
> >=20
> > > > > > Sorry! I am sticking on another critical issue. I will find=
 a
> > > > > > time to trace TAB's DSDT at this week.
> > > > >=20
> > > > > No need to be sorry, I know exactly what you mean :) No need =
to
> > > > > rush, I'm stuck with a few bugs at work too.
> > > >=20
> > > > Hi, I'm starting to get curious again. Did you had time to look=
 into
> > > > it? Thanks in advance!
> > >=20
> > > Sorry for I am late to reply you!
> >=20
> > ...
> >=20
> > > I checked your DSDT, unfortunately I found the logic is empty for
> > > G-sesor in W500's DSDT.
> > >=20
> > > I mean, that's right we got only g-sensor event but didn't have s=
ensor
> > > state data, because they didn't put the return value in DSDT!
> > >=20
> > > On you TAB W500, the _Q7C method should run by EC when G-sensor
> > > detected
> > >=20
> > > state change:
> > >         Method (_Q7C, 0, NotSerialized)
> > >         {
> > >        =20
> > >             If (LEqual (^^SENR.GSLC, Zero))                     /=
* G
> > >             sensor enabled? */ {
> > >            =20
> > >                 Store (0x05, Index (^^^WMID.FEBC, Zero))        /=
* 0x05
> > >                 is Sensor Event */ Store (One, Index (^^^WMID.FEB=
C,
> > >                 One))          /* 0x01 is G-Sensor */ Notify (WMI=
D,
> > >                 0xBC)
> > >            =20
> > >             }
> > >            =20
> > >             If (LMST)
> > >             {
> > >            =20
> > >                 Return (Zero)
> > >            =20
> > >             }
> > >        =20
> > >         }
> > >=20
> > > You can enable ACPI debug message to verify _Q7C method run when =
you
> > > reverse TAB, add the
> > >=20
> > > following kernel parameter and reboot:
> > >  acpi.debug_level=3D0x0000000F acpi.debug_layer=3D0xffffffff log_=
buf_len=3D5M
> > >=20
> > > The WMI event code in DSDT like this:
> > >             Method (EVBC, 0, NotSerialized)             /* call b=
y _WED
> > >             */ {
> > >=20
> > > ...
> > >=20
> > >                 If (LEqual (Local0, One))               /* hotkey=
 event
> > >                 */ {
> > >=20
> > > ...
> > >=20
> > >                         If (LEqual (Local0, 0x05)) {}
> > >                         /* 0x05 is Sensor Event, why empty? */
> > >=20
> > > ...
> > >=20
> > >                 Store (Zero, Index (FEBC, 0x04))		/* all set to
>=20
> zero */
>=20
> > >                 Store (Zero, Index (FEBC, 0x05))
> > >                 Store (Zero, Index (FEBC, 0x06))
> > >                 Store (Zero, Index (FEBC, 0x07))
> > >=20
> > > ...
> > >=20
> > >                 Return (FEBC)
> > >            =20
> > >             }
> > >=20
> > > That's why we receive a G-sensor event but didn't have orientatio=
n
> > > information of TAB. On windows platform, I believe there have ano=
ther
> > > driver listen and handle this g-sensor event when tab turned.
> >=20
> > OK, there havse a "BST0001" acpi device should handle by a g-sensor
> >=20
> > driver or a special acpi driver:
> >     Scope (_SB.PCI0.LPC0)
> >     {
> >    =20
> >         Device (SENR)
> >         {
> >        =20
> >             Name (_HID, "BST0001")
> >             Name (_UID, Zero)
> >             Name (_STA, 0x0F)
> >             Name (GSLC, Zero)           /* G-sensor lock? */
> >             Name (GSLX, Zero)		/* X */
> >             Name (GSLY, Zero)		/* Y */
> >             Name (GSLZ, Zero)		/* Z */
> >=20
> > ...
> >=20
> >             Method (_INI, 0, NotSerialized)
> >=20
> > ...
> >=20
> >             Method (RDST, 0, NotSerialized)
> >             {
> >=20
> > ...
> >=20
> >             Method (RDVL, 0, NotSerialized)
> >             {
> >=20
> > ...
> >=20
> >             Method (WRVL, 1, NotSerialized)
> >             {
> >=20
> > ...
> >=20
> >=20
> > There have 3 methods "RDST", "RDVL" and "WRVL", currently, no idea =
for
> > what functions provided by those 3 methods.
> >=20
> > my _GUESS_:
> > 	"RDST" is read state?
> > 	"RDVL" is read value(what!?)
> > 	"WRVL" is write value?
> >=20
> > My idea is just find out which method is for read the orientation o=
f
> > G-sensor then we can use a driver raise it to userland.
>=20
> Well, I'm getting somewhere, thanks for all your hints, they really b=
lasted
> me forward!
>=20
> So, calling the _INI function, I get value of the G-Sensor kill switc=
h
> (there's a toggle on the bottom of the tablet to enable/disable input=
 from
> the accelerometer). So _INI returns integer, 0 for GS enabled, 1 for =
GS
> disabled. I didn't get further (yet). Will keep you in loop!
>=20
> Thanks!

Ok, I'm even getting values from RDVL now. I hope to come up with a pat=
ch soon.

>=20
> > Thanks a lot!
> > Joey Lee
