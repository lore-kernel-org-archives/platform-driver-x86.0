From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/2] ACER: Add support for ambient light sensor
Date: Mon, 4 Jun 2012 13:13:27 +0200
Message-ID: <CAHR064hJquR4AF6iZNyJTpK5f9GOBHfMq33Y=XpD7ZtFVW1E4A@mail.gmail.com>
References: <1338570683-16491-1-git-send-email-marex@denx.de>
	<1338570683-16491-2-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:36978 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752035Ab2FDLN3 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jun 2012 07:13:29 -0400
Received: by bkcji2 with SMTP id ji2so3459386bkc.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jun 2012 04:13:27 -0700 (PDT)
In-Reply-To: <1338570683-16491-2-git-send-email-marex@denx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: platform-driver-x86@vger.kernel.org, joeyli <jlee@suse.com>, "Zhang, Rui" <rui.zhang@intel.com>, Len Brown <len.brown@intel.com>

On Fri, Jun 1, 2012 at 7:11 PM, Marek Vasut <marex@denx.de> wrote:
> This is the ambient light sensor found on Iconia W500.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: joeyli <jlee@suse.com>
> ---
> =C2=A0drivers/platform/x86/acer-wmi.c | =C2=A0 86 +++++++++++++++++++=
++++++++++++++++++++
> =C2=A01 file changed, 86 insertions(+)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index edb6bad..a58c415 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -203,6 +203,7 @@ struct hotkey_function_type_aa {
> =C2=A0#define ACER_CAP_BRIGHTNESS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(1<<3)
> =C2=A0#define ACER_CAP_THREEG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1<<4)
> =C2=A0#define ACER_CAP_ACCEL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (1<<5)
> +#define ACER_CAP_ALS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (1<<6)
> =C2=A0#define ACER_CAP_ANY =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (0xFFFFFFFF)
>
> =C2=A0/*
> @@ -1378,6 +1379,63 @@ static void acer_backlight_exit(void)
> =C2=A0}
>
> =C2=A0/*
> + * Ambient light sensor device
> + */
> +static acpi_handle alsd_handle;
> +
> +static int acer_als_init(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 union acpi_object in_obj;
> + =C2=A0 =C2=A0 =C2=A0 struct acpi_object_list params;
> + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer out;
> + =C2=A0 =C2=A0 =C2=A0 union acpi_object out_obj;
> + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
> +
> + =C2=A0 =C2=A0 =C2=A0 status =3D acpi_evaluate_object(alsd_handle, "=
_INI", NULL, NULL);
> + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(status))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> +
> + =C2=A0 =C2=A0 =C2=A0 params.count =3D 1;
> + =C2=A0 =C2=A0 =C2=A0 params.pointer =3D &in_obj;
> + =C2=A0 =C2=A0 =C2=A0 in_obj.type =3D ACPI_TYPE_INTEGER;
> + =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* Unknown argument of both GLOV and GUPV=
, set to 5.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* GLOV - G? Lower Value ?
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* GUPV - G? Upper Value ?
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> + =C2=A0 =C2=A0 =C2=A0 in_obj.integer.value =3D 5;
> + =C2=A0 =C2=A0 =C2=A0 out.length =3D sizeof(out_obj);
> + =C2=A0 =C2=A0 =C2=A0 out.pointer =3D &out_obj;
> +
> + =C2=A0 =C2=A0 =C2=A0 acpi_evaluate_object(alsd_handle, "GLOV", &par=
ams, &out);
> + =C2=A0 =C2=A0 =C2=A0 acpi_evaluate_object(alsd_handle, "GUPV", &par=
ams, &out);
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static ssize_t acer_als_show(struct device *dev, struct device_attri=
bute *attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 char *buf)
> +{
> + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
> + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer output;
> + =C2=A0 =C2=A0 =C2=A0 union acpi_object out_obj;
> +
> + =C2=A0 =C2=A0 =C2=A0 status =3D acpi_evaluate_object(alsd_handle, "=
S3WK", NULL, NULL);
> + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(status))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> +
> + =C2=A0 =C2=A0 =C2=A0 output.length =3D sizeof(out_obj);
> + =C2=A0 =C2=A0 =C2=A0 output.pointer =3D &out_obj;
> + =C2=A0 =C2=A0 =C2=A0 status =3D acpi_evaluate_object(alsd_handle, "=
_ALI", NULL, &output);
> + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(status))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> +
> + =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, "%d\n", (u16)out_obj.integ=
er.value);
> +}
> +
> +static DEVICE_ATTR(ls_switch, S_IRUGO, acer_als_show, NULL);
> +
> +/*
> =C2=A0* Accelerometer device
> =C2=A0*/
> =C2=A0static acpi_handle gsensor_handle;
> @@ -1856,6 +1914,21 @@ err_free_dev:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;
> =C2=A0}
>
> +static int __init acer_wmi_alsd_setup(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int err;
> +
> + =C2=A0 =C2=A0 =C2=A0 err =3D acer_wmi_get_handle("ALSD", "ACPI0008"=
, &alsd_handle);
> + =C2=A0 =C2=A0 =C2=A0 if (err)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;

NACK ! This is a generic device, and should be handled by ACPI core
(Samsung laptop have this too). See "ACPI ALS" on linux-acpi.

> + =C2=A0 =C2=A0 =C2=A0 interface->capability |=3D ACER_CAP_ALS;
> +
> + =C2=A0 =C2=A0 =C2=A0 acer_als_init();
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> =C2=A0static void acer_wmi_accel_destroy(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0input_unregister_device(acer_wmi_accel_dev=
);
> @@ -2020,6 +2093,9 @@ static int acer_platform_resume(struct platform=
_device *device)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (has_cap(ACER_CAP_ACCEL))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acer_gsensor_i=
nit();
>
> + =C2=A0 =C2=A0 =C2=A0 if (has_cap(ACER_CAP_ALS))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acer_als_init();
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> @@ -2052,6 +2128,8 @@ static int remove_sysfs(struct platform_device =
*device)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (has_cap(ACER_CAP_THREEG))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_remove_=
file(&device->dev, &dev_attr_threeg);
> + =C2=A0 =C2=A0 =C2=A0 if (has_cap(ACER_CAP_ALS))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 device_remove_file=
(&device->dev, &dev_attr_ls_switch);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0device_remove_file(&device->dev, &dev_attr=
_interface);
>
> @@ -2069,6 +2147,13 @@ static int create_sysfs(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0goto error_sysfs;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> + =C2=A0 =C2=A0 =C2=A0 if (has_cap(ACER_CAP_ALS)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D device_=
create_file(&acer_platform_device->dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &dev_attr_ls_switch);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (retval)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 goto error_sysfs;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D device_create_file(&acer_platfo=
rm_device->dev,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&dev_attr_inte=
rface);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (retval)
> @@ -2198,6 +2283,7 @@ static int __init acer_wmi_init(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0acer_wmi_accel_setup();
> + =C2=A0 =C2=A0 =C2=A0 acer_wmi_alsd_setup();
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D platform_driver_register(&acer_pla=
tform_driver);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {
> --
> 1.7.10
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml



--=20
Corentin Chary
http://xf.iksaif.net
