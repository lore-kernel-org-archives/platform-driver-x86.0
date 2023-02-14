Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BA1C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Feb 2023 15:04:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjBNPED (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Feb 2023 10:04:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbjBNPEC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Feb 2023 10:04:02 -0500
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F606EF92
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Feb 2023 07:04:00 -0800 (PST)
Date:   Tue, 14 Feb 2023 15:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1676387035; x=1676646235;
        bh=JHidAUh3/dvgW3cWD27rY0S3umxKDbBUVuHoAxS6m2U=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=hAnEw+uGZi9Dd9lwLWbapjq5QR2v/osVy5YW5rGpkXzHIX/MLz+8qTWjvwg27SmND
         ruKu1FB/cvquoMLatFwGpC6CHRAciFqFjKMv6jhGiPAHn18v2IDQIeKXy8DFKoFktq
         dDNLZn3BHQncw0ZjuBHWH9rLBPQnVyqUIgW0vx6aoq9qkmY8qII+qutGA+KGS3PRbq
         w919++WpQoJd/NvrukPzklnGXjtUQX9D9GluCAo0qgBo4dIkUQH+ULFScDRI8BW5X5
         STxuTIVAYbA9sdIY9Q2MMxR7AJ56pbuNDmbHwOq6BiOk353l+0g3bBsd3/HOBHfsGg
         t+Uq/GYnx7zlg==
To:     Nikita Kravets <teackot@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: Add new msi-ec driver
Message-ID: <83AkxqZKq3bgBwaStV4wlfKJ_gH589YsVpodZGlDzxEydljNFJWfJG8cesFfH_cr5n7YaxxqIRQUxSuiGSgQiHZJkb_q1GoJgtrIGFNChzg=@protonmail.com>
In-Reply-To: <20230214132522.32631-1-teackot@gmail.com>
References: <20230214132522.32631-1-teackot@gmail.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2023. febru=C3=A1r 14., kedd 14:25 keltez=C3=A9ssel, Nikita Kravets <teacko=
t@gmail.com> =C3=ADrta:

> Add a new driver to allow various MSI laptops' functionalities to be
> controlled from userspace. This includes such features as power
> profiles (aka shift modes), fan speed, charge thresholds, LEDs, etc.
>=20
> This driver contains EC memory configurations for different firmware
> versions and exports battery charge thresholds to userspace (note,
> that start and end thresholds control the same EC parameter
> and are always 10% apart).
>=20
> Link: https://github.com/BeardOverflow/msi-ec/
> Discussion: https://github.com/BeardOverflow/msi-ec/pull/13
> Signed-off-by: Nikita Kravets <teackot@gmail.com>
> ---
>  drivers/platform/x86/Kconfig  |   7 +
>  drivers/platform/x86/Makefile |   1 +
>  drivers/platform/x86/msi-ec.c | 528 ++++++++++++++++++++++++++++++++++
>  drivers/platform/x86/msi-ec.h | 119 ++++++++
>  4 files changed, 655 insertions(+)
>  create mode 100644 drivers/platform/x86/msi-ec.c
>  create mode 100644 drivers/platform/x86/msi-ec.h
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 5692385e2d26..4534d11f9ca5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -644,6 +644,13 @@ config THINKPAD_LMI
>=20
>  source "drivers/platform/x86/intel/Kconfig"
>=20
> +config MSI_EC
> +=09tristate "MSI EC Extras"
> +=09depends on ACPI
> +=09help
> +=09  This driver allows various MSI laptops' functionalities to be
> +=09  controlled from userspace, including battery charge threshold.
> +
>  config MSI_LAPTOP
>  =09tristate "MSI Laptop Extras"
>  =09depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index 1d3d1b02541b..7cc2beca8208 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_THINKPAD_LMI)=09+=3D think-lmi.o
>  obj-y=09=09=09=09+=3D intel/
>=20
>  # MSI
> +obj-$(CONFIG_MSI_EC)=09=09+=3D msi-ec.o
>  obj-$(CONFIG_MSI_LAPTOP)=09+=3D msi-laptop.o
>  obj-$(CONFIG_MSI_WMI)=09=09+=3D msi-wmi.o
>=20
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.=
c
> new file mode 100644
> index 000000000000..b32106445bf6
> --- /dev/null
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -0,0 +1,528 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/*
> + * msi-ec: MSI laptops' embedded controller driver.
> + *
> + * This driver allows various MSI laptops' functionalities to be
> + * controlled from userspace.
> + *
> + * It contains EC memory configurations for different firmware versions
> + * and exports battery charge thresholds to userspace.
> + *
> + * Copyright (C) 2023 Jose Angel Pastrana <japp0005@red.ujaen.es>
> + * Copyright (C) 2023 Aakash Singh <mail@singhaakash.dev>
> + * Copyright (C) 2023 Nikita Kravets <teackot@gmail.com>
> + */
> +
> +#include "msi-ec.h"
> +
> +#include <acpi/battery.h>
> +#include <linux/acpi.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/proc_fs.h>
> +#include <linux/seq_file.h>
> +
> +static const char *const SM_ECO_NAME       =3D "eco";
> +static const char *const SM_COMFORT_NAME   =3D "comfort";
> +static const char *const SM_SPORT_NAME     =3D "sport";
> +static const char *const SM_TURBO_NAME     =3D "turbo";
> +
> +static const char *ALLOWED_FW_0[] __initdata =3D {
> +=09"14C1EMS1.101",
> +=09NULL,

Usually commas are omitted after sentinel entries.


> +};
> +
> +static struct msi_ec_conf CONF0 __initdata =3D {
> +=09.allowed_fw =3D ALLOWED_FW_0,

Alternatively:

=09.allowed_fw =3D (const char * const []) {
=09=09"...",
=09=09"...",
=09=09NULL
=09},

(although this won't inherit the __initdata attribute as far as I can see)


> +=09.charge_control =3D {
> +=09=09.address      =3D 0xef,
> +=09=09.offset_start =3D 0x8a,
> +=09=09.offset_end   =3D 0x80,
> +=09=09.range_min    =3D 0x8a,
> +=09=09.range_max    =3D 0xe4,
> +=09},
> +=09.webcam =3D {
> +=09=09.address       =3D 0x2e,
> +=09=09.block_address =3D 0x2f,
> +=09=09.bit           =3D 1,
> +=09},
> +=09.fn_super_swap =3D {
> +=09=09.address =3D 0xbf,
> +=09=09.bit     =3D 4,
> +=09},
> +=09.cooler_boost =3D {
> +=09=09.address =3D 0x98,
> +=09=09.bit     =3D 7,
> +=09},
> +=09.shift_mode =3D {
> +=09=09.address =3D 0xf2,
> +=09=09.modes =3D {
> +=09=09=09{ SM_ECO_NAME,     0xc2 },
> +=09=09=09{ SM_COMFORT_NAME, 0xc1 },
> +=09=09=09{ SM_SPORT_NAME,   0xc0 },
> +=09=09},
> +=09=09.modes_count =3D 3,
> +=09},
> +=09.super_battery =3D {
> +=09=09.supported =3D false,
> +=09},
> +=09.fan_mode =3D {
> +=09=09.address =3D 0xf4,
> +=09},
> +=09.cpu =3D {
> +=09=09.rt_temp_address       =3D 0x68,
> +=09=09.rt_fan_speed_address  =3D 0x71,
> +=09=09.rt_fan_speed_base_min =3D 0x19,
> +=09=09.rt_fan_speed_base_max =3D 0x37,
> +=09=09.bs_fan_speed_address  =3D 0x89,
> +=09=09.bs_fan_speed_base_min =3D 0x00,
> +=09=09.bs_fan_speed_base_max =3D 0x0f,
> +=09},
> +=09.gpu =3D {
> +=09=09.rt_temp_address      =3D 0x80,
> +=09=09.rt_fan_speed_address =3D 0x89,
> +=09},
> +=09.leds =3D {
> +=09=09.micmute_led_address =3D 0x2b,
> +=09=09.mute_led_address    =3D 0x2c,
> +=09=09.bit                 =3D 2,
> +=09},
> +=09.kbd_bl =3D {
> +=09=09.bl_mode_address  =3D 0x2c, // ?
> +=09=09.bl_modes         =3D { 0x00, 0x08 }, // ?
> +=09=09.max_mode         =3D 1, // ?
> +=09=09.bl_state_address =3D 0xf3,
> +=09=09.state_base_value =3D 0x80,
> +=09=09.max_state        =3D 3,
> +=09},
> +};
> +
> +static const char *ALLOWED_FW_1[] __initdata =3D {
> +=09"17F2EMS1.106",
> +=09NULL,
> +};
> +
> +static struct msi_ec_conf CONF1 __initdata =3D {
> +=09.allowed_fw =3D ALLOWED_FW_1,
> +=09.charge_control =3D {
> +=09=09.address      =3D 0xef,
> +=09=09.offset_start =3D 0x8a,
> +=09=09.offset_end   =3D 0x80,
> +=09=09.range_min    =3D 0x8a,
> +=09=09.range_max    =3D 0xe4,
> +=09},
> +=09.webcam =3D {
> +=09=09.address       =3D 0x2e,
> +=09=09.block_address =3D 0x2f,
> +=09=09.bit           =3D 1,
> +=09},
> +=09.fn_super_swap =3D {
> +=09=09.address =3D 0xbf,
> +=09=09.bit     =3D 4,
> +=09},
> +=09.cooler_boost =3D {
> +=09=09.address =3D 0x98,
> +=09=09.bit     =3D 7,
> +=09},
> +=09.shift_mode =3D {
> +=09=09.address =3D 0xf2,
> +=09=09.modes =3D {
> +=09=09=09{ SM_ECO_NAME,     0xc2 },
> +=09=09=09{ SM_COMFORT_NAME, 0xc1 },
> +=09=09=09{ SM_SPORT_NAME,   0xc0 },
> +=09=09=09{ SM_TURBO_NAME,   0xc4 },
> +=09=09},
> +=09=09.modes_count =3D 4,
> +=09},
> +=09.super_battery =3D {
> +=09=09.supported =3D false,
> +=09},
> +=09.fan_mode =3D {
> +=09=09.address =3D 0xf4,
> +=09},
> +=09.cpu =3D {
> +=09=09.rt_temp_address       =3D 0x68,
> +=09=09.rt_fan_speed_address  =3D 0x71,
> +=09=09.rt_fan_speed_base_min =3D 0x19,
> +=09=09.rt_fan_speed_base_max =3D 0x37,
> +=09=09.bs_fan_speed_address  =3D 0x89,
> +=09=09.bs_fan_speed_base_min =3D 0x00,
> +=09=09.bs_fan_speed_base_max =3D 0x0f,
> +=09},
> +=09.gpu =3D {
> +=09=09.rt_temp_address      =3D 0x80,
> +=09=09.rt_fan_speed_address =3D 0x89,
> +=09},
> +=09.leds =3D {
> +=09=09.micmute_led_address =3D 0x2b,
> +=09=09.mute_led_address    =3D 0x2c,
> +=09=09.bit                 =3D 2,
> +=09},
> +=09.kbd_bl =3D {
> +=09=09.bl_mode_address  =3D 0x2c, // ?
> +=09=09.bl_modes         =3D { 0x00, 0x08 }, // ?
> +=09=09.max_mode         =3D 1, // ?
> +=09=09.bl_state_address =3D 0xf3,
> +=09=09.state_base_value =3D 0x80,
> +=09=09.max_state        =3D 3,
> +=09},
> +};
> +
> +static const char *ALLOWED_FW_2[] __initdata =3D {
> +=09"1552EMS1.118",
> +=09NULL,
> +};
> +
> +static struct msi_ec_conf CONF2 __initdata =3D {
> +=09.allowed_fw =3D ALLOWED_FW_2,
> +=09.charge_control =3D {
> +=09=09.address      =3D 0xd7,
> +=09=09.offset_start =3D 0x8a,
> +=09=09.offset_end   =3D 0x80,
> +=09=09.range_min    =3D 0x8a,
> +=09=09.range_max    =3D 0xe4,
> +=09},
> +=09.webcam =3D {
> +=09=09.address       =3D 0x2e,
> +=09=09.block_address =3D 0x2f,
> +=09=09.bit           =3D 1,
> +=09},
> +=09.fn_super_swap =3D {
> +=09=09.address =3D 0xe8,
> +=09=09.bit     =3D 4,
> +=09},
> +=09.cooler_boost =3D {
> +=09=09.address =3D 0x98,
> +=09=09.bit     =3D 7,
> +=09},
> +=09.shift_mode =3D {
> +=09=09.address =3D 0xf2,
> +=09=09.modes =3D {
> +=09=09=09{ SM_ECO_NAME,     0xc2 },
> +=09=09=09{ SM_COMFORT_NAME, 0xc1 },
> +=09=09=09{ SM_SPORT_NAME,   0xc0 },
> +=09=09},
> +=09=09.modes_count =3D 3,
> +=09},
> +=09.super_battery =3D {
> +=09=09.supported =3D true,
> +=09=09.address   =3D 0xeb,
> +=09=09.mask      =3D 0x0f,
> +=09},
> +=09.fan_mode =3D {
> +=09=09.address =3D 0xd4,
> +=09},
> +=09.cpu =3D {
> +=09=09.rt_temp_address       =3D 0x68,
> +=09=09.rt_fan_speed_address  =3D 0x71,
> +=09=09.rt_fan_speed_base_min =3D 0x19,
> +=09=09.rt_fan_speed_base_max =3D 0x37,
> +=09=09.bs_fan_speed_address  =3D 0x89,
> +=09=09.bs_fan_speed_base_min =3D 0x00,
> +=09=09.bs_fan_speed_base_max =3D 0x0f,
> +=09},
> +=09.gpu =3D {
> +=09=09.rt_temp_address      =3D 0x80,
> +=09=09.rt_fan_speed_address =3D 0x89,
> +=09},
> +=09.leds =3D {
> +=09=09.micmute_led_address =3D 0x2c,
> +=09=09.mute_led_address    =3D 0x2d,
> +=09=09.bit                 =3D 1,
> +=09},
> +=09.kbd_bl =3D {
> +=09=09.bl_mode_address  =3D 0x2c, // ?
> +=09=09.bl_modes         =3D { 0x00, 0x08 }, // ?
> +=09=09.max_mode         =3D 1, // ?
> +=09=09.bl_state_address =3D 0xd3,
> +=09=09.state_base_value =3D 0x80,
> +=09=09.max_state        =3D 3,
> +=09},
> +};
> +
> +static const char *ALLOWED_FW_3[] __initdata =3D {
> +=09"1592EMS1.111",
> +=09"E1592IMS.10C",
> +=09NULL,
> +};
> +
> +static struct msi_ec_conf CONF3 __initdata =3D {
> +=09.allowed_fw =3D ALLOWED_FW_3,
> +=09.charge_control =3D {
> +=09=09.address      =3D 0xef,
> +=09=09.offset_start =3D 0x8a,
> +=09=09.offset_end   =3D 0x80,
> +=09=09.range_min    =3D 0x8a,
> +=09=09.range_max    =3D 0xe4,
> +=09},
> +=09.webcam =3D {
> +=09=09.address       =3D 0x2e,
> +=09=09.block_address =3D 0x2f,
> +=09=09.bit           =3D 1,
> +=09},
> +=09.fn_super_swap =3D {
> +=09=09.address =3D 0xe8,
> +=09=09.bit     =3D 4,
> +=09},
> +=09.cooler_boost =3D {
> +=09=09.address =3D 0x98,
> +=09=09.bit     =3D 7,
> +=09},
> +=09.shift_mode =3D {
> +=09=09.address =3D 0xd2,
> +=09=09.modes =3D {
> +=09=09=09{ SM_ECO_NAME,     0xc2 },
> +=09=09=09{ SM_COMFORT_NAME, 0xc1 },
> +=09=09=09{ SM_SPORT_NAME,   0xc0 },
> +=09=09},
> +=09=09.modes_count =3D 3,
> +=09},
> +=09.super_battery =3D {
> +=09=09.supported =3D true,
> +=09=09.address   =3D 0xeb,
> +=09=09.mask      =3D 0x0f,
> +=09},
> +=09.fan_mode =3D {
> +=09=09.address =3D 0xd4,
> +=09},
> +=09.cpu =3D {
> +=09=09.rt_temp_address       =3D 0x68,
> +=09=09.rt_fan_speed_address  =3D 0xc9,
> +=09=09.rt_fan_speed_base_min =3D 0x19,
> +=09=09.rt_fan_speed_base_max =3D 0x37,
> +=09=09.bs_fan_speed_address  =3D 0x89, // ?
> +=09=09.bs_fan_speed_base_min =3D 0x00,
> +=09=09.bs_fan_speed_base_max =3D 0x0f,
> +=09},
> +=09.gpu =3D {
> +=09=09.rt_temp_address      =3D 0x80,
> +=09=09.rt_fan_speed_address =3D 0x89,
> +=09},
> +=09.leds =3D {
> +=09=09.micmute_led_address =3D 0x2b,
> +=09=09.mute_led_address    =3D 0x2c,
> +=09=09.bit                 =3D 1,
> +=09},
> +=09.kbd_bl =3D {
> +=09=09.bl_mode_address  =3D 0x2c, // ?
> +=09=09.bl_modes         =3D { 0x00, 0x08 }, // ?
> +=09=09.max_mode         =3D 1, // ?
> +=09=09.bl_state_address =3D 0xd3,
> +=09=09.state_base_value =3D 0x80,
> +=09=09.max_state        =3D 3,
> +=09},
> +};
> +
> +static struct msi_ec_conf *CONFIGURATIONS[] __initdata =3D {
> +=09&CONF0,
> +=09&CONF1,
> +=09&CONF2,
> +=09&CONF3,
> +=09NULL,
> +};
> +
> +static struct msi_ec_conf conf; // current configuration
> +
> +// =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D //
> +// Helper functions
> +// =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D //
> +
> +static int ec_read_seq(u8 addr, u8 *buf, int len)
> +{
> +=09int result;
> +=09u8 i;
> +=09for (i =3D 0; i < len; i++) {

It's a small thing, but I would make `i` and `len` be the same type.


> +=09=09result =3D ec_read(addr + i, buf + i);
> +=09=09if (result < 0)
> +=09=09=09return result;
> +=09}
> +=09return 0;
> +}
> +
> +static int ec_get_firmware_version(u8 buf[MSI_EC_FW_VERSION_LENGTH + 1])
> +{
> +=09int result;
> +
> +=09memset(buf, 0, MSI_EC_FW_VERSION_LENGTH + 1);
> +=09result =3D ec_read_seq(MSI_EC_FW_VERSION_ADDRESS,
> +=09=09=09     buf,
> +=09=09=09     MSI_EC_FW_VERSION_LENGTH);
> +=09if (result < 0)
> +=09=09return result;
> +
> +=09return MSI_EC_FW_VERSION_LENGTH + 1;
> +}
> +
> +// =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D //
> +// Sysfs power_supply subsystem
> +// =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D //
> +
> +static ssize_t charge_control_threshold_show(u8 offset, struct device *d=
evice,
> +=09=09=09=09=09     struct device_attribute *attr,
> +=09=09=09=09=09     char *buf)
> +{
> +=09u8 rdata;
> +=09int result;
> +
> +=09result =3D ec_read(conf.charge_control.address, &rdata);
> +=09if (result < 0)
> +=09=09return result;
> +
> +=09return sprintf(buf, "%i\n", rdata - offset);

Please prefer `sysfs_emit()`.


> +}
> +
> +static ssize_t charge_control_threshold_store(u8 offset, struct device *=
dev,
> +=09=09=09=09=09      struct device_attribute *attr,
> +=09=09=09=09=09      const char *buf, size_t count)
> +{
> +=09u8 wdata;
> +=09int result;
> +
> +=09result =3D kstrtou8(buf, 10, &wdata);
> +=09if (result < 0)
> +=09=09return result;
> +
> +=09wdata +=3D offset;
> +=09if (wdata < conf.charge_control.range_min ||
> +=09    wdata > conf.charge_control.range_max)
> +=09=09return -EINVAL;
> +
> +=09result =3D ec_write(conf.charge_control.address, wdata);
> +=09if (result < 0)
> +=09=09return result;
> +
> +=09return count;
> +}
> +
> +static ssize_t
> +charge_control_start_threshold_show(struct device *device,
> +=09=09=09=09    struct device_attribute *attr, char *buf)
> +{
> +=09return charge_control_threshold_show(conf.charge_control.offset_start=
,
> +=09=09=09=09=09     device, attr, buf);
> +}
> +
> +static ssize_t
> +charge_control_start_threshold_store(struct device *dev,
> +=09=09=09=09     struct device_attribute *attr,
> +=09=09=09=09     const char *buf, size_t count)
> +{
> +=09return charge_control_threshold_store(conf.charge_control.offset_star=
t,
> +=09=09=09=09=09      dev, attr, buf, count);
> +}
> +
> +static ssize_t charge_control_end_threshold_show(struct device *device,
> +=09=09=09=09=09=09 struct device_attribute *attr,
> +=09=09=09=09=09=09 char *buf)
> +{
> +=09return charge_control_threshold_show(conf.charge_control.offset_end,
> +=09=09=09=09=09     device, attr, buf);
> +}
> +
> +static ssize_t charge_control_end_threshold_store(struct device *dev,
> +=09=09=09=09=09=09  struct device_attribute *attr,
> +=09=09=09=09=09=09  const char *buf, size_t count)
> +{
> +=09return charge_control_threshold_store(conf.charge_control.offset_end,
> +=09=09=09=09=09      dev, attr, buf, count);
> +}
> +
> +static DEVICE_ATTR_RW(charge_control_start_threshold);
> +static DEVICE_ATTR_RW(charge_control_end_threshold);
> +
> +static struct attribute *msi_battery_attrs[] =3D {
> +=09&dev_attr_charge_control_start_threshold.attr,
> +=09&dev_attr_charge_control_end_threshold.attr,
> +=09NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(msi_battery);
> +
> +static int msi_battery_add(struct power_supply *battery,
> +=09=09=09   struct acpi_battery_hook *hook)
> +{
> +=09if (device_add_groups(&battery->dev, msi_battery_groups))
> +=09=09return -ENODEV;
> +=09return 0;

Why not

  return device_add_groups(...);

?

Furthermore, is it possible that there are two or more batteries?


> +}
> +
> +static int msi_battery_remove(struct power_supply *battery,
> +=09=09=09      struct acpi_battery_hook *hook)
> +{
> +=09device_remove_groups(&battery->dev, msi_battery_groups);
> +=09return 0;
> +}
> +
> +static struct acpi_battery_hook battery_hook =3D {
> +=09.add_battery =3D msi_battery_add,
> +=09.remove_battery =3D msi_battery_remove,
> +=09.name =3D MSI_EC_DRIVER_NAME,
> +};
> +
> +// =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D //
> +// Module load/unload
> +// =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D //
> +
> +static int __init load_configuration(void)
> +{
> +=09int result;
> +
> +=09// get firmware version
> +=09u8 fw_version[MSI_EC_FW_VERSION_LENGTH + 1];
> +=09result =3D ec_get_firmware_version(fw_version);
> +=09if (result < 0) {
> +=09=09return result;
> +=09}
> +
> +=09// load the suitable configuration, if exists
> +=09for (int i =3D 0; CONFIGURATIONS[i]; i++) {
> +=09=09for (int j =3D 0; CONFIGURATIONS[i]->allowed_fw[j]; j++) {
> +=09=09=09if (strcmp(CONFIGURATIONS[i]->allowed_fw[j], fw_version) =3D=3D=
 0) {
> +=09=09=09=09memcpy(&conf, CONFIGURATIONS[i], sizeof(struct msi_ec_conf))=
;
> +=09=09=09=09conf.allowed_fw =3D NULL;
> +=09=09=09=09return 0;
> +=09=09=09}
> +=09=09}
> +=09}

Have you checked if `match_string()` from string.h works here?


> +
> +=09pr_err("Your firmware version is not supported!\n");
> +=09return -EOPNOTSUPP;
> +}
> +
> +static int __init msi_ec_init(void)
> +{
> +=09int result;
> +
> +=09if (acpi_disabled) {

I am wondering how useful this check really is.


> +=09=09pr_err("Unable to init because ACPI needs to be enabled first!\n")=
;
> +=09=09return -ENODEV;
> +=09}
> +
> +=09result =3D load_configuration();

This will start poking the embedded controller when the module is loaded,
regardless of the platform. I am not sure that is desirable.


> +=09if (result < 0)
> +=09=09return result;
> +
> +=09battery_hook_register(&battery_hook);
> +
> +=09pr_info("msi-ec: module_init\n");

Instead of manually prefixing the messages, I suggest you do

  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

before including any headers and then you can drop the "msi-ec: " from the =
strings.


> +=09return 0;
> +}
> +
> +static void __exit msi_ec_exit(void)
> +{
> +=09battery_hook_unregister(&battery_hook);
> +
> +=09pr_info("msi-ec: module_exit\n");
> +}
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Jose Angel Pastrana <japp0005@red.ujaen.es>");
> +MODULE_AUTHOR("Aakash Singh <mail@singhaakash.dev>");
> +MODULE_AUTHOR("Nikita Kravets <teackot@gmail.com>");
> +MODULE_DESCRIPTION("MSI Embedded Controller");
> +
> +module_init(msi_ec_init);
> +module_exit(msi_ec_exit);
> diff --git a/drivers/platform/x86/msi-ec.h b/drivers/platform/x86/msi-ec.=
h
> new file mode 100644
> index 000000000000..4de6bba363ff
> --- /dev/null
> +++ b/drivers/platform/x86/msi-ec.h
> @@ -0,0 +1,119 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/*
> + * msi-ec: MSI laptops' embedded controller driver.
> + *
> + * Copyright (C) 2023 Jose Angel Pastrana <japp0005@red.ujaen.es>
> + * Copyright (C) 2023 Aakash Singh <mail@singhaakash.dev>
> + * Copyright (C) 2023 Nikita Kravets <teackot@gmail.com>
> + */
> +
> +#ifndef _MSI_EC_H_
> +#define _MSI_EC_H_
> +
> +#include <linux/types.h>
> +
> +#define MSI_EC_DRIVER_NAME "msi-ec"
> +
> +// Firmware info addresses are universal
> +#define MSI_EC_FW_VERSION_ADDRESS 0xa0
> +#define MSI_EC_FW_DATE_ADDRESS    0xac
> +#define MSI_EC_FW_TIME_ADDRESS    0xb4
> +#define MSI_EC_FW_VERSION_LENGTH  12
> +#define MSI_EC_FW_DATE_LENGTH     8
> +#define MSI_EC_FW_TIME_LENGTH     8
> +
> +struct msi_ec_charge_control_conf {
> +=09int address;
> +=09int offset_start;
> +=09int offset_end;
> +=09int range_min;
> +=09int range_max;
> +};
> +
> +struct msi_ec_webcam_conf {
> +=09int address;
> +=09int block_address;
> +=09int bit;
> +};
> +
> +struct msi_ec_fn_super_swap_conf {
> +=09int address;
> +=09int bit;
> +};
> +
> +struct msi_ec_cooler_boost_conf {
> +=09int address;
> +=09int bit;
> +};
> +
> +struct msi_ec_mode {
> +=09const char *name;
> +=09int value;
> +};
> +
> +struct msi_ec_shift_mode_conf {
> +=09int address;
> +=09struct msi_ec_mode modes[5]; // fixed size for easier hard coding
> +=09int modes_count;
> +};
> +
> +struct msi_ec_super_battery_conf {
> +=09bool supported;
> +=09int address;
> +=09int mask;
> +};
> +
> +struct msi_ec_fan_mode_conf {
> +=09int address;
> +};
> +
> +struct msi_ec_cpu_conf {
> +=09int rt_temp_address;
> +=09int rt_fan_speed_address; // realtime
> +=09int rt_fan_speed_base_min;
> +=09int rt_fan_speed_base_max;
> +=09int bs_fan_speed_address; // basic
> +=09int bs_fan_speed_base_min;
> +=09int bs_fan_speed_base_max;
> +};
> +
> +struct msi_ec_gpu_conf {
> +=09int rt_temp_address;
> +=09int rt_fan_speed_address; // realtime
> +};
> +
> +struct msi_ec_led_conf {
> +=09int micmute_led_address;
> +=09int mute_led_address;
> +=09int bit;
> +};
> +
> +#define MSI_EC_KBD_BL_STATE_MASK 0x3
> +struct msi_ec_kbd_bl_conf {
> +=09int bl_mode_address;
> +=09int bl_modes[2];
> +=09int max_mode;
> +
> +=09int bl_state_address;
> +=09int state_base_value;
> +=09int max_state;
> +};
> +
> +struct msi_ec_conf {
> +=09const char **allowed_fw;
> +
> +=09struct msi_ec_charge_control_conf charge_control;
> +=09struct msi_ec_webcam_conf         webcam;
> +=09struct msi_ec_fn_super_swap_conf  fn_super_swap;
> +=09struct msi_ec_cooler_boost_conf   cooler_boost;
> +=09struct msi_ec_shift_mode_conf     shift_mode;
> +=09struct msi_ec_super_battery_conf  super_battery;
> +=09struct msi_ec_fan_mode_conf       fan_mode;
> +=09struct msi_ec_cpu_conf            cpu;
> +=09struct msi_ec_gpu_conf            gpu;
> +=09struct msi_ec_led_conf            leds;
> +=09struct msi_ec_kbd_bl_conf         kbd_bl;
> +};
> +
> +#endif // _MSI_EC_H_
> --
> 2.39.1
>=20


Regards,
Barnab=C3=A1s P=C5=91cze
