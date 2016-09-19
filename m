From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v2] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Mon, 19 Sep 2016 06:12:17 +0000
Message-ID: <AM5PR0501MB20977F1CF757901EFED529D5A2F40@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1473933306-124919-1-git-send-email-vadimp@mellanox.com>
 <4497bb80-42e3-ca02-5f41-9c66186ace99@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-db5eur01on0071.outbound.protection.outlook.com ([104.47.2.71]:41506
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752356AbcISJqU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2016 05:46:20 -0400
In-Reply-To: <4497bb80-42e3-ca02-5f41-9c66186ace99@roeck-us.net>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, "tglx@linutronix.de" <tglx@linutronix.de>
Cc: "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "davem@davemloft.net" <davem@davemloft.net>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>



> -----Original Message-----
> From: Guenter Roeck [mailto:linux@roeck-us.net]
> Sent: Monday, September 19, 2016 9:03 AM
> To: Vadim Pasternak <vadimp@mellanox.com>; tglx@linutronix.de
> Cc: mingo@redhat.com; hpa@zytor.com; davem@davemloft.net; geert@linux-
> m68k.org; akpm@linux-foundation.org; gregkh@linuxfoundation.org;
> kvalo@codeaurora.org; mchehab@kernel.org; x86@kernel.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us
> Subject: Re: [patch v2] x86/platform/mellanox: introduce support for Mell=
anox
> systems platform
>=20
> On 09/15/2016 02:55 AM, vadimp@mellanox.com wrote:
> > From: Vadim Pasternak <vadimp@mellanox.com>
> >
> > Enable system support for the Mellanox Technologies platform, which
> > provides support for the next Mellanox basic systems: "msx6710",
> > "msx6720", "msb7700", "msn2700", "msx1410", "msn2410", "msb7800",
> > "msn2740", "msn2100" and also various number of derivative systems
> > from the above basic types.
> >
> > The Kconfig currently controlling compilation of this code is:
> > arch/x86/platform:config MLX_PLATFORM
> > arch/x86/platform:      tristate "Mellanox Technologies platform suppor=
t"
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> > v1->v2:
> >  Comments pointed out by Greg:
> >   - kick out all PCI related code;
> > ---
> >  MAINTAINERS                               |   7 +
> >  arch/x86/Kconfig                          |  25 +++
> >  arch/x86/platform/Makefile                |   1 +
> >  arch/x86/platform/mellanox/Makefile       |   1 +
> >  arch/x86/platform/mellanox/mlx-platform.c | 275
> > ++++++++++++++++++++++++++++++
> >  5 files changed, 309 insertions(+)
> >  create mode 100644 arch/x86/platform/mellanox/Makefile
> >  create mode 100644 arch/x86/platform/mellanox/mlx-platform.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index 4705c94..8a675de 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7664,6 +7664,13 @@ W:	http://www.mellanox.com
> >  Q:	http://patchwork.ozlabs.org/project/netdev/list/
> >  F:	drivers/net/ethernet/mellanox/mlxsw/
> >
> > +MELLANOX PLATFORM DRIVER
> > +M:      Vadim Pasternak <vadimp@mellanox.com>
> > +L:      platform-driver-x86@vger.kernel.org
> > +S:      Supported
> > +W:      http://www.mellanox.com
> > +F:      arch/x86/platform/mellanox/mlx-platform.c
> > +
> >  SOFT-ROCE DRIVER (rxe)
> >  M:	Moni Shoua <monis@mellanox.com>
> >  L:	linux-rdma@vger.kernel.org
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig index
> > c580d8c..1346441 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -550,6 +550,31 @@ config X86_INTEL_QUARK
> >  	  Say Y here if you have a Quark based system such as the Arduino
> >  	  compatible Intel Galileo.
> >
> > +config MLX_PLATFORM
> > +	tristate "Mellanox Technologies platform support"
> > +	depends on X86_64
> > +	depends on X86_EXTENDED_PLATFORM
> > +	depends on PCI
>=20
> No longer needed.
>=20
> > +	depends on DMI
> > +	depends on I2C_MLXCPLD
> > +	depends on I2C_MUX_REG
> > +	select HWMON
> > +	select PMBUS
> > +	select SENSORS_PMBUS
> > +	select LM75
> > +	select NEW_LEDS
> > +	select LEDS_CLASS
> > +	select LEDS_TRIGGERS
> > +	select LEDS_TRIGGER_TIMER
> > +	select LEDS_MLXCPLD
>=20
> Kind of unusual to select drivers not directly related to this one like t=
his.

These selection is required by all systems.
Do you suggest to remove all that is not related directly?

>=20
> > +	---help---
> > +	  This option enables system support for the Mellanox Technologies
> > +	  platform.
> > +
> > +	  Say Y here if you are building a kernel for Mellanox system.
> > +
> > +	  Otherwise, say N.
> > +
> >  config X86_INTEL_LPSS
> >  	bool "Intel Low Power Subsystem Support"
> >  	depends on X86 && ACPI
> > diff --git a/arch/x86/platform/Makefile b/arch/x86/platform/Makefile
> > index 184842e..3c3c19e 100644
> > --- a/arch/x86/platform/Makefile
> > +++ b/arch/x86/platform/Makefile
> > @@ -8,6 +8,7 @@ obj-y	+=3D iris/
> >  obj-y	+=3D intel/
> >  obj-y	+=3D intel-mid/
> >  obj-y	+=3D intel-quark/
> > +obj-y	+=3D mellanox/
> >  obj-y	+=3D olpc/
> >  obj-y	+=3D scx200/
> >  obj-y	+=3D sfi/
> > diff --git a/arch/x86/platform/mellanox/Makefile
> > b/arch/x86/platform/mellanox/Makefile
> > new file mode 100644
> > index 0000000..f43c931
> > --- /dev/null
> > +++ b/arch/x86/platform/mellanox/Makefile
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_MLX_PLATFORM)	+=3D mlx-platform.o
> > diff --git a/arch/x86/platform/mellanox/mlx-platform.c
> > b/arch/x86/platform/mellanox/mlx-platform.c
> > new file mode 100644
> > index 0000000..d29da68
> > --- /dev/null
> > +++ b/arch/x86/platform/mellanox/mlx-platform.c
> > @@ -0,0 +1,275 @@
> > +/*
> > + * arch/x86/platform/mellanox/mlx-platform.c
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
> > +#include <linux/device.h>
> > +#include <linux/dmi.h>
> > +#include <linux/i2c.h>
> > +#include <linux/i2c-mux.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/platform_data/i2c-mux-reg.h>
> > +
> > +#define MLX_PLAT_DEVICE_NAME		"mlxplat"
> > +
> > +/* LPC bus IO offsets */
> > +#define MLXPLAT_CPLD_LPC_I2C_BASE_ADRR		0x2000
> > +#define MLXPLAT_CPLD_LPC_REG_BASE_ADRR		0x2500
> > +#define MLXPLAT_CPLD_LPC_IO_RANGE		0x100
> > +#define MLXPLAT_CPLD_LPC_I2C_CH1_OFF		0xdb
> > +#define MLXPLAT_CPLD_LPC_I2C_CH2_OFF		0xda
> > +#define MLXPLAT_CPLD_LPC_PIO_OFFSET		0x10000UL
> > +#define MLXPLAT_CPLD_LPC_REG1
> 	((MLXPLAT_CPLD_LPC_REG_BASE_ADRR + \
> > +				  MLXPLAT_CPLD_LPC_I2C_CH1_OFF) | \
> > +				  MLXPLAT_CPLD_LPC_PIO_OFFSET)
> > +#define MLXPLAT_CPLD_LPC_REG2
> 	((MLXPLAT_CPLD_LPC_REG_BASE_ADRR + \
> > +				  MLXPLAT_CPLD_LPC_I2C_CH2_OFF) | \
> > +				  MLXPLAT_CPLD_LPC_PIO_OFFSET)
> > +
> > +/* Start channel numbers */
> > +#define MLXPLAT_CPLD_CH1			2
> > +#define MLXPLAT_CPLD_CH2			10
> > +
> > +/* Number of LPC attached MUX platform devices */
> > +#define MLXPLAT_CPLD_LPC_MUX_DEVS		2
> > +
> > +/* mlxplat_priv - platform private data
> > + * @pdev_i2c - i2c controller platform device
> > + * @pdev_mux - array of mux platform devices  */ struct mlxplat_priv
> > +{
> > +	struct platform_device *pdev_i2c;
> > +	struct platform_device *pdev_mux[MLXPLAT_CPLD_LPC_MUX_DEVS];
> > +};
> > +
> > +/* Regions for LPC I2C controller and LPC base register space */
> > +static struct resource mlxplat_lpc_resources[] =3D {
> > +	[0] =3D DEFINE_RES_NAMED(MLXPLAT_CPLD_LPC_I2C_BASE_ADRR,
> > +			       MLXPLAT_CPLD_LPC_IO_RANGE,
> > +			       "mlxplat_cpld_lpc_i2c_ctrl", IORESOURCE_IO),
> > +	[1] =3D DEFINE_RES_NAMED(MLXPLAT_CPLD_LPC_REG_BASE_ADRR,
> > +			       MLXPLAT_CPLD_LPC_IO_RANGE,
> > +			       "mlxplat_cpld_lpc_regs",
> > +			       IORESOURCE_IO),
> > +};
> > +
> > +/* Platform default channels */
> > +static int mlxplat_default_channels[][8] =3D {
> > +	{
> > +		MLXPLAT_CPLD_CH1, MLXPLAT_CPLD_CH1 + 1,
> MLXPLAT_CPLD_CH1 + 2,
> > +		MLXPLAT_CPLD_CH1 + 3, MLXPLAT_CPLD_CH1 + 4,
> MLXPLAT_CPLD_CH1 +
> > +		5, MLXPLAT_CPLD_CH1 + 6, MLXPLAT_CPLD_CH1 + 7
> > +	},
> > +	{
> > +		MLXPLAT_CPLD_CH2, MLXPLAT_CPLD_CH2 + 1,
> MLXPLAT_CPLD_CH2 + 2,
> > +		MLXPLAT_CPLD_CH2 + 3, MLXPLAT_CPLD_CH2 + 4,
> MLXPLAT_CPLD_CH2 +
>=20
> Odd line split.
>=20
> > +		+ 5, MLXPLAT_CPLD_CH2 + 6, MLXPLAT_CPLD_CH2 + 7
> > +	},
> > +};
> > +
> > +/* Platform channels for MSN21xx system family */ static int
> > +mlxplat_msn21xx_channels[][8] =3D {
> > +	{
> > +		1, 2, 3, 4, 5, 6, 7, 8
> > +	},
> > +	{
> > +		1, 2, 3, 4, 5, 6, 7, 8
> > +	},
>=20
> Seems to be a waste. A single dimensional array should be sufficient.
>=20
OK

> > +};
> > +
> > +/* Platform mux data */
> > +struct i2c_mux_reg_platform_data mlxplat_mux_data[] =3D {
>=20
> Why global ?
>=20
> > +	{
> > +		.parent =3D 1,
> > +		.base_nr =3D MLXPLAT_CPLD_CH1,
> > +		.write_only =3D 1,
> > +		.reg =3D (void __iomem *)MLXPLAT_CPLD_LPC_REG1,
> > +		.reg_size =3D 1,
> > +		.idle_in_use =3D 1,
> > +	},
> > +	{
> > +		.parent =3D 1,
> > +		.base_nr =3D MLXPLAT_CPLD_CH2,
> > +		.write_only =3D 1,
> > +		.reg =3D (void __iomem *)MLXPLAT_CPLD_LPC_REG2,
> > +		.reg_size =3D 1,
> > +		.idle_in_use =3D 1,
> > +	},
> > +
> > +};
> > +
> > +struct platform_device *mlxplat_dev;
> > +
>=20
> Is this global on purpose ? If so, why ?

No, it should be both static.

>=20
> > +static int __init mlxplat_dmi_default_matched(const struct
> > +dmi_system_id *dmi) {
> > +	int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mlxplat_mux_data); i++) {
> > +		mlxplat_mux_data[i].values =3D mlxplat_default_channels[i];
> > +		mlxplat_mux_data[i].n_values =3D
> > +				ARRAY_SIZE(mlxplat_default_channels[i]);
> > +	}
> > +
> > +	return 1;
> > +};
> > +
> > +static int __init mlxplat_dmi_msn21xx_matched(const struct
> > +dmi_system_id *dmi) {
> > +	int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mlxplat_mux_data); i++) {
> > +		mlxplat_mux_data[i].values =3D mlxplat_msn21xx_channels[i],
> > +		mlxplat_mux_data[i].n_values =3D
> > +				ARRAY_SIZE(mlxplat_msn21xx_channels[i]);
> > +	}
> > +
> > +	return 1;
> > +};
> > +
> > +static struct dmi_system_id mlxplat_dmi_table[] __initdata =3D {
> > +	{
> > +		.callback =3D mlxplat_dmi_default_matched,
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox
> Technologies"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "MSN24"),
> > +		},
> > +	},
> > +	{
> > +		.callback =3D mlxplat_dmi_default_matched,
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox
> Technologies"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "MSN27"),
> > +		},
> > +	},
> > +	{
> > +		.callback =3D mlxplat_dmi_default_matched,
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox
> Technologies"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "MSB"),
> > +		},
> > +	},
> > +	{
> > +		.callback =3D mlxplat_dmi_default_matched,
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox
> Technologies"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "MSX"),
> > +		},
> > +	},
> > +	{
> > +		.callback =3D mlxplat_dmi_msn21xx_matched,
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox
> Technologies"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "MSN21"),
> > +		},
> > +	},
> > +	{ }
> > +};
> > +
> > +static int __init mlxplat_init(void)
> > +{
> > +	struct mlxplat_priv *priv;
> > +	int i;
> > +	int err;
> > +
> > +	if (!dmi_check_system(mlxplat_dmi_table))
> > +		return -ENODEV;
> > +
> > +	mlxplat_dev =3D
> platform_device_register_simple(MLX_PLAT_DEVICE_NAME, -1,
> > +					mlxplat_lpc_resources,
> > +					ARRAY_SIZE(mlxplat_lpc_resources));
> > +
> > +	if (!mlxplat_dev) {
> > +		pr_err("Alloc %s platform device failed\n",
> > +			MLX_PLAT_DEVICE_NAME);
>=20
> Error messages for memory allocations are unnecessary.
>=20
> > +		return -ENOMEM;
> > +	}
> > +
> > +	priv =3D devm_kzalloc(&mlxplat_dev->dev, sizeof(struct mlxplat_priv),
> > +			    GFP_KERNEL);
> > +	if (!priv) {
> > +		err =3D -ENOMEM;
> > +		dev_err(&mlxplat_dev->dev, "Failed to allocate
> mlxplat_priv\n");
>=20
> Same here.
>=20
> > +		goto fail_alloc;
> > +	}
> > +	platform_set_drvdata(mlxplat_dev, priv);
> > +
> > +	priv->pdev_i2c =3D platform_device_register_simple("i2c_mlxcpld", -1,
> > +							 NULL, 0);
> > +	if (IS_ERR(priv->pdev_i2c)) {
> > +		err =3D PTR_ERR(priv->pdev_i2c);
> > +		goto fail_alloc;
> > +	};
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mlxplat_mux_data); i++) {
> > +		priv->pdev_mux[i] =3D platform_device_register_resndata(
> > +						&mlxplat_dev->dev,
> > +						"i2c-mux-reg", i, NULL,
> > +						0, &mlxplat_mux_data[i],
> > +						sizeof(mlxplat_mux_data[i]));
> > +		if (IS_ERR(priv->pdev_mux[i])) {
> > +			err =3D PTR_ERR(priv->pdev_mux[i]);
> > +			goto fail_platform_mux_register;
> > +		}
> > +	}
> > +
> > +	return err;
>=20
> return 0;
>=20
> > +
> > +fail_platform_mux_register:
> > +	for (i--; i > 0 ; i--)
>=20
>  >=3D 0 ?
>=20
> > +		platform_device_unregister(priv->pdev_mux[i]);
> > +	platform_device_unregister(priv->pdev_i2c);
> > +fail_alloc:
> > +	platform_device_unregister(mlxplat_dev);
> > +
> > +	return err;
> > +}
> > +
> > +static void __exit mlxplat_exit(void) {
> > +	struct mlxplat_priv *priv =3D platform_get_drvdata(mlxplat_dev);
> > +	int i;
> > +
> > +	for (i =3D ARRAY_SIZE(mlxplat_mux_data) - 1; i >=3D 0 ; i--)
> > +		platform_device_unregister(priv->pdev_mux[i]);
> > +
> > +	platform_device_unregister(priv->pdev_i2c);
> > +	platform_device_unregister(mlxplat_dev);
> > +}
> > +
> > +module_init(mlxplat_init);
> > +module_exit(mlxplat_exit);
> > +
> > +MODULE_AUTHOR("Vadim Pasternak (vadimp@mellanox.com)");
> > +MODULE_DESCRIPTION("Mellanox platform driver");
> MODULE_LICENSE("GPL
> > +v2"); MODULE_ALIAS("platform:mlx-platform");
> >
> Should this possibly be a dmi module alias ?

Do you mean just to change it to
MODULE_ALIAS("dmi:mlx-platform"); ?

Thank you very much for review.
Best regards,
Vadim.
