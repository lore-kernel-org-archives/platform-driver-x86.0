From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 1/5] dell-laptop: move dell_smi_error() to dell-smbios
Date: Mon, 29 Feb 2016 13:52:14 +0100
Message-ID: <20160229125214.GF21814@pali>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-2-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:33667 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751548AbcB2MwS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 07:52:18 -0500
Content-Disposition: inline
In-Reply-To: <1456298416-29683-2-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 24 February 2016 08:20:11 Micha=C5=82 K=C4=99pie=C5=84 wro=
te:
> The dell_smi_error() method could be used by modules other than
> dell-laptop for convenient translation of SMBIOS request errors into
> errno values.  Thus, move it to dell-smbios.
>=20
> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> ---
>  drivers/platform/x86/dell-laptop.c |   14 --------------
>  drivers/platform/x86/dell-smbios.c |   16 ++++++++++++++++
>  drivers/platform/x86/dell-smbios.h |    2 ++
>  3 files changed, 18 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x8=
6/dell-laptop.c
> index 76064c8..cbafb95 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -273,20 +273,6 @@ static const struct dmi_system_id dell_quirks[] =
__initconst =3D {
>  	{ }
>  };
> =20
> -static inline int dell_smi_error(int value)
> -{
> -	switch (value) {
> -	case 0: /* Completed successfully */
> -		return 0;
> -	case -1: /* Completed with error */
> -		return -EIO;
> -	case -2: /* Function not supported */
> -		return -ENXIO;
> -	default: /* Unknown error */
> -		return -EINVAL;
> -	}
> -}
> -
>  /*
>   * Derived from information in smbios-wireless-ctl:
>   *
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x8=
6/dell-smbios.c
> index 2a4992a..942572f 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -16,6 +16,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/dmi.h>
> +#include <linux/err.h>
>  #include <linux/gfp.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
> @@ -39,6 +40,21 @@ static int da_command_code;
>  static int da_num_tokens;
>  static struct calling_interface_token *da_tokens;
> =20
> +int dell_smi_error(int value)
> +{
> +	switch (value) {
> +	case 0: /* Completed successfully */
> +		return 0;
> +	case -1: /* Completed with error */
> +		return -EIO;
> +	case -2: /* Function not supported */
> +		return -ENXIO;
> +	default: /* Unknown error */
> +		return -EINVAL;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(dell_smi_error);
> +
>  struct calling_interface_buffer *dell_smbios_get_buffer(void)
>  {
>  	mutex_lock(&buffer_mutex);
> diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x8=
6/dell-smbios.h
> index 4f69b16..52febe6 100644
> --- a/drivers/platform/x86/dell-smbios.h
> +++ b/drivers/platform/x86/dell-smbios.h
> @@ -35,6 +35,8 @@ struct calling_interface_token {
>  	};
>  };
> =20
> +int dell_smi_error(int value);
> +
>  struct calling_interface_buffer *dell_smbios_get_buffer(void);
>  void dell_smbios_clear_buffer(void);
>  void dell_smbios_release_buffer(void);

And... here what about inline vs EXPORT_SYMBOL function? Just asking...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
