From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 1/2] dell-wmi, dell-laptop: hide dell-smbios
Date: Thu, 2 Jun 2016 13:03:33 +0200
Message-ID: <20160602110333.GA2575@eudyptula.hq.kempniu.pl>
References: <20160526114212.2b17ee2d@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34224 "EHLO
	mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932294AbcFBLDj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jun 2016 07:03:39 -0400
Received: by mail-lf0-f65.google.com with SMTP id 65so4738264lfq.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jun 2016 04:03:38 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160526114212.2b17ee2d@endymion>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: platform-driver-x86@vger.kernel.org, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>

> Dell-smbios is a helper module, it serves no purpose on its own, so
> do not present it as an option to the user. Instead, select it
> automatically whenever a driver which needs it is selected.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Cc: Darren Hart <dvhart@infradead.org>
> ---
>  drivers/platform/x86/Kconfig |    8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> --- linux-4.6.orig/drivers/platform/x86/Kconfig	2016-05-16 00:43:13.0=
00000000 +0200
> +++ linux-4.6/drivers/platform/x86/Kconfig	2016-05-26 11:18:50.029103=
790 +0200
> @@ -92,7 +92,7 @@ config ASUS_LAPTOP
>  	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
> =20
>  config DELL_SMBIOS
> -	tristate "Dell SMBIOS Support"
> +	tristate
>  	depends on DCDBAS
>  	default n
>  	---help---
> @@ -104,12 +104,13 @@ config DELL_SMBIOS
>  config DELL_LAPTOP
>  	tristate "Dell Laptop Extras"
>  	depends on X86
> -	depends on DELL_SMBIOS
>  	depends on DMI
>  	depends on BACKLIGHT_CLASS_DEVICE
>  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
>  	depends on RFKILL || RFKILL =3D n
>  	depends on SERIO_I8042
> +	depends on DCDBAS
> +	select DELL_SMBIOS
>  	select POWER_SUPPLY
>  	select LEDS_CLASS
>  	select NEW_LEDS
> @@ -124,7 +125,8 @@ config DELL_WMI
>  	depends on DMI
>  	depends on INPUT
>  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> -	depends on DELL_SMBIOS
> +	depends on DCDBAS
> +	select DELL_SMBIOS
>  	select INPUT_SPARSEKMAP
>  	---help---
>  	  Say Y here if you want to support WMI-based hotkeys on Dell lapto=
ps.

While I'm not a maintainer, I feel obliged to respond as I introduced
the changes which this patch applies to.

I like this approach and all the way I've been thinking whether it's
reasonable to hide configuration options that are pretty
self-explanatory ("Dell Laptop Extras", "Dell WMI extras") behind a
rather cryptic one ("Dell SMBIOS Support").  The only reason I didn't g=
o
the way you're suggesting in this patch is my lack of experience with
kbuild and the warning in Documentation/kbuild/kconfig-language.txt tha=
t
"select should be used with care".

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
