From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] ACER: Add support for accelerometer sensor
Date: Mon, 28 May 2012 08:19:17 +0200
Message-ID: <201205280819.17686.marex@denx.de>
References: <1338162291-21343-1-git-send-email-marex@denx.de> <1338185402.9751.4113.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:40199 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752996Ab2E1GTb convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 May 2012 02:19:31 -0400
In-Reply-To: <1338185402.9751.4113.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org, corentincj@iksaif.net, trenn@suse.de, dtor@mail.ru, jbenc@suse.cz, carlos@strangeworlds.co.uk, mjg@redhat.com

Dear joeyli,

> Hi Marek,
>=20
> =E6=96=BC =E4=B8=80=EF=BC=8C2012-05-28 =E6=96=BC 01:44 +0200=EF=BC=8C=
Marek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
>=20
> > This device is present on Iconia Tab W500.
> >=20
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: joeyli <jlee@suse.com>
> > ---
> >=20
> >  drivers/platform/x86/acer-wmi.c |  110
> >  +++++++++++++++++++++++++++++++++++++++ 1 file changed, 110
> >  insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/acer-wmi.c
> > b/drivers/platform/x86/acer-wmi.c index c1a3fd8..2df0673 100644
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
> > @@ -145,6 +147,7 @@ struct event_return_value {
> >=20
> >  #define ACER_WMID3_GDS_THREEG		(1<<6)	/* 3G */
> >  #define ACER_WMID3_GDS_WIMAX		(1<<7)	/* WiMAX */
> >  #define ACER_WMID3_GDS_BLUETOOTH	(1<<11)	/* BT */
> >=20
> > +#define ACER_WMID3_GDS_ACCEL		(1<<2)	/* Accelerometer */
>=20
> Please kindly share your dmidecode information:
>  # dmidecode > dmidecode.log

Will do.

> How did you know '1<<2' reflects to G-sensor? As I know this is a
> reserved bit did not use before.

Honestly? Wild guess.

> >  struct lm_input_params {
> > =20
> >  	u8 function_num;        /* Function Number */
> >=20
> > @@ -200,6 +203,7 @@ struct hotkey_function_type_aa {
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
> > @@ -1150,6 +1154,8 @@ static void type_aa_dmi_decode(const struct
> > dmi_header *header, void *dummy)
> >=20
> >  		interface->capability |=3D ACER_CAP_THREEG;
> >  =09
> >  	if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_BLUETOOTH)
> >  =09
> >  		interface->capability |=3D ACER_CAP_BLUETOOTH;
> >=20
> > +	if (type_aa->others_func_bitmap & ACER_WMID3_GDS_ACCEL)
> > +		interface->capability |=3D ACER_CAP_ACCEL;
> >=20
> >  	commun_fn_key_number =3D type_aa->commun_fn_key_number;
> > =20
> >  }
> >=20
> > @@ -1375,6 +1381,61 @@ static void acer_backlight_exit(void)
> >=20
> >  }
> > =20
> >  /*
> >=20
> > + * Accelerometer device
> > + */
> > +#define ACER_GSENSOR_HANDLE	"\\_SB.PCI0.LPC0.SENR"
> > +#define ACER_GSENSOR_INIT	"\\_SB.PCI0.LPC0.SENR._INI"
> > +#define ACER_GSENSOR_RDVL	"\\_SB.PCI0.LPC0.SENR.RDVL"
>=20
> I think that will be better don't hard code the path of device in
> driver, because different models have different path naming.

Certainly, how should I do it the correct way please?

> IMHO, please reference thinkpad_acpi driver like the following:
>=20
> vi drivers/platform/x86/thinkpad_acpi.c
>=20
> #define TPACPI_ACPI_EC_HID              "PNP0C09"
> ...
> static acpi_handle ec_handle;
> ...
>=20
> static int __init probe_for_thinkpad(void)
> {
> ...
>         /* The EC handler is required */
>         tpacpi_acpi_handle_locate("ec", TPACPI_ACPI_EC_HID, &ec_handl=
e);
>=20
> static void __init tpacpi_acpi_handle_locate(const char *name,
> {
> ...
>         memset(&device_found, 0, sizeof(device_found));
>         status =3D acpi_get_devices(hid, tpacpi_acpi_handle_locate_ca=
llback,
>                                   (void *)name, &device_found);

I see! Will do (incl. the other driver) Thanks for your guidance here, =
really,=20
thanks a lot!

> > @@ -2118,6 +2225,9 @@ static void __exit acer_wmi_exit(void)
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
>=20
> other stuff looks good to me.

Thanks. Btw I'll update the CC list in V2.

>=20
> Thanks a lot!
> Joey Lee
