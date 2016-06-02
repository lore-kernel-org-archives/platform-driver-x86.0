From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 1/2] dell-wmi, dell-laptop: hide dell-smbios
Date: Thu, 2 Jun 2016 23:03:36 +0200
Message-ID: <20160602230336.431d854a@endymion>
References: <20160526114212.2b17ee2d@endymion>
	<20160602110333.GA2575@eudyptula.hq.kempniu.pl>
	<20160602111029.GO29844@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49637 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932215AbcFBVDj convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jun 2016 17:03:39 -0400
In-Reply-To: <20160602111029.GO29844@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>

Hi Pali,

On Thu, 2 Jun 2016 13:10:29 +0200, Pali Roh=C3=A1r wrote:
> On Thursday 02 June 2016 13:03:33 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > > Dell-smbios is a helper module, it serves no purpose on its own, =
so
> > > do not present it as an option to the user. Instead, select it
> > > automatically whenever a driver which needs it is selected.
> > >=20
> > > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > > Cc: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> > > Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > > Cc: Darren Hart <dvhart@infradead.org>
> > > ---
> > >  drivers/platform/x86/Kconfig |    8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >=20
> > > --- linux-4.6.orig/drivers/platform/x86/Kconfig	2016-05-16 00:43:=
13.000000000 +0200
> > > +++ linux-4.6/drivers/platform/x86/Kconfig	2016-05-26 11:18:50.02=
9103790 +0200
> > > @@ -92,7 +92,7 @@ config ASUS_LAPTOP
> > >  	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
> > > =20
> > >  config DELL_SMBIOS
> > > -	tristate "Dell SMBIOS Support"
> > > +	tristate
> > >  	depends on DCDBAS
> > >  	default n
> > >  	---help---
> > > @@ -104,12 +104,13 @@ config DELL_SMBIOS
> > >  config DELL_LAPTOP
> > >  	tristate "Dell Laptop Extras"
> > >  	depends on X86
> > > -	depends on DELL_SMBIOS
> > >  	depends on DMI
> > >  	depends on BACKLIGHT_CLASS_DEVICE
> > >  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> > >  	depends on RFKILL || RFKILL =3D n
> > >  	depends on SERIO_I8042
> > > +	depends on DCDBAS
> > > +	select DELL_SMBIOS
> > >  	select POWER_SUPPLY
> > >  	select LEDS_CLASS
> > >  	select NEW_LEDS
> > > @@ -124,7 +125,8 @@ config DELL_WMI
> > >  	depends on DMI
> > >  	depends on INPUT
> > >  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> > > -	depends on DELL_SMBIOS
> > > +	depends on DCDBAS
> > > +	select DELL_SMBIOS
> > >  	select INPUT_SPARSEKMAP
> > >  	---help---
> > >  	  Say Y here if you want to support WMI-based hotkeys on Dell l=
aptops.
> >=20
> > While I'm not a maintainer, I feel obliged to respond as I introduc=
ed
> > the changes which this patch applies to.
>=20
> Well, I'm on maintainer list of dell modules, but I do care about kbu=
ild
> configuration if it is working. So I let review of this change to oth=
er
> people who understand kbuild better.
>=20
> What I see in this change is adding "duplicate" or "redundant"
> transitive dependency from DELL_WMI to DCDBAS. But DELL_WMI does not =
use
> or need DCDBAS. It just needs DELL_SMIBIOS and basically DELL_WMI doe=
s
> not care what DELL_SMBIOS is using (if DCDBAS, ACPI or any other thin=
g).
> So from my graph dependency point of view it is not correct, but I do
> not know how kbuild is working...

Sadly, options which select other options do not inherit from their
dependencies, so kconfig would complain about unmet dependencies if you
let the user enable an option which selects something that depends on
something which is missing or not selected. I wish kconfig was smarter
and would inherit dependencies in this case, but this doesn't happen. I
don't know if it is a design decision, a limitation, or just the way it
is for no specific reason.

The only way I know of to avoid the duplicate dependency would be to
let DELL_SMBIOS select DCDBAS instead of depending on it. But this is a
more intrusive change. If it were just me I'd use select a lot more, as
I don't think it is user-friendly to have drivers in one subsystem
silently depend on options from another subsystem. But not everybody
agrees with that.

> So I think kbuild developers should review this change.

Sounds unrealistic to me. It's as if you would ask Kernighan and Ritchi=
e
to review your driver code because they invented the C language ;-)

--=20
Jean Delvare
SUSE L3 Support
