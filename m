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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9E8C4338F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 22 Aug 2021 17:04:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E228861261
	for <platform-driver-x86@archiver.kernel.org>; Sun, 22 Aug 2021 17:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbhHVREz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 22 Aug 2021 13:04:55 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:62089 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhHVREz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 22 Aug 2021 13:04:55 -0400
Date:   Sun, 22 Aug 2021 17:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1629651851;
        bh=m/6iJG+XriR2hyKGZ24skAguHrrJlA/7tFHJTkzlwpk=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=GKUmafi4JkFHZSaemBkgbJMZngdOMNklQfn5L3BUDsEVOQ/3lHAOiDeToC9L9hpuq
         tmXQcdZw8eSU+XpsNPt4YdGEDAF4XhuPp2tBiqGEwyUeE8NOjyaTiN9wpi/BOQJaLi
         hV+Xw3IVuVBZ0zQfE+d4ukpZbBXtvCL2GIaVrdng=
To:     Enver Balalic <balalic.enver@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: add support for omen laptops
Message-ID: <dmlqFeCj95CYJBSHp58FRsLPWQqI-Kh_O82mUrhHsBbnCNKSwlWd9ynWz2JQAdWwaGMvagH5LOQlz0r5_5yerwCZRXIJLbU4lmTOu03ZQnU=@protonmail.com>
In-Reply-To: <20210822163143.jutjs7un5d547ehr@omen.localdomain>
References: <20210822163143.jutjs7un5d547ehr@omen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


+CC Guenter Roeck and Jean Delvare for hwmon parts


2021. augusztus 22., vas=C3=A1rnap 18:31 keltez=C3=A9ssel, Enver Balalic =
=C3=ADrta:
> This patch adds support for HP Omen laptops.
> It adds support for most things that can be controlled via the
> Windows Omen Command Center application.
>
>  - Fan speed monitoring through hwmon
>  - Platform Profile support (cool, balanced, performance)
>  - Max fan speed function toggle
>
> This patch has been tested on a 2020 HP Omen 15 (AMD) 15-en0023dx.
>
> Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
> ---
>  drivers/platform/x86/Kconfig  |   1 +
>  drivers/platform/x86/hp-wmi.c | 292 ++++++++++++++++++++++++++++++++--
>  2 files changed, 282 insertions(+), 11 deletions(-)
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
> index 027a1467d009..39d26602376d 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -22,6 +22,7 @@
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
> +#include <linux/hwmon.h>
>  #include <linux/acpi.h>
>  #include <linux/rfkill.h>
>  #include <linux/string.h>
> @@ -39,6 +40,7 @@ MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABL=
ET_MODE reporting (-1=3Daut
>
>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> +#define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
>
>  enum hp_wmi_radio {
>  =09HPWMI_WIFI=09=3D 0x0,
> @@ -89,10 +91,18 @@ enum hp_wmi_commandtype {
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
> +=09HPWMI_GM    =3D 0x20008,
>  };
>
>  enum hp_wmi_hardware_mask {
> @@ -120,6 +130,13 @@ enum hp_wireless2_bits {
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
> @@ -279,6 +296,27 @@ static int hp_wmi_perform_query(int query, enum hp_w=
mi_command command,
>  =09return ret;
>  }
>
> +static int hp_wmi_get_fan_speed(int fan, int *data)
> +{
> +=09int fsh, fsl;
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
> +=09*data =3D ((fsh > 0 ? fsh : 0) << 8) | (fsl > 0 ? fsl : 0);
> +
> +=09return 0;
> +}
> +
>  static int hp_wmi_read_int(int query)
>  {
>  =09int val =3D 0, ret;
> @@ -302,6 +340,61 @@ static int hp_wmi_hw_state(int mask)
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
> +static int hp_wmi_fan_speed_max_set(int enabled)
> +{
> +=09int ret;
> +
> +=09ret =3D hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
> +=09=09=09=09   &enabled, sizeof(enabled), sizeof(enabled));
> +
> +=09if (ret)
> +=09=09return ret < 0 ? ret : -EINVAL;
> +
> +=09return enabled;
> +}
> +
> +static int hp_wmi_fan_speed_max_get(void)
> +{
> +=09int val =3D 0, ret;
> +
> +=09ret =3D hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> +=09=09=09=09   &val, sizeof(val), sizeof(val));
> +
> +=09if (ret)
> +=09=09return ret < 0 ? ret : -EINVAL;
> +
> +=09return val;
> +}
> +
> +static int omen_thermal_profile_get(void)
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
> +
>  static int __init hp_wmi_bios_2008_later(void)
>  {
>  =09int state =3D 0;
> @@ -473,6 +566,42 @@ static ssize_t postcode_show(struct device *dev, str=
uct device_attribute *attr,
>  =09return sprintf(buf, "0x%x\n", value);
>  }
>
> +static ssize_t max_fan_show(struct device *dev, struct device_attribute =
*attr,
> +=09=09=09    char *buf)
> +{
> +=09int value =3D hp_wmi_fan_speed_max_get();
> +
> +=09if (value < 0)
> +=09=09return value;
> +=09return sprintf(buf, "%d\n", value);
> +}
> +
> +static ssize_t fan1_show(struct device *dev, struct device_attribute *at=
tr,
> +=09=09=09char *buf)
> +{
> +=09int fan_speed;
> +
> +=09int ret =3D hp_wmi_get_fan_speed(0, &fan_speed);
> +
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return sprintf(buf, "%d\n", fan_speed);
> +}
> +
> +static ssize_t fan2_show(struct device *dev, struct device_attribute *at=
tr,
> +=09=09=09char *buf)
> +{
> +=09int fan_speed;
> +
> +=09int ret =3D hp_wmi_get_fan_speed(1, &fan_speed);
> +
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return sprintf(buf, "%d\n", fan_speed);
> +}
> +
>  static ssize_t als_store(struct device *dev, struct device_attribute *at=
tr,
>  =09=09=09 const char *buf, size_t count)
>  {
> @@ -514,12 +643,33 @@ static ssize_t postcode_store(struct device *dev, s=
truct device_attribute *attr,
>  =09return count;
>  }
>
> +static ssize_t max_fan_store(struct device *dev, struct device_attribute=
 *attr,
> +=09=09=09     const char *buf, size_t count)
> +{
> +=09u32 tmp;
> +=09int ret;
> +
> +=09ret =3D kstrtou32(buf, 10, &tmp);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D hp_wmi_fan_speed_max_set(tmp);
> +
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return count;
> +}
> +
>  static DEVICE_ATTR_RO(display);
>  static DEVICE_ATTR_RO(hddtemp);
>  static DEVICE_ATTR_RW(als);
>  static DEVICE_ATTR_RO(dock);
>  static DEVICE_ATTR_RO(tablet);
>  static DEVICE_ATTR_RW(postcode);
> +static DEVICE_ATTR_RW(max_fan);
> +static DEVICE_ATTR_RO(fan1);
> +static DEVICE_ATTR_RO(fan2);
>
>  static struct attribute *hp_wmi_attrs[] =3D {
>  =09&dev_attr_display.attr,
> @@ -528,6 +678,7 @@ static struct attribute *hp_wmi_attrs[] =3D {
>  =09&dev_attr_dock.attr,
>  =09&dev_attr_tablet.attr,
>  =09&dev_attr_postcode.attr,
> +=09&dev_attr_max_fan.attr,
>  =09NULL,
>  };
>  ATTRIBUTE_GROUPS(hp_wmi);
> @@ -878,6 +1029,58 @@ static int __init hp_wmi_rfkill2_setup(struct platf=
orm_device *device)
>  =09return err;
>  }
>
> +static int platform_profile_omen_get(struct platform_profile_handler *pp=
rof,
> +=09=09=09=09enum platform_profile_option *profile)
> +{
> +=09int tp;
> +
> +=09tp =3D omen_thermal_profile_get();
> +=09if (tp < 0)
> +=09=09return tp;
> +
> +=09switch (tp) {
> +=09case HP_OMEN_THERMAL_PROFILE_PERFORMANCE:
> +=09=09*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +=09=09break;
> +=09case HP_OMEN_THERMAL_PROFILE_DEFAULT:
> +=09=09*profile =3D PLATFORM_PROFILE_BALANCED;
> +=09=09break;
> +=09case HP_OMEN_THERMAL_PROFILE_COOL:
> +=09=09*profile =3D PLATFORM_PROFILE_COOL;
> +=09=09break;
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int platform_profile_omen_set(struct platform_profile_handler *pp=
rof,
> +=09=09=09=09enum platform_profile_option profile)
> +{
> +=09int err, tp;
> +
> +=09switch (profile) {
> +=09case PLATFORM_PROFILE_PERFORMANCE:
> +=09=09tp =3D HP_OMEN_THERMAL_PROFILE_PERFORMANCE;
> +=09=09break;
> +=09case PLATFORM_PROFILE_BALANCED:
> +=09=09tp =3D HP_OMEN_THERMAL_PROFILE_DEFAULT;
> +=09=09break;
> +=09case PLATFORM_PROFILE_COOL:
> +=09=09tp =3D HP_OMEN_THERMAL_PROFILE_COOL;
> +=09=09break;
> +=09default:
> +=09=09return -EOPNOTSUPP;
> +=09}
> +
> +=09err =3D omen_thermal_profile_set(tp);
> +=09if (err < 0)
> +=09=09return err;
> +
> +=09return 0;
> +}
> +
>  static int thermal_profile_get(void)
>  {
>  =09return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
> @@ -946,19 +1149,34 @@ static int thermal_profile_setup(void)
>  =09int err, tp;
>
>  =09tp =3D thermal_profile_get();
> -=09if (tp < 0)
> -=09=09return tp;
> +=09if (tp >=3D 0) {
> +=09=09/*
> +=09=09* call thermal profile write command to ensure that the firmware c=
orrectly
> +=09=09* sets the OEM variables for the DPTF
> +=09=09*/
> +=09=09err =3D thermal_profile_set(tp);
> +=09=09if (err)
> +=09=09=09return err;
>
> -=09/*
> -=09 * call thermal profile write command to ensure that the firmware cor=
rectly
> -=09 * sets the OEM variables for the DPTF
> -=09 */
> -=09err =3D thermal_profile_set(tp);
> -=09if (err)
> -=09=09return err;
> +=09=09platform_profile_handler.profile_get =3D platform_profile_get;
> +=09=09platform_profile_handler.profile_set =3D platform_profile_set;
> +=09}
> +
> +=09tp =3D omen_thermal_profile_get();
> +=09if (tp >=3D 0) {
> +=09=09/*
> +=09=09* call thermal profile write command to ensure that the firmware c=
orrectly
> +=09=09* sets the OEM variables for the DPTF
> +=09=09*/
> +=09=09err =3D omen_thermal_profile_set(tp);
> +=09=09if (err < 0)
> +=09=09=09return err;
>
> -=09platform_profile_handler.profile_get =3D platform_profile_get,
> -=09platform_profile_handler.profile_set =3D platform_profile_set,
> +=09=09platform_profile_handler.profile_get =3D platform_profile_omen_get=
;
> +=09=09platform_profile_handler.profile_set =3D platform_profile_omen_set=
;
> +=09} else {
> +=09=09return tp;
> +=09}
>
>  =09set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
>  =09set_bit(PLATFORM_PROFILE_BALANCED, platform_profile_handler.choices);
> @@ -973,6 +1191,8 @@ static int thermal_profile_setup(void)
>  =09return 0;
>  }
>
> +static int hp_wmi_hwmon_init(void);
> +
>  static int __init hp_wmi_bios_setup(struct platform_device *device)
>  {
>  =09/* clear detected rfkill devices */
> @@ -984,6 +1204,8 @@ static int __init hp_wmi_bios_setup(struct platform_=
device *device)
>  =09if (hp_wmi_rfkill_setup(device))
>  =09=09hp_wmi_rfkill2_setup(device);
>
> +=09hp_wmi_hwmon_init();
> +
>  =09thermal_profile_setup();
>
>  =09return 0;
> @@ -1068,6 +1290,54 @@ static struct platform_driver hp_wmi_driver =3D {
>  =09.remove =3D __exit_p(hp_wmi_bios_remove),
>  };
>
> +static struct attribute *hwmon_attributes[] =3D {
> +=09&dev_attr_fan1.attr,
> +=09&dev_attr_fan2.attr,
> +=09NULL
> +};
> +
> +static umode_t hp_wmi_hwmon_sysfs_is_visible(struct kobject *kobj,
> +=09=09=09=09=09  struct attribute *attr, int idx)
> +{
> +=09int fan_speed;
> +
> +=09if (attr =3D=3D &dev_attr_fan1.attr) {
> +=09=09int ret =3D hp_wmi_get_fan_speed(0, &fan_speed);
> +
> +=09=09if (ret < 0)
> +=09=09=09return 0;
> +=09} else if (attr =3D=3D &dev_attr_fan2.attr) {
> +=09=09int ret =3D hp_wmi_get_fan_speed(1, &fan_speed);
> +
> +=09=09if (ret < 0)
> +=09=09=09return 0;
> +=09}
> +
> +=09return attr->mode;
> +}
> +
> +static const struct attribute_group hwmon_attribute_group =3D {
> +=09.is_visible =3D hp_wmi_hwmon_sysfs_is_visible,
> +=09.attrs =3D hwmon_attributes
> +};
> +__ATTRIBUTE_GROUPS(hwmon_attribute);
> +
> +static int hp_wmi_hwmon_init(void)
> +{
> +=09struct device *dev =3D &hp_wmi_platform_dev->dev;
> +=09struct device *hwmon;
> +
> +=09hwmon =3D devm_hwmon_device_register_with_groups(dev, "hp", &hp_wmi_d=
river,
> +=09=09=09hwmon_attribute_groups);

I think you should use

  [devm_]hwmon_device_register_with_info()

as it creates sysfs attributes for you, etc. You wouldn't need to manually
create device attributes, and you wouldn't need fan{1,2}_show() at all.


> +
> +=09if (IS_ERR(hwmon)) {
> +=09=09pr_err("Could not register hp hwmon device\n");
> +=09=09return PTR_ERR(hwmon);
> +=09}
> +
> +=09return 0;
> +}
> +
>  static int __init hp_wmi_init(void)
>  {
>  =09int event_capable =3D wmi_has_guid(HPWMI_EVENT_GUID);
> --
> 2.33.0


Best regards,
Barnab=C3=A1s P=C5=91cze
