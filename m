From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 2/2] ACER: Add support for ambient light sensor
Date: Mon, 04 Jun 2012 17:08:13 +0800
Message-ID: <1338800893.6374.71.camel@linux-s257.site>
References: <1338570683-16491-1-git-send-email-marex@denx.de>
	 <1338570683-16491-2-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from nat.nue.novell.com ([195.135.221.2]:32275 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756694Ab2FDJM6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jun 2012 05:12:58 -0400
In-Reply-To: <1338570683-16491-2-git-send-email-marex@denx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: platform-driver-x86@vger.kernel.org, rui.zhang@intel.com

Hi Marek,=20

=E6=96=BC =E4=BA=94=EF=BC=8C2012-06-01 =E6=96=BC 19:11 +0200=EF=BC=8CMa=
rek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
> This is the ambient light sensor found on Iconia W500.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: joeyli <jlee@suse.com>
> ---
>  drivers/platform/x86/acer-wmi.c |   86 +++++++++++++++++++++++++++++=
++++++++++
>  1 file changed, 86 insertions(+)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index edb6bad..a58c415 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -203,6 +203,7 @@ struct hotkey_function_type_aa {
>  #define ACER_CAP_BRIGHTNESS		(1<<3)
>  #define ACER_CAP_THREEG			(1<<4)
>  #define ACER_CAP_ACCEL			(1<<5)
> +#define ACER_CAP_ALS			(1<<6)
>  #define ACER_CAP_ANY			(0xFFFFFFFF)
> =20
>  /*
> @@ -1378,6 +1379,63 @@ static void acer_backlight_exit(void)
>  }
> =20
>  /*
> + * Ambient light sensor device
> + */
> +static acpi_handle alsd_handle;
> +
> +static int acer_als_init(void)
> +{
> +	union acpi_object in_obj;
> +	struct acpi_object_list params;
> +	struct acpi_buffer out;
> +	union acpi_object out_obj;
> +	acpi_status status;
> +
> +	status =3D acpi_evaluate_object(alsd_handle, "_INI", NULL, NULL);
> +	if (ACPI_FAILURE(status))
> +		return -1;
> +
> +	params.count =3D 1;
> +	params.pointer =3D &in_obj;
> +	in_obj.type =3D ACPI_TYPE_INTEGER;
> +	/*
> +	 * Unknown argument of both GLOV and GUPV, set to 5.
> +	 * GLOV - G? Lower Value ?
> +	 * GUPV - G? Upper Value ?
> +	 */
> +	in_obj.integer.value =3D 5;
> +	out.length =3D sizeof(out_obj);
> +	out.pointer =3D &out_obj;
> +
> +	acpi_evaluate_object(alsd_handle, "GLOV", &params, &out);
> +	acpi_evaluate_object(alsd_handle, "GUPV", &params, &out);
> +

GUPV/GLOV also call by _INI, why need evaluate it again?

            Method (_INI, 0, NotSerialized)
            {
=2E..
                Store (GUPV (Local1), Local2)
                Store (GLOV (Local1), Local3)

And, why use '5' to evaluate GUPV/GLOV?

> +	return 0;
> +}
> +
> +static ssize_t acer_als_show(struct device *dev, struct device_attri=
bute *attr,
> +			char *buf)
> +{
> +	acpi_status status;
> +	struct acpi_buffer output;
> +	union acpi_object out_obj;
> +
> +	status =3D acpi_evaluate_object(alsd_handle, "S3WK", NULL, NULL);
> +	if (ACPI_FAILURE(status))
> +		return -1;
> +

Why need evaluate S3WK before _ALI ? Looks like this method call in S3
resume path:

 _WAK -> OEMW -> PRJW -> S3WK

> +	output.length =3D sizeof(out_obj);
> +	output.pointer =3D &out_obj;
> +	status =3D acpi_evaluate_object(alsd_handle, "_ALI", NULL, &output)=
;
> +	if (ACPI_FAILURE(status))
> +		return -1;
> +
> +	return sprintf(buf, "%d\n", (u16)out_obj.integer.value);
> +}
> +
> +static DEVICE_ATTR(ls_switch, S_IRUGO, acer_als_show, NULL);
> +
> +/*
>   * Accelerometer device
>   */
>  static acpi_handle gsensor_handle;
> @@ -1856,6 +1914,21 @@ err_free_dev:
>  	return err;
>  }
> =20
> +static int __init acer_wmi_alsd_setup(void)
> +{
> +	int err;
> +
> +	err =3D acer_wmi_get_handle("ALSD", "ACPI0008", &alsd_handle);
> +	if (err)
> +		return err;
> +


Does anybody know why "introduce ACPI ALS device driver" patches from
Zhang Rui didn't include in acpi code base?

http://comments.gmane.org/gmane.linux.kernel/884328


There have V6 patches, but didn't see those patches show up in acpi git=
=2E


Thanks a lot!
Joey Lee

> +	interface->capability |=3D ACER_CAP_ALS;
> +
> +	acer_als_init();
> +
> +	return 0;
> +}
> +
>  static void acer_wmi_accel_destroy(void)
>  {
>  	input_unregister_device(acer_wmi_accel_dev);
> @@ -2020,6 +2093,9 @@ static int acer_platform_resume(struct platform=
_device *device)
>  	if (has_cap(ACER_CAP_ACCEL))
>  		acer_gsensor_init();
> =20
> +	if (has_cap(ACER_CAP_ALS))
> +		acer_als_init();
> +
>  	return 0;
>  }
> =20
> @@ -2052,6 +2128,8 @@ static int remove_sysfs(struct platform_device =
*device)
>  {
>  	if (has_cap(ACER_CAP_THREEG))
>  		device_remove_file(&device->dev, &dev_attr_threeg);
> +	if (has_cap(ACER_CAP_ALS))
> +		device_remove_file(&device->dev, &dev_attr_ls_switch);
> =20
>  	device_remove_file(&device->dev, &dev_attr_interface);
> =20
> @@ -2069,6 +2147,13 @@ static int create_sysfs(void)
>  			goto error_sysfs;
>  	}
> =20
> +	if (has_cap(ACER_CAP_ALS)) {
> +		retval =3D device_create_file(&acer_platform_device->dev,
> +			&dev_attr_ls_switch);
> +		if (retval)
> +			goto error_sysfs;
> +	}
> +
>  	retval =3D device_create_file(&acer_platform_device->dev,
>  		&dev_attr_interface);
>  	if (retval)
> @@ -2198,6 +2283,7 @@ static int __init acer_wmi_init(void)
>  	}
> =20
>  	acer_wmi_accel_setup();
> +	acer_wmi_alsd_setup();
> =20
>  	err =3D platform_driver_register(&acer_platform_driver);
>  	if (err) {
