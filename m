Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15DAC77B60
	for <platform-driver-x86@archiver.kernel.org>; Sun,  2 Apr 2023 06:05:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbjDBGF3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 2 Apr 2023 02:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjDBGF2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 2 Apr 2023 02:05:28 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E98D20C3A
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Apr 2023 23:05:27 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id z33so8068782qko.6
        for <platform-driver-x86@vger.kernel.org>; Sat, 01 Apr 2023 23:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680415526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5w4ZHKkTCN3vA7pdNgVdmdNeSjSMQOJpKmTUERmyy8=;
        b=NNqh9LzYSCcFUVP7e02UFqHXwjYPGLwku9hr/XreWasx/6KotFHaiO2djG5X9bMif8
         G0sQfAUkzaSuEWUmPY5juR8vjlSCd9GcKDRMKq/ZBy98G+J1O1+nj6KQKd4b0u55G19C
         pbwYEpvkGI27spxzz/cB5Vku/onDH/vpzQOxH6o2E98k4jCHdVjAj6unVnwWZVjoG479
         uv27626EJmuukXLAR3cwtsyAiefU3EsGfOq1QGa4Mo6lLYTfRqapAqxk2LKx26fwKPnS
         s58Xn93u1tvT4OSO0OEwXkP/GFeXztOuVYmAd2D0yqItdsljo0N1+JRTWmAle1S+ZMyU
         sOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680415526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5w4ZHKkTCN3vA7pdNgVdmdNeSjSMQOJpKmTUERmyy8=;
        b=4303Th/2ZnCqK/r5C1nP7BdtrBE0f42T8aydfpuBFwtZAN/RWJPzBTeY0jjA6Sg+l2
         fMJ3c4t7wcS1y6RSWZmy5JLd3FrLUbIti+kimX5vtkeUX5TVBxReZvr4Jo/YO3KZ4AGP
         jiHMpQ7FGxlnO70fctLqmgXWbtxptN8c0LKwdbP7C2WQn49f3hpqnyI/QDhUX92NBju2
         l58jLTyG7HywAC9fn/WUnrH5QoZI3mqgWuZvxK7k0CbG9Q2KnK9gbZGOS0hqgtXI4XE2
         icSEsxHfmv8rH44HrTv21IFyv4O96o67d8rMy/GKGkUDBEkqPMOasy4EVZ+9lwc04U/W
         UZBQ==
X-Gm-Message-State: AO0yUKUwCJyJoBoTV8pVhjJOKkHwskkWgERqE78jW1jIMp0HmtliSM2x
        u93ckxoRkmFKkR5rzEHdXbl3eJrMQX6fdRot+ZtupzQZ1EYeOg==
X-Google-Smtp-Source: AK7set90e2bFCOiEbhP7wKc8gfxUMqWVI3njBZvBlHuhqFnuu9NFUSNhfzM/sh/uBXS9y7K0bCGjbcqmV+hy7xw0pG0=
X-Received: by 2002:a05:620a:986:b0:746:af25:7e8a with SMTP id
 x6-20020a05620a098600b00746af257e8amr6489329qkx.14.1680415526062; Sat, 01 Apr
 2023 23:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230401150737.597417-1-hdegoede@redhat.com> <20230401150737.597417-3-hdegoede@redhat.com>
In-Reply-To: <20230401150737.597417-3-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 2 Apr 2023 08:04:48 +0200
Message-ID: <CAHp75Ve5zx0rEDjQTkf2KsRC4ASVoxUkhpX2YFAJsNuV9+v3OQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: x86-android-tablets: Add Lenovo Yoga
 Book X90F/L data
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Apr 1, 2023 at 5:07=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> The Lenovo Yoga Book X90F/L is a x86 ACPI tablet which ships with Android
> x86 as factory OS. Its DSDT contains a bunch of I2C devices which are not
> actually there, causing various resource conflicts. Enumeration of these
> is skipped through the acpi_quirk_skip_i2c_client_enumeration().
>
> Add support for manually instantiating the I2C + other devices which are
> actually present on this tablet by adding the necessary device info to
> the x86-android-tablets module.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../platform/x86/x86-android-tablets/dmi.c    |   9 ++
>  .../platform/x86/x86-android-tablets/lenovo.c | 122 ++++++++++++++++++
>  .../x86-android-tablets/x86-android-tablets.h |   1 +
>  3 files changed, 132 insertions(+)
>
> diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/pla=
tform/x86/x86-android-tablets/dmi.c
> index 6ea47af1b480..23e640b7003d 100644
> --- a/drivers/platform/x86/x86-android-tablets/dmi.c
> +++ b/drivers/platform/x86/x86-android-tablets/dmi.c
> @@ -76,6 +76,15 @@ const struct dmi_system_id x86_android_tablet_ids[] __=
initconst =3D {
>                 },
>                 .driver_data =3D (void *)&czc_p10t,
>         },
> +       {
> +               /* Lenovo Yoga Book X90F / X90L */
> +               .matches =3D {
> +                       DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporatio=
n"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 =
PLATFORM"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "YETI-11"),
> +               },
> +               .driver_data =3D (void *)&lenovo_yogabook_x90_info,
> +       },
>         {
>                 /* Lenovo Yoga Book X91F / X91L */
>                 .matches =3D {
> diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/=
platform/x86/x86-android-tablets/lenovo.c
> index 5d217cbbde30..d53928504c09 100644
> --- a/drivers/platform/x86/x86-android-tablets/lenovo.c
> +++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
> @@ -38,6 +38,128 @@ static struct lp855x_platform_data lenovo_lp8557_pdat=
a =3D {
>         .initial_brightness =3D 128,
>  };
>
> +/* Lenovo Yoga Book X90F / X90L's Android factory img has everything har=
dcoded */
> +
> +/*
> + * The HiDeep IST940E touchscreen comes up in HID mode and could alterna=
tively
> + * be used in I2C-HID mode (I2C-HID descriptor reg 0x0020) if i2c-hid-of=
.c is
> + * modified to use generic (non of) device-properties and thought to dea=
l with

non-OF

> + * the reset GPIO. "hideep,force-native-protocol" resets it to native mo=
de.
> + */
> +static const struct property_entry lenovo_yb1_x90_hideep_ts_props[] =3D =
{
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1200),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1920),
> +       PROPERTY_ENTRY_U32("touchscreen-max-pressure", 16384),
> +       PROPERTY_ENTRY_BOOL("hideep,force-native-protocol"),
> +       { }
> +};
> +
> +static const struct software_node lenovo_yb1_x90_hideep_ts_node =3D {
> +       .properties =3D lenovo_yb1_x90_hideep_ts_props,
> +};
> +
> +static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __i=
nitconst =3D {
> +       {
> +               /* BQ27542 fuel-gauge */
> +               .board_info =3D {
> +                       .type =3D "bq27542",
> +                       .addr =3D 0x55,
> +                       .dev_name =3D "bq27542",
> +                       .swnode =3D &fg_bq25890_supply_node,
> +               },
> +               .adapter_path =3D "\\_SB_.PCI0.I2C1",
> +       }, {
> +               /* Goodix Touchscreen in keyboard half*/

Missing space before */.

> +               .board_info =3D {
> +                       .type =3D "GDIX1001:00",
> +                       .addr =3D 0x14,
> +                       .dev_name =3D "goodix_ts",
> +               },
> +               .adapter_path =3D "\\_SB_.PCI0.I2C2",
> +               .irq_data =3D {
> +                       .type =3D X86_ACPI_IRQ_TYPE_GPIOINT,
> +                       .chip =3D "INT33FF:01",
> +                       .index =3D 56,
> +                       .trigger =3D ACPI_EDGE_SENSITIVE,
> +                       .polarity =3D ACPI_ACTIVE_LOW,
> +               },
> +       }, {
> +               /* LP8557 Backlight controller */
> +               .board_info =3D {
> +                       .type =3D "lp8557",
> +                       .addr =3D 0x2c,
> +                       .dev_name =3D "lp8557",
> +                       .platform_data =3D &lenovo_lp8557_pdata,
> +               },
> +               .adapter_path =3D "\\_SB_.PCI0.I2C4",
> +       }, {
> +               /* HiDeep IST940E Touchscreen in display half */
> +               .board_info =3D {
> +                       .type =3D "hideep_ts",
> +                       .addr =3D 0x6c,
> +                       .dev_name =3D "hideep_ts",
> +                       .swnode =3D &lenovo_yb1_x90_hideep_ts_node,
> +               },
> +               .adapter_path =3D "\\_SB_.PCI0.I2C6",
> +               .irq_data =3D {
> +                       .type =3D X86_ACPI_IRQ_TYPE_GPIOINT,
> +                       .chip =3D "INT33FF:03",
> +                       .index =3D 77,
> +                       .trigger =3D ACPI_LEVEL_SENSITIVE,
> +                       .polarity =3D ACPI_ACTIVE_LOW,
> +               },
> +       },
> +};
> +
> +static struct gpiod_lookup_table lenovo_yb1_x90_goodix_gpios =3D {
> +       .dev_id =3D "i2c-goodix_ts",
> +       .table =3D {
> +               GPIO_LOOKUP("INT33FF:01", 53, "reset", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("INT33FF:01", 56, "irq", GPIO_ACTIVE_HIGH),
> +               { }
> +       },
> +};
> +
> +static struct gpiod_lookup_table lenovo_yb1_x90_hideep_gpios =3D {
> +       .dev_id =3D "i2c-hideep_ts",
> +       .table =3D {
> +               GPIO_LOOKUP("INT33FF:00", 7, "reset", GPIO_ACTIVE_LOW),
> +               { }
> +       },
> +};
> +
> +static struct gpiod_lookup_table * const lenovo_yb1_x90_gpios[] =3D {
> +       &lenovo_yb1_x90_hideep_gpios,
> +       &lenovo_yb1_x90_goodix_gpios,
> +       NULL
> +};
> +
> +static int __init lenovo_yb1_x90_init(void)
> +{
> +       /* Enable the regulators used by the touchscreens */
> +
> +       /* Vprog3B 3.0V used by the goodix touchscreen in the keyboard ha=
lf */
> +       intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0x9b, 0x02, 0xff)=
;
> +
> +       /* Vprog4D 3.0V used by the HiDeep touchscreen in the display hal=
f */
> +       intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0x9f, 0x02, 0xff)=
;
> +
> +       /* Vprog5A 1.8V used by the HiDeep touchscreen in the display hal=
f */
> +       intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0xa0, 0x02, 0xff)=
;
> +
> +       /* Vprog5B 1.8V used by the goodix touchscreen in the keyboard ha=
lf */
> +       intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0xa1, 0x02, 0xff)=
;
> +
> +       return 0;
> +}
> +
> +const struct x86_dev_info lenovo_yogabook_x90_info __initconst =3D {
> +       .i2c_client_info =3D lenovo_yb1_x90_i2c_clients,
> +       .i2c_client_count =3D ARRAY_SIZE(lenovo_yb1_x90_i2c_clients),
> +       .gpiod_lookup_tables =3D lenovo_yb1_x90_gpios,
> +       .init =3D lenovo_yb1_x90_init,
> +};
> +
>  /* Lenovo Yoga Book X91F/L Windows tablet needs manual instantiation of =
the fg client */
>  static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[=
] __initconst =3D {
>         {
> diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets=
.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> index c2b490519324..b6802d75dbdd 100644
> --- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> +++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> @@ -94,6 +94,7 @@ extern const struct x86_dev_info asus_me176c_info;
>  extern const struct x86_dev_info asus_tf103c_info;
>  extern const struct x86_dev_info chuwi_hi8_info;
>  extern const struct x86_dev_info czc_p10t;
> +extern const struct x86_dev_info lenovo_yogabook_x90_info;
>  extern const struct x86_dev_info lenovo_yogabook_x91_info;
>  extern const struct x86_dev_info lenovo_yoga_tab2_830_1050_info;
>  extern const struct x86_dev_info lenovo_yt3_info;

For the entire series
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
