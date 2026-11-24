Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543289;
	b=gQc51/Jk3JJMa0GShQzUX9FuBw/wBgaCdy5HcUUAD46k5r8JjzCk4lFC9HZ0OhAlDH0L
	 VMOKjVvHUmyo6JeAQSiGqhGS6JB24eILYzCGlG+xUlVeDbF+D49ruHcuX5OToYs0UR1bm
	 CHVbIqzrUzbCSHSYk/f+K2VYW9jZdmTyn+LlctiUnJWe7aoEdhPqD7aVJd2T2kdXreZKu
	 6QWx48ZpHvbTgAhnpJqBfakImMBSqaYCW7JqIqrmMHVmO0K2ZPXJNcuR7mahTDdJuuWAH
	 3qGoMF6BlhZ0UGGX68HEzRx5H2dMVuEra+AGoaFzvtA7KNQ1P29vewLrO9/eNdRpnmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543289;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=cXgPOFXiKx+ZpHqEDiDlyzVT/pIW6o47fkit5HtZgIU=;
	b=GJRZiSZb58mHen31/91Rzb19OGtOoIQ5khiF89DaJSq9gBtASyuhRwp/yBaw0yJUHL1r
	 gWz4WavagDVHqbhDjPJ0ukBxpxlAKF1fobThFFTsz8Z4viy59hersuHPunVVQS/cGM3iL
	 hb1Xy4v9QdnYTPe5BJX04g8IognMZlEJfQBWyq0dGQ37eJnv6lAPDrCHzqT94gxoBJ+xV
	 /8e/wVrg/0yM1A9+jZd7lojZ1f+fWOYrh7LoMAFYHL2A+wS+1G8ND8ffsJmvASUYbz3Yj
	 QSX40GXht9UQ2Fa23AkSktbYFx0gQhRoqRRLxA3bFXrMWNL7uNYLLmAB7QzRDG1J/vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J9AyLsM6;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DCE606A321;
	Tue, 24 Nov 2026 18:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DCE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J9AyLsM6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795543289; x=1827079289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ttoqj9NNfxE0tdFYrGZnAp+BjYX3nf5XKKyleXrRzww=;
  b=J9AyLsM6a4esTUloo+cq6qgA3+EluWBMyRuFvw/4Fxwg5fHznJDLPSXG
   8WYvzLClTf83IkPVW3k5dBSXxqB+7yUZje0MzDhTY9FW7SOoS3M604RHs
   apqc9L20+CMvd5CRvASsg8xEyBusJ15FozfZwjSAff01dsIdHyTI0tH9L
   VqKH//CIkPdAtm6YCkktbiq2e9gxtxrQHqsaahIRbSWDel3X/rgibGBDm
   Oo318WcZZiAO5SPKcuJN6rZMtkfZ+xWdYQOkiekOjRlFhVqVdUwTGZB7p
   s5L3KPPAbPWf4iN3N+m549a79Nwa8SNYfmLpSVaIifmccIIKtSzMe1a1N
   g==;
X-CSE-ConnectionGUID: +s1mtMtSQC63THQOHXJ0Rw==
X-CSE-MsgGUID: sgIYcRAcSHSL7mIK5+x+uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4432874"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4432874"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:03:15 -0800
X-CSE-ConnectionGUID: F8Mx1U9oTEmxZEiLSzt94g==
X-CSE-MsgGUID: RE+eTp9VQMCvWMeAiprIvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="13403255"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:03:12 -0800
Date: Tue, 24 Nov 2026 19:03:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ondrej Zary <linux@zary.sk>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Introduce Synology x86 NAS LEDs driver
Message-ID: <awXDRNPad3iWtwdp@ashevche-desk.local>
References: <20261124125616.1168560-1-linux@zary.sk>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124125616.1168560-1-linux@zary.sk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 24, 2026 at 01:45:46PM +0100, Ondrej Zary wrote:
> Add platform driver for Synology x86-based NAS devices to support HDD LEDs
> controlled by ICH9 GPIO pins.
> 
> Only DS411+II is supported for now (DS411+ should be the same except CPU).
> 
> Unfortunately, the DMI data in BIOS is not very helpful to identify the
> device as almost all strings are "To be filled by O.E.M.". Match also the
> BIOS date and then check presence of PCI devices (host bridge, LPC bridge,
> onboard SiI3531 SATA controller and i82574L ethernet controller) to avoid
> activation on other systems.
> 
> Buttons and other LEDs are not supported by this driver because they're
> controlled by a PIC MCU (connected through serial port).

...

> +struct synology_pci_dev {
> +	unsigned int bus;
> +	unsigned int devfn;
> +	struct pci_device_id id;
> +};
> +
> +/* onboard PCI devices found in DS411+ to confirm the machine type (after DMI match) */
> +static const struct synology_pci_dev ds411plus_pci_devices[] __initconst = {
> +	/* 00:00.0 Host bridge: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx DMI Bridge */
> +	{ 0, PCI_DEVFN(0, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0xa000,
> +					       PCI_VENDOR_ID_INTEL, 0xa000) } },
> +	/* 00:1f.0 ISA bridge: Intel Corporation 82801IR (ICH9R) LPC Interface Controller */
> +	{ 0, PCI_DEVFN(0x1f, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x2916,
> +						  PCI_VENDOR_ID_INTEL, 0x2916) } },

> +	/* 02:00.0 Mass storage controller: Silicon Image, Inc. SiI 3531 Serial ATA Controller */
> +	{ 2, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_CMD, 0x3531,
> +						  PCI_VENDOR_ID_CMD, 0x3531) } },
> +	/* 03:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network Connection */
> +	{ 3, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x10d3,
> +						  PCI_VENDOR_ID_INTEL, 0x0000) } },
> +	{}

> +};

> +/* check if all PCI devices in the list are present at specified locations */
> +static bool __init synology_pci_devices_present(const struct synology_pci_dev *list)
> +{
> +	const struct synology_pci_dev *d;
> +
> +	for (d = list; d->id.vendor; d++) {
> +		struct pci_dev *pdev = pci_get_domain_bus_and_slot(0, d->bus, d->devfn);
> +
> +		if (!pdev)
> +			return false;

> +		bool matched = d->id.vendor == pdev->vendor &&
> +			       d->id.device == pdev->device &&
> +			       d->id.subvendor == pdev->subsystem_vendor &&
> +			       d->id.subdevice == pdev->subsystem_device;

Don't mix variable definitions with the code (it's exceptionally possible
for a couple of cases, none of which is this one). Can't it use
pci_match_id() approach with driver_data? (If we ever need this check.)

> +		pci_dev_put(pdev);
> +		if (!matched)
> +			return false;
> +	}
> +
> +	return true;
> +}

Yeah, this becomes an ugly part of the patch...

...

> +static int __init synology_init(void)
> +{
> +	struct platform_device_info leds_info = {
> +		.name = "leds-gpio",
> +		.id = PLATFORM_DEVID_NONE,
> +	};
> +	int err;

> +

No blank line in the definition block.

> +	const struct dmi_system_id *dmi = dmi_first_match(synology_systems);

Split assignment and keep the variables in reversed xmas tree order.

> +	if (!dmi)
> +		return -ENODEV;
> +
> +	/* DS411+ DMI match is too generic, confirm by onboard PCI devices */
> +	if (!strcmp(dmi->ident, "DS411+") && !synology_pci_devices_present(ds411plus_pci_devices))
> +		return -ENODEV;
> +
> +	pr_info("Detected Synology NAS %s\n", dmi->ident);
> +
> +	err = software_node_register_node_group(synology_swnodes);
> +	if (err) {
> +		pr_err("failed to register software nodes: %d\n", err);
> +		return err;
> +	}
> +
> +	leds_info.fwnode = software_node_fwnode(&synology_gpio_leds_node);
> +	synology_leds_pdev = platform_device_register_full(&leds_info);
> +	err = PTR_ERR_OR_ZERO(synology_leds_pdev);
> +	if (err) {
> +		pr_err("error registering platform device: %pe\n", synology_leds_pdev);
> +		goto err_unregister;
> +	}
> +
> +	return 0;
> +
> +err_unregister:
> +	software_node_unregister_node_group(synology_swnodes);
> +	return err;
> +}

-- 
With Best Regards,
Andy Shevchenko


