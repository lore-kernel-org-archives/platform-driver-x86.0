Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524DEC77B75
	for <platform-driver-x86@archiver.kernel.org>; Sat,  6 May 2023 11:41:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbjEFLlW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 6 May 2023 07:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbjEFLlV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 6 May 2023 07:41:21 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE658A53
        for <platform-driver-x86@vger.kernel.org>; Sat,  6 May 2023 04:41:20 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-61b5b4df8baso23519286d6.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 06 May 2023 04:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683373279; x=1685965279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyEKePZDBGEn/WtsE6t3vs5F//I0eroqrsCJjRMf4Vo=;
        b=r/pQAwgXb4ewrRgLJN+gkLWyZZckxOcNZ5sNYp5tl8V6xQgSzD08mX+MGQChho79MF
         7lSdeE/BKzgxtPnCOyX7LfY4A2qoTFVQetJk2y5ndf7LVkKMSuBL9hZ6LvqJNSDFrEVt
         m9uf0tj050n28e6JrSSZZzCmEN7KKcaQijbYaxkzDUlU7+cRbeFLElE1JeK0qqvvVEhw
         aYJEwCFPWMnXKPmwRe+mqgF1aU8Z/1vqyHU8sUdGR8tsvV7c+4EhyAsyZKp18rpKKG9N
         dbu63TDLZr+7aHT2nNzUBKmJGqtoB3qVMVvU1hmOiKpQ58ESdoko1JEc7DVAtTNsbJCC
         7FKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683373279; x=1685965279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyEKePZDBGEn/WtsE6t3vs5F//I0eroqrsCJjRMf4Vo=;
        b=h31/SreYcdgi2vdMhV/Hr8Q4cVSJoxOFAL+8DNzKzj5Aidx0KdqT5dlxWCx+utI+ns
         wWkiMIC5M5YNaCnPCxG3/xstC7ifhu31tvoD52MzCyjVdt/fcXbv4Cec/7NKsuuv8M3J
         DyJw5FV2lCRVYSvcijGb/2vi7mCcw4Z3/f4WT20Dxpwep66skih0XNLCa92mWZK16KVJ
         CnB0v26P71RyizJIWXKfXd1CZUgRhjw9QK0CMXpcZM8PMaDptPont+5A+XP8N/5+C8rq
         AKk4fcsyNJbeajHkglIH37hDhv+jliB6MIObIJCjJW2GH4+fmzg5/vG5ivFdaN07InKI
         Em9A==
X-Gm-Message-State: AC+VfDyTQ1PBFWT3jYK1M5st2M5F9yjXOIBYJ8RUdN9u1g+og6nPzQGq
        tonrlUMvt67AUaW+ZlGgA+uh89Gn7ypdPwBMX3E=
X-Google-Smtp-Source: ACHHUZ4QcAmIbgbSBHgC3BISVefoGojJIG8ECEXbmoFQVo7cWHXlYyyHW840j+vHQXnzqRqdcSgaJ5Akf/TBaQPU5lQ=
X-Received: by 2002:a05:6214:1c42:b0:616:516e:f3ea with SMTP id
 if2-20020a0562141c4200b00616516ef3eamr6958357qvb.51.1683373279074; Sat, 06
 May 2023 04:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230505205901.42649-1-hdegoede@redhat.com> <20230505205901.42649-2-hdegoede@redhat.com>
In-Reply-To: <20230505205901.42649-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 6 May 2023 14:40:43 +0300
Message-ID: <CAHp75VfFMDA=ABLhopY+2Eofm4rdJch-f-ZxVRz6OOa7U=NWJw@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: x86-android-tablets: Add support for
 extra buttons on Cyberbook T116
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, May 5, 2023 at 11:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The Cyberbook T116 rugged tablet comes in both Windows and Android versio=
ns
> and even on the Android version the DSDT is mostly sane. This tablet has
> 2 extra general purpose buttons in the row with the power + volume-button=
s,
> labeled P and F.
>
> Use the x86-android-tablets infra to create a gpio-button device for thes=
e
> 2 extra buttons.

For both
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../platform/x86/x86-android-tablets/dmi.c    | 11 ++++++
>  .../platform/x86/x86-android-tablets/other.c  | 39 +++++++++++++++++++
>  .../x86-android-tablets/x86-android-tablets.h |  1 +
>  3 files changed, 51 insertions(+)
>
> diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/pla=
tform/x86/x86-android-tablets/dmi.c
> index 07acf0978325..2bda152b4a11 100644
> --- a/drivers/platform/x86/x86-android-tablets/dmi.c
> +++ b/drivers/platform/x86/x86-android-tablets/dmi.c
> @@ -58,6 +58,17 @@ const struct dmi_system_id x86_android_tablet_ids[] __=
initconst =3D {
>                 },
>                 .driver_data =3D (void *)&chuwi_hi8_info,
>         },
> +       {
> +               /* Cyberbook T116 Android version */
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "Default string"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
> +                       /* Above strings are much too generic, also match=
 on SKU + BIOS date */
> +                       DMI_MATCH(DMI_PRODUCT_SKU, "20170531"),
> +                       DMI_MATCH(DMI_BIOS_DATE, "07/12/2017"),
> +               },
> +               .driver_data =3D (void *)&cyberbook_t116_info,
> +       },
>         {
>                 /* CZC P10T */
>                 .ident =3D "CZC ODEON TPC-10 (\"P10T\")",
> diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/p=
latform/x86/x86-android-tablets/other.c
> index 4d54c89e6ca2..e79549c6aae1 100644
> --- a/drivers/platform/x86/x86-android-tablets/other.c
> +++ b/drivers/platform/x86/x86-android-tablets/other.c
> @@ -197,6 +197,45 @@ const struct x86_dev_info chuwi_hi8_info __initconst=
 =3D {
>         .init =3D chuwi_hi8_init,
>  };
>
> +/*
> + * Cyberbook T116 Android version
> + * This comes in both Windows and Android versions and even on Android
> + * the DSDT is mostly sane. This tablet has 2 extra general purpose butt=
ons
> + * in the button row with the power + volume-buttons labeled P and F.
> + * Use the x86-android-tablets infra to create a gpio-button device for =
these.
> + */
> +static const struct x86_gpio_button cyberbook_t116_buttons[] __initconst=
 =3D {
> +       {
> +               .button =3D {
> +                       .code =3D KEY_PROG1,
> +                       .active_low =3D true,
> +                       .desc =3D "prog1_key",
> +                       .type =3D EV_KEY,
> +                       .wakeup =3D false,
> +                       .debounce_interval =3D 50,
> +               },
> +               .chip =3D "INT33FF:00",
> +               .pin =3D 30,
> +       },
> +       {
> +               .button =3D {
> +                       .code =3D KEY_PROG2,
> +                       .active_low =3D true,
> +                       .desc =3D "prog2_key",
> +                       .type =3D EV_KEY,
> +                       .wakeup =3D false,
> +                       .debounce_interval =3D 50,
> +               },
> +               .chip =3D "INT33FF:03",
> +               .pin =3D 48,
> +       },
> +};
> +
> +const struct x86_dev_info cyberbook_t116_info __initconst =3D {
> +       .gpio_button =3D cyberbook_t116_buttons,
> +       .gpio_button_count =3D ARRAY_SIZE(cyberbook_t116_buttons),
> +};
> +
>  #define CZC_EC_EXTRA_PORT      0x68
>  #define CZC_EC_ANDROID_KEYS    0x63
>
> diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets=
.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> index 8f04a052eada..e46e1128acc8 100644
> --- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> +++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> @@ -94,6 +94,7 @@ extern const struct x86_dev_info advantech_mica_071_inf=
o;
>  extern const struct x86_dev_info asus_me176c_info;
>  extern const struct x86_dev_info asus_tf103c_info;
>  extern const struct x86_dev_info chuwi_hi8_info;
> +extern const struct x86_dev_info cyberbook_t116_info;
>  extern const struct x86_dev_info czc_p10t;
>  extern const struct x86_dev_info lenovo_yogabook_x90_info;
>  extern const struct x86_dev_info lenovo_yogabook_x91_info;
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
