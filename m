Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.182.83.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425921;
	b=q4AStoWSpRaqZcL/s6Yj23fbxPJKZ9a6saAdw2h5gho2Z9gyRVESH9uh7a/gNYHC6J3H
	 7zgdBExn9pUeyDI7JbBAMyLY6MeWjAXjwjvRgYmxLzEYmLfC85iwnw5JVz1Yols530pJA
	 +La2Q+JGdFz3H2XBU/EZIlQUXK+gFXuYAdYsQwhXzXI5byz7kehYuaZKicHij0SesQbHK
	 chsOvlJLXSbhdeMVKP/jxgOxHOptUp1OQQvIACd/3FcqSnm9kvYYVzca14RfaCIjrcuHH
	 nR4A5XhS0mCKmVED98uQnvKaV/EH/VqaeKsONWy5dYfRdlFvYJr2+wH2EEHS16WS+TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425921;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:User-Agent:
	 Cc:References:In-Reply-To:X-KMail-QuotePrefix:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Message-Id;
	bh=vGPPGT/tX2AQy6Jyz9WDzuYfB8v7xK6bBgFfHOdozUc=;
	b=weP3ac6PSxvLyYP+NM3kjmTXdpo5d3JX5APYL8X54qwjBnpWDNpssfQ4CoBhFAHyGjBC
	 /souEA38LNjGe0AIdqufDmO+HcRAzWpnVUVp9FvwXozbgZiiuxVlYzO2t1+X9uF14yz7+
	 eJv2hzT3tAXS1OeDyucGqW+mKkt0K7//LrB30+eszkegpuV8kMA2UoyA9z0URUWM8miSf
	 xv6DJvvbxldQemEDg9goCuEN+TochQq0u5KgTUeb3eh+Cv3ltAndYWoEzuNY24wVYHf42
	 WoFZmzKKlO3Xj6dijcDC384iBH+onPee4Ij3CKrmXo/9Bs82XWSQ9+51UXp0NGV7MlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zary.sk;
	spf=pass smtp.mailfrom=zary.sk;
	dkim=pass header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=Ur1tKESt;
	arc=none smtp.remote-ip=194.182.83.82
Received: from mail.zary.sk (mail.zary.sk [194.182.83.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CAF606A31F;
	Mon, 23 Nov 2026 09:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34CAF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zary.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zary.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=Ur1tKESt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zary.sk; s=key1;
	t=1795425912; bh=YiSznkQw0wX2fzkKlapyWLpuis8sVmnnUYU3Q5bGma4=;
	h=From:To:Subject:Date:Cc:References:In-Reply-To:From;
	b=Ur1tKEStuuHZTDhiaQSetim0lGX4VRPkpk82qWDS+cG20CKsJttj9VU3bxm7nK6jE
	 eSBCJKFk26ZcYu4HZHogOgRKoHP2mh5PEGrH2svHwOBMa43qc5cN8JdAy186G5Avid
	 FHXZHy9B8aVq9SZGhRvDaz1HE/LuNj9Z0XYZELf/D0PNKGuuC0qjoxIC1Ld0RTtyk2
	 z4GFM2XDq7VJjd9+xwVt0u6U2GcGKVsiVMH6Qk4jszzi6bwJBL7JqLZpF5GAx0zY43
	 AKinxXvshU6d4P0xSwYK6KEF+8MLuPcuHs0XSig/E81AOa7Sqz7IO51uEdZKSItgme
	 MelWJvol46Wjg==
Received: from [192.168.1.3] (mail.gsystem.sk [37.58.14.130])
	by mail.zary.sk (Postfix) with ESMTPSA id 198C0BED69;
	Mon, 23 Nov 2026 10:25:12 +0100 (CET)
From: Ondrej Zary <linux@zary.sk>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Introduce Synology NAS x86 platform driver
Date: Mon, 23 Nov 2026 10:25:06 +0100
User-Agent: KMail/1.9.10
Cc: Ilpo =?iso-8859-1?q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20261120214014.4188702-1-linux@zary.sk> <b3be68b5-b363-85bb-513a-733ab31cf1b7@linux.intel.com>
In-Reply-To: <b3be68b5-b363-85bb-513a-733ab31cf1b7@linux.intel.com>
X-KMail-QuotePrefix: > 
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <202611231025.06940.linux@zary.sk>

On Friday 20 November 2026, Ilpo J=E4rvinen wrote:
> On Fri, 20 Nov 2026, Ondrej Zary wrote:
>=20
> > Add platform driver for Synology x86-based NAS devices to support HDD L=
EDs
> > controller by ICH9 GPIO pins.
> >=20
> > Only DS411+II is supported for now (DS411+ should be the same except CP=
U).
> >=20
> > Unfortunately, the DMI data in BIOS is not very helpful to identify the
> > device as almost all strings are "To be filled by O.E.M.". Match also t=
he
> > BIOS date and then check presence of the onboard SiI3531 SATA controller
> > and i82574L ethernet controller to avoid activation on other systems.
>=20
> Hans, Andy,
>=20
> Do you have an opinion on the selected approach?

Thinking more about that, maybe we should check the PCI host bridge (CPU) a=
nd
ISA bridge (ICH9R) too. And if we also check the bus and device number of t=
he
onboard devices (02:00 and 03:00), the chance of false detection is almost
zero.

Unfortunately, the subsystem IDs are not set either. Only the ethernet
interface has subsystem device ID 0x0000 (how common is that?)

# lspci -vnn | egrep '^0|Subsystem'
00:00.0 Host bridge [0600]: Intel Corporation Atom Processor D4xx/D5xx/N4xx=
/N5xx DMI Bridge [8086:a000] (rev 02)
        Subsystem: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx DMI=
 Bridge [8086:a000]
00:02.0 VGA compatible controller [0300]: Intel Corporation Atom Processor =
D4xx/D5xx/N4xx/N5xx Integrated Graphics Controller [8086:a001] (rev 02) (pr=
og-if 00 [VGA controller])
        Subsystem: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx Int=
egrated Graphics Controller [8086:a001]
00:02.1 Display controller [0380]: Intel Corporation Atom Processor D4xx/D5=
xx/N4xx/N5xx Integrated Graphics Controller [8086:a002] (rev 02)
        Subsystem: Intel Corporation Device [8086:a001]
00:1a.0 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB U=
HCI Controller #4 [8086:2937] (rev 02) (prog-if 00 [UHCI])
        Subsystem: Intel Corporation Optiplex 755 [8086:2937]
00:1a.1 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB U=
HCI Controller #5 [8086:2938] (rev 02) (prog-if 00 [UHCI])
        Subsystem: Intel Corporation Optiplex 755 [8086:2938]
00:1a.2 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB U=
HCI Controller #6 [8086:2939] (rev 02) (prog-if 00 [UHCI])
        Subsystem: Intel Corporation 82801I (ICH9 Family) USB UHCI Controll=
er #6 [8086:2939]
00:1a.7 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB2 =
EHCI Controller #2 [8086:293c] (rev 02) (prog-if 20 [EHCI])
        Subsystem: Intel Corporation Optiplex 755 [8086:293c]
00:1c.0 PCI bridge [0604]: Intel Corporation 82801I (ICH9 Family) PCI Expre=
ss Port 1 [8086:2940] (rev 02) (prog-if 00 [Normal decode])
        Subsystem: Intel Corporation Optiplex 755 [8086:2940]
        Capabilities: [90] Subsystem: Intel Corporation Optiplex 755 [8086:=
2940]
00:1c.1 PCI bridge [0604]: Intel Corporation 82801I (ICH9 Family) PCI Expre=
ss Port 2 [8086:2942] (rev 02) (prog-if 00 [Normal decode])
        Subsystem: Intel Corporation 82801I (ICH9 Family) PCI Express Port =
2 [8086:2942]
        Capabilities: [90] Subsystem: Intel Corporation 82801I (ICH9 Family=
) PCI Express Port 2 [8086:2942]
00:1c.4 PCI bridge [0604]: Intel Corporation 82801I (ICH9 Family) PCI Expre=
ss Port 5 [8086:2948] (rev 02) (prog-if 00 [Normal decode])
        Subsystem: Intel Corporation 82801I (ICH9 Family) PCI Express Port =
5 [8086:2948]
        Capabilities: [90] Subsystem: Intel Corporation 82801I (ICH9 Family=
) PCI Express Port 5 [8086:2948]
00:1d.0 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB U=
HCI Controller #1 [8086:2934] (rev 02) (prog-if 00 [UHCI])
        Subsystem: Intel Corporation 82801I (ICH9 Family) USB UHCI Controll=
er #1 [8086:2934]
00:1d.1 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB U=
HCI Controller #2 [8086:2935] (rev 02) (prog-if 00 [UHCI])
        Subsystem: Intel Corporation 82801I (ICH9 Family) USB UHCI Controll=
er #2 [8086:2935]
00:1d.2 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB U=
HCI Controller #3 [8086:2936] (rev 02) (prog-if 00 [UHCI])
        Subsystem: Intel Corporation 82801I (ICH9 Family) USB UHCI Controll=
er #3 [8086:2936]
00:1d.7 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB2 =
EHCI Controller #1 [8086:293a] (rev 02) (prog-if 20 [EHCI])
        Subsystem: Intel Corporation 82801I (ICH9 Family) USB2 EHCI Control=
ler #1 [8086:293a]
00:1e.0 PCI bridge [0604]: Intel Corporation 82801 PCI Bridge [8086:244e] (=
rev 92) (prog-if 01 [Subtractive decode])
        Subsystem: Intel Corporation 82801 PCI Bridge [8086:244e]
        Capabilities: [50] Subsystem: Intel Corporation 82801 PCI Bridge [8=
086:244e]
00:1f.0 ISA bridge [0601]: Intel Corporation 82801IR (ICH9R) LPC Interface =
Controller [8086:2916] (rev 02)
        Subsystem: Intel Corporation 82801IR (ICH9R) LPC Interface Controll=
er [8086:2916]
00:1f.2 SATA controller [0106]: Intel Corporation 82801IR/IO/IH (ICH9R/DO/D=
H) 6 port SATA Controller [AHCI mode] [8086:2922] (rev 02) (prog-if 01 [AHC=
I 1.0])
        Subsystem: Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH) 6 port SAT=
A Controller [AHCI mode] [8086:2922]
00:1f.3 SMBus [0c05]: Intel Corporation 82801I (ICH9 Family) SMBus Controll=
er [8086:2930] (rev 02)
        Subsystem: Intel Corporation 82801I (ICH9 Family) SMBus Controller =
[8086:2930]
02:00.0 Mass storage controller [0180]: Silicon Image, Inc. SiI 3531 [SATAL=
ink/SATARaid] Serial ATA Controller [1095:3531] (rev 01)
        Subsystem: Silicon Image, Inc. SiI 3531 [SATALink/SATARaid] Serial =
ATA Controller [1095:3531]
03:00.0 Ethernet controller [0200]: Intel Corporation 82574L Gigabit Networ=
k Connection [8086:10d3]
        Subsystem: Intel Corporation Device [8086:0000]

> > Buttons and other LEDs are not supported by this driver because they're
> > controlled by a PIC MCU (connected through serial port).
> >=20
> > Signed-off-by: Ondrej Zary <linux@zary.sk>
> > ---
> > Changes in v2:
> >  - fixed includes (order, added missing, removed kernel.h)
> >  - added missing DMI and PCI dependencies to Kconfig
> >  - added PCI device presence check details to changelog
> >  - used %pe for error message
> >=20
> > ---
> >  drivers/platform/x86/Kconfig        |  16 ++++
> >  drivers/platform/x86/Makefile       |   3 +
> >  drivers/platform/x86/synology-x86.c | 128 ++++++++++++++++++++++++++++
> >  3 files changed, 147 insertions(+)
> >  create mode 100644 drivers/platform/x86/synology-x86.c
> >=20
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index 9ce384e0475e..14b366cca2dd 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -1059,6 +1059,22 @@ config OXP_EC
> > =20
> >  source "drivers/platform/x86/tuxedo/Kconfig"
> > =20
> > +config SYNOLOGY_X86
> > +	tristate "Synology x86 NAS Platform Driver"
> > +	depends on DMI
> > +	depends on GPIOLIB
> > +	depends on LPC_ICH
> > +	depends on GPIO_ICH
> > +	depends on LEDS_CLASS
> > +	depends on PCI
> > +	select LEDS_GPIO
> > +	help
> > +	  This driver provides support for the HDD LEDs on Synology x86 NAS
> > +	  devices.
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called synology-x86.
> > +
> >  endif # X86_PLATFORM_DEVICES
> > =20
> >  config P2SB
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
> > index 229057234d00..a1806eb0efc9 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -166,3 +166,6 @@ obj-$(CONFIG_SEL3350_PLATFORM)		+=3D sel3350-platfo=
rm.o
> > =20
> >  # OneXPlayer
> >  obj-$(CONFIG_OXP_EC)			+=3D oxpec.o
> > +
> > +# Synology
> > +obj-$(CONFIG_SYNOLOGY_X86)		+=3D synology-x86.o
> > diff --git a/drivers/platform/x86/synology-x86.c b/drivers/platform/x86=
/synology-x86.c
> > new file mode 100644
> > index 000000000000..80831c8c45d8
> > --- /dev/null
> > +++ b/drivers/platform/x86/synology-x86.c
> > @@ -0,0 +1,128 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Synology x86 NAS platform driver
> > + *
> > + * Inspired by platform/x86/meraki-mx100.c
> > + *
> > + * Copyright (C) 2026 Ondrej Zary <linux@zary.sk>
> > + */
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/dmi.h>
> > +#include <linux/err.h>
> > +#include <linux/gpio/machine.h>
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/pci.h>
> > +#include <linux/pci_ids.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/printk.h>
> > +#include <linux/string.h>
> > +
> > +static const struct gpio_led synology_leds[] =3D {
> > +	{ .name =3D "synology:green:hdd1"	},
> > +	{ .name =3D "synology:amber:hdd1" },
> > +	{ .name =3D "synology:green:hdd2" },
> > +	{ .name =3D "synology:amber:hdd2"	},
> > +	{ .name =3D "synology:green:hdd3" },
> > +	{ .name =3D "synology:amber:hdd3"	},
> > +	{ .name =3D "synology:green:hdd4" },
> > +	{ .name =3D "synology:amber:hdd4" },
> > +};
> > +
> > +static const struct gpio_led_platform_data synology_leds_pdata =3D {
> > +	.num_leds	=3D ARRAY_SIZE(synology_leds),
> > +	.leds		=3D synology_leds,
> > +};
> > +
> > +#define GPIO_ICH_DRIVER_NAME "gpio_ich"
> > +
> > +static struct gpiod_lookup_table synology_leds_table =3D {
> > +	.dev_id =3D "leds-gpio",
> > +	.table =3D {
> > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 16, NULL, 0, GPIO_ACTIVE_HIGH),
> > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 18, NULL, 1, GPIO_ACTIVE_HIGH),
> > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 20, NULL, 2, GPIO_ACTIVE_HIGH),
> > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 32, NULL, 3, GPIO_ACTIVE_HIGH),
> > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 33, NULL, 4, GPIO_ACTIVE_HIGH),
> > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 34, NULL, 5, GPIO_ACTIVE_HIGH),
> > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 49, NULL, 6, GPIO_ACTIVE_HIGH),
> > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 55, NULL, 7, GPIO_ACTIVE_HIGH),
> > +		{}
> > +	}
> > +};
> > +
> > +static const struct dmi_system_id synology_systems[] __initconst =3D {
> > +	{
> > +		.ident =3D "DS411+",	/* DS411+II is the same with faster CPU */
> > +		.matches =3D {
> > +			/* Synology did not put anything in DMI strings */
> > +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To Be Filled By O.E.M."),
> > +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "To Be Filled By O.E.M."),
> > +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "To be filled by O.E.M."),
> > +			DMI_EXACT_MATCH(DMI_BIOS_DATE, "05/21/2012"),
> > +		},
> > +	},
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(dmi, synology_systems);
> > +
> > +static struct platform_device *synology_leds_pdev;
> > +
> > +static int __init synology_init(void)
> > +{
> > +	int ret;
> > +
> > +	static const struct pci_device_id pci_sii3531[] =3D {
> > +		{ PCI_DEVICE_SUB(PCI_VENDOR_ID_CMD, 0x3531, PCI_VENDOR_ID_CMD, 0x353=
1) },
> > +		{ }
> > +	};
> > +
> > +	static const struct pci_device_id pci_i82574l[] =3D {
> > +		{ PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x10d3, PCI_VENDOR_ID_INTEL, 0=
x0000) },
> > +		{ }
> > +	};
> > +
> > +	const struct dmi_system_id *dmi =3D dmi_first_match(synology_systems);
> > +
> > +	if (!dmi)
> > +		return -ENODEV;
> > +
> > +	/* DS411+ DMI match is too generic, confirm by onboard PCI devices */
> > +	if (!strcmp(dmi->ident, "DS411+")) {
> > +		if (!pci_dev_present(pci_sii3531) ||
> > +		    !pci_dev_present(pci_i82574l))
> > +			return -ENODEV;
> > +	}
> > +
> > +	pr_info("Detected Synology NAS %s\n", dmi->ident);
> > +
> > +	gpiod_add_lookup_table(&synology_leds_table);
> > +
> > +	synology_leds_pdev =3D platform_device_register_data(NULL,
> > +		"leds-gpio", PLATFORM_DEVID_NONE, &synology_leds_pdata,
> > +		sizeof(synology_leds_pdata));
> > +	if (IS_ERR(synology_leds_pdev)) {
> > +		pr_err("error registering platform device: %pe\n", synology_leds_pde=
v);
>=20
> Won't these be prefixless and you should add the usual pr_fmt line?
>=20
> > +		ret =3D PTR_ERR(synology_leds_pdev);
> > +		goto err;
> > +	}
> > +
> > +	return 0;
> > +
> > +err:
> > +	gpiod_remove_lookup_table(&synology_leds_table);
> > +	return ret;
> > +}
> > +module_init(synology_init);
> > +
> > +static void __exit synology_exit(void)
> > +{
> > +	platform_device_unregister(synology_leds_pdev);
> > +	gpiod_remove_lookup_table(&synology_leds_table);
> > +}
> > +module_exit(synology_exit);
> > +
> > +MODULE_AUTHOR("Ondrej Zary <linux@zary.sk>");
> > +MODULE_DESCRIPTION("Synology x86 NAS Platform Driver");
> > +MODULE_LICENSE("GPL");
> >=20
>=20



=2D-=20
Ondrej Zary
