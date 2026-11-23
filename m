Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431769;
	b=iQebFueOtvgzLnUI/hDcYA+eU2hDKOJx/eZzY60RimywWCq/8EVW/u6lk5qxVB+PdD+a
	 6MJlKktFwfL+zBHh2A7VkQEaACXYUXLglvm8K8CrPdhGlEAqmcwegHkF5u7eObfrfG2bX
	 WXCz+svSupZd2Y4gG1o2cvbxoLWqITJPVvAzNS3nIn7Ou+iEIlCr+smjOBSrNuCAwL5Rg
	 nk3FI6CifySyinvqbjWAsLlCRBbZISZ/aROzohDPJFENJWlXRqR4vzqQmXP8aUuG8Rmrm
	 RVdZKZKMIM+hN4xcR73NUm6BvTp2Hs6Eix6zTsx+hglNuWhOsXwOI/ary+SjwevjZlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431769;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=3K3SdUj3JwWWepPg9rr3kbx+dxUkOhrE6gER+eC/FuI=;
	b=QNFP/1OzldfV7A6ASQatN5SqiL+IWVolR8FYKu53vzWGgwgD8c4uDKgQO2Ogpi2gIp/v
	 1GZ/gri2ZpAO27FkmklOLu+XMvZQvTwBmWKce7LbOZGNodPIpOGXrEmaytzcmeCJt1G1H
	 CpcY1PhFVjS+Yop6d3OPuw8EvzJvCnL20I1JKN5qL9k1uXl4mrhPQtM68WldxlgdFlbqf
	 t0gfZfGJDXYrL0Tu/iuQi2gYsj3GyAC8x5S89+Nccczvgj7edR5BJnhxvIMtCCEjP7ovd
	 ylZ9hBNGu+8T/WKF1cSVTrBzEldcL+VDoIQAKeAH8hBYOvyp+nZdIWFOBUGuOZXtLog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bXwBCzOt;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6217A606A33D;
	Mon, 23 Nov 2026 11:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6217A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bXwBCzOt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795431769; x=1826967769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PMvGXM24+YAzr+Vo5Xdliur1cF2wjMWZvGWFVWM2Zaw=;
  b=bXwBCzOtlU9sg061FZ1lzgktM8HF14kAsE3EEKBK+OHNBaxo0xc51XV0
   jV8RYI7BcOb2lkTnCW19DsYbH8BO1qiySMvyin5Cz8ghlsep4Dogip3z0
   pyOWW6Euw8oNytehktxxMDbJ1+wrHmtNiOasU108TwxhhQm3kDonsJomd
   C7HMLTXtD9XNOKwC7fJJUWS/VgJWZ75Ax0BUe4iKOTpW5jF3LseUWvdsD
   X9Sy6IIU3VXnSptkOektMR7ACRPr2VPfB+3UzeLLlcQgTQqVBScuMF4xo
   aPq8fkuC7wLFpcv4KXIA15aIcUf92Eks0YRYSZbEzCjcmRgu90zkhKpNH
   w==;
X-CSE-ConnectionGUID: HcQHFHt1Sb+6Si8GpvQVvw==
X-CSE-MsgGUID: 9NGSqb0PS3e5Ouah+EdJtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4128363"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4128363"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:02:48 -0800
X-CSE-ConnectionGUID: /zKTeBfNRYebpLxtGW4ytg==
X-CSE-MsgGUID: VfYkf8ujT+ybiRg9Psk3LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11689719"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:02:46 -0800
Date: Mon, 23 Nov 2026 13:02:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ondrej Zary <linux@zary.sk>
Cc: linux-kernel@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] Introduce Synology NAS x86 platform driver
Message-ID: <awQdVBHiNY_J-A4y@ashevche-desk.local>
References: <20261120214014.4188702-1-linux@zary.sk>
 <b3be68b5-b363-85bb-513a-733ab31cf1b7@linux.intel.com>
 <202611231025.06940.linux@zary.sk>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202611231025.06940.linux@zary.sk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 23, 2026 at 10:25:06AM +0100, Ondrej Zary wrote:
> On Friday 20 November 2026, Ilpo Järvinen wrote:
> > On Fri, 20 Nov 2026, Ondrej Zary wrote:
> > 
> > > Add platform driver for Synology x86-based NAS devices to support HDD LEDs
> > > controller by ICH9 GPIO pins.

We usually host more than that in PDx86, you need to rephrase to point that
this code only supports HDD LEDs on the platform in question.
Same for the Kconfig help text.

> > > Only DS411+II is supported for now (DS411+ should be the same except CPU).
> > > 
> > > Unfortunately, the DMI data in BIOS is not very helpful to identify the
> > > device as almost all strings are "To be filled by O.E.M.". Match also the
> > > BIOS date and then check presence of the onboard SiI3531 SATA controller
> > > and i82574L ethernet controller to avoid activation on other systems.
> > 
> > Hans, Andy,
> > 
> > Do you have an opinion on the selected approach?

Let me briefly look into this...

> Thinking more about that, maybe we should check the PCI host bridge (CPU) and
> ISA bridge (ICH9R) too. And if we also check the bus and device number of the
> onboard devices (02:00 and 03:00), the chance of false detection is almost
> zero.
> 
> Unfortunately, the subsystem IDs are not set either. Only the ethernet
> interface has subsystem device ID 0x0000 (how common is that?)

Usually Ethernet cards need a specific ROM part (where MAC address is written
and possible other configuration pieces) that usually IFWI has and the proper
ID of the Ethernet is updated with that information (yes, there are some stub
PCI IDs are used for Intel Ethernet cards). But I haven't checked if 10d3 is
a stub ID. And assuming device is recognized and working, I can simply guess
that this is a miss in the BIOS (non-critical BIOS bug when they forgot to file
that data into PCI configuration space).

> # lspci -vnn | egrep '^0|Subsystem'
> 00:00.0 Host bridge [0600]: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx DMI Bridge [8086:a000] (rev 02)
>         Subsystem: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx DMI Bridge [8086:a000]
> 00:02.0 VGA compatible controller [0300]: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx Integrated Graphics Controller [8086:a001] (rev 02) (prog-if 00 [VGA controller])
>         Subsystem: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx Integrated Graphics Controller [8086:a001]
> 00:02.1 Display controller [0380]: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx Integrated Graphics Controller [8086:a002] (rev 02)
>         Subsystem: Intel Corporation Device [8086:a001]
> 00:1a.0 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB UHCI Controller #4 [8086:2937] (rev 02) (prog-if 00 [UHCI])
>         Subsystem: Intel Corporation Optiplex 755 [8086:2937]
> 00:1a.1 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB UHCI Controller #5 [8086:2938] (rev 02) (prog-if 00 [UHCI])
>         Subsystem: Intel Corporation Optiplex 755 [8086:2938]
> 00:1a.2 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB UHCI Controller #6 [8086:2939] (rev 02) (prog-if 00 [UHCI])
>         Subsystem: Intel Corporation 82801I (ICH9 Family) USB UHCI Controller #6 [8086:2939]
> 00:1a.7 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB2 EHCI Controller #2 [8086:293c] (rev 02) (prog-if 20 [EHCI])
>         Subsystem: Intel Corporation Optiplex 755 [8086:293c]
> 00:1c.0 PCI bridge [0604]: Intel Corporation 82801I (ICH9 Family) PCI Express Port 1 [8086:2940] (rev 02) (prog-if 00 [Normal decode])
>         Subsystem: Intel Corporation Optiplex 755 [8086:2940]
>         Capabilities: [90] Subsystem: Intel Corporation Optiplex 755 [8086:2940]
> 00:1c.1 PCI bridge [0604]: Intel Corporation 82801I (ICH9 Family) PCI Express Port 2 [8086:2942] (rev 02) (prog-if 00 [Normal decode])
>         Subsystem: Intel Corporation 82801I (ICH9 Family) PCI Express Port 2 [8086:2942]
>         Capabilities: [90] Subsystem: Intel Corporation 82801I (ICH9 Family) PCI Express Port 2 [8086:2942]
> 00:1c.4 PCI bridge [0604]: Intel Corporation 82801I (ICH9 Family) PCI Express Port 5 [8086:2948] (rev 02) (prog-if 00 [Normal decode])
>         Subsystem: Intel Corporation 82801I (ICH9 Family) PCI Express Port 5 [8086:2948]
>         Capabilities: [90] Subsystem: Intel Corporation 82801I (ICH9 Family) PCI Express Port 5 [8086:2948]
> 00:1d.0 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB UHCI Controller #1 [8086:2934] (rev 02) (prog-if 00 [UHCI])
>         Subsystem: Intel Corporation 82801I (ICH9 Family) USB UHCI Controller #1 [8086:2934]
> 00:1d.1 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB UHCI Controller #2 [8086:2935] (rev 02) (prog-if 00 [UHCI])
>         Subsystem: Intel Corporation 82801I (ICH9 Family) USB UHCI Controller #2 [8086:2935]
> 00:1d.2 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB UHCI Controller #3 [8086:2936] (rev 02) (prog-if 00 [UHCI])
>         Subsystem: Intel Corporation 82801I (ICH9 Family) USB UHCI Controller #3 [8086:2936]
> 00:1d.7 USB controller [0c03]: Intel Corporation 82801I (ICH9 Family) USB2 EHCI Controller #1 [8086:293a] (rev 02) (prog-if 20 [EHCI])
>         Subsystem: Intel Corporation 82801I (ICH9 Family) USB2 EHCI Controller #1 [8086:293a]
> 00:1e.0 PCI bridge [0604]: Intel Corporation 82801 PCI Bridge [8086:244e] (rev 92) (prog-if 01 [Subtractive decode])
>         Subsystem: Intel Corporation 82801 PCI Bridge [8086:244e]
>         Capabilities: [50] Subsystem: Intel Corporation 82801 PCI Bridge [8086:244e]
> 00:1f.0 ISA bridge [0601]: Intel Corporation 82801IR (ICH9R) LPC Interface Controller [8086:2916] (rev 02)
>         Subsystem: Intel Corporation 82801IR (ICH9R) LPC Interface Controller [8086:2916]
> 00:1f.2 SATA controller [0106]: Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH) 6 port SATA Controller [AHCI mode] [8086:2922] (rev 02) (prog-if 01 [AHCI 1.0])
>         Subsystem: Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH) 6 port SATA Controller [AHCI mode] [8086:2922]
> 00:1f.3 SMBus [0c05]: Intel Corporation 82801I (ICH9 Family) SMBus Controller [8086:2930] (rev 02)
>         Subsystem: Intel Corporation 82801I (ICH9 Family) SMBus Controller [8086:2930]
> 02:00.0 Mass storage controller [0180]: Silicon Image, Inc. SiI 3531 [SATALink/SATARaid] Serial ATA Controller [1095:3531] (rev 01)
>         Subsystem: Silicon Image, Inc. SiI 3531 [SATALink/SATARaid] Serial ATA Controller [1095:3531]
> 03:00.0 Ethernet controller [0200]: Intel Corporation 82574L Gigabit Network Connection [8086:10d3]
>         Subsystem: Intel Corporation Device [8086:0000]

...

> > > + * Synology x86 NAS platform driver

Make this line same as tristate in Kconfig.

...

> > > +#include <linux/array_size.h>
> > > +#include <linux/dmi.h>
> > > +#include <linux/err.h>
> > > +#include <linux/gpio/machine.h>
> > > +#include <linux/leds.h>
> > > +#include <linux/module.h>
> > > +#include <linux/pci.h>

> > > +#include <linux/pci_ids.h>

It's assumed by pci.h.

> > > +#include <linux/platform_device.h>
> > > +#include <linux/printk.h>
> > > +#include <linux/string.h>

...

> > > +static struct gpiod_lookup_table synology_leds_table = {
> > > +	.dev_id = "leds-gpio",
> > > +	.table = {
> > > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 16, NULL, 0, GPIO_ACTIVE_HIGH),
> > > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 18, NULL, 1, GPIO_ACTIVE_HIGH),
> > > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 20, NULL, 2, GPIO_ACTIVE_HIGH),
> > > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 32, NULL, 3, GPIO_ACTIVE_HIGH),
> > > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 33, NULL, 4, GPIO_ACTIVE_HIGH),
> > > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 34, NULL, 5, GPIO_ACTIVE_HIGH),
> > > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 49, NULL, 6, GPIO_ACTIVE_HIGH),
> > > +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 55, NULL, 7, GPIO_ACTIVE_HIGH),
> > > +		{}
> > > +	}
> > > +};

Please, switch to use GPIO swnodes.

...

> > > +static const struct dmi_system_id synology_systems[] __initconst = {
> > > +	{
> > > +		.ident = "DS411+",	/* DS411+II is the same with faster CPU */
> > > +		.matches = {
> > > +			/* Synology did not put anything in DMI strings */
> > > +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To Be Filled By O.E.M."),
> > > +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "To Be Filled By O.E.M."),
> > > +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "To be filled by O.E.M."),
> > > +			DMI_EXACT_MATCH(DMI_BIOS_DATE, "05/21/2012"),
> > > +		},

This needs a better comment assuring that this is unique enough. See what Hans
did elsewhere for the similar DMI case.

> > > +	},
> > > +	{}
> > > +};

...

> > > +static int __init synology_init(void)
> > > +{
> > > +	int ret;
> > > +
> > > +	static const struct pci_device_id pci_sii3531[] = {
> > > +		{ PCI_DEVICE_SUB(PCI_VENDOR_ID_CMD, 0x3531, PCI_VENDOR_ID_CMD, 0x3531) },
> > > +		{ }
> > > +	};
> > > +
> > > +	static const struct pci_device_id pci_i82574l[] = {
> > > +		{ PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x10d3, PCI_VENDOR_ID_INTEL, 0x0000) },
> > > +		{ }
> > > +	};
> > > +
> > > +	const struct dmi_system_id *dmi = dmi_first_match(synology_systems);

> > > +

Unneeded blank line.

> > > +	if (!dmi)
> > > +		return -ENODEV;
> > > +
> > > +	/* DS411+ DMI match is too generic, confirm by onboard PCI devices */
> > > +	if (!strcmp(dmi->ident, "DS411+")) {
> > > +		if (!pci_dev_present(pci_sii3531) ||
> > > +		    !pci_dev_present(pci_i82574l))
> > > +			return -ENODEV;
> > > +	}
> > > +
> > > +	pr_info("Detected Synology NAS %s\n", dmi->ident);
> > > +
> > > +	gpiod_add_lookup_table(&synology_leds_table);
> > > +
> > > +	synology_leds_pdev = platform_device_register_data(NULL,
> > > +		"leds-gpio", PLATFORM_DEVID_NONE, &synology_leds_pdata,
> > > +		sizeof(synology_leds_pdata));

	ret = PTR_ERR_OR_ZERO(...);

> > > +	if (IS_ERR(synology_leds_pdev)) {
> > > +		pr_err("error registering platform device: %pe\n", synology_leds_pdev);
> > 
> > Won't these be prefixless and you should add the usual pr_fmt line?
> > 
> > > +		ret = PTR_ERR(synology_leds_pdev);
> > > +		goto err;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +err:
> > > +	gpiod_remove_lookup_table(&synology_leds_table);
> > > +	return ret;
> > > +}

-- 
With Best Regards,
Andy Shevchenko


