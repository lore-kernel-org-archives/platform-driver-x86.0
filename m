From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] dell-wmi, dell-laptop: hide dell-smbios
Date: Wed, 8 Jun 2016 14:57:44 -0700
Message-ID: <20160608215744.GI28348@f23x64.localdomain>
References: <20160526114212.2b17ee2d@endymion>
 <20160602110333.GA2575@eudyptula.hq.kempniu.pl>
 <20160602111029.GO29844@pali>
 <20160602230336.431d854a@endymion>
 <20160607113019.GD29844@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160607113019.GD29844@pali>
Sender: linux-kbuild-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.de>, =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org, linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 07, 2016 at 01:30:19PM +0200, Pali Roh=C3=A1r wrote:
> On Thursday 02 June 2016 23:03:36 Jean Delvare wrote:
> > Hi Pali,
> >=20
> > On Thu, 2 Jun 2016 13:10:29 +0200, Pali Roh=C3=A1r wrote:
> > > On Thursday 02 June 2016 13:03:33 Micha=C5=82 K=C4=99pie=C5=84 wr=
ote:
> > > > > Dell-smbios is a helper module, it serves no purpose on its o=
wn, so
> > > > > do not present it as an option to the user. Instead, select i=
t
> > > > > automatically whenever a driver which needs it is selected.

Hi Yann,

We have a question regarding best practice of depends and selects insti=
gated by
the following patch from Jean.

> > > > >=20
> > > > > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > > > > Cc: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> > > > > Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > > > > Cc: Darren Hart <dvhart@infradead.org>
> > > > > ---
> > > > >  drivers/platform/x86/Kconfig |    8 +++++---
> > > > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > > >=20
> > > > > --- linux-4.6.orig/drivers/platform/x86/Kconfig	2016-05-16 00=
:43:13.000000000 +0200
> > > > > +++ linux-4.6/drivers/platform/x86/Kconfig	2016-05-26 11:18:5=
0.029103790 +0200
> > > > > @@ -92,7 +92,7 @@ config ASUS_LAPTOP
> > > > >  	  If you have an ACPI-compatible ASUS laptop, say Y or M he=
re.
> > > > > =20
> > > > >  config DELL_SMBIOS
> > > > > -	tristate "Dell SMBIOS Support"
> > > > > +	tristate
> > > > >  	depends on DCDBAS
> > > > >  	default n
> > > > >  	---help---
> > > > > @@ -104,12 +104,13 @@ config DELL_SMBIOS
> > > > >  config DELL_LAPTOP
> > > > >  	tristate "Dell Laptop Extras"
> > > > >  	depends on X86
> > > > > -	depends on DELL_SMBIOS
> > > > >  	depends on DMI
> > > > >  	depends on BACKLIGHT_CLASS_DEVICE
> > > > >  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> > > > >  	depends on RFKILL || RFKILL =3D n
> > > > >  	depends on SERIO_I8042
> > > > > +	depends on DCDBAS
> > > > > +	select DELL_SMBIOS
> > > > >  	select POWER_SUPPLY
> > > > >  	select LEDS_CLASS
> > > > >  	select NEW_LEDS
> > > > > @@ -124,7 +125,8 @@ config DELL_WMI
> > > > >  	depends on DMI
> > > > >  	depends on INPUT
> > > > >  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> > > > > -	depends on DELL_SMBIOS
> > > > > +	depends on DCDBAS
> > > > > +	select DELL_SMBIOS
> > > > >  	select INPUT_SPARSEKMAP
> > > > >  	---help---
> > > > >  	  Say Y here if you want to support WMI-based hotkeys on De=
ll laptops.
> > > >=20
> > > > While I'm not a maintainer, I feel obliged to respond as I intr=
oduced
> > > > the changes which this patch applies to.
> > >=20
> > > Well, I'm on maintainer list of dell modules, but I do care about=
 kbuild
> > > configuration if it is working. So I let review of this change to=
 other
> > > people who understand kbuild better.
> > >=20
> > > What I see in this change is adding "duplicate" or "redundant"
> > > transitive dependency from DELL_WMI to DCDBAS. But DELL_WMI does =
not use
> > > or need DCDBAS. It just needs DELL_SMIBIOS and basically DELL_WMI=
 does
> > > not care what DELL_SMBIOS is using (if DCDBAS, ACPI or any other =
thing).
> > > So from my graph dependency point of view it is not correct, but =
I do
> > > not know how kbuild is working...
> >=20
> > Sadly, options which select other options do not inherit from their
> > dependencies, so kconfig would complain about unmet dependencies if=
 you
> > let the user enable an option which selects something that depends =
on
> > something which is missing or not selected. I wish kconfig was smar=
ter
> > and would inherit dependencies in this case, but this doesn't happe=
n. I
> > don't know if it is a design decision, a limitation, or just the wa=
y it
> > is for no specific reason.
> >=20
> > The only way I know of to avoid the duplicate dependency would be t=
o
> > let DELL_SMBIOS select DCDBAS instead of depending on it. But this =
is a
> > more intrusive change. If it were just me I'd use select a lot more=
, as
> > I don't think it is user-friendly to have drivers in one subsystem
> > silently depend on options from another subsystem. But not everybod=
y
> > agrees with that.
> >=20
> > > So I think kbuild developers should review this change.

Let's ask them then.
+Yann
+linux-kbuild

> >=20
> > Sounds unrealistic to me. It's as if you would ask Kernighan and Ri=
tchie
> > to review your driver code because they invented the C language ;-)
>=20
> No, that is not same. It is about that restriction that kbuild does n=
ot
> support (correctly) transitive dependences and this is probably good
> proposal either for extending kbuild or fixing something else. And
> kbuild maintainers/developers either confirm this is really problem i=
n
> kbuild (which should be fixed) or show us how to write such thing
> correctly. Or we are trying to use kbuild for something for which kbu=
ild
> is not designed...
>=20
> --=20
> Pali Roh=C3=A1r
> pali.rohar@gmail.com
>=20

--=20
Darren Hart
Intel Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
