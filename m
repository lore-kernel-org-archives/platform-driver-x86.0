From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/2] dell-wmi, dell-laptop: hide dell-smbios
Date: Tue, 7 Jun 2016 13:30:19 +0200
Message-ID: <20160607113019.GD29844@pali>
References: <20160526114212.2b17ee2d@endymion>
 <20160602110333.GA2575@eudyptula.hq.kempniu.pl>
 <20160602111029.GO29844@pali>
 <20160602230336.431d854a@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36541 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752401AbcFGLaY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jun 2016 07:30:24 -0400
Received: by mail-wm0-f65.google.com with SMTP id m124so22286482wme.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2016 04:30:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160602230336.431d854a@endymion>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>

On Thursday 02 June 2016 23:03:36 Jean Delvare wrote:
> Hi Pali,
>=20
> On Thu, 2 Jun 2016 13:10:29 +0200, Pali Roh=C3=A1r wrote:
> > On Thursday 02 June 2016 13:03:33 Micha=C5=82 K=C4=99pie=C5=84 wrot=
e:
> > > > Dell-smbios is a helper module, it serves no purpose on its own=
, so
> > > > do not present it as an option to the user. Instead, select it
> > > > automatically whenever a driver which needs it is selected.
> > > >=20
> > > > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > > > Cc: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> > > > Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > > > Cc: Darren Hart <dvhart@infradead.org>
> > > > ---
> > > >  drivers/platform/x86/Kconfig |    8 +++++---
> > > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > >=20
> > > > --- linux-4.6.orig/drivers/platform/x86/Kconfig	2016-05-16 00:4=
3:13.000000000 +0200
> > > > +++ linux-4.6/drivers/platform/x86/Kconfig	2016-05-26 11:18:50.=
029103790 +0200
> > > > @@ -92,7 +92,7 @@ config ASUS_LAPTOP
> > > >  	  If you have an ACPI-compatible ASUS laptop, say Y or M here=
=2E
> > > > =20
> > > >  config DELL_SMBIOS
> > > > -	tristate "Dell SMBIOS Support"
> > > > +	tristate
> > > >  	depends on DCDBAS
> > > >  	default n
> > > >  	---help---
> > > > @@ -104,12 +104,13 @@ config DELL_SMBIOS
> > > >  config DELL_LAPTOP
> > > >  	tristate "Dell Laptop Extras"
> > > >  	depends on X86
> > > > -	depends on DELL_SMBIOS
> > > >  	depends on DMI
> > > >  	depends on BACKLIGHT_CLASS_DEVICE
> > > >  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> > > >  	depends on RFKILL || RFKILL =3D n
> > > >  	depends on SERIO_I8042
> > > > +	depends on DCDBAS
> > > > +	select DELL_SMBIOS
> > > >  	select POWER_SUPPLY
> > > >  	select LEDS_CLASS
> > > >  	select NEW_LEDS
> > > > @@ -124,7 +125,8 @@ config DELL_WMI
> > > >  	depends on DMI
> > > >  	depends on INPUT
> > > >  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> > > > -	depends on DELL_SMBIOS
> > > > +	depends on DCDBAS
> > > > +	select DELL_SMBIOS
> > > >  	select INPUT_SPARSEKMAP
> > > >  	---help---
> > > >  	  Say Y here if you want to support WMI-based hotkeys on Dell=
 laptops.
> > >=20
> > > While I'm not a maintainer, I feel obliged to respond as I introd=
uced
> > > the changes which this patch applies to.
> >=20
> > Well, I'm on maintainer list of dell modules, but I do care about k=
build
> > configuration if it is working. So I let review of this change to o=
ther
> > people who understand kbuild better.
> >=20
> > What I see in this change is adding "duplicate" or "redundant"
> > transitive dependency from DELL_WMI to DCDBAS. But DELL_WMI does no=
t use
> > or need DCDBAS. It just needs DELL_SMIBIOS and basically DELL_WMI d=
oes
> > not care what DELL_SMBIOS is using (if DCDBAS, ACPI or any other th=
ing).
> > So from my graph dependency point of view it is not correct, but I =
do
> > not know how kbuild is working...
>=20
> Sadly, options which select other options do not inherit from their
> dependencies, so kconfig would complain about unmet dependencies if y=
ou
> let the user enable an option which selects something that depends on
> something which is missing or not selected. I wish kconfig was smarte=
r
> and would inherit dependencies in this case, but this doesn't happen.=
 I
> don't know if it is a design decision, a limitation, or just the way =
it
> is for no specific reason.
>=20
> The only way I know of to avoid the duplicate dependency would be to
> let DELL_SMBIOS select DCDBAS instead of depending on it. But this is=
 a
> more intrusive change. If it were just me I'd use select a lot more, =
as
> I don't think it is user-friendly to have drivers in one subsystem
> silently depend on options from another subsystem. But not everybody
> agrees with that.
>=20
> > So I think kbuild developers should review this change.
>=20
> Sounds unrealistic to me. It's as if you would ask Kernighan and Ritc=
hie
> to review your driver code because they invented the C language ;-)

No, that is not same. It is about that restriction that kbuild does not
support (correctly) transitive dependences and this is probably good
proposal either for extending kbuild or fixing something else. And
kbuild maintainers/developers either confirm this is really problem in
kbuild (which should be fixed) or show us how to write such thing
correctly. Or we are trying to use kbuild for something for which kbuil=
d
is not designed...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
