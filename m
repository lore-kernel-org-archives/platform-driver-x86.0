From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] ACER: Add support for accelerometer sensor
Date: Mon, 28 May 2012 14:10:02 +0800
Message-ID: <1338185402.9751.4113.camel@linux-s257.site>
References: <1338162291-21343-1-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from charybdis-ext.suse.de ([195.135.221.2]:59655 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753822Ab2E1GOU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 May 2012 02:14:20 -0400
In-Reply-To: <1338162291-21343-1-git-send-email-marex@denx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: platform-driver-x86@vger.kernel.org, corentincj@iksaif.net, trenn@suse.de, dtor@mail.ru, jbenc@suse.cz, carlos@strangeworlds.co.uk, mjg@redhat.com

Hi Marek,=20

=E6=96=BC =E4=B8=80=EF=BC=8C2012-05-28 =E6=96=BC 01:44 +0200=EF=BC=8CMa=
rek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
> This device is present on Iconia Tab W500.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: joeyli <jlee@suse.com>
> ---
>  drivers/platform/x86/acer-wmi.c |  110 +++++++++++++++++++++++++++++=
++++++++++
>  1 file changed, 110 insertions(+)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index c1a3fd8..2df0673 100644
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
> @@ -145,6 +147,7 @@ struct event_return_value {
>  #define ACER_WMID3_GDS_THREEG		(1<<6)	/* 3G */
>  #define ACER_WMID3_GDS_WIMAX		(1<<7)	/* WiMAX */
>  #define ACER_WMID3_GDS_BLUETOOTH	(1<<11)	/* BT */
> +#define ACER_WMID3_GDS_ACCEL		(1<<2)	/* Accelerometer */
> =20

Please kindly share your dmidecode information:
 # dmidecode > dmidecode.log

How did you know '1<<2' reflects to G-sensor? As I know this is a
reserved bit did not use before.

>  struct lm_input_params {
>  	u8 function_num;        /* Function Number */
> @@ -200,6 +203,7 @@ struct hotkey_function_type_aa {
>  #define ACER_CAP_BLUETOOTH		(1<<2)
>  #define ACER_CAP_BRIGHTNESS		(1<<3)
>  #define ACER_CAP_THREEG			(1<<4)
> +#define ACER_CAP_ACCEL			(1<<5)
>  #define ACER_CAP_ANY			(0xFFFFFFFF)
> =20
>  /*
> @@ -1150,6 +1154,8 @@ static void type_aa_dmi_decode(const struct dmi=
_header *header, void *dummy)
>  		interface->capability |=3D ACER_CAP_THREEG;
>  	if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_BLUETOOTH)
>  		interface->capability |=3D ACER_CAP_BLUETOOTH;
> +	if (type_aa->others_func_bitmap & ACER_WMID3_GDS_ACCEL)
> +		interface->capability |=3D ACER_CAP_ACCEL;
> =20
>  	commun_fn_key_number =3D type_aa->commun_fn_key_number;
>  }
> @@ -1375,6 +1381,61 @@ static void acer_backlight_exit(void)
>  }
> =20
>  /*
> + * Accelerometer device
> + */
> +#define ACER_GSENSOR_HANDLE	"\\_SB.PCI0.LPC0.SENR"
> +#define ACER_GSENSOR_INIT	"\\_SB.PCI0.LPC0.SENR._INI"
> +#define ACER_GSENSOR_RDVL	"\\_SB.PCI0.LPC0.SENR.RDVL"

I think that will be better don't hard code the path of device in
driver, because different models have different path naming.

IMHO, please reference thinkpad_acpi driver like the following:

vi drivers/platform/x86/thinkpad_acpi.c

#define TPACPI_ACPI_EC_HID              "PNP0C09"
=2E..
static acpi_handle ec_handle;
=2E..

static int __init probe_for_thinkpad(void)
{
=2E..
        /* The EC handler is required */
        tpacpi_acpi_handle_locate("ec", TPACPI_ACPI_EC_HID, &ec_handle)=
;

static void __init tpacpi_acpi_handle_locate(const char *name,
{
=2E..
        memset(&device_found, 0, sizeof(device_found));
        status =3D acpi_get_devices(hid, tpacpi_acpi_handle_locate_call=
back,
                                  (void *)name, &device_found);


> +static int __devinit acer_gsensor_open(struct input_dev *input)
> +{
> +	acpi_handle handle;
> +	acpi_status status;
> +	struct acpi_buffer output;
> +	union acpi_object out_obj;
> +
> +	status =3D acpi_get_handle(NULL, ACER_GSENSOR_HANDLE, &handle);
> +	if (ACPI_FAILURE(status))
> +		return -1;
> +
> +	output.length =3D sizeof(out_obj);
> +	output.pointer =3D &out_obj;
> +	status =3D acpi_evaluate_object(NULL, ACER_GSENSOR_INIT, NULL, &out=
put);
> +	if (ACPI_FAILURE(status))
> +		return -1;
> +
> +	return 0;
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
> +	status =3D acpi_evaluate_object(NULL, ACER_GSENSOR_RDVL, NULL, &out=
put);
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
> @@ -1649,6 +1710,9 @@ static void acer_wmi_notify(u32 value, void *co=
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
> @@ -1734,6 +1798,41 @@ static int acer_wmi_enable_lm(void)
>  	return status;
>  }
> =20
> +static int __init acer_wmi_accel_setup(void)
> +{
> +	int err;
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
> @@ -2066,6 +2165,12 @@ static int __init acer_wmi_init(void)
>  			return err;
>  	}
> =20
> +	if (has_cap(ACER_CAP_ACCEL)) {
> +		err =3D acer_wmi_accel_setup();
> +		if (err)
> +			goto error_platform_register;
> +	}
> +
>  	err =3D platform_driver_register(&acer_platform_driver);
>  	if (err) {
>  		pr_err("Unable to register platform driver\n");
> @@ -2109,6 +2214,8 @@ error_device_alloc:
>  error_platform_register:
>  	if (wmi_has_guid(ACERWMID_EVENT_GUID))
>  		acer_wmi_input_destroy();
> +	if (has_cap(ACER_CAP_ACCEL))
> +		acer_wmi_accel_destroy();
> =20
>  	return err;
>  }
> @@ -2118,6 +2225,9 @@ static void __exit acer_wmi_exit(void)
>  	if (wmi_has_guid(ACERWMID_EVENT_GUID))
>  		acer_wmi_input_destroy();
> =20
> +	if (has_cap(ACER_CAP_ACCEL))
> +		acer_wmi_accel_destroy();
> +
>  	remove_sysfs(acer_platform_device);
>  	remove_debugfs();
>  	platform_device_unregister(acer_platform_device);

other stuff looks good to me.


Thanks a lot!
Joey Lee
