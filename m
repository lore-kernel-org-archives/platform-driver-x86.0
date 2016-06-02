From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/2] dell-wmi, dell-laptop: hide dell-smbios
Date: Thu, 2 Jun 2016 13:10:29 +0200
Message-ID: <20160602111029.GO29844@pali>
References: <20160526114212.2b17ee2d@endymion>
 <20160602110333.GA2575@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35177 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751145AbcFBLKd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jun 2016 07:10:33 -0400
Received: by mail-wm0-f66.google.com with SMTP id e3so14778168wme.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jun 2016 04:10:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160602110333.GA2575@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jean Delvare <jdelvare@suse.de>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>

On Thursday 02 June 2016 13:03:33 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > Dell-smbios is a helper module, it serves no purpose on its own, so
> > do not present it as an option to the user. Instead, select it
> > automatically whenever a driver which needs it is selected.
> >=20
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> > Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > Cc: Darren Hart <dvhart@infradead.org>
> > ---
> >  drivers/platform/x86/Kconfig |    8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >=20
> > --- linux-4.6.orig/drivers/platform/x86/Kconfig	2016-05-16 00:43:13=
=2E000000000 +0200
> > +++ linux-4.6/drivers/platform/x86/Kconfig	2016-05-26 11:18:50.0291=
03790 +0200
> > @@ -92,7 +92,7 @@ config ASUS_LAPTOP
> >  	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
> > =20
> >  config DELL_SMBIOS
> > -	tristate "Dell SMBIOS Support"
> > +	tristate
> >  	depends on DCDBAS
> >  	default n
> >  	---help---
> > @@ -104,12 +104,13 @@ config DELL_SMBIOS
> >  config DELL_LAPTOP
> >  	tristate "Dell Laptop Extras"
> >  	depends on X86
> > -	depends on DELL_SMBIOS
> >  	depends on DMI
> >  	depends on BACKLIGHT_CLASS_DEVICE
> >  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> >  	depends on RFKILL || RFKILL =3D n
> >  	depends on SERIO_I8042
> > +	depends on DCDBAS
> > +	select DELL_SMBIOS
> >  	select POWER_SUPPLY
> >  	select LEDS_CLASS
> >  	select NEW_LEDS
> > @@ -124,7 +125,8 @@ config DELL_WMI
> >  	depends on DMI
> >  	depends on INPUT
> >  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> > -	depends on DELL_SMBIOS
> > +	depends on DCDBAS
> > +	select DELL_SMBIOS
> >  	select INPUT_SPARSEKMAP
> >  	---help---
> >  	  Say Y here if you want to support WMI-based hotkeys on Dell lap=
tops.
>=20
> While I'm not a maintainer, I feel obliged to respond as I introduced
> the changes which this patch applies to.

Well, I'm on maintainer list of dell modules, but I do care about kbuil=
d
configuration if it is working. So I let review of this change to other
people who understand kbuild better.

What I see in this change is adding "duplicate" or "redundant"
transitive dependency from DELL_WMI to DCDBAS. But DELL_WMI does not us=
e
or need DCDBAS. It just needs DELL_SMIBIOS and basically DELL_WMI does
not care what DELL_SMBIOS is using (if DCDBAS, ACPI or any other thing)=
=2E
So from my graph dependency point of view it is not correct, but I do
not know how kbuild is working...

So I think kbuild developers should review this change.

> I like this approach and all the way I've been thinking whether it's
> reasonable to hide configuration options that are pretty
> self-explanatory ("Dell Laptop Extras", "Dell WMI extras") behind a
> rather cryptic one ("Dell SMBIOS Support").  The only reason I didn't=
 go
> the way you're suggesting in this patch is my lack of experience with
> kbuild and the warning in Documentation/kbuild/kconfig-language.txt t=
hat
> "select should be used with care".

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
