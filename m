Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C86C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 22:08:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A105C61A8E
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 22:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355739AbhJAWJy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 1 Oct 2021 18:09:54 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:16736 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbhJAWJx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 1 Oct 2021 18:09:53 -0400
Date:   Fri, 01 Oct 2021 22:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1633126083;
        bh=MQX40IMZmVt66k4MRBO8h3CFf63hORkHCIxWadWWSjo=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=cGMDfW1L90CIodyt+XASf0QGxFeqG9YQ2CYf22WKhhSCK55rib4+nJY655XUhnNTD
         g4f8XasBTgWSjKYv2uzGE+AgXt3M5dJ59fTAvGuO44hcGEw0riL9KLLvAs6PEv4sME
         fSOQbiXEe0qGFATEqjBzJ+hAicGkNZX/qpo2vuaM=
To:     Tim Crawford <tcrawford@system76.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org, productdev@system76.com,
        Jeremy Soller <jeremy@system76.com>,
        Guenter Roeck <linux@roeck-us.net>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 1/4] platform/x86: system76_acpi: Report temperature and fan speed
Message-ID: <4gSvZ5mguEtBCU0mllXwanAUGGsqODVMBNjm7RGVnwVmpWN8gP17PETwTyOBLAyg1BYn6Olx9iy2itywSJFqyplaNpQj0ZRbnRMEOgl-fqA=@protonmail.com>
In-Reply-To: <20211001160812.22535-2-tcrawford@system76.com>
References: <20211001160812.22535-1-tcrawford@system76.com> <20211001160812.22535-2-tcrawford@system76.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


+CC Guenter Roeck for hwmon


2021. okt=C3=B3ber 1., p=C3=A9ntek 18:08 keltez=C3=A9ssel, Tim Crawford =
=C3=ADrta:

> From: Jeremy Soller <jeremy@system76.com>
>
> Add a hwmon interface to report CPU/GPU temperature and fan speed.
> sensors now reports an ACPI interface with the entries:
>
> system76_acpi-acpi-0
> Adapter: ACPI interface
> CPU fan:        0 RPM
> GPU fan:        0 RPM
> CPU temp:     +47.0=C2=B0C
> GPU temp:      +0.0=C2=B0C
>
> Signed-off-by: Jeremy Soller <jeremy@system76.com>
> Signed-off-by: Tim Crawford <tcrawford@system76.com>
> ---
>  drivers/platform/x86/system76_acpi.c | 172 ++++++++++++++++++++++++++-
>  1 file changed, 171 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/=
system76_acpi.c
> index c14fd22ba196..11f0e42386ba 100644
> --- a/drivers/platform/x86/system76_acpi.c
> +++ b/drivers/platform/x86/system76_acpi.c
> @@ -10,6 +10,8 @@
>   */
>
>  #include <linux/acpi.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
> @@ -24,6 +26,9 @@ struct system76_data {
>  =09enum led_brightness kb_brightness;
>  =09enum led_brightness kb_toggle_brightness;
>  =09int kb_color;
> +=09struct device *therm;
> +=09union acpi_object *nfan;
> +=09union acpi_object *ntmp;
>  };
>
>  static const struct acpi_device_id device_ids[] =3D {
> @@ -68,6 +73,55 @@ static int system76_get(struct system76_data *data, ch=
ar *method)
>  =09=09return -1;
>  }
>
> +// Get a System76 ACPI device value by name with index
> +static int system76_get_index(struct system76_data *data, char *method, =
int index)
> +{
> +=09union acpi_object obj;
> +=09struct acpi_object_list obj_list;
> +=09acpi_handle handle;
> +=09acpi_status status;
> +=09unsigned long long ret =3D 0;
> +
> +=09obj.type =3D ACPI_TYPE_INTEGER;
> +=09obj.integer.value =3D index;
> +=09obj_list.count =3D 1;
> +=09obj_list.pointer =3D &obj;
> +
> +=09handle =3D acpi_device_handle(data->acpi_dev);
> +=09status =3D acpi_evaluate_integer(handle, method, &obj_list, &ret);
> +=09if (ACPI_SUCCESS(status))
> +=09=09return (int)ret;

(The cast is unnecessary.)


> +=09return -1;

This should probably be a relevant errno.


> +}
> +
> +// Get a System76 ACPI device object by name
> +static int system76_get_object(struct system76_data *data, char *method,=
 union acpi_object **obj)
> +{
> +=09acpi_handle handle;
> +=09acpi_status status;
> +=09struct acpi_buffer buf =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +
> +=09handle =3D acpi_device_handle(data->acpi_dev);
> +=09status =3D acpi_evaluate_object(handle, method, NULL, &buf);
> +=09if (ACPI_SUCCESS(status)) {
> +=09=09*obj =3D (union acpi_object *)buf.pointer;

(The cast is unnecessary.)


> +=09=09return 0;
> +=09}
> +
> +=09return -1;
> +}
> +
> +// Get a name from a System76 ACPI device object
> +static char *system76_name(union acpi_object *obj, int index)
> +{
> +=09if (obj && obj->type =3D=3D ACPI_TYPE_PACKAGE && index <=3D obj->pack=
age.count) {
> +=09=09if (obj->package.elements[index].type =3D=3D ACPI_TYPE_STRING)
> +=09=09=09return obj->package.elements[index].string.pointer;
> +=09}
> +
> +=09return NULL;
> +}
> +
>  // Set a System76 ACPI device value by name
>  static int system76_set(struct system76_data *data, char *method, int va=
lue)
>  {
> @@ -270,6 +324,112 @@ static void kb_led_hotkey_color(struct system76_dat=
a *data)
>  =09kb_led_notify(data);
>  }
>
> +static umode_t thermal_is_visible(const void *drvdata, enum hwmon_sensor=
_types type,
> +=09=09=09=09  u32 attr, int channel)
> +{
> +=09const struct system76_data *data =3D drvdata;
> +
> +=09if (type =3D=3D hwmon_fan || type =3D=3D hwmon_pwm) {
> +=09=09if (system76_name(data->nfan, channel))
> +=09=09=09return 0444;
> +=09} else if (type =3D=3D hwmon_temp) {
> +=09=09if (system76_name(data->ntmp, channel))
> +=09=09=09return 0444;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int thermal_read(struct device *dev, enum hwmon_sensor_types type=
, u32 attr,
> +=09=09=09int channel, long *val)
> +{
> +=09struct system76_data *data =3D dev_get_drvdata(dev);
> +=09int raw;
> +
> +=09if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_input) {
> +=09=09raw =3D system76_get_index(data, "GFAN", channel);
> +=09=09if (raw >=3D 0) {
> +=09=09=09*val =3D (long)((raw >> 8) & 0xFFFF);
> +=09=09=09return 0;
> +=09=09}
> +=09} else if (type =3D=3D hwmon_pwm && attr =3D=3D hwmon_pwm_input) {
> +=09=09raw =3D system76_get_index(data, "GFAN", channel);
> +=09=09if (raw >=3D 0) {
> +=09=09=09*val =3D (long)(raw & 0xFF);
> +=09=09=09return 0;
> +=09=09}
> +=09} else if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_input) {
> +=09=09raw =3D system76_get_index(data, "GTMP", channel);
> +=09=09if (raw >=3D 0) {
> +=09=09=09*val =3D (long)(raw * 1000);

(The cast is unnecessary.)


> +=09=09=09return 0;
> +=09=09}
> +=09}
> +
> +=09return -EINVAL;

I am not sure if EINVAL is the best error to return in case of any errors h=
ere.
Usually hwmon drivers return EOPNOTSUPP when an impossible (type, attr)
tuple is encountered as far as I know, and a relevant errno in case of an e=
rror.
I think returning EIO in case of an error would be somewhat better than EIN=
VAL.


> +}
> +
> +static int thermal_read_string(struct device *dev, enum hwmon_sensor_typ=
es type, u32 attr,
> +=09=09=09       int channel, const char **str)
> +{
> +=09struct system76_data *data =3D dev_get_drvdata(dev);
> +
> +=09if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_label) {
> +=09=09*str =3D system76_name(data->nfan, channel);
> +=09=09if (*str)
> +=09=09=09return 0;
> +=09} else if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_label) {
> +=09=09*str =3D system76_name(data->ntmp, channel);
> +=09=09if (*str)
> +=09=09=09return 0;
> +=09}
> +
> +=09return -EINVAL;
> +}
> +
> +static const struct hwmon_ops thermal_ops =3D {
> +=09.is_visible =3D thermal_is_visible,
> +=09.read =3D thermal_read,
> +=09.read_string =3D thermal_read_string,
> +};
> +
> +// Allocate up to 8 fans and temperatures
> +static const struct hwmon_channel_info *thermal_channel_info[] =3D {
> +=09HWMON_CHANNEL_INFO(fan,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL),
> +=09HWMON_CHANNEL_INFO(pwm,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT),
> +=09HWMON_CHANNEL_INFO(temp,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL),
> +=09NULL
> +};
> +
> +static const struct hwmon_chip_info thermal_chip_info =3D {
> +=09.ops =3D &thermal_ops,
> +=09.info =3D thermal_channel_info,
> +};
> +
>  // Handle ACPI notification
>  static void system76_notify(struct acpi_device *acpi_dev, u32 event)
>  {
> @@ -346,6 +506,14 @@ static int system76_add(struct acpi_device *acpi_dev=
)
>  =09=09=09return err;
>  =09}
>
> +=09system76_get_object(data, "NFAN", &data->nfan);
> +=09system76_get_object(data, "NTMP", &data->ntmp);

I believe some error handling would be useful.


> +
> +=09data->therm =3D devm_hwmon_device_register_with_info(&acpi_dev->dev,
> +=09=09"system76_acpi", data, &thermal_chip_info, NULL);
> +=09if (IS_ERR(data->therm))
> +=09=09return PTR_ERR(data->therm);

This is mostly theoretical, but `data->nfan` and `data->ntmp` are potential=
ly leaked
in the error path. I think using `devm_kmemdup()` _might_ provide a conveni=
ent
solution.


> +
>  =09return 0;
>  }
>
> @@ -359,9 +527,11 @@ static int system76_remove(struct acpi_device *acpi_=
dev)
>  =09=09device_remove_file(data->kb_led.dev, &kb_led_color_dev_attr);
>
>  =09devm_led_classdev_unregister(&acpi_dev->dev, &data->ap_led);
> -
>  =09devm_led_classdev_unregister(&acpi_dev->dev, &data->kb_led);
>
> +=09kfree(data->nfan);
> +=09kfree(data->ntmp);
> +
>  =09system76_get(data, "FINI");
>
>  =09return 0;
> --
> 2.31.1


Regards,
Barnab=C3=A1s P=C5=91cze
