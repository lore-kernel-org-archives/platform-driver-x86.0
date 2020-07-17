From: "Mani, Rajmohan" <rajmohan.mani@intel.com>
Subject: RE: [PATCH 1/2] platform/x86: Add Intel Input Output Manager (IOM)
 driver
Date: Fri, 17 Jul 2020 06:03:55 +0000
Message-ID: <DM6PR11MB39632BD9A5A0DF4A9EAB351CF67C0@DM6PR11MB3963.namprd11.prod.outlook.com>
References: <20200716003310.26125-1-rajmohan.mani@intel.com>
 <20200716003310.26125-2-rajmohan.mani@intel.com>
 <20200716070950.GC962748@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200716070950.GC962748@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee.jones@linaro.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, "Joseph, Jithu" <jithu.joseph@intel.com>, =?iso-8859-2?Q?Bla=BE_Hrastnik?= <blaz@mxxn.io>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "pmalani@chromium.org" <pmalani@chromium.org>, "bleung@chromium.org" <bleung@chromiu>
List-Id: platform-driver-x86.vger.kernel.org

Hi Greg,

Thanks for the reviews.

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Thursday, July 16, 2020 12:10 AM
> To: Mani, Rajmohan <rajmohan.mani@intel.com>
> Cc: Darren Hart <dvhart@infradead.org>; Andy Shevchenko
> <andy@infradead.org>; Mika Westerberg
> <mika.westerberg@linux.intel.com>; Dmitry Torokhov
> <dmitry.torokhov@gmail.com>; Lee Jones <lee.jones@linaro.org>; Ayman
> Bagabas <ayman.bagabas@gmail.com>; Masahiro Yamada
> <masahiroy@kernel.org>; Joseph, Jithu <jithu.joseph@intel.com>; Bla=BE
> Hrastnik <blaz@mxxn.io>; Srinivas Pandruvada
> <srinivas.pandruvada@linux.intel.com>; linux-kernel@vger.kernel.org;
> platform-driver-x86@vger.kernel.org; Heikki Krogerus
> <heikki.krogerus@linux.intel.com>; linux-usb@vger.kernel.org;
> pmalani@chromium.org; bleung@chromium.org
> Subject: Re: [PATCH 1/2] platform/x86: Add Intel Input Output Manager (IO=
M)
> driver
>=20
> On Wed, Jul 15, 2020 at 05:33:09PM -0700, Rajmohan Mani wrote:
> > Input Output Manager (IOM) is part of the Tiger Lake SoC that
> > configures the Type-C Sub System (TCSS). IOM is a micro controller
> > that handles Type-C topology, configuration and PM functions of
> > various Type-C devices connected on the platform.
> >
> > This driver helps read relevant information such as Type-C port status
> > (whether a device is connected to a Type-C port or not) and the
> > activity type on the Type-C ports (such as USB, Display Port,
> > Thunderbolt), for consumption by other drivers.
> >
> > Currently intel_iom_port_status() API is exported by this driver, that
> > has information about the Type-C port status and port activity type.
> >
> > Signed-off-by: Rajmohan Mani <rajmohan.mani@intel.com>
> > ---
> >  drivers/platform/x86/Kconfig                |  16 +++
> >  drivers/platform/x86/Makefile               |   1 +
> >  drivers/platform/x86/intel_iom.c            | 133 ++++++++++++++++++++
> >  include/linux/platform_data/x86/intel_iom.h |  62 +++++++++
>=20
> Why do you need a .h file for a single .c file that no one else shares th=
is data?
> Just put it all in the .c file please.
>=20

The APIs exported by this driver, are used by the caller (Intel PMC USB mux
control driver), hence the need for header file.

> >  4 files changed, 212 insertions(+)
> >  create mode 100644 drivers/platform/x86/intel_iom.c  create mode
> > 100644 include/linux/platform_data/x86/intel_iom.h
> >
> > diff --git a/drivers/platform/x86/Kconfig
> > b/drivers/platform/x86/Kconfig index 0581a54cf562..271feddb20ef 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -816,6 +816,22 @@ config INTEL_INT0002_VGPIO
> >  	  To compile this driver as a module, choose M here: the module will
> >  	  be called intel_int0002_vgpio.
> >
> > +config INTEL_IOM
> > +	tristate "Intel Input Output Manager (IOM) driver"
> > +	depends on ACPI && PCI
> > +	help
> > +	  This driver helps read relevant information such as Type-C port
> > +	  status (whether a device is connected to a Type-C port or not)
> > +	  and the activity type on the Type-C ports (such as USB, Display
> > +	  Port, Thunderbolt), for consumption by other drivers.
> > +
> > +	  Currently intel_iom_port_status() API is exported by this driver,
> > +	  that has information about the Type-C port status and port activity
> > +	  type.
> > +
> > +	  To compile this driver as a module, choose M here: the module will
> > +	  be called intel_iom.
> > +
> >  config INTEL_MENLOW
> >  	tristate "Thermal Management driver for Intel menlow platform"
> >  	depends on ACPI_THERMAL
> > diff --git a/drivers/platform/x86/Makefile
> > b/drivers/platform/x86/Makefile index 2b85852a1a87..d71e4620a7c6
> > 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -76,6 +76,7 @@ intel_cht_int33fe-objs			:=3D
> intel_cht_int33fe_common.o \
> >  					   intel_cht_int33fe_microb.o
> >  obj-$(CONFIG_INTEL_HID_EVENT)		+=3D intel-hid.o
> >  obj-$(CONFIG_INTEL_INT0002_VGPIO)	+=3D intel_int0002_vgpio.o
> > +obj-$(CONFIG_INTEL_IOM)			+=3D intel_iom.o
> >  obj-$(CONFIG_INTEL_MENLOW)		+=3D intel_menlow.o
> >  obj-$(CONFIG_INTEL_OAKTRAIL)		+=3D intel_oaktrail.o
> >  obj-$(CONFIG_INTEL_VBTN)		+=3D intel-vbtn.o
> > diff --git a/drivers/platform/x86/intel_iom.c
> > b/drivers/platform/x86/intel_iom.c
> > new file mode 100644
> > index 000000000000..ece0fe720b2d
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel_iom.c
> > @@ -0,0 +1,133 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Intel Core SoC Input Output Manager (IOM) driver.
> > + *
> > + * This driver provides access to the Input Output Manager (IOM)
> > +(that
> > + * is part of Tiger Lake SoC) registers that can be used to know
> > +about
> > + * Type-C Sub System related information (such as Type-C port status,
> > + * activity type on Type-C ports).
> > + *
> > + * Copyright (C) 2020, Intel Corporation
> > + * Author: Rajmohan Mani <rajmohan.mani@intel.com>  */
> > +
> > +#include <linux/io.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_data/x86/intel_iom.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +#define IOM_PORT_STATUS_OFFSET				0x560
> > +
> > +struct intel_iom {
> > +	struct device *dev;
> > +	void __iomem *regbar;
> > +};
> > +
> > +static struct intel_iom iom_dev;
>=20
> Why just one?  Why is this static?
>=20

There is just one IOM device in the system.

> > +
> > +/**
> > + * intel_iom_get() - Get IOM device instance
> > + *
> > + * This function returns the IOM device instance. This also ensures
> > +that
> > + * this driver cannot be unloaded while the caller has the instance.
> > + *
> > + * Call intel_iom_put() to release the instance.
> > + *
> > + * Returns IOM device instance on success or error pointer otherwise.
> > + */
> > +struct intel_iom *intel_iom_get(void) {
> > +	struct device *dev =3D get_device(iom_dev.dev);
>=20
> Wht if dev is NULL?
>=20

Ack. Will add a check for NULL.

> > +
> > +	/* Prevent this driver from being unloaded while in use */
> > +	if (!try_module_get(dev->driver->owner)) {
>=20
> Why are you poking around in a random device's driver's owner?
>=20
> That's not ok.  And probably totally racy.
>=20
> Handle module reference counts properly, not like this.
>=20

Ack. Will use THIS_MODULE here.

> And why does it even matter that you incremented the module reference
> count?  What is that "protecting" you from?
>=20
=20
To prevent this driver from being unloaded, while it is being used.

> > +		put_device(iom_dev.dev);
> > +		return ERR_PTR(-EBUSY);
> > +	}
> > +
> > +	return &iom_dev;
> > +}
> > +EXPORT_SYMBOL_GPL(intel_iom_get);
>=20
> Who calls this function?
>=20

Intel PMC USB mux control driver, in this case.
The callers are expected to call intel_iom_get() before using the
intel_iom_port_status(), after which intel_iom_put() can be called
to release the IOM device instance.

> > +
> > +/**
> > + * intel_iom_put() - Put IOM device instance
> > + * @iom: IOM device instance
> > + *
> > + * This function releases the IOM device instance created using
> > + * intel_iom_get() and allows the driver to be unloaded.
> > + *
> > + * Call intel_iom_put() to release the instance.
> > + */
> > +void intel_iom_put(struct intel_iom *iom) {
> > +	if (!iom)
> > +		return;
> > +
> > +	module_put(iom->dev->driver->owner);
>=20
> And if the device doesn't have a driver?  boom :(
>=20
> Don't do this.
>=20

Ack. Will use THIS_MODULE here.

> > +	put_device(iom->dev);
> > +}
> > +EXPORT_SYMBOL_GPL(intel_iom_put);
> > +
> > +/**
> > + * intel_iom_port_status() - Get status bits for the Type-C port
> > + * @iom: IOM device instance
> > + * @port: Type-C port number
> > + * @status: pointer to receive the status bits
> > + *
> > + * Returns 0 on success, error otherwise.
> > + */
> > +int intel_iom_port_status(struct intel_iom *iom, u8 port, u32
> > +*status) {
> > +	void __iomem *reg;
> > +
> > +	if (!iom)
> > +		return -ENODEV;
> > +
> > +	if (!status || (port > IOM_MAX_PORTS - 1))
> > +		return -EINVAL;
> > +
> > +	reg =3D iom->regbar + IOM_PORT_STATUS_OFFSET + IOM_REG_LEN *
> port;
> > +
> > +	*status =3D ioread32(reg);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(intel_iom_port_status);
>=20
> So the whole driver is here just to read, directly from memory, a single
> 32 bit value?

Yes.

> Doesn't that seem like a lot of overkill?  Why can't the caller just
> do this themselves?
>=20

Ack.
Intel PMC USB mux device is part of the PCH, while IOM is part of the SoC.
So I thought it made sense to keep these 2 devices / drivers apart, despite
the overkill. Heikki also agreed with this approach, given the above.

> greg k-h
