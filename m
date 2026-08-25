Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69152388878
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787691912; cv=pass; b=PAWP+o/JPmdbr84ogQZq3H88f8oQxAVpmqk+5Fbi0CZSZ48c8xr/1f/p1t8pXg9wGSUgWJ5mhw8Wx9GPRzgstRpZcBqtqtGZGLIK8VJKRUtVLZw8IUW6QDnSpHxgO8mhDclfyLxZe8zkR5zHF/CN1CwPwSicqH8uTy5+CzjueVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787691912; c=relaxed/simple;
	bh=tIHycO/GI6MLlaki9fgjnmTXBN6r13RpIqRLp+IZuVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIiEBI3GKnASC9Jv3l3RNHmbwFs0UjFQtcl5ETgfuTy2Lc3LPRn4MTxIl4tzG7lR1fuka5tOGPEeG57AGnJUhdLz4gLTyQ/4elImR7e3joOBgiLyxdAViqIHa10XWpzLQMcPxbn6V2J6fhRQOz6sZWhm9V4K5i1bwMqpLZqcpxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwnvLDqs; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwnvLDqs"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4a4836dc117so198225b6e.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 14:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787691910; cv=none;
        d=google.com; s=arc-20260327;
        b=EFxOoAQ6PI+gzuaR6YJUrJa0aTYpDuQBdwm6Nm8Zpm0zM+67WJz5RkbZYrt9obfoMZ
         Va9Ld0LknDpQenvRC7GG/gGMS5Dtu8YrigVi2wFYvSBplCvo568TxcluDkLwYa8vXeb7
         mI88+PfhYrfZmVCMJ931m4E7UWcrw2HnuaF7BnHLC4WysB0sb8o9MudVLse12+pr7bpA
         +N4uzHzGpweEwbcZ5Bq+vVwNXFGtPEH56qabPj6YCFu8ew1Zjw/WpV2nlL6D07VZAKW6
         Kqmw+6Koi8U0vxEVBwq7S8PGDUMMxVUawu/X5UfxuzxgsW4muLm6qihbijhx4JoYedA4
         w5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DrFC6uOzO3NeHI9ggPwFw1lwVA1Ud0+9aZIxH+l/DVU=;
        fh=zaVG6Te7XWiXD6BU7NqHmYg/pSLvClBGQJqxKPVh9ow=;
        b=YdOb+UafzLM1wwLGpSq1PDIiM++5OzXdZCjzZBAYEDwk+F7qZInCU0qYO7NewJP8NE
         xWNzCGPWdTeulOeFPTOt6wIqzsOjQot6iorwU58PlY+M4jhV9ASvXgduxyjoAL5KIyA8
         7eWNXNdlyTRjYAvg/ttmlIaIOjSY29rSq4Qd1tGIJ+KH0M/CwnGSHpy87YnapZuAK4GJ
         5+yYZoKhxKbU3cT2ETPaOcH7G19q/o72H8IMRVY0YifLlTjExh3mQfgZrCDBf4bf0Y5Z
         4EEQGsV8jWhXxUVnZq+nxfCiqKO405bdhTdfn0PluluHM5L/EU9uWs5j5hYvvc68xVYg
         HcpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787691910; x=1788296710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DrFC6uOzO3NeHI9ggPwFw1lwVA1Ud0+9aZIxH+l/DVU=;
        b=KwnvLDqsomebZYgAc81dx61hOoDQW9QOZFTUvArz5CI4po+NbhObPljHjlftDV+cn3
         E2sZOhp0NTEKWdXKzaAt3uRd+1RB8V4M9uIJvODOJxY68ku9CVCWTXzVh2d/SC1mWfZz
         jqqqva1qeDuGCPCixRGAXmQrytP4G3NtSRsmXfSFKcQVdyn+GHWpTMvs2HjIPwy84Wjb
         7Mdj6bWgjoe5qIdbIcA8vQpoqAzcRWLpKqZNZHXA9c0W304O8vlvOPq5/lsbS7sGWGUc
         duFzw9jvj/ImOrRln95DCrnY0pUFek+PmMXWD7XCpwtazrVlJnVRYWlvh4s/Ps1NaIry
         pCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787691910; x=1788296710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrFC6uOzO3NeHI9ggPwFw1lwVA1Ud0+9aZIxH+l/DVU=;
        b=lIzhPk6dRdnRxebZtzoN/WBESqxhTXrugtMijVeAlnRUaOkL6BE0GsBlAxhSKS0e3T
         IfFLbu0LbSJIWtw44n2T8riPIvd1HRFvwhzHy0n2pmVKKb4u5BKrVoIMvxiDFf4zPqnh
         WrJKGi/wOcpFubXUrGdEScYMU1V7Mpf+b0+Z2uQqEQeSa4u09Iye5cDrz4N6U/LY7kz+
         MWbxVNdm4fOT3YeYLjMshzeFeFrZTQXm9BGgagqkQtD+W0ifwu12KJ42PRHxrKoX652V
         H2g6aYNIoIAK4wt98omSJrlgI9marCg3Ml8nXu43JdkNUaJWubluwVDgb6BadBuMtTII
         7isA==
X-Forwarded-Encrypted: i=1; AHgh+RrThQiXmPh189AXg5Fkh2IkZRyfLwtDVfzKJTNdmY5qxyttOohGkWPdoGTFmtC5+fzpC9KCueWSqgJ1/b0afZYORwQi@vger.kernel.org
X-Gm-Message-State: AFuF++mQhz2y4Rh88hVgOZ+a4Hhx7YuRYcm8nlMMWGX2WQrgwch2HoN8
	D05JWugEskm5jFNpKAI5i9xOgmFNhaM0A0Apb2Ce0gicSq73OSI+3UDpwM0X2RyROCn8pYXL58u
	h0Jtng5NF1remyGvhmXpaj3YMGhmFPvg=
X-Gm-Gg: AR+sD113DAYPYjqUSNgj/TiMaDAZB0Qc7w+NRFfdtl8Fz3O7T55MbAhWnwGoGuHCOTR
	YM0MZNZvLnHD/xywPQJGvcFOn7IUtX6xa9Scl0gA3ip89tnWXClWJ5oZuKMBd1Wa96nm503XD7g
	chx4qvftb6km22UuIfduRpKfs7PIZQkO7DPsHDS0e8v5VgoUMyXctr+ESGTtCkjfRaakFahhDOG
	ojqcIkCPP8xDuiVKE3bJLawwijMslkclA+5Op/BwvZTDLKKnAU8cHTsVWu17pn6QQqpwVNIeUEU
	p89/ZeUJAIx4doqMohwO2vWE1yfSfBlSTmKuYAJV3cNyW0pNlMjYaGltNY+amZ0vBVtENVe5m/4
	=
X-Received: by 2002:a05:6808:1b11:b0:497:e7e2:756e with SMTP id
 5614622812f47-4b366aa6fc7mr2621143b6e.13.1787691910243; Tue, 25 Aug 2026
 14:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825203553.3725132-1-sakari.ailus@linux.intel.com> <20260825203553.3725132-3-sakari.ailus@linux.intel.com>
In-Reply-To: <20260825203553.3725132-3-sakari.ailus@linux.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 25 Aug 2026 23:04:51 +0200
X-Gm-Features: AcwNN1VGU9Qwk5_fHeJYNkRopBcA7EiO0dUKi7oyW0GavJGXv0cEQiH0jbLRPpg
Message-ID: <CAPybu_1J4z2Z0Xv1PyHZa2U+PFsTWPVyifJr2p8DgkQRTJm6YQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] platform/x86: int3472: Fix uninitialised variable warning
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

nits:

It would be nice to have the error message that it is fixed in the
commit message (also for 1/3)

Would you consider adding a Fixes? This patch fixes a compilation
error (with the right kernel config)

On Tue, Aug 25, 2026 at 10:36=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Fix a smatch warning about uninitialised err_msg variable, by printing th=
e
> error where it is handled.
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 25 +++++++++++--------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/plat=
form/x86/intel/int3472/discrete.c
> index 6c729fcfce5d..9cd4f78875ab 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -329,7 +329,6 @@ static int skl_int3472_handle_gpio_resources(struct a=
cpi_resource *ares,
>         unsigned long gpio_flags;
>         union acpi_object *obj;
>         struct gpio_desc *gpio;
> -       const char *err_msg;
>         const char *con_id;
>         int ret;
>
> @@ -375,7 +374,8 @@ static int skl_int3472_handle_gpio_resources(struct a=
cpi_resource *ares,
>         case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>                 ret =3D skl_int3472_map_gpio_to_sensor(int3472, agpio, co=
n_id, gpio_flags);
>                 if (ret)
> -                       err_msg =3D "Failed to map GPIO pin to sensor\n";
> +                       dev_err_probe(int3472->dev, ret,
> +                                     "Failed to map GPIO pin to sensor\n=
");
>
>                 break;
>         case INT3472_GPIO_TYPE_CLK_ENABLE:
> @@ -387,7 +387,7 @@ static int skl_int3472_handle_gpio_resources(struct a=
cpi_resource *ares,
>                 gpio =3D skl_int3472_gpiod_get_from_temp_lookup(int3472, =
agpio, con_id, gpio_flags);
>                 if (IS_ERR(gpio)) {
>                         ret =3D PTR_ERR(gpio);
> -                       err_msg =3D "Failed to get GPIO\n";
> +                       dev_err_probe(int3472->dev, ret, "Failed to get G=
PIO\n");
>                         break;
>                 }
>
> @@ -395,14 +395,16 @@ static int skl_int3472_handle_gpio_resources(struct=
 acpi_resource *ares,
>                 case INT3472_GPIO_TYPE_CLK_ENABLE:
>                         ret =3D skl_int3472_register_gpio_clock(int3472, =
gpio);
>                         if (ret)
> -                               err_msg =3D "Failed to register clock\n";
> +                               dev_err_probe(int3472->dev, ret,
> +                                             "Failed to register clock\n=
");
>
>                         break;
>                 case INT3472_GPIO_TYPE_PRIVACY_LED:
>                 case INT3472_GPIO_TYPE_STROBE:
>                         ret =3D skl_int3472_register_led(int3472, gpio, c=
on_id);
>                         if (ret)
> -                               err_msg =3D "Failed to register LED\n";
> +                               dev_err_probe(int3472->dev, ret,
> +                                             "Failed to register LED\n")=
;
>
>                         break;
>                 case INT3472_GPIO_TYPE_POWER_ENABLE:
> @@ -413,7 +415,8 @@ static int skl_int3472_handle_gpio_resources(struct a=
cpi_resource *ares,
>                         ret =3D skl_int3472_register_regulator(int3472, g=
pio, enable_time_us,
>                                                              con_id, seco=
nd_sensor);
>                         if (ret)
> -                               err_msg =3D "Failed to register regulator=
\n";
> +                               dev_err_probe(int3472->dev, ret,
> +                                             "Failed to register regulat=
or\n");
>
>                         break;
>                 default: /* Never reached */
> @@ -436,11 +439,11 @@ static int skl_int3472_handle_gpio_resources(struct=
 acpi_resource *ares,
>         int3472->ngpios++;
>         ACPI_FREE(obj);
>
> -       if (ret < 0)
> -               return dev_err_probe(int3472->dev, ret, err_msg);
> -
> -       /* Tell acpi_dev_get_resources() to not make a copy of the resour=
ce */
> -       return 1;
> +       /*
> +        * Either return an error or tell acpi_dev_get_resources() to not=
 make a
> +        * copy of the resource.
> +        */
> +       return ret < 0 ? ret : 1;
>  }
>
>  int int3472_discrete_parse_crs(struct int3472_discrete_device *int3472)
> --
> 2.47.3
>
>


--=20
Ricardo Ribalda
