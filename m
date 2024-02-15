Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F398BA38
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Feb 2024 06:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707979389; cv=none; b=AQhwz5y6sTUtKHMTpPh79C3XJndPJWpwKEhichNWXUqacdULJApX+DsVjzYOww+UnU3WWUCGse6OzPGUzGS5YjtVYeBgMZMfTDqQBeGG/hRPyRVlCdXaCT+Jkl9gCiu9GLlEQWYlxEnETUHpfhr0ABktD/YJkUwhS0wY8wdm9Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707979389; c=relaxed/simple;
	bh=LYaSc8njSYNZnvZiDGaD2ZGcKRvv6NkF8qcuSbK13P0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Zh6dVDZSQeQqhq7dFpPuO15r+8POy3yyd16iBN3bDPosVteh8lP/gaZcuQLhfwnFoEqWyTo4/qQcZRZSjx0NxT85TH60DedeZBXQlBRtENlJzcgp7RhjxEASz4gXVddFHWM7ocn05vqHyWlaE1s/wzJNicOt59VD8Wi0djpF4sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BoRUKwNf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BoRUKwNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707979386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=veMR1cRoIykUAJIlxF4VuefJ6PcnqVS3H7Slnab3IQA=;
	b=BoRUKwNfKgk5xriZnTVmDPT0YjfvUPlexXYJXuutdznUdM+Y41Zq6/Gej6FOoSWKhC/ebD
	nmlJM9PYvkMu/mx+P0eIosqWgdh0Hg5mX3NcrAwseh0hZWWs1nJUCBjzK+W0eHmMRpMw8y
	nacUJ5zsFg3gKZOTw7MsQ4r2vt13S4A=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-3hzxYPAJOeekGHRTWePCMw-1; Thu, 15 Feb 2024 01:43:04 -0500
X-MC-Unique: 3hzxYPAJOeekGHRTWePCMw-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2966737d3e3so525725a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Feb 2024 22:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707979383; x=1708584183;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veMR1cRoIykUAJIlxF4VuefJ6PcnqVS3H7Slnab3IQA=;
        b=ibR8sJuKcNUvMENBrXYhL2/eK1YurGQfxfKMl0g/89+wVT4hCsKzIHVC0jJnThGHTL
         6EmsVlf3N//OlmK6kuHefp7NS70yaiZGYPF8Za2NUpuElZ5yy76+WverOrhIpAqnnThr
         FrbkcWUpdshRtaH+WPuS8prZx93C8kMweGQQhKgMSzD3SINoe/vABmUBf2fFNWfpfv+8
         FW4Xo0BEAa8GBVox58zsKIi6EjL5m8HDYIsi1sPZHew+7DLo/AVFDzEMnFxS3hrRbJo1
         J9wG1Kti3ofnWb1eZfbFocjsFLFG6XlmmFG/Up9TwzsJjCKWdFt1EO687vofvLsS90kx
         epuw==
X-Forwarded-Encrypted: i=1; AJvYcCUUhOUZL0+cwOISrNLB5Vj5LzlAU4MJqTcCxmAki6N66vj5fa3ocdMg3va0ELM/0/k5gs3LtPecLcB4GtiCYZBRGFxRktm2NyT0Djv6p9y7AmVCFQ==
X-Gm-Message-State: AOJu0YwtnPCZVtHOz5wFsxUr0kz2CVDu7eOD+R/Fi5alVmEWphEkEwXA
	HaTAsHIJeTdl6zeXUGE7xu4HYcykS2C7TWqXkU8b7dd/9qNxq77RqFrLdxKay36E3yiZlrd5JuL
	7eo/tUJQy3ACPTdViDWpNtjqVUWnc25U8V6dWouQaE18cwQw7t/aWrxN5HO7m2RQuP8VsbPqeTU
	UsATA/Nas4oXK8es40gVYWGjtj+xdnJNukch8pD9nJdpFdCQ==
X-Received: by 2002:a17:90b:14b:b0:295:d61a:c934 with SMTP id em11-20020a17090b014b00b00295d61ac934mr851319pjb.48.1707979382434;
        Wed, 14 Feb 2024 22:43:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGb6+izlmHfTzryEXe39ZxvyVMgy6z/Bo0GXAjIy39Jry5Xl844Dnx1g0ehrzhnzD24LWu1G/BVhAAmnI0/Dj0=
X-Received: by 2002:a17:90b:14b:b0:295:d61a:c934 with SMTP id
 em11-20020a17090b014b00b00295d61ac934mr851306pjb.48.1707979382033; Wed, 14
 Feb 2024 22:43:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207061006.407066-1-hpa@redhat.com> <20240207061006.407066-3-hpa@redhat.com>
 <b1cffa5999204fd27693bad8c9f0d815172d28aa.camel@apitzsch.eu>
In-Reply-To: <b1cffa5999204fd27693bad8c9f0d815172d28aa.camel@apitzsch.eu>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 15 Feb 2024 14:42:50 +0800
Message-ID: <CAEth8oG_y8+oeV11umXayHFNzNT39vyyZNOsVN6wzM9zenaBAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] leds: rgb: leds-ktd202x: Get device properties
 through fwnode to support ACPI
To: git@apitzsch.eu, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for your review.

Sorry for the late reply. I came back from holiday.

On Thu, Feb 8, 2024 at 5:03=E2=80=AFAM Andr=C3=A9 Apitzsch <git@apitzsch.eu=
> wrote:
>
> Hi,
>
> Am Mittwoch, dem 07.02.2024 um 14:10 +0800 schrieb Kate Hsuan:
> > This LED controller also installed on a Xiaomi pad2 and it is an x86
> > platform. The original driver is based on the device tree and can't
> > be used for this ACPI based system. This patch migrated the driver to
> > use fwnode to access the properties. Moreover, the fwnode API
> > supports device tree so this work would affect the original
> would -> won't ?

won't

>
> > implementations.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  drivers/leds/rgb/Kconfig        |  1 -
> >  drivers/leds/rgb/leds-ktd202x.c | 68 ++++++++++++++++++++++---------
> > --
> >  2 files changed, 45 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
> > index a6a21f564673..f245dbd9a163 100644
> > --- a/drivers/leds/rgb/Kconfig
> > +++ b/drivers/leds/rgb/Kconfig
> > @@ -17,7 +17,6 @@ config LEDS_GROUP_MULTICOLOR
> >  config LEDS_KTD202X
> >       tristate "LED support for KTD202x Chips"
> >       depends on I2C
> > -     depends on OF
> >       select REGMAP_I2C
> >       help
> >         This option enables support for the Kinetic
> > KTD2026/KTD2027
> > diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-
> > ktd202x.c
> > index 514965795a10..a1aef62e3db5 100644
> > --- a/drivers/leds/rgb/leds-ktd202x.c
> > +++ b/drivers/leds/rgb/leds-ktd202x.c
> > @@ -112,6 +112,8 @@ static int ktd202x_chip_disable(struct ktd202x
> > *chip)
> >
> >       regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL,
> > KTD202X_ENABLE_CTRL_SLEEP);
> >
> > +     usleep_range(500, 600);
> Why have you added the sleep?

When removing the module, a WARN_ON() shown as the following URL will
be triggered. It happens randomly.
I tried to mitigate it through a sleep.
https://elixir.bootlin.com/linux/latest/source/drivers/regulator/core.c#L23=
96

>
> > +
> >       ret =3D regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
> > chip->regulators);
> >       if (ret) {
> >               dev_err(chip->dev, "Failed to disable regulators:
> > %d\n", ret);
> > @@ -381,16 +383,18 @@ static int ktd202x_blink_mc_set(struct
> > led_classdev *cdev,
> >                                mc->num_colors);
> >  }
> >
> > -static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct
> > device_node *np,
> > +static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct
> > fwnode_handle *np,
> >                                struct ktd202x_led *led, struct
> > led_init_data *init_data)
> >  {
> >       struct led_classdev *cdev;
> > -     struct device_node *child;
> > +     struct fwnode_handle *child;
> Nit, swap the above lines for reverse Christmas tree.

okay

>
> >       struct mc_subled *info;
> > -     int num_channels;
> > +     int num_channels =3D 0;
> >       int i =3D 0;
> >
> > -     num_channels =3D of_get_available_child_count(np);
> > +     fwnode_for_each_available_child_node(np, child) {
> > +             num_channels++;
> > +     }
> >       if (!num_channels || num_channels > chip->num_leds)
> >               return -EINVAL;
> >
> > @@ -398,22 +402,22 @@ static int ktd202x_setup_led_rgb(struct ktd202x
> > *chip, struct device_node *np,
> >       if (!info)
> >               return -ENOMEM;
> >
> > -     for_each_available_child_of_node(np, child) {
> > +     fwnode_for_each_available_child_node(np, child) {
> >               u32 mono_color;
> >               u32 reg;
> >               int ret;
> >
> > -             ret =3D of_property_read_u32(child, "reg", &reg);
> > +             ret =3D fwnode_property_read_u32(child, "reg", &reg);
> >               if (ret !=3D 0 || reg >=3D chip->num_leds) {
> >                       dev_err(chip->dev, "invalid 'reg' of
> > %pOFn\n", child);
> > -                     of_node_put(child);
> > +                     fwnode_handle_put(child);
> >                       return -EINVAL;
> >               }
> >
> > -             ret =3D of_property_read_u32(child, "color",
> > &mono_color);
> > +             ret =3D fwnode_property_read_u32(child, "color",
> > &mono_color);
> >               if (ret < 0 && ret !=3D -EINVAL) {
> >                       dev_err(chip->dev, "failed to parse 'color'
> > of %pOF\n", child);
> > -                     of_node_put(child);
> > +                     fwnode_handle_put(child);
> >                       return ret;
> >               }
> >
> > @@ -433,14 +437,14 @@ static int ktd202x_setup_led_rgb(struct ktd202x
> > *chip, struct device_node *np,
> >       return devm_led_classdev_multicolor_register_ext(chip->dev,
> > &led->mcdev, init_data);
> >  }
> >
> > -static int ktd202x_setup_led_single(struct ktd202x *chip, struct
> > device_node *np,
> > +static int ktd202x_setup_led_single(struct ktd202x *chip, struct
> > fwnode_handle *np,
> >                                   struct ktd202x_led *led, struct
> > led_init_data *init_data)
> >  {
> >       struct led_classdev *cdev;
> >       u32 reg;
> >       int ret;
> >
> > -     ret =3D of_property_read_u32(np, "reg", &reg);
> > +     ret =3D fwnode_property_read_u32(np, "reg", &reg);
> >       if (ret !=3D 0 || reg >=3D chip->num_leds) {
> >               dev_err(chip->dev, "invalid 'reg' of %pOFn\n", np);
> >               return -EINVAL;
> > @@ -454,7 +458,7 @@ static int ktd202x_setup_led_single(struct
> > ktd202x *chip, struct device_node *np
> >       return devm_led_classdev_register_ext(chip->dev, &led->cdev,
> > init_data);
> >  }
> >
> > -static int ktd202x_add_led(struct ktd202x *chip, struct device_node
> > *np, unsigned int index)
> > +static int ktd202x_add_led(struct ktd202x *chip, struct
> > fwnode_handle *np, unsigned int index)
> >  {
> >       struct ktd202x_led *led =3D &chip->leds[index];
> >       struct led_init_data init_data =3D {};
> > @@ -463,14 +467,14 @@ static int ktd202x_add_led(struct ktd202x
> > *chip, struct device_node *np, unsigne
> >       int ret;
> >
> >       /* Color property is optional in single color case */
> > -     ret =3D of_property_read_u32(np, "color", &color);
> > +     ret =3D fwnode_property_read_u32(np, "color", &color);
> >       if (ret < 0 && ret !=3D -EINVAL) {
> >               dev_err(chip->dev, "failed to parse 'color' of
> > %pOF\n", np);
> >               return ret;
> >       }
> >
> >       led->chip =3D chip;
> > -     init_data.fwnode =3D of_fwnode_handle(np);
> > +     init_data.fwnode =3D np;
> >
> >       if (color =3D=3D LED_COLOR_ID_RGB) {
> >               cdev =3D &led->mcdev.led_cdev;
> > @@ -492,26 +496,30 @@ static int ktd202x_add_led(struct ktd202x
> > *chip, struct device_node *np, unsigne
> >
> >  static int ktd202x_probe_dt(struct ktd202x *chip)
> >  {
> > -     struct device_node *np =3D dev_of_node(chip->dev), *child;
> > -     int count;
> > +     struct device *dev =3D chip->dev;
> > +     struct fwnode_handle *np, *child;
> Nit, swap the above lines.
>
> > +     int count =3D 0;
> Un-needed init.

Okay

>
> >       int i =3D 0;
> >
> > -     chip->num_leds =3D (int)(unsigned
> > long)of_device_get_match_data(chip->dev);
> > +     count =3D device_get_child_node_count(dev);
> >
> > -     count =3D of_get_available_child_count(np);
> >       if (!count || count > chip->num_leds)
> >               return -EINVAL;
> >
> > +     np =3D dev_fwnode(chip->dev);
> > +     if (!np)
> > +             return -ENODEV;
> > +
> >       regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL,
> > KTD202X_RSTR_RESET);
> >
> >       /* Allow the device to execute the complete reset */
> >       usleep_range(200, 300);
> >
> > -     for_each_available_child_of_node(np, child) {
> > +     fwnode_for_each_available_child_node(np, child) {
> >               int ret =3D ktd202x_add_led(chip, child, i);
> >
> >               if (ret) {
> > -                     of_node_put(child);
> > +                     fwnode_handle_put(child);
> >                       return ret;
> >               }
> >               i++;
> > @@ -533,7 +541,7 @@ static int ktd202x_probe(struct i2c_client
> > *client)
> >  {
> >       struct device *dev =3D &client->dev;
> >       struct ktd202x *chip;
> > -     int count;
> > +     int count =3D 0;
> Un-needed init.

Okay.

>
> >       int ret;
> >
> >       count =3D device_get_child_node_count(dev);
> > @@ -568,6 +576,8 @@ static int ktd202x_probe(struct i2c_client
> > *client)
> >               return ret;
> >       }
> >
> > +     chip->num_leds =3D (int) (unsigned
> > long)i2c_get_match_data(client);
> > +
> >       ret =3D ktd202x_probe_dt(chip);
> >       if (ret < 0) {
> >               regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
> > chip->regulators);
> > @@ -602,21 +612,33 @@ static void ktd202x_shutdown(struct i2c_client
> > *client)
> >       regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL,
> > KTD202X_RSTR_RESET);
> >  }
> >
> > +static const struct i2c_device_id ktd202x_id[] =3D {
> > +     {"ktd2026", KTD2026_NUM_LEDS},
> > +     {"ktd2027", KTD2027_NUM_LEDS},
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(i2c, ktd202x_id);
> > +
> > +#ifndef CONFIG_ACPI
> >  static const struct of_device_id ktd202x_match_table[] =3D {
> >       { .compatible =3D "kinetic,ktd2026", .data =3D (void
> > *)KTD2026_NUM_LEDS },
> >       { .compatible =3D "kinetic,ktd2027", .data =3D (void
> > *)KTD2027_NUM_LEDS },
> >       {},
> >  };
> >  MODULE_DEVICE_TABLE(of, ktd202x_match_table);
> > +#endif
> >
> >  static struct i2c_driver ktd202x_driver =3D {
> >       .driver =3D {
> > -             .name =3D "leds-ktd202x",
> > -             .of_match_table =3D ktd202x_match_table,
> > +             .name   =3D "leds-ktd202x",
> Why was the space after "name" replaced by tab?
I'll remove it.

>
> > +#ifndef CONFIG_ACPI
> > +             .of_match_table =3D ktd20xx_match_table,
> Typo: ktd20xx_match_table -> ktd202x_match_table
Ops. I'll fix it.

>
> Andr=C3=A9
>
> > +#endif
> >       },
> >       .probe =3D ktd202x_probe,
> >       .remove =3D ktd202x_remove,
> >       .shutdown =3D ktd202x_shutdown,
> > +     .id_table =3D ktd202x_id,
> >  };
> >  module_i2c_driver(ktd202x_driver);
> >
>

I'll propose a v2 patch to improve the code according to your suggestions.


--=20
BR,
Kate

