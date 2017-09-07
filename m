From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] Add driver to force WMI Thunderbolt controller power
 status
Date: Thu, 7 Sep 2017 18:47:35 +0000
Message-ID: <3e21d6174dd24deea25957e43ecd5cbf@ausx13mpc120.AMER.DELL.COM>
References: <1504720440-24423-1-git-send-email-mario.limonciello@dell.com>
 <20170907065015.GC2477@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa1.dell-outbound.iphmx.com ([68.232.153.90]:13461 "EHLO
        esa1.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755548AbdIGSs4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2017 14:48:56 -0400
In-Reply-To: <20170907065015.GC2477@lahna.fi.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mika.westerberg@linux.intel.com
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com, yehezkelshb@gmail.com

> -----Original Message-----
> From: Mika Westerberg [mailto:mika.westerberg@linux.intel.com]
> Sent: Thursday, September 7, 2017 1:50 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; LKML <linux-kernel@vger.kernel.org>; platform-d=
river-
> x86@vger.kernel.org; Richard Hughes <hughsient@gmail.com>; Yehezkel Berna=
t
> <yehezkelshb@gmail.com>
> Subject: Re: [PATCH] Add driver to force WMI Thunderbolt controller power=
 status
>=20
> On Wed, Sep 06, 2017 at 12:54:00PM -0500, Mario Limonciello wrote:
> > Current implementations of Intel Thunderbolt controllers will go
> > into a low power mode when not in use.
> >
> > Many machines containing these controllers also have a GPIO wired up
> > that can force the controller awake.  This is offered via a ACPI-WMI
> > interface intended to be manipulated by a userspace utility.
> >
> > This mechanism is provided by Intel to OEMs to include in BIOS.
> > It uses an industry wide GUID that is populated in a separate _WDG
> > entry with no binary MOF.
> >
> > This interface allow software such as fwupd to wake up thunderbolt
> > controllers to query the firmware version or flash new firmware.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > ---
> >  MAINTAINERS                                  |  5 ++
> >  drivers/platform/x86/Kconfig                 | 13 ++++
> >  drivers/platform/x86/Makefile                |  1 +
> >  drivers/platform/x86/intel-wmi-thunderbolt.c | 97
> ++++++++++++++++++++++++++++
> >  4 files changed, 116 insertions(+)
> >  create mode 100644 drivers/platform/x86/intel-wmi-thunderbolt.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1c3feff..375bea9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3949,6 +3949,11 @@ M:	Pali Roh=E1r <pali.rohar@gmail.com>
> >  S:	Maintained
> >  F:	drivers/platform/x86/dell-wmi.c
> >
> > +INTEL WMI THUNDERBOLT DRIVER
> > +M:	Mario Limonciello <mario.limonciello@dell.com>
> > +S:	Maintained
> > +F:	drivers/platform/x86/intel-wmi-thunderbolt.c
> > +
> >  DELTA ST MEDIA DRIVER
> >  M:	Hugues Fruchet <hugues.fruchet@st.com>
> >  L:	linux-media@vger.kernel.org
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
> > index 80b8795..6670a8d 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -658,6 +658,19 @@ config WMI_BMOF
> >  	  To compile this driver as a module, choose M here: the module will
> >  	  be called wmi-bmof.
> >
> > +config INTEL_WMI_THUNDERBOLT
> > +	tristate "Intel WMI thunderbolt driver"
>=20
> "Intel WMI Thunderbolt force power driver"

Adjusted.

>=20
> > +	depends on ACPI_WMI
> > +	default ACPI_WMI
> > +	---help---
> > +	  Say Y here if you want to be able to use the WMI interface on selec=
t
> > +	  systems to force the power control of Intel Thunderbolt controllers=
.
> > +	  This is useful for updating the firmware when devices are not plugg=
ed
> > +	  into the controller.
> > +
> > +	  To compile this driver as a module, choose M here: the module will
> > +	  be called intel-wmi-thunderbolt.
> > +
> >  config MSI_WMI
> >  	tristate "MSI WMI extras"
> >  	depends on ACPI_WMI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
> > index 91cec17..2b315d0 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -39,6 +39,7 @@ obj-$(CONFIG_PEAQ_WMI)		+=3D peaq-wmi.o
> >  obj-$(CONFIG_SURFACE3_WMI)	+=3D surface3-wmi.o
> >  obj-$(CONFIG_TOPSTAR_LAPTOP)	+=3D topstar-laptop.o
> >  obj-$(CONFIG_WMI_BMOF)		+=3D wmi-bmof.o
> > +obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+=3D intel-wmi-thunderbolt.o
> >
> >  # toshiba_acpi must link after wmi to ensure that wmi devices are foun=
d
> >  # before toshiba_acpi initializes
> > diff --git a/drivers/platform/x86/intel-wmi-thunderbolt.c
> b/drivers/platform/x86/intel-wmi-thunderbolt.c
> > new file mode 100644
> > index 0000000..98f60f2
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel-wmi-thunderbolt.c
> > @@ -0,0 +1,97 @@
> > +/*
> > + * WMI Thunderbolt driver
> > + *
> > + * Copyright (C) 2017 Dell Inc. All Rights Reserved.
> > + *
> > + *  This program is free software; you can redistribute it and/or modi=
fy it
> > + *  under the terms of the GNU General Public License version 2 as pub=
lished
> > + *  by the Free Software Foundation.
> > + *
> > + *  This program is distributed in the hope that it will be useful,
> > + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *  GNU General Public License for more details.
> > + */
> > +
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/device.h>
> > +#include <linux/fs.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/string.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/types.h>
> > +#include <linux/wmi.h>
> > +
> > +#define INTEL_WMI_THUNDERBOLT_GUID "86CCFD48-205E-4A77-9C48-
> 2021CBEDE341"
> > +
>=20
> Remove extra newline.

Removed.

>=20
> > +
> > +static ssize_t force_power_store(struct device *dev,
> > +				 struct device_attribute *attr,
> > +				 const char *buf, size_t count)
> > +{
> > +	struct acpi_buffer input;
> > +	acpi_status status;
> > +	u8 mode;
> > +
> > +	input.length =3D (acpi_size) (sizeof(u8));
>=20
> Is this cast really needed?

Nope, adjusted.

>=20
> > +	input.pointer =3D &mode;
> > +	mode =3D hex_to_bin(buf[0]);
> > +	if (mode =3D=3D 0 || mode =3D=3D 1) {
> > +		status =3D wmi_evaluate_method(INTEL_WMI_THUNDERBOLT_GUID,
> 0, 1,
> > +					     &input, NULL);
> > +		if (ACPI_FAILURE(status)) {
> > +			pr_err("intel-wmi-thunderbolt: failed setting %s\n",
> > +			       buf);
> > +			return -ENODEV;
> > +		}
> > +	} else {
> > +		pr_err("intel-wmi-thunderbolt: unsupported mode: %d", mode);
> > +	}
> > +	return count;
> > +}
> > +
> > +static DEVICE_ATTR_WO(force_power);
> > +
> > +static struct attribute *tbt_attrs[] =3D {
>=20
> Can this be const?

No, "initialization from incompatible pointer type" if set like that.
Other drivers in platform/ seem to follow the same approach too.

>=20
> > +	&dev_attr_force_power.attr,
> > +	NULL
> > +};
> > +
> > +static const struct attribute_group tbt_attribute_group =3D {
> > +	.attrs =3D tbt_attrs,
> > +};
> > +
> > +static int intel_wmi_thunderbolt_probe(struct wmi_device *wdev)
> > +{
> > +	return sysfs_create_group(&wdev->dev.kobj, &tbt_attribute_group);
>=20
> You need to document this in Documentation/ABI. While there, I think it
> make sense to update Documentation/admin-guide/thunderbolt.rst
> accordingly.
>=20

Thanks, will fix for v2.

> Also you are adding an attribute to a device that is already announced
> to the userspace (I think). So it is possible userspace does not find
> this when it deals with the uevent. Not sure if it is really a problem
> in this case, though.
>=20

I don't think it will matter in this case.  It will come down to how fwupd
decides to use this (which will be TBD and is under discussion still).

> Other than that, looks nice to me :)

Thanks for your feedback.  I'll send a follow up v2 in a few moments.
