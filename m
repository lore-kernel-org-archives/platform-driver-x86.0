Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C825E92731
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 19:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjJET2w (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 15:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjJET2v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 15:28:51 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9E7DB
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Oct 2023 12:28:49 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4526c6579afso921297137.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Oct 2023 12:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696534128; x=1697138928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSh0l5ofVGMNbspBk9OBoPCC5cHBB/5eLrue4avwkfs=;
        b=DPND1qj8JvWAwB4AQJYcJxvDGbI4Ctbzr0MLsYIW5EqmSkDVsJooBhezPvcPNCX+Iw
         grvlGTYhVJLayqgOFgLqZRbcVssb5PJ8vEh5m9W3GhKuiLchL4Ngz7uvIULT9tzwFqAw
         hqU3JiJLXOnmO0x/pVEGu972L/Y2CchQt4QiEHnLglzdrxKLc/3jcBT8zoHV4ynlnqf+
         ga0asCrNYs3PT+RNdJFCt1qqATw8iCBYy56rkMq7h0jZS5qq7MZTGFvgCbq2RxWVArri
         pRsdwALqAW2wOB/YyUp7+SjqBo9Zn0FKDQluXSAFqWsExFel7pHkYoXYNnNlGF3O7Rh0
         DVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696534128; x=1697138928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSh0l5ofVGMNbspBk9OBoPCC5cHBB/5eLrue4avwkfs=;
        b=VtIwvspovaEkYmxxz9pljwxAfe2IsWRvDiI3OhmmpjM/mrrPMFxHeSrN8dpQ45wH9o
         4sDQCFKLb9HzVegAwwBTU6lmO8bJiGoDnAgW63EZ+yJSL8Bc/fV2wsvMvyQPvDXrAFLH
         qq5GS/U1vT+rTbt6AKsChy2wU5hSLlQhWjn3jvlP1Gk0E5BCROBTdRXzdvp+8l64br9L
         U6CLnoFnTj9Q6wvTl8twAd2qzc5gwGUzVWzNXBn8WTCDDKYxKO9MWVSNi8q2MziJ6dhP
         G5+SziOvEPFqN6E5xsdTtvNhHW6S48g+QjrKWz+Is2ddya48BW8zLJu+xAmfuf3FRqoz
         X9ig==
X-Gm-Message-State: AOJu0YxWY4/TrFXt2TEpu0pNfWu7p7y8nheTXV/j0jPH/0eVSqQSm45m
        Y9Y+tSo4ul0tp0YOctkRqVi5BM3lm7pEMdmVHqfwvA==
X-Google-Smtp-Source: AGHT+IHAkb4QbOhqb1IbWDecFeoJk4YYf8bLlEmnaFX7gpy/mLj6MNRVg1DgoQMpuq9pgjqv8doTTSOYwnt0RHehLmA=
X-Received: by 2002:a67:fd50:0:b0:450:cebb:4f15 with SMTP id
 g16-20020a67fd50000000b00450cebb4f15mr2244279vsr.1.1696534126724; Thu, 05 Oct
 2023 12:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231004162317.163488-1-hdegoede@redhat.com> <20231004162317.163488-4-hdegoede@redhat.com>
In-Reply-To: <20231004162317.163488-4-hdegoede@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 Oct 2023 21:28:36 +0200
Message-ID: <CAMRc=McLZU06s10h7HFFDaRpFtA-DCz=aRqkuPA-x0mgFPD2LA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] platform/x86: int3472: Stop using gpiod_toggle_active_low()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Oct 4, 2023 at 6:23=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Use the new skl_int3472_gpiod_get_from_temp_lookup() helper to get
> a gpio to pass to register_gpio_clock(), skl_int3472_register_regulator()
> and skl_int3472_register_pled().
>
> This removes all use of the deprecated gpiod_toggle_active_low() and
> acpi_get_and_request_gpiod() functions.
>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../x86/intel/int3472/clk_and_regulator.c     | 31 ++-----------
>  drivers/platform/x86/intel/int3472/common.h   |  7 ++-
>  drivers/platform/x86/intel/int3472/discrete.c | 43 +++++++++++++------
>  drivers/platform/x86/intel/int3472/led.c      | 17 ++------
>  4 files changed, 40 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/dri=
vers/platform/x86/intel/int3472/clk_and_regulator.c
> index ef4b3141efcd..459f96c04ca1 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -162,9 +162,8 @@ int skl_int3472_register_dsm_clock(struct int3472_dis=
crete_device *int3472)
>  }
>
>  int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3=
472,
> -                                   struct acpi_resource_gpio *agpio, u32=
 polarity)
> +                                   struct gpio_desc *gpio)
>  {
> -       char *path =3D agpio->resource_source.string_ptr;
>         struct clk_init_data init =3D {
>                 .ops =3D &skl_int3472_clock_ops,
>                 .flags =3D CLK_GET_RATE_NOCACHE,
> @@ -174,19 +173,7 @@ int skl_int3472_register_gpio_clock(struct int3472_d=
iscrete_device *int3472,
>         if (int3472->clock.cl)
>                 return -EBUSY;
>
> -       int3472->clock.ena_gpio =3D acpi_get_and_request_gpiod(path, agpi=
o->pin_table[0],
> -                                                            "int3472,clk=
-enable");
> -       if (IS_ERR(int3472->clock.ena_gpio)) {
> -               ret =3D PTR_ERR(int3472->clock.ena_gpio);
> -               int3472->clock.ena_gpio =3D NULL;
> -               return dev_err_probe(int3472->dev, ret, "getting clk-enab=
le GPIO\n");
> -       }
> -
> -       if (polarity =3D=3D GPIO_ACTIVE_LOW)
> -               gpiod_toggle_active_low(int3472->clock.ena_gpio);
> -
> -       /* Ensure the pin is in output mode and non-active state */
> -       gpiod_direction_output(int3472->clock.ena_gpio, 0);
> +       int3472->clock.ena_gpio =3D gpio;
>
>         init.name =3D kasprintf(GFP_KERNEL, "%s-clk",
>                               acpi_dev_name(int3472->adev));
> @@ -273,9 +260,8 @@ static const struct dmi_system_id skl_int3472_regulat=
or_second_sensor[] =3D {
>  };
>
>  int skl_int3472_register_regulator(struct int3472_discrete_device *int34=
72,
> -                                  struct acpi_resource_gpio *agpio)
> +                                  struct gpio_desc *gpio)
>  {
> -       char *path =3D agpio->resource_source.string_ptr;
>         struct regulator_init_data init_data =3D { };
>         struct regulator_config cfg =3D { };
>         const char *second_sensor =3D NULL;
> @@ -314,16 +300,7 @@ int skl_int3472_register_regulator(struct int3472_di=
screte_device *int3472,
>                                                 int3472->regulator.supply=
_name,
>                                                 &int3472_gpio_regulator_o=
ps);
>
> -       int3472->regulator.gpio =3D acpi_get_and_request_gpiod(path, agpi=
o->pin_table[0],
> -                                                            "int3472,reg=
ulator");
> -       if (IS_ERR(int3472->regulator.gpio)) {
> -               ret =3D PTR_ERR(int3472->regulator.gpio);
> -               int3472->regulator.gpio =3D NULL;
> -               return dev_err_probe(int3472->dev, ret, "getting regulato=
r GPIO\n");
> -       }
> -
> -       /* Ensure the pin is in output mode and non-active state */
> -       gpiod_direction_output(int3472->regulator.gpio, 0);
> +       int3472->regulator.gpio =3D gpio;
>
>         cfg.dev =3D &int3472->adev->dev;
>         cfg.init_data =3D &init_data;
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platfo=
rm/x86/intel/int3472/common.h
> index 9f29baa13860..145dec66df64 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -117,16 +117,15 @@ int skl_int3472_get_sensor_adev_and_name(struct dev=
ice *dev,
>                                          const char **name_ret);
>
>  int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3=
472,
> -                                   struct acpi_resource_gpio *agpio, u32=
 polarity);
> +                                   struct gpio_desc *gpio);
>  int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int34=
72);
>  void skl_int3472_unregister_clock(struct int3472_discrete_device *int347=
2);
>
>  int skl_int3472_register_regulator(struct int3472_discrete_device *int34=
72,
> -                                  struct acpi_resource_gpio *agpio);
> +                                  struct gpio_desc *gpio);
>  void skl_int3472_unregister_regulator(struct int3472_discrete_device *in=
t3472);
>
> -int skl_int3472_register_pled(struct int3472_discrete_device *int3472,
> -                             struct acpi_resource_gpio *agpio, u32 polar=
ity);
> +int skl_int3472_register_pled(struct int3472_discrete_device *int3472, s=
truct gpio_desc *gpio);
>  void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472=
);
>
>  #endif
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/plat=
form/x86/intel/int3472/discrete.c
> index b69ef63f75ab..0bc7cbefd9ae 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -194,6 +194,7 @@ static int skl_int3472_handle_gpio_resources(struct a=
cpi_resource *ares,
>         struct acpi_resource_gpio *agpio;
>         u8 active_value, pin, type;
>         union acpi_object *obj;
> +       struct gpio_desc *gpio;
>         const char *err_msg;
>         const char *func;
>         u32 polarity;
> @@ -244,22 +245,38 @@ static int skl_int3472_handle_gpio_resources(struct=
 acpi_resource *ares,
>
>                 break;
>         case INT3472_GPIO_TYPE_CLK_ENABLE:
> -               ret =3D skl_int3472_register_gpio_clock(int3472, agpio, p=
olarity);
> -               if (ret)
> -                       err_msg =3D "Failed to register clock\n";
> -
> -               break;
>         case INT3472_GPIO_TYPE_PRIVACY_LED:
> -               ret =3D skl_int3472_register_pled(int3472, agpio, polarit=
y);
> -               if (ret)
> -                       err_msg =3D "Failed to register LED\n";
> -
> -               break;
>         case INT3472_GPIO_TYPE_POWER_ENABLE:
> -               ret =3D skl_int3472_register_regulator(int3472, agpio);
> -               if (ret)
> -                       err_msg =3D "Failed to map regulator to sensor\n"=
;
> +               gpio =3D skl_int3472_gpiod_get_from_temp_lookup(int3472, =
agpio, func, polarity);
> +               if (IS_ERR(gpio)) {
> +                       ret =3D PTR_ERR(gpio);
> +                       err_msg =3D "Failed to get GPIO\n";
> +                       break;
> +               }
>
> +               switch (type) {

My brain refused to parse the diff, I needed to apply the patch to
understand what it's doing. I can't say I'm a fan of this double
switch construct but I don't have a better idea either, so...

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

> +               case INT3472_GPIO_TYPE_CLK_ENABLE:
> +                       ret =3D skl_int3472_register_gpio_clock(int3472, =
gpio);
> +                       if (ret)
> +                               err_msg =3D "Failed to register clock\n";
> +
> +                       break;
> +               case INT3472_GPIO_TYPE_PRIVACY_LED:
> +                       ret =3D skl_int3472_register_pled(int3472, gpio);
> +                       if (ret)
> +                               err_msg =3D "Failed to register LED\n";
> +
> +                       break;
> +               case INT3472_GPIO_TYPE_POWER_ENABLE:
> +                       ret =3D skl_int3472_register_regulator(int3472, g=
pio);
> +                       if (ret)
> +                               err_msg =3D "Failed to map regulator to s=
ensor\n";
> +
> +                       break;
> +               default: /* Never reached */
> +                       ret =3D -EINVAL;
> +                       break;
> +               }
>                 break;
>         default:
>                 dev_warn(int3472->dev,
> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/=
x86/intel/int3472/led.c
> index bca1ce7d0d0c..476cd637fc51 100644
> --- a/drivers/platform/x86/intel/int3472/led.c
> +++ b/drivers/platform/x86/intel/int3472/led.c
> @@ -16,26 +16,15 @@ static int int3472_pled_set(struct led_classdev *led_=
cdev,
>         return 0;
>  }
>
> -int skl_int3472_register_pled(struct int3472_discrete_device *int3472,
> -                             struct acpi_resource_gpio *agpio, u32 polar=
ity)
> +int skl_int3472_register_pled(struct int3472_discrete_device *int3472, s=
truct gpio_desc *gpio)
>  {
> -       char *p, *path =3D agpio->resource_source.string_ptr;
> +       char *p;
>         int ret;
>
>         if (int3472->pled.classdev.dev)
>                 return -EBUSY;
>
> -       int3472->pled.gpio =3D acpi_get_and_request_gpiod(path, agpio->pi=
n_table[0],
> -                                                            "int3472,pri=
vacy-led");
> -       if (IS_ERR(int3472->pled.gpio))
> -               return dev_err_probe(int3472->dev, PTR_ERR(int3472->pled.=
gpio),
> -                                    "getting privacy LED GPIO\n");
> -
> -       if (polarity =3D=3D GPIO_ACTIVE_LOW)
> -               gpiod_toggle_active_low(int3472->pled.gpio);
> -
> -       /* Ensure the pin is in output mode and non-active state */
> -       gpiod_direction_output(int3472->pled.gpio, 0);
> +       int3472->pled.gpio =3D gpio;
>
>         /* Generate the name, replacing the ':' in the ACPI devname with =
'_' */
>         snprintf(int3472->pled.name, sizeof(int3472->pled.name),
> --
> 2.41.0
>
