From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] ACER: Add support for accelerometer sensor
Date: Wed, 6 Jun 2012 00:52:37 +0200
Message-ID: <201206060052.38133.marex@denx.de>
References: <1338570683-16491-1-git-send-email-marex@denx.de> <1338798193.6374.51.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:36534 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751545Ab2FEWwn convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jun 2012 18:52:43 -0400
In-Reply-To: <1338798193.6374.51.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org

Dear joeyli,

> =E6=96=BC =E4=BA=94=EF=BC=8C2012-06-01 =E6=96=BC 19:11 +0200=EF=BC=8C=
Marek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
>=20
> > This device is present on Iconia Tab W500.
> >=20
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: joeyli <jlee@suse.com>
>=20
> This patch is good to me!

Thanks for your help and guidance throughout the process. Now who'll ap=
ply it=20
and when can I expect it in -next or somewhere (where?)?

> Acked-by: Lee, Chun-Yi <jlee@suse.com>
>=20
>=20
> Thanks a lot!
> Joey Lee
>=20
> > ---
> >=20
> >  drivers/platform/x86/acer-wmi.c |  138
> >  +++++++++++++++++++++++++++++++++++++++ 1 file changed, 138
> >  insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/acer-wmi.c
> > b/drivers/platform/x86/acer-wmi.c index c1a3fd8..edb6bad 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -95,6 +95,7 @@
> > MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D14026");
> >=20
> >  enum acer_wmi_event_ids {
> > =20
> >  	WMID_HOTKEY_EVENT =3D 0x1,
> >=20
> > +	WMID_ACCEL_EVENT =3D 0x5,
> >=20
> >  };
> > =20
> >  static const struct key_entry acer_wmi_keymap[] =3D {
> >=20
> > @@ -130,6 +131,7 @@ static const struct key_entry acer_wmi_keymap[]=
 =3D {
> >=20
> >  };
> > =20
> >  static struct input_dev *acer_wmi_input_dev;
> >=20
> > +static struct input_dev *acer_wmi_accel_dev;
> >=20
> >  struct event_return_value {
> > =20
> >  	u8 function;
> >=20
> > @@ -200,6 +202,7 @@ struct hotkey_function_type_aa {
> >=20
> >  #define ACER_CAP_BLUETOOTH		(1<<2)
> >  #define ACER_CAP_BRIGHTNESS		(1<<3)
> >  #define ACER_CAP_THREEG			(1<<4)
> >=20
> > +#define ACER_CAP_ACCEL			(1<<5)
> >=20
> >  #define ACER_CAP_ANY			(0xFFFFFFFF)
> > =20
> >  /*
> >=20
> > @@ -1375,6 +1378,60 @@ static void acer_backlight_exit(void)
> >=20
> >  }
> > =20
> >  /*
> >=20
> > + * Accelerometer device
> > + */
> > +static acpi_handle gsensor_handle;
> > +
> > +static int acer_gsensor_init(void)
> > +{
> > +	acpi_status status;
> > +	struct acpi_buffer output;
> > +	union acpi_object out_obj;
> > +
> > +	output.length =3D sizeof(out_obj);
> > +	output.pointer =3D &out_obj;
> > +	status =3D acpi_evaluate_object(gsensor_handle, "_INI", NULL, &ou=
tput);
> > +	if (ACPI_FAILURE(status))
> > +		return -1;
> > +
> > +	return 0;
> > +}
> > +
> > +static int acer_gsensor_open(struct input_dev *input)
> > +{
> > +	return acer_gsensor_init();
> > +}
> > +
> > +static int acer_gsensor_event(void)
> > +{
> > +	acpi_status status;
> > +	struct acpi_buffer output;
> > +	union acpi_object out_obj[5];
> > +
> > +	if (!has_cap(ACER_CAP_ACCEL))
> > +		return -1;
> > +
> > +	output.length =3D sizeof(out_obj);
> > +	output.pointer =3D out_obj;
> > +
> > +	status =3D acpi_evaluate_object(gsensor_handle, "RDVL", NULL, &ou=
tput);
> > +	if (ACPI_FAILURE(status))
> > +		return -1;
> > +
> > +	if (out_obj->package.count !=3D 4)
> > +		return -1;
> > +
> > +	input_report_abs(acer_wmi_accel_dev, ABS_X,
> > +		(s16)out_obj->package.elements[0].integer.value);
> > +	input_report_abs(acer_wmi_accel_dev, ABS_Y,
> > +		(s16)out_obj->package.elements[1].integer.value);
> > +	input_report_abs(acer_wmi_accel_dev, ABS_Z,
> > +		(s16)out_obj->package.elements[2].integer.value);
> > +	input_sync(acer_wmi_accel_dev);
> > +	return 0;
> > +}
> > +
> > +/*
> >=20
> >   * Rfkill devices
> >   */
> > =20
> >  static void acer_rfkill_update(struct work_struct *ignored);
> >=20
> > @@ -1649,6 +1706,9 @@ static void acer_wmi_notify(u32 value, void
> > *context)
> >=20
> >  						   1, true);
> >  	=09
> >  		}
> >  		break;
> >=20
> > +	case WMID_ACCEL_EVENT:
> > +		acer_gsensor_event();
> > +		break;
> >=20
> >  	default:
> >  		pr_warn("Unknown function number - %d - %d\n",
> >  	=09
> >  			return_value.function, return_value.key_num);
> >=20
> > @@ -1734,6 +1794,74 @@ static int acer_wmi_enable_lm(void)
> >=20
> >  	return status;
> > =20
> >  }
> >=20
> > +static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u=
32
> > level, +						void *ctx, void=20
**retval)
> > +{
> > +	*(acpi_handle *)retval =3D ah;
> > +	return AE_OK;
> > +}
> > +
> > +static int __init acer_wmi_get_handle(const char *name, const char
> > *prop, +					acpi_handle *ah)
> > +{
> > +	acpi_status status;
> > +	acpi_handle handle;
> > +
> > +	BUG_ON(!name || !ah);
> > +
> > +	handle =3D 0;
> > +	status =3D acpi_get_devices(prop, acer_wmi_get_handle_cb,
> > +					(void *)name, &handle);
> > +
> > +	if (ACPI_SUCCESS(status)) {
> > +		*ah =3D handle;
> > +		return 0;
> > +	} else {
> > +		return -ENODEV;
> > +	}
> > +}
> > +
> > +static int __init acer_wmi_accel_setup(void)
> > +{
> > +	int err;
> > +
> > +	err =3D acer_wmi_get_handle("SENR", "BST0001", &gsensor_handle);
> > +	if (err)
> > +		return err;
> > +
> > +	interface->capability |=3D ACER_CAP_ACCEL;
> > +
> > +	acer_wmi_accel_dev =3D input_allocate_device();
> > +	if (!acer_wmi_accel_dev)
> > +		return -ENOMEM;
> > +
> > +	acer_wmi_accel_dev->open =3D acer_gsensor_open;
> > +
> > +	acer_wmi_accel_dev->name =3D "Acer BMA150 accelerometer";
> > +	acer_wmi_accel_dev->phys =3D "wmi/input1";
> > +	acer_wmi_accel_dev->id.bustype =3D BUS_HOST;
> > +	acer_wmi_accel_dev->evbit[0] =3D BIT_MASK(EV_ABS);
> > +	input_set_abs_params(acer_wmi_accel_dev, ABS_X, -16384, 16384, 0,=
 0);
> > +	input_set_abs_params(acer_wmi_accel_dev, ABS_Y, -16384, 16384, 0,=
 0);
> > +	input_set_abs_params(acer_wmi_accel_dev, ABS_Z, -16384, 16384, 0,=
 0);
> > +
> > +	err =3D input_register_device(acer_wmi_accel_dev);
> > +	if (err)
> > +		goto err_free_dev;
> > +
> > +	return 0;
> > +
> > +err_free_dev:
> > +	input_free_device(acer_wmi_accel_dev);
> > +	return err;
> > +}
> > +
> > +static void acer_wmi_accel_destroy(void)
> > +{
> > +	input_unregister_device(acer_wmi_accel_dev);
> > +	input_free_device(acer_wmi_accel_dev);
> > +}
> > +
> >=20
> >  static int __init acer_wmi_input_setup(void)
> >  {
> > =20
> >  	acpi_status status;
> >=20
> > @@ -1889,6 +2017,9 @@ static int acer_platform_resume(struct
> > platform_device *device)
> >=20
> >  	if (has_cap(ACER_CAP_BRIGHTNESS))
> >  =09
> >  		set_u32(data->brightness, ACER_CAP_BRIGHTNESS);
> >=20
> > +	if (has_cap(ACER_CAP_ACCEL))
> > +		acer_gsensor_init();
> > +
> >=20
> >  	return 0;
> > =20
> >  }
> >=20
> > @@ -2066,6 +2197,8 @@ static int __init acer_wmi_init(void)
> >=20
> >  			return err;
> >  =09
> >  	}
> >=20
> > +	acer_wmi_accel_setup();
> > +
> >=20
> >  	err =3D platform_driver_register(&acer_platform_driver);
> >  	if (err) {
> >  =09
> >  		pr_err("Unable to register platform driver\n");
> >=20
> > @@ -2109,6 +2242,8 @@ error_device_alloc:
> >  error_platform_register:
> >  	if (wmi_has_guid(ACERWMID_EVENT_GUID))
> >  =09
> >  		acer_wmi_input_destroy();
> >=20
> > +	if (has_cap(ACER_CAP_ACCEL))
> > +		acer_wmi_accel_destroy();
> >=20
> >  	return err;
> > =20
> >  }
> >=20
> > @@ -2118,6 +2253,9 @@ static void __exit acer_wmi_exit(void)
> >=20
> >  	if (wmi_has_guid(ACERWMID_EVENT_GUID))
> >  =09
> >  		acer_wmi_input_destroy();
> >=20
> > +	if (has_cap(ACER_CAP_ACCEL))
> > +		acer_wmi_accel_destroy();
> > +
> >=20
> >  	remove_sysfs(acer_platform_device);
> >  	remove_debugfs();
> >  	platform_device_unregister(acer_platform_device);
