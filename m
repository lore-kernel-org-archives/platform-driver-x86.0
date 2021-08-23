Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD54C4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Aug 2021 16:40:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62BA361371
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Aug 2021 16:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhHWQl1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Aug 2021 12:41:27 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:35820 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhHWQl1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Aug 2021 12:41:27 -0400
Date:   Mon, 23 Aug 2021 16:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1629736810;
        bh=F3EF5WxojsooUUF0sHpA+KrD9wrIyMIIOAHopVh5mGw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=MvaEuVPN5mJ43lA/0fk3e1WUDGAgA4O04eOaQ9bN0GNpmsby1oBDOyxv/3biSuao4
         9PpaCain+HopNO03YwLeWPRKuGyJgXn27Q1Zns0vBDlVTvKFAUUEGUGW9mwj//Lqfu
         Q5uttXgTwkJMBzRthAg9mcfm6caZ7RIcEyNm6Q0A=
To:     Enver Balalic <balalic.enver@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com, jdelvare@suse.com,
        linux@roeck-us.net, platform-driver-x86@vger.kernel.org
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2] platform/x86: hp-wmi: add support for omen laptops
Message-ID: <hAisOfmIeiaMvSxmFY6D-GL2f-Fo94dNFcQj5bl4j0Lj08YDiTXMzfOHErbNqkGJ_2vrdadsbcv27qIB-YMliEfqs3H7QAzrpEdQZ0rLc0o=@protonmail.com>
In-Reply-To: <20210823141521.2gxhsoqx7brrovfl@omen.localdomain>
References: <20210823141521.2gxhsoqx7brrovfl@omen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. augusztus 23., h=C3=A9tf=C5=91 16:15 keltez=C3=A9ssel, Enver Balalic =
=C3=ADrta:
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
>
> Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
> ---
>  drivers/platform/x86/Kconfig  |   1 +
>  drivers/platform/x86/hp-wmi.c | 302 ++++++++++++++++++++++++++++++++--
>  2 files changed, 292 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index d12db6c316ea..f0b3d94e182b 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -431,6 +431,7 @@ config HP_WMI
>  =09tristate "HP WMI extras"
>  =09depends on ACPI_WMI
>  =09depends on INPUT
> +=09depends on HWMON
>  =09depends on RFKILL || RFKILL =3D n
>  =09select INPUT_SPARSEKMAP
>  =09select ACPI_PLATFORM_PROFILE
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.=
c
> index 027a1467d009..20cf8a32e76e 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -22,6 +22,7 @@
> [...]
>  enum hp_wmi_command {
>  =09HPWMI_READ=09=3D 0x01,
>  =09HPWMI_WRITE=09=3D 0x02,
>  =09HPWMI_ODM=09=3D 0x03,
> +=09HPWMI_GM    =3D 0x20008,
                ^^^^
The other command values are aligned using a single tab.


>  };
> [...]
> +static int hp_wmi_get_fan_speed(int fan)
> +{
> +=09int fsh, fsl, fan_speed;
> +=09char fan_data[4] =3D { fan, 0, 0, 0 };
> +
> +=09int ret =3D hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
> +=09=09=09=09       &fan_data, sizeof(fan_data),
> +=09=09=09=09       sizeof(fan_data));
> +
> +=09if (ret !=3D 0)
> +=09=09return -EINVAL;
> +
> +=09fsh =3D fan_data[2];
> +=09fsl =3D fan_data[3];
> +
> +=09// sometimes one of these can be negative

If the speed is e.g. 1279 RPM, that's 0x04FF, which will be 4 and -1 if you=
 interpret
the bytes as a signed values on x86. Isn't this what's happening here? Or i=
s the
reason known?


> +=09fan_speed =3D ((fsh > 0 ? fsh : 0) << 8) | (fsl > 0 ? fsl : 0);
> +
> +=09return fan_speed;
> +}
> [...]
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

I think something like EIO would be more appropriate than EINVAL.
(In other functions, too.)


> +
> +=09return mode;
> +}
> [...]
> +static int omen_thermal_profile_get(void)

I would put this function next to `omen_thermal_profile_set`.


> +{
> +=09u8 data;
> +
> +=09int ret =3D ec_read(HP_OMEN_EC_THERMAL_PROFILE_OFFSET, &data);
> +
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return data;
> +}
> [...]
> +static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types=
 type,
> +=09=09=09u32 attr, int channel, long *val)
> +{
> +=09switch (type) {
> +=09case hwmon_temp:
> +=09=09return hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
> +=09case hwmon_fan:
> +=09=09int ret =3D hp_wmi_get_fan_speed(channel);
> +
> +=09=09if (ret < 0)
> +=09=09=09return -EINVAL;
> +=09=09*val =3D ret;
> +=09=09return 0;
> +=09case hwmon_pwm:
> +=09=09return hp_wmi_fan_speed_max_get();

Shouldn't this "mapped back"? 1 -> 0, 0 -> 2?


> +=09default:
> +=09=09return -EINVAL;
> +=09};
         ^
This semicolon is not needed.


> +}
> +
> +static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_type=
s type,
> +=09=09=09u32 attr, int channel, long val)
> +{
> +=09switch (type) {
> +=09case hwmon_pwm:
> +=09=09switch (val) {
> +=09=09case 0:
> +=09=09=09// 1 is no fan speed control(automatic), which is 1 for us
                                                   ^^
Small thing, but I'd put a space there.


> +=09=09=09return hp_wmi_fan_speed_max_set(1);
> +=09=09case 2:
> +=09=09=09// 2 is automatic speed control, which is 0 for us
> +=09=09=09return hp_wmi_fan_speed_max_set(0);
> +=09=09default:
> +=09=09=09// we don't support manual fan speed control
> +=09=09=09return -EOPNOTSUPP;

/* this type of comments is preferred */


> +=09=09}
> +=09default:
> +=09=09return -EOPNOTSUPP;
> +=09}
> +}
> [...]


Best regards,
Barnab=C3=A1s P=C5=91cze
