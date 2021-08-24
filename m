Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7F5C4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Aug 2021 22:47:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2218261357
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Aug 2021 22:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhHXWsc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Aug 2021 18:48:32 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:36722 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhHXWsb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Aug 2021 18:48:31 -0400
Date:   Tue, 24 Aug 2021 22:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1629845263;
        bh=2WMkNuiClWH2wp3LlUZ9qvaWCZDSH29y4aDm5JtCbrg=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=AUIHJDBUvDXxEvOzDIeUuoWGlW5OqLFMCTciHQ5WLrgnOtSBp/8u+Jz2pamv6D8BO
         8n1SCDZ9UNPQ9B0cNgpXWSqZtW5bVPUD9tywypZOOaF4YyOH+oiNXBWoPiuLK9BBxY
         000muWkhzhj+h01qOiIx28RZDYGvOTVY8uw9KYls=
To:     Daniel Dadap <ddadap@nvidia.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com,
        mario.limonciello@outlook.com, andy@infradead.org,
        dvhart@infradead.org, Aaron Plattner <aplattner@nvidia.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v3] platform/x86: Add driver for ACPI WMAA EC-based backlight control
Message-ID: <6RpClBuJeF9Qz9ttRSWYSDf54xIAio4IkrnTPSMeRx69TjEpe833H_rZXiIoK_GJUj4oi5Qv1BUV5yxlKMi5Pu9ngpKB_U_wie_a3_S5Yjg=@protonmail.com>
In-Reply-To: <20210824220437.14175-1-ddadap@nvidia.com>
References: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com> <20210824220437.14175-1-ddadap@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. augusztus 25., szerda 0:04 keltez=C3=A9ssel, Daniel Dadap =C3=ADrta:
> A number of upcoming notebook computer designs drive the internal
> display panel's backlight PWM through the Embedded Controller (EC).
> This EC-based backlight control can be plumbed through to an ACPI
> "WMAA" method interface, which in turn can be wrapped by WMI with
> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>
> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
> backlight class driver to control backlight levels on systems with
> EC-driven backlights.
>
> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
>
> v2: Convert to WMI subsystem driver, suggested by Mario Limonciello
>     <mario.limonciello@outlook.com>; various cleanups suggested by
>     Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
> v3: Address assorted style nits raised by Andy Shevchenko
>     <andy.shevchenko@gmail.com> in response to a related patch; remove
>     additional behavior change to WMI subsystem from patch series as
>     recommended by Hans de Goede <hdegoede@redhat.com>
>
>  MAINTAINERS                               |   6 +
>  drivers/platform/x86/Kconfig              |  10 ++
>  drivers/platform/x86/Makefile             |   1 +
>  drivers/platform/x86/wmaa-backlight-wmi.c | 184 ++++++++++++++++++++++
>  4 files changed, 201 insertions(+)
>  create mode 100644 drivers/platform/x86/wmaa-backlight-wmi.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bbaecde94aa0..fd7362a86c6d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20008,6 +20008,12 @@ L:=09linux-wireless@vger.kernel.org
>  S:=09Odd fixes
>  F:=09drivers/net/wireless/wl3501*
>
> +WMAA BACKLIGHT DRIVER
> +M:=09Daniel Dadap <ddadap@nvidia.com>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Supported
> +F:=09drivers/platform/x86/wmaa-backlight-wmi.c
> +
>  WOLFSON MICROELECTRONICS DRIVERS
>  L:=09patches@opensource.cirrus.com
>  S:=09Supported
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index d12db6c316ea..e54449c16d03 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -113,6 +113,16 @@ config PEAQ_WMI
>  =09help
>  =09 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s.
>
> +config WMAA_BACKLIGHT_WMI
> +=09tristate "ACPI WMAA Backlight Driver"
> +=09depends on ACPI_WMI
> +=09depends on BACKLIGHT_CLASS_DEVICE
> +=09help
> +=09  This driver provides a sysfs backlight interface for notebook
> +=09  systems which expose the WMAA ACPI method and an associated WMI
> +=09  wrapper to drive LCD backlight levels through the system's
> +=09  Embedded Controller.
> +
>  config XIAOMI_WMI
>  =09tristate "Xiaomi WMI key driver"
>  =09depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index 7ee369aab10d..109c1714237d 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_INTEL_WMI_SBL_FW_UPDATE)=09+=3D intel-wmi-=
sbl-fw-update.o
>  obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)=09+=3D intel-wmi-thunderbolt.o
>  obj-$(CONFIG_MXM_WMI)=09=09=09+=3D mxm-wmi.o
>  obj-$(CONFIG_PEAQ_WMI)=09=09=09+=3D peaq-wmi.o
> +obj-$(CONFIG_WMAA_BACKLIGHT_WMI)=09+=3D wmaa-backlight-wmi.o
>  obj-$(CONFIG_XIAOMI_WMI)=09=09+=3D xiaomi-wmi.o
>  obj-$(CONFIG_GIGABYTE_WMI)=09=09+=3D gigabyte-wmi.o
>
> diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c b/drivers/platform=
/x86/wmaa-backlight-wmi.c
> new file mode 100644
> index 000000000000..b607d3f88fc2
> --- /dev/null
> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/backlight.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> +
> +struct wmi_wmaa_priv {
> +=09struct backlight_device *backlight;
> +};
> +
> +enum wmaa_method {
> +=09WMAA_BRIGHTNESS_LEVEL =3D 1,
> +=09WMAA_BRIGHTNESS_SOURCE =3D 2,
> +};
> +
> +enum wmaa_get_or_set {
> +=09WMAA_GET =3D 0,
> +=09WMAA_SET =3D 1,
> +=09WMAA_GET_MAX =3D 2, // for WMAA_BRIGHTNESS_LEVEL only

/* this type of comments is preferred */


> +};
> +
> +enum wmaa_source {
> +=09WMAA_SOURCE_CLEAR =3D 0,
> +=09WMAA_SOURCE_GPU =3D 1,
> +=09WMAA_SOURCE_EC =3D 2,
> +=09WMAA_SOURCE_AUX =3D 3,
> +=09WMAA_SOURCE_COUNT
> +};
> +
> +struct wmaa_args {
> +=09u32 set;
> +=09u32 val;
> +=09u32 ret;
> +=09u32 ignored[3];
> +};
> +
> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] =3D {
> +=09{ .guid_string =3D WMAA_WMI_GUID },
> +=09{ },
> +};
> +
> +static struct wmi_device *wdev;
> +
> +static int wmi_call_wmaa(enum wmaa_method method, enum wmaa_get_or_set s=
et, u32 *val)
> +{
> +=09struct wmaa_args args =3D {
> +=09=09.set =3D set,
> +=09=09.val =3D 0,
> +=09=09.ret =3D 0,
> +=09};
> +=09struct acpi_buffer buf =3D { (acpi_size)sizeof(args), &args };
> +=09acpi_status status;
> +
> +=09if (set =3D=3D WMAA_SET)
> +=09=09args.val =3D *val;
> +
> +=09status =3D wmidev_evaluate_method(wdev, 0, method, &buf, &buf);
> +=09if (ACPI_FAILURE(status)) {
> +=09=09pr_err("ACPI WMAA failed with %s\n", acpi_format_exception(status)=
);

I think this could be `dev_err()` instead.


> +=09=09return -EIO;
> +=09}
> +
> +=09if (set !=3D WMAA_SET)
> +=09=09*val =3D args.ret;
> +
> +=09return 0;
> +}
> +
> +static int wmaa_get_brightness(u32 *level)
> +{
> +=09return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET, level);
> +}
> +
> +static int wmaa_set_brightness(u32 level)
> +{
> +=09return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_SET, &level);
> +}
> +
> +static int wmaa_backlight_update_status(struct backlight_device *bd)
> +{
> +=09return wmaa_set_brightness(bd->props.brightness);
> +}
> +
> +static int wmaa_backlight_get_brightness(struct backlight_device *bd)
> +{
> +=09u32 level;
> +=09int ret;
> +
> +=09ret =3D wmaa_get_brightness(&level);
> +
> +=09WARN_ON(ret !=3D 0);
> +=09return ret =3D=3D 0 ? level : 0;
> +}
> +
> +static const struct backlight_ops wmaa_backlight_ops =3D {
> +=09.update_status =3D wmaa_backlight_update_status,
> +=09.get_brightness =3D wmaa_backlight_get_brightness,
> +};
> +
> +static int wmaa_get_max_brightness(u32 *level)
> +{
> +=09return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET_MAX, level);
> +}
> +
> +static int wmaa_get_brightness_source(u32 *source)
> +{
> +=09return wmi_call_wmaa(WMAA_BRIGHTNESS_SOURCE, WMAA_GET, source);
> +}
> +
> +static int wmaa_backlight_wmi_probe(struct wmi_device *w, const void *ct=
x)
> +{
> +=09struct backlight_properties props =3D {0};
> +=09struct wmi_wmaa_priv *priv;
> +=09u32 source;
> +=09int ret;
> +
> +=09priv =3D devm_kmalloc(&w->dev, sizeof(*priv), GFP_KERNEL);
> +=09if(!priv)
> +=09=09return -ENOMEM;
> +
> +=09wdev =3D w;

It seems odd to me that half of the state is per-device, but the other half=
 is global.


> +
> +=09ret =3D wmaa_get_brightness_source(&source);
> +=09if (ret)
> +=09=09goto done;
> +
> +=09if (source !=3D WMAA_SOURCE_EC) {
> +=09=09ret =3D -ENODEV;
> +=09=09goto done;
> +=09}
> +
> +=09// Register a backlight handler
> +=09props.type =3D BACKLIGHT_PLATFORM;
> +=09ret =3D wmaa_get_max_brightness(&props.max_brightness);
> +=09if (ret)
> +=09=09goto done;
> +
> +=09ret =3D wmaa_get_brightness(&props.brightness);
> +=09if (ret)
> +=09=09goto done;
> +
> +=09priv->backlight =3D backlight_device_register("wmaa_backlight",
> +=09=09NULL, NULL, &wmaa_backlight_ops, &props);

Have you looked at `devm_backlight_device_register()`?


> +=09if (IS_ERR(priv->backlight))
> +=09=09return PTR_ERR(priv->backlight);
> +
> +=09dev_set_drvdata(&w->dev, priv);
> +
> +done:
> +=09return ret;
> +}
> +
> +static void wmaa_backlight_wmi_remove(struct wmi_device *wdev)
> +{
> +=09struct wmi_wmaa_priv *priv =3D dev_get_drvdata(&wdev->dev);
> +
> +=09backlight_device_unregister(priv->backlight);
> +}
> +
> +static struct wmi_driver wmaa_backlight_wmi_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D "wmaa-backlight",
> +=09},
> +=09.probe =3D wmaa_backlight_wmi_probe,
> +=09.remove =3D wmaa_backlight_wmi_remove,
> +=09.id_table =3D wmaa_backlight_wmi_id_table,
> +};
> +
> +module_wmi_driver(wmaa_backlight_wmi_driver);
> +
> +MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
> +MODULE_DESCRIPTION("WMAA Backlight WMI driver");
> +MODULE_LICENSE("GPL v2");
> +
> +MODULE_ALIAS("wmi:"WMAA_WMI_GUID);
> --
> 2.20.1


Best regards,
Barnab=C3=A1s P=C5=91cze
