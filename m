From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] ACER: Add support for accelerometer sensor
Date: Tue, 29 May 2012 16:00:02 +0800
Message-ID: <1338278402.9751.4201.camel@linux-s257.site>
References: <1338162291-21343-1-git-send-email-marex@denx.de>
	 <201205281234.15981.marex@denx.de>
	 <1338257194.9751.4158.camel@linux-s257.site>
	 <201205290722.50810.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from nat.nue.novell.com ([195.135.221.2]:56730 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751071Ab2E2IEI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 May 2012 04:04:08 -0400
In-Reply-To: <201205290722.50810.marex@denx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=8C=EF=BC=8C2012-05-29 =E6=96=BC 07:22 +0200=EF=BC=8CMa=
rek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
> Dear joeyli,
>=20
> > Hi Marek,
> >=20
> > =E6=96=BC =E4=B8=80=EF=BC=8C2012-05-28 =E6=96=BC 12:34 +0200=EF=BC=8C=
Marek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
> >=20
>=20
> [...]

> > information about BST0001 and RDVL. I think BST0001 is a special de=
vice
> > handle by G-sensor driver on Windows.
> >=20
> > But, as our trace on W500 TAB, they didn't return this information
> > through wmi event.
> >=20
> > Currently, only way is GUESS what's the result from RDVL.
>=20
> Well, I finally figured that out. It's a rotation vector sensor, the =
result is=20
> sin(angle) in x/y/z direction.
>=20
> It maps to this rotation around a ball:
> http://developer.android.com/reference/android/hardware/SensorEvent.h=
tml (see=20
> Sensor.TYPE_ROTATION_VECTOR: )
>=20

I see!

Per my colleague's information, udev should calculate orientation and
raise it to X-window.

> >=20
> > For how to detect G-sensor in machine, BIOS write the device inform=
ation
> > to type ABh in POST stage, on your machine like this:
> >=20
> > OEM-specific Type
> >         Header and Data:
> >                 AB 27 19 00 01 02 10 04 98 05 02 10 83 43 07 8C
> >                 16 2B 00 03 DA 0B 38 01 04 4E 06 0C D2 04 4E 06
> >                 0C D2 08 F3 0C 19 E0
> >=20
> > You can reference my type_aa_dmi_decode function in acer-wmi to par=
se
> > type AB:
> >=20
> > The format is:
> > 	offset 00: type AB
> > 	offset 01: length 27
> > 	offset 02 (WORD): Handle
> >=20
> > Then, follow many devices type and vid/pid, on your machine:
> >=20
> > 05 02 10 83 43
> > 05 =3D Audio
> > 1002 =3D VID
> > 4383 =3D PID
> >=20
> > 07 8C 16 2B 00
> > 07 =3D Wireless LAN
> > 168C
> > 002B
> > ...
> >=20
> > We can guess what's the device type through vid/pid.
> > Per their document, G-sensor's type is 0x0E, but, I didn't see this
> > device from your dmidecode log. It should like this:
> >=20
> > 0E xx xx xx xx
> >=20
> > Did you disable G-sensor when you capture dmidecode log?
>=20
> I don't think it's possible to disable it, it's always enabled it see=
ms to me.=20
> It's only possible to flip a switch that makes it stop producing ACPI=
 events.
>=20

I am not sure does it possible walk through pci or USB bus to detect
G-sensor exist?
If not, then the only one way is always run acer_wmi_accel_setup() to
detect "BST0001" exist or not.


Thanks a lot!
Joey Lee
=20
