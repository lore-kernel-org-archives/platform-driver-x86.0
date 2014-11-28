From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/3] platform: x86: dell-rbtn: Dell Airplane Mode Switch
 driver
Date: Fri, 28 Nov 2014 13:33:28 +0200
Message-ID: <20141128113328.GS1304@lahna.fi.intel.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1416755361-17357-2-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:35224 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751047AbaK1Ldc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Nov 2014 06:33:32 -0500
Content-Disposition: inline
In-Reply-To: <1416755361-17357-2-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>

On Sun, Nov 23, 2014 at 04:09:19PM +0100, Pali Roh=E1r wrote:
> This is an ACPI driver for Dell laptops which receive HW switch event=
s.
> It exports rfkill device dell-rbtn which provide correct hard rfkill =
state.
>=20
> It does not provide support for setting soft rfkill state yet.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> ---
>  drivers/platform/x86/Kconfig     |   13 +++
>  drivers/platform/x86/Makefile    |    1 +
>  drivers/platform/x86/dell-rbtn.c |  179 ++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 193 insertions(+)
>  create mode 100644 drivers/platform/x86/dell-rbtn.c
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> index 4dcfb71..5a2ba64 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -137,6 +137,19 @@ config DELL_SMO8800
>  	  To compile this driver as a module, choose M here: the module wil=
l
>  	  be called dell-smo8800.
> =20
> +config DELL_RBTN
> +	tristate "Dell Airplane Mode Switch driver"
> +	depends on ACPI
> +	depends on RFKILL
> +	---help---
> +	  Say Y here if you want to support Dell Airplane Mode Switch ACPI
> +	  device on Dell laptops. Sometimes it has names: DELLABCE or DELRB=
TN.
> +	  This driver register rfkill device and receives HW rfkill events
> +	  (when wifi/bluetooth was enabled) and set correct hard rfkill sta=
te.
> +
> +	  To compile this driver as a module, choose M here: the module wil=
l
> +	  be called dell-rbtn.
> +
> =20
>  config FUJITSU_LAPTOP
>  	tristate "Fujitsu Laptop Extras"
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> index f82232b..b3e54ed 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_DELL_LAPTOP)	+=3D dell-laptop.o
>  obj-$(CONFIG_DELL_WMI)		+=3D dell-wmi.o
>  obj-$(CONFIG_DELL_WMI_AIO)	+=3D dell-wmi-aio.o
>  obj-$(CONFIG_DELL_SMO8800)	+=3D dell-smo8800.o
> +obj-$(CONFIG_DELL_RBTN)		+=3D dell-rbtn.o
>  obj-$(CONFIG_ACER_WMI)		+=3D acer-wmi.o
>  obj-$(CONFIG_ACERHDF)		+=3D acerhdf.o
>  obj-$(CONFIG_HP_ACCEL)		+=3D hp_accel.o
> diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/=
dell-rbtn.c
> new file mode 100644
> index 0000000..f1f039a
> --- /dev/null
> +++ b/drivers/platform/x86/dell-rbtn.c
> @@ -0,0 +1,179 @@
> +/*
> +    Dell Airplane Mode Switch driver
> +    Copyright (C) 2014  Pali Roh=E1r <pali.rohar@gmail.com>
> +
> +    This program is free software; you can redistribute it and/or mo=
dify
> +    it under the terms of the GNU General Public License as publishe=
d by
> +    the Free Software Foundation; either version 2 of the License, o=
r
> +    (at your option) any later version.
> +
> +    This program is distributed in the hope that it will be useful,
> +    but WITHOUT ANY WARRANTY; without even the implied warranty of
> +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +    GNU General Public License for more details.

Please check Documentation/CodingStyle, block comments look like this

 /*
  * This is block comment.
  */

> +*/
> +
> +#include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/rfkill.h>
> +
> +/*** helper functions ***/
> +
> +static int rbtn_check(struct acpi_device *device)
> +{
> +	acpi_status status;
> +	unsigned long long output;
> +
> +	status =3D acpi_evaluate_integer(device->handle, "CRBT", NULL, &out=
put);

Do you think it is worth documenting what CRBT is supposed to do? Why
return value <=3D 3 is OK and > 3 is not?

> +	if (ACPI_FAILURE(status))
> +		return -EINVAL;
> +
> +	if (output > 3)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +

Delete the second blank line.

> +/*** rfkill ops ***/
> +
> +static void rbtn_query(struct rfkill *rfkill, void *data)
> +{
> +	struct acpi_device *device =3D data;
> +	acpi_status status;
> +	unsigned long long output;
> +
> +	status =3D acpi_evaluate_integer(device->handle, "GRBT", NULL, &out=
put);

Same comment here about the documentation.

> +	if (ACPI_FAILURE(status))
> +		return;
> +
> +	rfkill_set_states(rfkill, !output, !output);

You can also write it like:

	if (ACPI_SUCCESS(status))
		rfkill_set_states(rfkill, !output, !output);

which looks better to me at least.

> +}
> +
> +static int rbtn_set_block(void *data, bool blocked)
> +{
> +	/* FIXME: setting soft rfkill cause problems, so disable it for now=
 */
> +	return -EINVAL;
> +}
> +
> +struct rfkill_ops rbtn_ops =3D {

static? const?

> +	.query =3D rbtn_query,
> +	.set_block =3D rbtn_set_block,
> +};
> +
> +

Delete the second blank line.

> +/*** acpi driver ***/
> +
> +static int rbtn_add(struct acpi_device *device);
> +static int rbtn_remove(struct acpi_device *device);
> +static void rbtn_notify(struct acpi_device *device, u32 event);
> +
> +static const struct acpi_device_id rbtn_ids[] =3D {
> +	{ "DELRBTN", 0 },
> +	{ "DELLABCE", 0 },
> +	{ "", 0 },
> +};
> +
> +static struct acpi_driver rbtn_driver =3D {
> +	.name =3D "dell-rbtn",
> +	.ids =3D rbtn_ids,
> +	.ops =3D {
> +		.add =3D rbtn_add,
> +		.remove =3D rbtn_remove,
> +		.notify =3D rbtn_notify,
> +	},
> +	.owner =3D THIS_MODULE,
> +};
> +
> +

Ditto.

> +/*** rfkill enable/disable ***/
> +
> +static int rbtn_enable(struct acpi_device *device)
> +{
> +	struct rfkill *rfkill =3D device->driver_data;
> +	int ret;
> +
> +	if (rfkill)
> +		return 0;
> +
> +	/* NOTE: rbtn controls all radio devices, not only WLAN
> +	         but rfkill interface does not support "ANY" type
> +	         so "WLAN" type is used
> +	 */

Block comment style.

> +	rfkill =3D rfkill_alloc("dell-rbtn", &device->dev, RFKILL_TYPE_WLAN=
,
> +			      &rbtn_ops, device);
> +	if (!rfkill)
> +		return -ENOMEM;
> +
> +	ret =3D rfkill_register(rfkill);
> +	if (ret) {
> +		rfkill_destroy(rfkill);
> +		return ret;
> +	}
> +
> +	device->driver_data =3D rfkill;
> +	return 0;
> +}
> +
> +static void rbtn_disable(struct acpi_device *device)
> +{
> +	struct rfkill *rfkill =3D device->driver_data;
> +
> +	if (!rfkill)
> +		return;
> +
> +	rfkill_unregister(rfkill);
> +	rfkill_destroy(rfkill);
> +	device->driver_data =3D NULL;
> +}
> +
> +

Extra blank line.

> +/*** acpi driver functions ***/
> +
> +static int rbtn_add(struct acpi_device *device)
> +{
> +	int ret;
> +
> +	ret =3D rbtn_check(device);
> +	if (ret < 0)
> +		return ret;
> +
> +	return rbtn_enable(device);
> +}
> +
> +static int rbtn_remove(struct acpi_device *device)
> +{
> +	rbtn_disable(device);
> +	return 0;
> +}
> +
> +static void rbtn_notify(struct acpi_device *device, u32 event)
> +{
> +	struct rfkill *rfkill =3D device->driver_data;
> +
> +	if (event =3D=3D 0x80)
> +		rbtn_query(rfkill, device);
> +	else
> +		dev_info(&device->dev, "Received unknown event (0x%x)\n", event);
> +}
> +
> +

Extra blank line.

> +/*** module functions ***/
> +
> +static int __init rbtn_init(void)
> +{
> +	return acpi_bus_register_driver(&rbtn_driver);
> +}
> +
> +static void __exit rbtn_exit(void)
> +{
> +	acpi_bus_unregister_driver(&rbtn_driver);
> +}
> +
> +module_init(rbtn_init);
> +module_exit(rbtn_exit);

module_acpi_driver()?

> +
> +MODULE_DEVICE_TABLE(acpi, rbtn_ids);
> +MODULE_DESCRIPTION("Dell Airplane Mode Switch driver");
> +MODULE_AUTHOR("Pali Roh=E1r <pali.rohar@gmail.com>");
> +MODULE_LICENSE("GPL");
> --=20
> 1.7.9.5
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
