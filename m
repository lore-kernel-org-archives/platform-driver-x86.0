From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 1/2] ACER: Add support for accelerometer sensor
Date: Mon, 04 Jun 2012 16:23:13 +0800
Message-ID: <1338798193.6374.51.camel@linux-s257.site>
References: <1338570683-16491-1-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from nat.nue.novell.com ([195.135.221.2]:61606 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754066Ab2FDI1w (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jun 2012 04:27:52 -0400
In-Reply-To: <1338570683-16491-1-git-send-email-marex@denx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=94=EF=BC=8C2012-06-01 =E6=96=BC 19:11 +0200=EF=BC=8CMa=
rek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
> This device is present on Iconia Tab W500.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: joeyli <jlee@suse.com>

This patch is good to me!

Acked-by: Lee, Chun-Yi <jlee@suse.com>


Thanks a lot!
Joey Lee

> ---
>  drivers/platform/x86/acer-wmi.c |  138 +++++++++++++++++++++++++++++=
++++++++++
>  1 file changed, 138 insertions(+)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index c1a3fd8..edb6bad 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -95,6 +95,7 @@ MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D14=
026");
> =20
>  enum acer_wmi_event_ids {
>  	WMID_HOTKEY_EVENT =3D 0x1,
> +	WMID_ACCEL_EVENT =3D 0x5,
>  };
> =20
>  static const struct key_entry acer_wmi_keymap[] =3D {
> @@ -130,6 +131,7 @@ static const struct key_entry acer_wmi_keymap[] =3D=
 {
>  };
> =20
>  static struct input_dev *acer_wmi_input_dev;
> +static struct input_dev *acer_wmi_accel_dev;
> =20
>  struct event_return_value {
>  	u8 function;
> @@ -200,6 +202,7 @@ struct hotkey_function_type_aa {
>  #define ACER_CAP_BLUETOOTH		(1<<2)
>  #define ACER_CAP_BRIGHTNESS		(1<<3)
>  #define ACER_CAP_THREEG			(1<<4)
> +#define ACER_CAP_ACCEL			(1<<5)
>  #define ACER_CAP_ANY			(0xFFFFFFFF)
> =20
>  /*
> @@ -1375,6 +1378,60 @@ static void acer_backlight_exit(void)
>  }
> =20
>  /*
> + * Accelerometer device
> + */
> +static acpi_handle gsensor_handle;
> +
> +static int acer_gsensor_init(void)
> +{
> +	acpi_status status;
> +	struct acpi_buffer output;
> +	union acpi_object out_obj;
> +
> +	output.length =3D sizeof(out_obj);
> +	output.pointer =3D &out_obj;
> +	status =3D acpi_evaluate_object(gsensor_handle, "_INI", NULL, &outp=
ut);
> +	if (ACPI_FAILURE(status))
> +		return -1;
> +
> +	return 0;
> +}
> +
> +static int acer_gsensor_open(struct input_dev *input)
> +{
> +	return acer_gsensor_init();
> +}
> +
> +static int acer_gsensor_event(void)
> +{
> +	acpi_status status;
> +	struct acpi_buffer output;
> +	union acpi_object out_obj[5];
> +
> +	if (!has_cap(ACER_CAP_ACCEL))
> +		return -1;
> +
> +	output.length =3D sizeof(out_obj);
> +	output.pointer =3D out_obj;
> +
> +	status =3D acpi_evaluate_object(gsensor_handle, "RDVL", NULL, &outp=
ut);
> +	if (ACPI_FAILURE(status))
> +		return -1;
> +
> +	if (out_obj->package.count !=3D 4)
> +		return -1;
> +
> +	input_report_abs(acer_wmi_accel_dev, ABS_X,
> +		(s16)out_obj->package.elements[0].integer.value);
> +	input_report_abs(acer_wmi_accel_dev, ABS_Y,
> +		(s16)out_obj->package.elements[1].integer.value);
> +	input_report_abs(acer_wmi_accel_dev, ABS_Z,
> +		(s16)out_obj->package.elements[2].integer.value);
> +	input_sync(acer_wmi_accel_dev);
> +	return 0;
> +}
> +
> +/*
>   * Rfkill devices
>   */
>  static void acer_rfkill_update(struct work_struct *ignored);
> @@ -1649,6 +1706,9 @@ static void acer_wmi_notify(u32 value, void *co=
ntext)
>  						   1, true);
>  		}
>  		break;
> +	case WMID_ACCEL_EVENT:
> +		acer_gsensor_event();
> +		break;
>  	default:
>  		pr_warn("Unknown function number - %d - %d\n",
>  			return_value.function, return_value.key_num);
> @@ -1734,6 +1794,74 @@ static int acer_wmi_enable_lm(void)
>  	return status;
>  }
> =20
> +static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32=
 level,
> +						void *ctx, void **retval)
> +{
> +	*(acpi_handle *)retval =3D ah;
> +	return AE_OK;
> +}
> +
> +static int __init acer_wmi_get_handle(const char *name, const char *=
prop,
> +					acpi_handle *ah)
> +{
> +	acpi_status status;
> +	acpi_handle handle;
> +
> +	BUG_ON(!name || !ah);
> +
> +	handle =3D 0;
> +	status =3D acpi_get_devices(prop, acer_wmi_get_handle_cb,
> +					(void *)name, &handle);
> +
> +	if (ACPI_SUCCESS(status)) {
> +		*ah =3D handle;
> +		return 0;
> +	} else {
> +		return -ENODEV;
> +	}
> +}
> +
> +static int __init acer_wmi_accel_setup(void)
> +{
> +	int err;
> +
> +	err =3D acer_wmi_get_handle("SENR", "BST0001", &gsensor_handle);
> +	if (err)
> +		return err;
> +
> +	interface->capability |=3D ACER_CAP_ACCEL;
> +
> +	acer_wmi_accel_dev =3D input_allocate_device();
> +	if (!acer_wmi_accel_dev)
> +		return -ENOMEM;
> +
> +	acer_wmi_accel_dev->open =3D acer_gsensor_open;
> +
> +	acer_wmi_accel_dev->name =3D "Acer BMA150 accelerometer";
> +	acer_wmi_accel_dev->phys =3D "wmi/input1";
> +	acer_wmi_accel_dev->id.bustype =3D BUS_HOST;
> +	acer_wmi_accel_dev->evbit[0] =3D BIT_MASK(EV_ABS);
> +	input_set_abs_params(acer_wmi_accel_dev, ABS_X, -16384, 16384, 0, 0=
);
> +	input_set_abs_params(acer_wmi_accel_dev, ABS_Y, -16384, 16384, 0, 0=
);
> +	input_set_abs_params(acer_wmi_accel_dev, ABS_Z, -16384, 16384, 0, 0=
);
> +
> +	err =3D input_register_device(acer_wmi_accel_dev);
> +	if (err)
> +		goto err_free_dev;
> +
> +	return 0;
> +
> +err_free_dev:
> +	input_free_device(acer_wmi_accel_dev);
> +	return err;
> +}
> +
> +static void acer_wmi_accel_destroy(void)
> +{
> +	input_unregister_device(acer_wmi_accel_dev);
> +	input_free_device(acer_wmi_accel_dev);
> +}
> +
>  static int __init acer_wmi_input_setup(void)
>  {
>  	acpi_status status;
> @@ -1889,6 +2017,9 @@ static int acer_platform_resume(struct platform=
_device *device)
>  	if (has_cap(ACER_CAP_BRIGHTNESS))
>  		set_u32(data->brightness, ACER_CAP_BRIGHTNESS);
> =20
> +	if (has_cap(ACER_CAP_ACCEL))
> +		acer_gsensor_init();
> +
>  	return 0;
>  }
> =20
> @@ -2066,6 +2197,8 @@ static int __init acer_wmi_init(void)
>  			return err;
>  	}
> =20
> +	acer_wmi_accel_setup();
> +
>  	err =3D platform_driver_register(&acer_platform_driver);
>  	if (err) {
>  		pr_err("Unable to register platform driver\n");
> @@ -2109,6 +2242,8 @@ error_device_alloc:
>  error_platform_register:
>  	if (wmi_has_guid(ACERWMID_EVENT_GUID))
>  		acer_wmi_input_destroy();
> +	if (has_cap(ACER_CAP_ACCEL))
> +		acer_wmi_accel_destroy();
> =20
>  	return err;
>  }
> @@ -2118,6 +2253,9 @@ static void __exit acer_wmi_exit(void)
>  	if (wmi_has_guid(ACERWMID_EVENT_GUID))
>  		acer_wmi_input_destroy();
> =20
> +	if (has_cap(ACER_CAP_ACCEL))
> +		acer_wmi_accel_destroy();
> +
>  	remove_sysfs(acer_platform_device);
>  	remove_debugfs();
>  	platform_device_unregister(acer_platform_device);
