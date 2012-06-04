From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] ACER: Add support for ambient light sensor
Date: Mon, 4 Jun 2012 11:29:43 +0200
Message-ID: <201206041129.43676.marex@denx.de>
References: <1338570683-16491-1-git-send-email-marex@denx.de> <1338570683-16491-2-git-send-email-marex@denx.de> <1338800893.6374.71.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:32894 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754066Ab2FDJ3t convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jun 2012 05:29:49 -0400
In-Reply-To: <1338800893.6374.71.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org, rui.zhang@intel.com

Dear joeyli,

> Hi Marek,
>=20
> =E6=96=BC =E4=BA=94=EF=BC=8C2012-06-01 =E6=96=BC 19:11 +0200=EF=BC=8C=
Marek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
>=20
> > This is the ambient light sensor found on Iconia W500.
> >=20
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: joeyli <jlee@suse.com>
> > ---
> >=20
> >  drivers/platform/x86/acer-wmi.c |   86
> >  +++++++++++++++++++++++++++++++++++++++ 1 file changed, 86
> >  insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/acer-wmi.c
> > b/drivers/platform/x86/acer-wmi.c index edb6bad..a58c415 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -203,6 +203,7 @@ struct hotkey_function_type_aa {
> >=20
> >  #define ACER_CAP_BRIGHTNESS		(1<<3)
> >  #define ACER_CAP_THREEG			(1<<4)
> >  #define ACER_CAP_ACCEL			(1<<5)
> >=20
> > +#define ACER_CAP_ALS			(1<<6)
> >=20
> >  #define ACER_CAP_ANY			(0xFFFFFFFF)
> > =20
> >  /*
> >=20
> > @@ -1378,6 +1379,63 @@ static void acer_backlight_exit(void)
> >=20
> >  }
> > =20
> >  /*
> >=20
> > + * Ambient light sensor device
> > + */
> > +static acpi_handle alsd_handle;
> > +
> > +static int acer_als_init(void)
> > +{
> > +	union acpi_object in_obj;
> > +	struct acpi_object_list params;
> > +	struct acpi_buffer out;
> > +	union acpi_object out_obj;
> > +	acpi_status status;
> > +
> > +	status =3D acpi_evaluate_object(alsd_handle, "_INI", NULL, NULL);
> > +	if (ACPI_FAILURE(status))
> > +		return -1;
> > +
> > +	params.count =3D 1;
> > +	params.pointer =3D &in_obj;
> > +	in_obj.type =3D ACPI_TYPE_INTEGER;
> > +	/*
> > +	 * Unknown argument of both GLOV and GUPV, set to 5.
> > +	 * GLOV - G? Lower Value ?
> > +	 * GUPV - G? Upper Value ?
> > +	 */
> > +	in_obj.integer.value =3D 5;
> > +	out.length =3D sizeof(out_obj);
> > +	out.pointer =3D &out_obj;
> > +
> > +	acpi_evaluate_object(alsd_handle, "GLOV", &params, &out);
> > +	acpi_evaluate_object(alsd_handle, "GUPV", &params, &out);
> > +
>=20
> GUPV/GLOV also call by _INI, why need evaluate it again?

What does _INI set them to though?

>             Method (_INI, 0, NotSerialized)
>             {
> ...
>                 Store (GUPV (Local1), Local2)
>                 Store (GLOV (Local1), Local3)
>=20
> And, why use '5' to evaluate GUPV/GLOV?

It seemed like the value that worked the best. I think those packages d=
efined at=20
the begining of the ALSD section define some kind of profiles (maybe, c=
loudy,=20
bright light etc). And this selects the profile.

>=20
> > +	return 0;
> > +}
> > +
> > +static ssize_t acer_als_show(struct device *dev, struct device_att=
ribute
> > *attr, +			char *buf)
> > +{
> > +	acpi_status status;
> > +	struct acpi_buffer output;
> > +	union acpi_object out_obj;
> > +
> > +	status =3D acpi_evaluate_object(alsd_handle, "S3WK", NULL, NULL);
> > +	if (ACPI_FAILURE(status))
> > +		return -1;
> > +
>=20
> Why need evaluate S3WK before _ALI ? Looks like this method call in S=
3
> resume path:

It makes the sensor re-read the data and it's faster than calling _INI.

>  _WAK -> OEMW -> PRJW -> S3WK
>=20
> > +	output.length =3D sizeof(out_obj);
> > +	output.pointer =3D &out_obj;
> > +	status =3D acpi_evaluate_object(alsd_handle, "_ALI", NULL, &outpu=
t);
> > +	if (ACPI_FAILURE(status))
> > +		return -1;
> > +
> > +	return sprintf(buf, "%d\n", (u16)out_obj.integer.value);
> > +}
> > +
> > +static DEVICE_ATTR(ls_switch, S_IRUGO, acer_als_show, NULL);
> > +
> > +/*
> >=20
> >   * Accelerometer device
> >   */
> > =20
> >  static acpi_handle gsensor_handle;
> >=20
> > @@ -1856,6 +1914,21 @@ err_free_dev:
> >  	return err;
> > =20
> >  }
> >=20
> > +static int __init acer_wmi_alsd_setup(void)
> > +{
> > +	int err;
> > +
> > +	err =3D acer_wmi_get_handle("ALSD", "ACPI0008", &alsd_handle);
> > +	if (err)
> > +		return err;
> > +
>=20
> Does anybody know why "introduce ACPI ALS device driver" patches from
> Zhang Rui didn't include in acpi code base?
>=20
> http://comments.gmane.org/gmane.linux.kernel/884328
>=20
>=20
> There have V6 patches, but didn't see those patches show up in acpi g=
it.

Now this would be much cooler to have than this crappy hack of mine :-)

> Thanks a lot!
> Joey Lee
>=20

Best regards,
Marek Vasut
