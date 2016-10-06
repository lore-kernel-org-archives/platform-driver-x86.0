From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v1] drivers/platform/x86: introduce support for Mellanox
 hotplug driver
Date: Thu, 6 Oct 2016 14:21:39 +0000
Message-ID: <AM5PR0501MB20976EB0E1837913D765FCAAA2C70@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1474550067-142107-1-git-send-email-vadimp@mellanox.com>
 <20160928221351.GA3066@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-db5eur01on0079.outbound.protection.outlook.com ([104.47.2.79]:63264
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752449AbcJFOgb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Oct 2016 10:36:31 -0400
In-Reply-To: <20160928221351.GA3066@f23x64.localdomain>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Rafael Wysocki <rjw@rjwysocki.net>



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Thursday, September 29, 2016 1:14 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: davem@davemloft.net; geert@linux-m68k.org; akpm@linux-
> foundation.org; kvalo@codeaurora.org; gregkh@linuxfoundation.org;
> mchehab@kernel.org; linux@roeck-us.net; linux-kernel@vger.kernel.org;
> platform-driver-x86@vger.kernel.org; jiri@resnulli.us; Rafael Wysocki
> <rjw@rjwysocki.net>
> Subject: Re: [patch v1] drivers/platform/x86: introduce support for Mella=
nox
> hotplug driver
>=20
> On Thu, Sep 22, 2016 at 01:14:27PM +0000, vadimp@mellanox.com wrote:
> > From: Vadim Pasternak <vadimp@mellanox.com>
> >
>=20
> Hi Vadim,

Hi Darren,

Thank you very much for your review.
Sorry for the delay with my reply.

>=20
> > Enable system support for the Mellanox Technologies hotplug platform
> > driver, which provides support for the next Mellanox basic systems:
> > "msx6710", "msx6720", "msb7700", "msn2700", "msx1410", "msn2410",
> > "msb7800", "msn2740", "msn2100" and also various number of derivative
> > systems from the above basic types.
>=20
> Some context for those reviewing the code and not familiar with your prod=
uct
> line will help establish context. Those appear to be a mix of Infiniband =
and
> Ethernet switches, typically with dual power supplies, and an x86 process=
or.
>=20
> Correct?

Yes, we have Ethernet and InfiniBand systems, currently based on Mellanox A=
ISCs SwitchX (36 40G Ethernet or 40/56G IB ports), SwitchX-2 (same as previ=
ous, but with some extra features in HW), Switch-IB/Switch-IB 2 (both 36x10=
0G IB, last one with some special offloading features) , Spectrum (32x100G =
Ethernet, also supporting 50G and 25G).
The systems are equipped with I7, Celeron or ATOM processors.
New system which is about to be released will be equipped with NPS460 netwo=
rk processor (100G and 40G Ethernet port mixed).
The above systems have different port configuration (combinations of 10/40G=
 or 25/100G).
Typical system configuration has 4 FAN drawers and 2 PSUs. Also it could be=
 system with more FAN drawers.
There are also "fixed" cheaper systems, on which FANs and PSUs are not repl=
icable (on such system only cable in/out signals are relevant).

>=20
> > This driver handles hot-plug events for the power suppliers, power
> > cables and fans for the above systems.
> >
> > The Kconfig currently controlling compilation of this code is:
> > driver/platform/x86:config MLX_CPLD_PLATFORM
> >                        tristate "Mellanox platform hotplug driver suppo=
rt"
>=20
> Regarding location and approach. Greg KH asked if there was another to
> paramaterize the driver, such as ACPI. You mentioned you didn't have it. =
I was
> curious to know - did you mean you that the Mellanox switch platform firm=
ware
> does not use ACPI at all or that you didn't have any ACPI description for=
 this
> hardware?

All the mentioned systems unfortunately don't use ACPI.
For new coming 200G systems we consider system support by BMC SoC (current =
system are not equipped with BMC).
=20
>=20
> If you use ACPI on the platform, the ACPI _DSD mechanism can provide you =
with
> these sorts of properties, allowing you to describe the platform fully to=
 the
> driver without the need for platform specific drivers.

I suppose we will support _DSD on future systems (in case some of them will=
 be not equipped with BMC SoC).

>=20
> +Rafael
>=20
> Is there a user of this platform driver coming?
>=20


Yes, this is another new module mlx-platform.

> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>=20
> > ---
> >  MAINTAINERS                                   |   7 +
> >  drivers/platform/x86/Kconfig                  |  10 +
> >  drivers/platform/x86/Makefile                 |   1 +
> >  drivers/platform/x86/mlxcpld-hotplug.c        | 543
> ++++++++++++++++++++++++++
> >  include/linux/platform_data/mlxcpld-hotplug.h |  90 +++++
> >  5 files changed, 651 insertions(+)
> >  create mode 100644 drivers/platform/x86/mlxcpld-hotplug.c
> >  create mode 100644 include/linux/platform_data/mlxcpld-hotplug.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index a306795..cbfe2a8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7649,6 +7649,13 @@ W:	http://www.mellanox.com
> >  Q:	http://patchwork.ozlabs.org/project/netdev/list/
> >  F:	drivers/net/ethernet/mellanox/mlxsw/
> >
> > +MELLANOX MLX CPLD HOTPLUG DRIVER
> > +M:	Vadim Pasternak <vadimp@mellanox.com>
> > +L:	platform-driver-x86@vger.kernel.org
> > +S:	Supported
> > +F:	drivers/platform/x86/mlxcpld-hotplug.c
> > +F:	include/linux/platform_data/mlxcpld-hotplug.h
> > +
> >  SOFT-ROCE DRIVER (rxe)
> >  M:	Moni Shoua <monis@mellanox.com>
> >  L:	linux-rdma@vger.kernel.org
> > diff --git a/drivers/platform/x86/Kconfig
> > b/drivers/platform/x86/Kconfig index 81b8dcc..e9be541 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -1026,4 +1026,14 @@ config INTEL_TELEMETRY
> >  	  used to get various SoC events and parameters
> >  	  directly via debugfs files. Various tools may use
> >  	  this interface for SoC state monitoring.
> > +
> > +config MLX_CPLD_PLATFORM
> > +        tristate "Mellanox platform hotplug driver support"
> > +        default n
>=20
> Please be consistent with whitespace usage with what is in the file and i=
ndent
> with tabs.
>=20
> > +	depends on MLX_PLATFORM
> > +	select I2C
> > +        ---help---
> > +	  This driver handles hot-plug events for the power suppliers, power
> > +	  cables and fans on the wide range Mellanox IB and Ethernet systems.
> > +
> >  endif # X86_PLATFORM_DEVICES
> > diff --git a/drivers/platform/x86/Makefile
> > b/drivers/platform/x86/Makefile index 2efa86d..1f06b63 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -71,3 +71,4 @@ obj-$(CONFIG_INTEL_TELEMETRY)	+=3D
> intel_telemetry_core.o \
> >  				   intel_telemetry_pltdrv.o \
> >  				   intel_telemetry_debugfs.o
> >  obj-$(CONFIG_INTEL_PMC_CORE)    +=3D intel_pmc_core.o
> > +obj-$(CONFIG_MLX_CPLD_PLATFORM)	+=3D mlxcpld-hotplug.o
> > diff --git a/drivers/platform/x86/mlxcpld-hotplug.c
> > b/drivers/platform/x86/mlxcpld-hotplug.c
> > new file mode 100644
> > index 0000000..d53d845
> > --- /dev/null
> > +++ b/drivers/platform/x86/mlxcpld-hotplug.c
> > @@ -0,0 +1,543 @@
> > +/*
> > + * drivers/platform/x86/mlxcpld-hotplug.c
> > + * Copyright (c) 2016 Mellanox Technologies. All rights reserved.
> > + * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
> > + *
> > + * Redistribution and use in source and binary forms, with or without
> > + * modification, are permitted provided that the following conditions =
are
> met:
> > + *
> > + * 1. Redistributions of source code must retain the above copyright
> > + *    notice, this list of conditions and the following disclaimer.
> > + * 2. Redistributions in binary form must reproduce the above copyrigh=
t
> > + *    notice, this list of conditions and the following disclaimer in =
the
> > + *    documentation and/or other materials provided with the distribut=
ion.
> > + * 3. Neither the names of the copyright holders nor the names of its
> > + *    contributors may be used to endorse or promote products derived =
from
> > + *    this software without specific prior written permission.
> > + *
> > + * Alternatively, this software may be distributed under the terms of
> > +the
> > + * GNU General Public License ("GPL") version 2 as published by the
> > +Free
> > + * Software Foundation.
> > + *
> > + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> > + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED
> > +TO, THE
> > + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> PARTICULAR
> > +PURPOSE
> > + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
> > +CONTRIBUTORS BE
> > + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
> > +OR
> > + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> PROCUREMENT
> > +OF
> > + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
> > +BUSINESS
> > + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
> > +WHETHER IN
> > + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> > +OTHERWISE)
> > + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> > +ADVISED OF THE
> > + * POSSIBILITY OF SUCH DAMAGE.
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/device.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_data/mlxcpld-hotplug.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/module.h>
> > +#include <linux/wait.h>
> > +#include <linux/workqueue.h>
>=20
> Please scrub this list of includes and only include what you explicitly r=
equire that
> isn't implicit in one of the others. module.h, for example, is listed twi=
ce. I
> suspect a few of these could be eliminated.
>=20
> > +
> > +/* Offset of event and mask registers from status register */
> > +#define MLXCPLD_HOTPLUG_EVENT_OFF	1
> > +#define MLXCPLD_HOTPLUG_MASK_OFF	2
> > +#define MLXCPLD_HOTPLUG_AGGR_MASK_OFF	1
> > +
> > +#define MLXCPLD_HOTPLUG_ATTRS_NUM	8
> > +
> > +enum mlxcpld_hotplug_attr_type {
> > +	MLXCPLD_HOTPLUG_ATTR_TYPE_PSU,
> > +	MLXCPLD_HOTPLUG_ATTR_TYPE_PWR,
> > +	MLXCPLD_HOTPLUG_ATTR_TYPE_FAN,
> > +};
> > +
> > +/* mlxcpld_hotplug_priv_data - platform private data:
>=20
> Nit, always lead multi-line comment blocks with:
>=20
> /*
>  * First line...
>=20
> More than one instance of this in the patch, please correct throughout.
>=20
> > + * @irq - platform interrupt number;
> > + * @pdev - platform device;
> > + * @plat - platform data;
> > + * @hwmon - hwmon device;
> > + * @mlxcpld_hotplug_attr - sysfs attributes array;
> > + * @mlxcpld_hotplug_dev_attr - sysfs sensor device attribute array;
> > + * @group - sysfs attribute group;
> > + * @groups - list of sysfs attribute group for hwmon registration;
> > + * @dwork - delayed work template;
> > + * @lock - spin lock;
> > + * @aggr_cache - last value of aggregation register status;
> > + * @psu_cache - last value of PSU register status;
> > + * @pwr_cache - last value of power register status;
> > + * @fan_cache - last value of FAN register status;  */ struct
> > +mlxcpld_hotplug_priv_data {
> > +	int irq;
> > +	struct platform_device *pdev;
> > +	struct mlxcpld_hotplug_platform_data *plat;
> > +	struct device *hwmon;
> > +	struct attribute
> *mlxcpld_hotplug_attr[MLXCPLD_HOTPLUG_ATTRS_NUM + 1];
> > +	struct sensor_device_attribute_2
> > +
> 	mlxcpld_hotplug_dev_attr[MLXCPLD_HOTPLUG_ATTRS_NUM];
> > +	struct attribute_group group;
> > +	const struct attribute_group *groups[2];
> > +	struct delayed_work dwork;
> > +	spinlock_t lock;
> > +	u8 aggr_cache;
> > +	u8 psu_cache;
> > +	u8 pwr_cache;
> > +	u8 fan_cache;
> > +};
> > +
> > +static ssize_t mlxcpld_hotplug_attr_show(struct device *dev,
> > +					 struct device_attribute *attr,
> > +					 char *buf)
> > +{
> > +	struct platform_device *pdev =3D to_platform_device(dev);
> > +	struct mlxcpld_hotplug_priv_data *priv =3D platform_get_drvdata(pdev)=
;
> > +	int index =3D to_sensor_dev_attr_2(attr)->index;
> > +	int nr =3D to_sensor_dev_attr_2(attr)->nr;
> > +	u8 reg_val =3D 0;
> > +
> > +	switch (nr) {
> > +	case MLXCPLD_HOTPLUG_ATTR_TYPE_PSU:
> > +		reg_val =3D inb(priv->plat->psu_reg_offset);
> > +		reg_val &=3D BIT_MASK(index);
>=20
> So BIT_MASK will mod by BITS_PER_LONG, but you're looking to mask a u8
> value, so would BIT() be just as effective (e.g. not). Is it valid for in=
dex to be
> larger than the bits in the u8?
>=20
> > +		reg_val =3D !!!reg_val; /* Bit =3D 0 : PSU is present. */
>=20
> I guess it's a nit, but this seems like a lot of unnecessary breakdown wh=
en the
> following accomplishes the same thing and isn't any less clear in my opin=
ion.
>=20
> 		reg_val =3D !!!(inb(priv->plat->psu_reg_offset) & BIT(index));
>=20
> > +		break;
> > +
> > +	case MLXCPLD_HOTPLUG_ATTR_TYPE_PWR:
> > +		reg_val =3D inb(priv->plat->pwr_reg_offset);
> > +		reg_val &=3D BIT_MASK(index % priv->plat->pwr_count);
>=20
> When is it valid for index to need to be modded? Same for fan_count below=
. Is
> this a valid use case, or something that should be checked and rejected e=
arlier?
>=20

This is common index for the all components, since there is no need to divi=
de them to different groups . For example for system with two PSUs and four=
 FANs, index is in range from 0 to 7 (2 PSUs, 2 cables, 4 FAN). PSU attribu=
tes are added at first, then cables, then FANs. FAN will have indexes from =
4 to 7, so module operation will factor them to 0 - 3.

> > +		reg_val =3D !!reg_val; /* Bit =3D 1 : power cable is attached. */
> > +		break;
> > +
> > +	case MLXCPLD_HOTPLUG_ATTR_TYPE_FAN:
> > +		reg_val =3D inb(priv->plat->fan_reg_offset);
> > +		reg_val &=3D BIT_MASK(index % priv->plat->fan_count);
> > +		reg_val =3D !!!reg_val; /* Bit =3D 0 : FAN is present. */
> > +		break;
> > +	}
> > +
> > +	return sprintf(buf, "%u\n", reg_val); }
> > +
> > +static int mlxcpld_hotplug_attr_init(struct mlxcpld_hotplug_priv_data
> > +*priv) {
> > +	int num_attrs =3D priv->plat->psu_count + priv->plat->pwr_count +
> > +			priv->plat->fan_count;
> > +	int i;
> > +
> > +	priv->group.attrs =3D devm_kzalloc(&priv->pdev->dev, num_attrs *
> > +					 sizeof(struct attribute *),
> > +					 GFP_KERNEL);
> > +	if (!priv->group.attrs)
> > +		return -ENOMEM;
> > +
> > +	for (i =3D 0; i < num_attrs; i++) {
> > +		priv->mlxcpld_hotplug_attr[i] =3D
> > +			&priv->mlxcpld_hotplug_dev_attr[i].dev_attr.attr;
> > +
> > +		if (i < priv->plat->psu_count) {
> > +			priv->mlxcpld_hotplug_attr[i]->name =3D
> > +				devm_kasprintf(&priv->pdev->dev,
> GFP_KERNEL,
> > +					       "psu%u", i + 1);
> > +			priv->mlxcpld_hotplug_dev_attr[i].nr =3D
> > +
> 	MLXCPLD_HOTPLUG_ATTR_TYPE_PSU;
>=20
>=20
> It seems this could be made more legible by doing on for loop for each th=
e three
> types (psu, pwr, and fan) and removing one level of indentation, possibly
> factoring some of it out into a function to avoid duplicating the error c=
hecking
> and sysfs dev_attr stuff. Once you've reached 8 levels of indentations...=
. it's
> probably time to refactor a bit. Or perhaps a local alias for the longer =
names like
> priv->mlxcpld_hotplug_dev_attr would do the trick.
>=20
>=20
> > +		} else if (i < priv->plat->psu_count + priv->plat->pwr_count) {
> > +			priv->mlxcpld_hotplug_attr[i]->name =3D
> > +				devm_kasprintf(&priv->pdev->dev,
> GFP_KERNEL,
> > +					       "pwr%u", i %
> > +						priv->plat->pwr_count + 1);
> > +			priv->mlxcpld_hotplug_dev_attr[i].nr =3D
> > +
> 	MLXCPLD_HOTPLUG_ATTR_TYPE_PWR;
> > +		} else {
> > +			priv->mlxcpld_hotplug_attr[i]->name =3D
> > +				devm_kasprintf(&priv->pdev->dev,
> GFP_KERNEL,
> > +					       "fan%u", i %
> > +						priv->plat->fan_count + 1);
> > +			priv->mlxcpld_hotplug_dev_attr[i].nr =3D
> > +
> 	MLXCPLD_HOTPLUG_ATTR_TYPE_FAN;
> > +		}
> > +
> > +		if (!priv->mlxcpld_hotplug_attr[i]->name) {
> > +			dev_err(&priv->pdev->dev, "Memory allocation failed
> for sysfs attribute %d.\n",
> > +				i + 1);
> > +			return -ENOMEM;
> > +		}
> > +
> > +		priv->mlxcpld_hotplug_dev_attr[i].dev_attr.attr.name =3D
> > +			priv->mlxcpld_hotplug_attr[i]->name;
> > +		priv->mlxcpld_hotplug_dev_attr[i].dev_attr.attr.mode =3D
> > +								S_IRUGO;
> > +		priv->mlxcpld_hotplug_dev_attr[i].dev_attr.show =3D
> > +						mlxcpld_hotplug_attr_show;
> > +		priv->mlxcpld_hotplug_dev_attr[i].index =3D i;
> > +		sysfs_attr_init(
> > +		&priv->mlxcpld_hotplug_dev_attr[i].dev_attr.attr);
> > +	}
> > +
> > +	priv->group.attrs =3D priv->mlxcpld_hotplug_attr;
> > +	priv->groups[0] =3D &priv->group;
> > +	priv->groups[1] =3D NULL;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mlxcpld_hotplug_device_create(struct device *dev,
> > +					 struct mlxcpld_hotplug_device *item) {
> > +	item->adapter =3D i2c_get_adapter(item->bus);
> > +	if (!item->adapter) {
> > +		dev_err(dev, "Failed to get adapter for bus %d\n",
> > +			item->bus);
> > +		return -EFAULT;
> > +	}
> > +
> > +	item->client =3D i2c_new_device(item->adapter, &item->brdinfo);
> > +	if (!item->client) {
> > +		dev_err(dev, "Failed to create client %s at bus %d at addr
> 0x%02x\n",
> > +			item->brdinfo.type, item->bus, item->brdinfo.addr);
> > +		i2c_put_adapter(item->adapter);
> > +		item->adapter =3D NULL;
> > +		return -EFAULT;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void mlxcpld_hotplug_device_destroy(struct
> > +mlxcpld_hotplug_device *item) {
> > +	if (item->client) {
> > +		i2c_unregister_device(item->client);
> > +		item->client =3D NULL;
> > +	}
> > +
> > +	if (item->adapter) {
> > +		i2c_put_adapter(item->adapter);
> > +		item->adapter =3D NULL;
> > +	}
> > +}
> > +
> > +/* mlxcpld_hotplug_work_handler - performs traversing of CPLD
> > +interrupt
> > + * registers according to the below hierarchy schema:
> > + *
> > + *                   Aggregation registers (status/mask)
> > + * PSU registers:           *---*
> > + * *-----------------*      |   |
> > + * |status/event/mask|----->| * |
> > + * *-----------------*      |   |
> > + * Power registers:         |   |
> > + * *-----------------*      |   |
> > + * |status/event/mask|----->| * |---> CPU
> > + * *-----------------*      |   |
> > + * FAN registers:
> > + * *-----------------*      |   |
> > + * |status/event/mask|----->| * |
> > + * *-----------------*      |   |
> > + *                          *---*
> > + * In case some system changed are detected: FAN in/out, PSU in/out,
> > +power
> > + * cable attached/detached, relevant device is created or destroyed.
> > + */
> > +static void mlxcpld_hotplug_work_handler(struct work_struct *work) {
> > +	struct mlxcpld_hotplug_priv_data *priv =3D container_of(work,
> > +				struct mlxcpld_hotplug_priv_data,
> dwork.work);
> > +	u8 val, aggr_asserted, asserted;
> > +	unsigned long flags;
> > +	int bit;
> > +
> > +	/* Mask aggregation event. */
> > +	outb(0, priv->plat->top_aggr_offset +
> MLXCPLD_HOTPLUG_AGGR_MASK_OFF);
> > +	/* Read aggregation status. */
> > +	val =3D inb(priv->plat->top_aggr_offset);
> > +	val &=3D priv->plat->top_aggr_mask;
> > +	aggr_asserted =3D priv->aggr_cache ^ val;
> > +	priv->aggr_cache =3D val;
> > +
> > +	if (aggr_asserted & priv->plat->top_aggr_psu_mask) {
> > +		/* Mask psu presense event. */
> > +		outb(0, priv->plat->psu_reg_offset +
> MLXCPLD_HOTPLUG_MASK_OFF);
> > +		/* Read psu presense status. */
> > +		val =3D inb(priv->plat->psu_reg_offset);
> > +		val &=3D priv->plat->psu_mask;
> > +		asserted =3D priv->psu_cache ^ val;
> > +		priv->psu_cache =3D val;
> > +
> > +		if (priv->plat->psu) {
> > +			for_each_set_bit(bit, (unsigned long *)&asserted, 8) {
> > +				if (val & BIT(bit))
> > +					mlxcpld_hotplug_device_destroy(
> > +							priv->plat->psu + bit);
> > +				else
> > +					mlxcpld_hotplug_device_create(
> > +							&priv->pdev->dev,
> > +							priv->plat->psu + bit);
> > +			}
> > +		}
> > +
> > +		/* Acknowledge psu presense event. */
> > +		outb(0, priv->plat->psu_reg_offset +
> MLXCPLD_HOTPLUG_EVENT_OFF);
> > +		/* Unmask psu presense event. */
> > +		outb(priv->plat->psu_mask, priv->plat->psu_reg_offset +
> > +
> 	MLXCPLD_HOTPLUG_MASK_OFF);
> > +
> > +	}
> > +
> > +	if (aggr_asserted & priv->plat->top_aggr_pwr_mask) {
> > +		/* Mask power cable event. */
> > +		outb(0, priv->plat->pwr_reg_offset +
> MLXCPLD_HOTPLUG_MASK_OFF);
> > +		/* Read power cable status. */
> > +		val =3D inb(priv->plat->pwr_reg_offset);
> > +		val &=3D priv->plat->pwr_mask;
> > +		asserted =3D priv->pwr_cache ^ val;
> > +		priv->pwr_cache =3D val;
> > +
> > +		if (priv->plat->pwr) {
> > +			for_each_set_bit(bit, (unsigned long *)&asserted, 8) {
> > +				if (val & BIT(bit))
> > +					mlxcpld_hotplug_device_create(
> > +							&priv->pdev->dev,
> > +							priv->plat->pwr + bit);
> > +				else
> > +					mlxcpld_hotplug_device_destroy(
> > +							priv->plat->pwr + bit);
> > +			}
> > +		}
> > +
> > +		/* Acknowledge power cable event. */
> > +		outb(0, priv->plat->pwr_reg_offset +
> MLXCPLD_HOTPLUG_EVENT_OFF);
> > +		/* Unmask power cable event */
> > +		outb(priv->plat->pwr_mask, priv->plat->pwr_reg_offset +
> > +
> 	MLXCPLD_HOTPLUG_MASK_OFF);
> > +
> > +	}
> > +
> > +	if (aggr_asserted & priv->plat->top_aggr_fan_mask) {
> > +		/* Mask fan presense event. */
> > +		outb(0, priv->plat->fan_reg_offset +
> MLXCPLD_HOTPLUG_MASK_OFF);
> > +		/* Read fan presense status. */
> > +		val =3D inb(priv->plat->fan_reg_offset);
> > +		val &=3D priv->plat->fan_mask;
> > +		asserted =3D priv->fan_cache ^ val;
> > +		priv->fan_cache =3D val;
> > +
> > +		if (priv->plat->fan) {
> > +			for_each_set_bit(bit, (unsigned long *)&asserted, 8) {
> > +				if (val & BIT(bit))
> > +					mlxcpld_hotplug_device_destroy(
> > +							priv->plat->fan + bit);
> > +				else
> > +					mlxcpld_hotplug_device_create(
> > +							&priv->pdev->dev,
> > +							priv->plat->fan + bit);
> > +			}
> > +		}
> > +
> > +		/* Acknowledge fan presense event. */
> > +		outb(0, priv->plat->fan_reg_offset +
> MLXCPLD_HOTPLUG_EVENT_OFF);
> > +		/* Unmask fan presense event. */
> > +		outb(priv->plat->fan_mask, priv->plat->fan_reg_offset +
> > +
> 	MLXCPLD_HOTPLUG_MASK_OFF);
> > +
> > +		/* Unmask aggregation event (no need acknowledge). */
> > +		outb(priv->plat->top_aggr_mask, priv->plat->top_aggr_offset +
> > +
> 	MLXCPLD_HOTPLUG_AGGR_MASK_OFF);
> > +
> > +`
> > +		spin_lock_irqsave(&priv->lock, flags);
> > +
> > +		/*
> > +		 * It is possible, that some signals have been inserted, while
> > +		 * interrupt has been masked by
> mlxcpld_hotplug_work_handler.
> > +		 * In this case such signals will be missed. In order to handle
> > +		 * these signals delayed work is canceled and work task
> > +		 * re-scheduled for immediate execution. It allows to handle
> > +		 * missed signals, if any. In other case work handler just
> > +		 * validates that no new signals have been received during
> > +		 * masking.
> > +		 */
> > +		cancel_delayed_work(&priv->dwork);
> > +		schedule_delayed_work(&priv->dwork, 0);
> > +
> > +		spin_unlock_irqrestore(&priv->lock, flags);
> > +
> > +		return;
> > +	}
> > +
> > +	/* Unmask aggregation event (no need acknowledge). */
> > +	outb(priv->plat->top_aggr_mask, priv->plat->top_aggr_offset +
> > +
> 	MLXCPLD_HOTPLUG_AGGR_MASK_OFF); }
> > +
> > +static void mlxcpld_hotplug_set_irq(struct mlxcpld_hotplug_priv_data
> > +*priv) {
> > +	/* Clear psu presense event. */
> > +	outb(0, priv->plat->psu_reg_offset + MLXCPLD_HOTPLUG_EVENT_OFF);
> > +	/* Set psu initial status as mask and unmask psu event. */
> > +	priv->psu_cache =3D priv->plat->psu_mask;
> > +	outb(priv->plat->psu_mask, priv->plat->psu_reg_offset +
> > +
> 	MLXCPLD_HOTPLUG_MASK_OFF);
> > +
> > +	/* Clear power cable event. */
> > +	outb(0, priv->plat->pwr_reg_offset +
> MLXCPLD_HOTPLUG_EVENT_OFF);
> > +	/* Keep power initial status as zero and unmask power event. */
> > +	outb(priv->plat->pwr_mask, priv->plat->pwr_reg_offset +
> > +
> 	MLXCPLD_HOTPLUG_MASK_OFF);
> > +
> > +	/* Clear fan presense event. */
> > +	outb(0, priv->plat->fan_reg_offset + MLXCPLD_HOTPLUG_EVENT_OFF);
> > +	/* Set fan initial status as mask and unmask fan event. */
> > +	priv->fan_cache =3D priv->plat->fan_mask;
> > +	outb(priv->plat->fan_mask, priv->plat->fan_reg_offset +
> > +
> 	MLXCPLD_HOTPLUG_MASK_OFF);
> > +
> > +	/* Keep aggregation initial status as zero and unmask events. */
> > +	outb(priv->plat->top_aggr_mask, priv->plat->top_aggr_offset +
> > +
> 	MLXCPLD_HOTPLUG_AGGR_MASK_OFF);
> > +
> > +	/* Invoke work handler for initializing hot plug devices setting. */
> > +	mlxcpld_hotplug_work_handler(&priv->dwork.work);
> > +
> > +	enable_irq(priv->irq);
> > +}
> > +
> > +static void mlxcpld_hotplug_unset_irq(struct
> > +mlxcpld_hotplug_priv_data *priv) {
> > +	int i;
> > +
> > +	disable_irq(priv->irq);
> > +	cancel_delayed_work_sync(&priv->dwork);
> > +
> > +	/* Mask aggregation event. */
> > +	outb(0, priv->plat->top_aggr_offset +
> > +MLXCPLD_HOTPLUG_AGGR_MASK_OFF);
> > +
> > +	/* Mask psu presense event. */
> > +	outb(0, priv->plat->psu_reg_offset + MLXCPLD_HOTPLUG_MASK_OFF);
> > +	/* Clear psu presense event. */
> > +	outb(0, priv->plat->psu_reg_offset + MLXCPLD_HOTPLUG_EVENT_OFF);
> > +
> > +	/* Mask power cable event. */
> > +	outb(0, priv->plat->pwr_reg_offset + MLXCPLD_HOTPLUG_MASK_OFF);
> > +	/* Clear power cable event. */
> > +	outb(0, priv->plat->pwr_reg_offset +
> MLXCPLD_HOTPLUG_EVENT_OFF);
> > +
> > +	/* Mask fan presense event. */
> > +	outb(0, priv->plat->fan_reg_offset + MLXCPLD_HOTPLUG_MASK_OFF);
> > +	/* Clear fan presense event. */
> > +	outb(0, priv->plat->fan_reg_offset + MLXCPLD_HOTPLUG_EVENT_OFF);
> > +
> > +	/* Remove all the attached devices. */
> > +	for (i =3D 0; i < priv->plat->psu_count; i++)
> > +		mlxcpld_hotplug_device_destroy(priv->plat->psu + i);
> > +
> > +	for (i =3D 0; i < priv->plat->pwr_count; i++)
> > +		mlxcpld_hotplug_device_destroy(priv->plat->pwr + i);
> > +
> > +	for (i =3D 0; i < priv->plat->fan_count; i++)
> > +		mlxcpld_hotplug_device_destroy(priv->plat->fan + i); }
> > +
> > +static irqreturn_t mlxcpld_hotplug_irq_handler(int irq, void *dev) {
> > +	struct mlxcpld_hotplug_priv_data *priv =3D
> > +				(struct mlxcpld_hotplug_priv_data *)dev;
> > +
> > +	/* Schedule work task for immediate execution.*/
> > +	schedule_delayed_work(&priv->dwork, 0);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int mlxcpld_hotplug_probe(struct platform_device *pdev) {
> > +	struct mlxcpld_hotplug_platform_data *pdata;
> > +	struct mlxcpld_hotplug_priv_data *priv;
> > +	int err;
> > +
> > +	pdata =3D dev_get_platdata(&pdev->dev);
> > +	if (!pdata) {
> > +		dev_err(&pdev->dev, "Failed to get platform data.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	priv->pdev =3D pdev;
> > +	priv->plat =3D pdata;
> > +
> > +	priv->irq =3D platform_get_irq(pdev, 0);
> > +	if (priv->irq < 0) {
> > +		dev_err(&pdev->dev, "Failed to get platform irq: %d\n",
> > +			priv->irq);
> > +		return priv->irq;
> > +	}
> > +
> > +	err =3D devm_request_irq(&pdev->dev, priv->irq,
> > +				mlxcpld_hotplug_irq_handler, 0, pdev->name,
> > +				priv);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "Failed to request irq: %d\n", err);
> > +		return err;
> > +	}
> > +	disable_irq(priv->irq);
> > +
> > +	INIT_DELAYED_WORK(&priv->dwork, mlxcpld_hotplug_work_handler);
> > +	spin_lock_init(&priv->lock);
> > +
> > +	err =3D mlxcpld_hotplug_attr_init(priv);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "Failed to allocate attributes: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	priv->hwmon =3D devm_hwmon_device_register_with_groups(&pdev-
> >dev,
> > +					"mlxcpld_hotplug", priv, priv->groups);
> > +	if (IS_ERR(priv->hwmon)) {
> > +		dev_err(&pdev->dev, "Failed to register hwmon device %ld\n",
> > +			PTR_ERR(priv->hwmon));
> > +		return PTR_ERR(priv->hwmon);
> > +	}
> > +
> > +	platform_set_drvdata(pdev, priv);
> > +
> > +	/* Perform initial interrupts setup. */
> > +	mlxcpld_hotplug_set_irq(priv);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mlxcpld_hotplug_remove(struct platform_device *pdev) {
> > +	struct mlxcpld_hotplug_priv_data *priv =3D platform_get_drvdata(pdev)=
;
> > +
> > +	/* Clean interrupts setup. */
> > +	mlxcpld_hotplug_unset_irq(priv);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct platform_driver mlxcpld_hotplug_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "mlxcpld-hotplug",
> > +	},
> > +	.probe =3D mlxcpld_hotplug_probe,
> > +	.remove =3D mlxcpld_hotplug_remove,
> > +};
> > +
> > +module_platform_driver(mlxcpld_hotplug_driver);
> > +
> > +MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
> > +MODULE_DESCRIPTION("Mellanox CPLD hotplug platform driver");
> > +MODULE_LICENSE("Dual BSD/GPL");
> > +MODULE_ALIAS("platform:mlxcpld-hotplug");
> > diff --git a/include/linux/platform_data/mlxcpld-hotplug.h
> > b/include/linux/platform_data/mlxcpld-hotplug.h
> > new file mode 100644
> > index 0000000..ebb942c
> > --- /dev/null
> > +++ b/include/linux/platform_data/mlxcpld-hotplug.h
> > @@ -0,0 +1,90 @@
> > +/*
> > + * include/linux/platform_data/mlxcpld-hotplug.h
> > + * Copyright (c) 2016 Mellanox Technologies. All rights reserved.
> > + * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
> > + *
> > + * Redistribution and use in source and binary forms, with or without
> > + * modification, are permitted provided that the following conditions =
are
> met:
> > + *
> > + * 1. Redistributions of source code must retain the above copyright
> > + *    notice, this list of conditions and the following disclaimer.
> > + * 2. Redistributions in binary form must reproduce the above copyrigh=
t
> > + *    notice, this list of conditions and the following disclaimer in =
the
> > + *    documentation and/or other materials provided with the distribut=
ion.
> > + * 3. Neither the names of the copyright holders nor the names of its
> > + *    contributors may be used to endorse or promote products derived =
from
> > + *    this software without specific prior written permission.
> > + *
> > + * Alternatively, this software may be distributed under the terms of
> > +the
> > + * GNU General Public License ("GPL") version 2 as published by the
> > +Free
> > + * Software Foundation.
> > + *
> > + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> > + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED
> > +TO, THE
> > + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> PARTICULAR
> > +PURPOSE
> > + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
> > +CONTRIBUTORS BE
> > + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
> > +OR
> > + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> PROCUREMENT
> > +OF
> > + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
> > +BUSINESS
> > + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
> > +WHETHER IN
> > + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> > +OTHERWISE)
> > + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> > +ADVISED OF THE
> > + * POSSIBILITY OF SUCH DAMAGE.
> > + */
> > +
> > +#ifndef __LINUX_PLATFORM_DATA_MLXCPLD_HOTPLUG_H
> > +#define __LINUX_PLATFORM_DATA_MLXCPLD_HOTPLUG_H
> > +
> > +/* mlxcpld_hotplug_device - I2C device data:
> > + * @adapter - ;
> > + * @client - ;
> > + * @brdinfo - ;
> > + * @bus - ;
>=20
> This comment blocks adds no information as it stands, please fill it out,=
 or
> remove it.
>=20
> > + */
> > +struct mlxcpld_hotplug_device {
> > +	struct i2c_adapter *adapter;
> > +	struct i2c_client *client;
> > +	struct i2c_board_info brdinfo;
> > +	u16 bus;
> > +};
> > +
> > +/* mlxcpld_hotplug_platform_data - device platform data:
> > + * @top_aggr_offset - offset of top aggregation interrupt register;
> > + * @top_aggr_mask - top aggregation interrupt common mask;
> > + * @top_aggr_psu_mask - top aggregation interrupt PSU mask;
> > + * @psu_reg_offset - offset of PSU interrupt register;
> > + * @psu_mask - PSU interrupt mask;
> > + * @psu_count - number of equipped replaceable PSUs;
> > + * @psu - pointer to PSU devices data array;
> > + * @top_aggr_pwr_mask - top aggregation interrupt power mask;
> > + * @pwr_reg_offset - offset of power interrupt register
> > + * @pwr_mask - power interrupt mask;
> > + * @pwr_count - number of power sources;
> > + * @pwr - pointer to power devices data array;
> > + * @top_aggr_fan_mask - top aggregation interrupt FAN mask;
> > + * @fan_reg_offset - offset of FAN interrupt register;
> > + * @fan_mask - FAN interrupt mask;
> > + * @fan_count - number of equipped replaceable FANs;
> > + * @fan - pointer to FAN devices data array;  */ struct
> > +mlxcpld_hotplug_platform_data {
> > +	u16 top_aggr_offset;
> > +	u8 top_aggr_mask;
> > +	u8 top_aggr_psu_mask;
> > +	u16 psu_reg_offset;
> > +	u8 psu_mask;
> > +	u8 psu_count;
> > +	struct mlxcpld_hotplug_device *psu;
> > +	u8 top_aggr_pwr_mask;
> > +	u16 pwr_reg_offset;
> > +	u8 pwr_mask;
> > +	u8 pwr_count;
> > +	struct mlxcpld_hotplug_device *pwr;
> > +	u8 top_aggr_fan_mask;
> > +	u16 fan_reg_offset;
> > +	u8 fan_mask;
> > +	u8 fan_count;
> > +	struct mlxcpld_hotplug_device *fan;
> > +};
> > +
> > +#endif /* __LINUX_PLATFORM_DATA_MLXCPLD_HOTPLUG_H */
> > --
> > 2.1.4
> >
> >
>=20
> --
> Darren Hart
> Intel Open Source Technology Center

Thank you very much,
Vadim.
