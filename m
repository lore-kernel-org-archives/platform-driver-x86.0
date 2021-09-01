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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11116C432BE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Sep 2021 15:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED43060F3A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Sep 2021 15:53:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343895AbhIAPyu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Sep 2021 11:54:50 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:18977 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343916AbhIAPyt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Sep 2021 11:54:49 -0400
Date:   Wed, 01 Sep 2021 15:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630511630;
        bh=6uwVh0b32UrB8AU699TL5miHtqIG2EArWqGAgES5fzU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=cAuQ4tDa7HILBtJqHA1uUf7JuJLcGr9/Eaxy1nkEoTSYz6FEIgWFhFvdeXadi2ZZl
         rlSw6Y2bCw/0pdmV5MDh3i+ixXOK7pDb39s1uBUIRaKSPeZH4EzR+LLeMeS8V/R9L4
         bScvJ2z8+CJv8roBTD1agb8tMN0k+qtibkoHs0IU=
To:     Enver Balalic <balalic.enver@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     mgross@linux.intel.com, jdelvare@suse.com,
        platform-driver-x86@vger.kernel.org, linux@roeck-us.net,
        hdegoede@redhat.com
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v4] platform/x86: hp-wmi: add support for omen laptops
Message-ID: <VFDoTRfsCLfG-Ur2bAXhPrTkSyFQXRt59bCTRHlNYsi9wvaZdzFcUnREgsP54RXJ4Lif_Md2ITa9OzVH4igOl5aPVUZ9D99HBchK2NqdKgU=@protonmail.com>
In-Reply-To: <20210827123105.mlrpsfmpbcfunuqc@omen.localdomain>
References: <20210827123105.mlrpsfmpbcfunuqc@omen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


> This patch adds support for HP Omen laptops.
> It adds support for most things that can be controlled via the
> Windows Omen Command Center application.
>
>  - Fan speed monitoring through hwmon
>  - Platform Profile support (cool, balanced, performance)
>  - Max fan speed function toggle
>
> Also exposes the existing HDD temperature through hwmon since
> this driver didn't use hwmon before this patch.
>
> This patch has been tested on a 2020 HP Omen 15 (AMD) 15-en0023dx.
>
>  - V1
>    Initial Patch
>  - V2
>    Use standard hwmon ABI attributes
>    Add existing non-standard "hddtemp" to hwmon
>  - V3
>    Fix overflow issue in "hp_wmi_get_fan_speed"
>    Map max fan speed value back to hwmon values on read
>    Code style fixes
>    Fix issue with returning values from "hp_wmi_hwmon_read",
>    the value to return should be written to val and not just
>    returned from the function
>  - V4
>    Use DMI Board names to detect if a device should use the omen
>    specific thermal profile method.
>    Select HWMON instead of depending on it.
>    Code style fixes.
>    Replace some error codes with more specific/meaningful ones.
>    Remove the HDD temperature from HWMON since we don't know what
>    unit it's expressed in.
>    Handle error from hp_wmi_hwmon_init
>
> Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
> ---
>  drivers/platform/x86/Kconfig  |   1 +
>  drivers/platform/x86/hp-wmi.c | 336 ++++++++++++++++++++++++++++++++--
>  2 files changed, 325 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index d12db6c316ea..2ab0dcf5b598 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -434,6 +434,7 @@ config HP_WMI
>  =09depends on RFKILL || RFKILL =3D n
>  =09select INPUT_SPARSEKMAP
>  =09select ACPI_PLATFORM_PROFILE
> +=09select HWMON
>  =09help
>  =09 Say Y here if you want to support WMI-based hotkeys on HP laptops an=
d
>  =09 to read data from WMI such as docking or ambient light sensor state.
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.=
c
> index 027a1467d009..44030f513453 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -22,9 +22,11 @@
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
> +#include <linux/hwmon.h>
>  #include <linux/acpi.h>
>  #include <linux/rfkill.h>
>  #include <linux/string.h>
> +#include <linux/dmi.h>
>
>  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
>  MODULE_DESCRIPTION("HP laptop WMI hotkeys driver");
> @@ -39,6 +41,25 @@ MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TAB=
LET_MODE reporting (-1=3Daut
>
>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> +#define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> +
> +/* DMI board names of devices that should use the omen specific path for
> + * thermal profiles.
> + * This was obtained by taking a look in the windows omen command center
> + * app and parsing a json file that they use to figure out what capabili=
ties
> + * the device should have.
> + * A device is considered an omen if the DisplayName in that list contai=
ns
> + * "OMEN", and it can use the thermal profile stuff if the "Feature" arr=
ay
> + * contains "PerformanceControl".
> + */
> +static const char * const omen_thermal_profile_boards[] =3D {
> +=09"84DA", "84DB", "84DC", "8574", "8575", "860A", "87B5", "8572", "8573=
",
> +=09"8600", "8601", "8602", "8605", "8606", "8607", "8746", "8747", "8749=
",
> +=09"874A", "8603", "8604", "8748", "886B", "886C", "878A", "878B", "878C=
",
> +=09"88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2", "88F4", "88FD=
",
> +=09"88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901", "8902", "8912=
",
> +=09"8917", "8918", "8949", "894A", "89EB"
> +};
>
>  enum hp_wmi_radio {
>  =09HPWMI_WIFI=09=3D 0x0,
> @@ -89,10 +110,18 @@ enum hp_wmi_commandtype {
>  =09HPWMI_THERMAL_PROFILE_QUERY=09=3D 0x4c,
>  };
>
> +enum hp_wmi_gm_commandtype {
> +=09HPWMI_FAN_SPEED_GET_QUERY =3D 0x11,
> +=09HPWMI_SET_PERFORMANCE_MODE =3D 0x1A,
> +=09HPWMI_FAN_SPEED_MAX_GET_QUERY =3D 0x26,
> +=09HPWMI_FAN_SPEED_MAX_SET_QUERY =3D 0x27,
> +};
> +
>  enum hp_wmi_command {
>  =09HPWMI_READ=09=3D 0x01,
>  =09HPWMI_WRITE=09=3D 0x02,
>  =09HPWMI_ODM=09=3D 0x03,
> +=09HPWMI_GM=09=3D 0x20008,
>  };
>
>  enum hp_wmi_hardware_mask {
> @@ -120,6 +149,13 @@ enum hp_wireless2_bits {
>  =09HPWMI_POWER_FW_OR_HW=09=3D HPWMI_POWER_BIOS | HPWMI_POWER_HARD,
>  };
>
> +
> +enum hp_thermal_profile_omen {
> +=09HP_OMEN_THERMAL_PROFILE_DEFAULT     =3D 0x00,
> +=09HP_OMEN_THERMAL_PROFILE_PERFORMANCE =3D 0x01,
> +=09HP_OMEN_THERMAL_PROFILE_COOL        =3D 0x02,
> +};
> +
>  enum hp_thermal_profile {
>  =09HP_THERMAL_PROFILE_PERFORMANCE=09=3D 0x00,
>  =09HP_THERMAL_PROFILE_DEFAULT=09=09=3D 0x01,
> @@ -169,6 +205,8 @@ static struct platform_device *hp_wmi_platform_dev;
>  static struct platform_profile_handler platform_profile_handler;
>  static bool platform_profile_support;
>
> +static bool use_omen_thermal_profile;

I think this variable is not necessary, you set it once,
and read it once. Maybe you could add a direct function
call to `detect_is_omen_thermal_profile()` in `thermal_profile_setup()`?


> [...]
>  static int hp_wmi_read_int(int query)
>  {
>  =09int val =3D 0, ret;
> @@ -302,6 +358,75 @@ static int hp_wmi_hw_state(int mask)
>  =09return !!(state & mask);
>  }
>
> +static int omen_thermal_profile_set(int mode)
> +{
> +=09char buffer[2] =3D {0, mode};
> +=09int ret;
> +
> +=09if (mode < 0 || mode > 2)
> +=09=09return -EINVAL;
> +
> +=09ret =3D hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
> +=09=09=09=09   &buffer, sizeof(buffer), sizeof(buffer));
> +
> +=09if (ret)
> +=09=09return ret < 0 ? ret : -EINVAL;
> +
> +=09return mode;
> +}
> +
> +static bool detect_is_omen_thermal_profile(void)
> +{
> +=09int i;
> +
> +=09const char *board_name =3D dmi_get_system_info(DMI_BOARD_NAME);

It seems that this can be NULL. Most users of this function have
a NULL check after the call, so please add one here as well.


> +
> +=09for (i =3D 0; i < ARRAY_SIZE(omen_thermal_profile_boards); i++) {
> +=09=09if (strcmp(board_name, omen_thermal_profile_boards[i]) =3D=3D 0)
> +=09=09=09return true;
> +=09}

Please see the `match_string()` function.


> +
> +=09return false;
> +}
> [...]


Best regards,
Barnab=C3=A1s P=C5=91cze
