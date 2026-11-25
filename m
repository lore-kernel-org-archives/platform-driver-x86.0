Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602358;
	b=giD49JSa0TBA5/Himc4WKpkrMg6V1uydxNNMZQ2ZvvG6kwWywB+Ye4neSqdyPmGP7zm9
	 6XLMbVYixULRPshY3za2iC0pgb3pOsuaFyKVadOaH83RH8SOJ0g7Wicer03K8hVpijg5e
	 Y90qMNWDu4UF1sB14smKuNqKYQgLmClmq2ZmKZ08beEwXTgBOAA17eAjQPd8dBsoAoIl3
	 1e7r9k+4VptHDwt8QEcH3290RplCQzSVw0v6oyFVutemoFI2OOq8lhVh8KawSGIM5VoNG
	 Cj6zsYGLr9+i/Y7IBC+VaUP2hQfm8w9HkC4Sk3fR8+qnqP4na11KGGWPHz9HzkfSx0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602358;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=WlFuaKVpPyAADCExJjdRpgmPVxGG6kUYPBCEuMN6bHc=;
	b=gq1CV+h+zFRiP6VmgImwaFKt3x1M+kRKn8yixJO/8tD9iu3HzYJ6sJNha8tr/SMh6esJ
	 YZK1L3Orw4NA1zzAshW5IHAQckCBxmYuWRnHOrSNJbXuHYYK49QuezFP3QV+5HxGbyrrm
	 BHgfZCUY+HOznJWpS3YSoDaPJsz8jFDLevXlQ1iB9DSFAQDTq7achwIUC0u3wlX/gPskc
	 AOdDpVjZo5dk458pQIc6cZBdDu0MJheas4bU8xUQFxdHdIBTfpafznIpbcAgRdQCPPU/9
	 Z48lUrxvvSYtSwFJHSJH7A04vF9NIJeJSgxVg9rQEtlUj2+FIwhIURj3UFZCjv9yxpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NG1da7Bi;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29AC606A32E;
	Wed, 25 Nov 2026 10:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E29AC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NG1da7Bi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795602358; x=1827138358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sVp/H2/rn84qdeatc1HWgs4KVcA8s6m1LW+Qjyr77Kk=;
  b=NG1da7BimEbP9/pqX5z+R+EufbHp5l3ro3/LqatrSwuKwwM/IkT6P6zf
   ARjXin/hY1l0AL1VxK5lbzmAIJz9rcB72Wq+KH1Evaq3xp5ukV4sydDvf
   E3IPgT0Cdp4Vq9hl1pcMu1vYZsTLJGZ6fN5AHu6/0z4yHTtk5UAy5xoWm
   QP9eMg1XgYWK7zuwPzBGYOvK7SLP5F3jDbbBqkT1RUALsPr/Bp6CmSm1T
   3jtPHONFQRDtIKGN+rfXdgY9GsjalbxNMow5ic1inDTuNs+k/LK2DyqCL
   V9POoTxMxKFJT8fVcut7uTbupQgLL9vP9bMZx0yA5W9xsU23cGjMXPXmP
   w==;
X-CSE-ConnectionGUID: ei4DSRHPRxqAj6Bo0iVjCQ==
X-CSE-MsgGUID: p72FrJxGTSKJJ79LJ/5fHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4556782"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4556782"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 02:25:58 -0800
X-CSE-ConnectionGUID: NzgfV7mBQSCrSuheLfjUqw==
X-CSE-MsgGUID: loxHPbCvR4OJvR3bJYv1rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12045169"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.73])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 02:25:56 -0800
Date: Wed, 25 Nov 2026 12:25:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ondrej Zary <linux@zary.sk>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Introduce Synology x86 NAS LEDs driver
Message-ID: <awa3sVUTSMWKAQCd@ashevche-desk.local>
References: <20261124125616.1168560-1-linux@zary.sk>
 <202611241954.47791.linux@zary.sk>
 <awXv4b3cjVlOc0NT@ashevche-desk.local>
 <202611242312.38998.linux@zary.sk>
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
In-Reply-To: <202611242312.38998.linux@zary.sk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 24, 2026 at 11:12:38PM +0100, Ondrej Zary wrote:
> On Tuesday 24 November 2026 21:13:21 Andy Shevchenko wrote:
> > On Tue, Nov 24, 2026 at 07:54:47PM +0100, Ondrej Zary wrote:
> > > On Tuesday 24 November 2026 18:03:00 Andy Shevchenko wrote:
> > > > On Tue, Nov 24, 2026 at 01:45:46PM +0100, Ondrej Zary wrote:

...

> > > > > +struct synology_pci_dev {
> > > > > +	unsigned int bus;
> > > > > +	unsigned int devfn;
> > > > > +	struct pci_device_id id;
> > > > > +};
> > > > > +
> > > > > +/* onboard PCI devices found in DS411+ to confirm the machine type (after DMI match) */
> > > > > +static const struct synology_pci_dev ds411plus_pci_devices[] __initconst = {
> > > > > +	/* 00:00.0 Host bridge: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx DMI Bridge */
> > > > > +	{ 0, PCI_DEVFN(0, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0xa000,
> > > > > +					       PCI_VENDOR_ID_INTEL, 0xa000) } },
> > > > > +	/* 00:1f.0 ISA bridge: Intel Corporation 82801IR (ICH9R) LPC Interface Controller */
> > > > > +	{ 0, PCI_DEVFN(0x1f, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x2916,
> > > > > +						  PCI_VENDOR_ID_INTEL, 0x2916) } },
> > > > 
> > > > > +	/* 02:00.0 Mass storage controller: Silicon Image, Inc. SiI 3531 Serial ATA Controller */
> > > > > +	{ 2, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_CMD, 0x3531,
> > > > > +						  PCI_VENDOR_ID_CMD, 0x3531) } },
> > > > > +	/* 03:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network Connection */
> > > > > +	{ 3, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x10d3,
> > > > > +						  PCI_VENDOR_ID_INTEL, 0x0000) } },
> > > > > +	{}
> > > > 
> > > > > +};
> > > > 
> > > > > +/* check if all PCI devices in the list are present at specified locations */
> > > > > +static bool __init synology_pci_devices_present(const struct synology_pci_dev *list)
> > > > > +{
> > > > > +	const struct synology_pci_dev *d;
> > > > > +
> > > > > +	for (d = list; d->id.vendor; d++) {
> > > > > +		struct pci_dev *pdev = pci_get_domain_bus_and_slot(0, d->bus, d->devfn);
> > > > > +
> > > > > +		if (!pdev)
> > > > > +			return false;
> > > > 
> > > > > +		bool matched = d->id.vendor == pdev->vendor &&
> > > > > +			       d->id.device == pdev->device &&
> > > > > +			       d->id.subvendor == pdev->subsystem_vendor &&
> > > > > +			       d->id.subdevice == pdev->subsystem_device;
> > > > 
> > > > Don't mix variable definitions with the code (it's exceptionally possible
> > > > for a couple of cases, none of which is this one). Can't it use
> > > > pci_match_id() approach with driver_data? (If we ever need this check.)
> > > 
> > > I don't see how can pci_match_id() be used here. I can merge pci bus and
> > > devfun into driver_data to fit into pci_device_id table but there's no
> > > pci_dev which could be matched against that table (and walking all PCI
> > > devices does not seem to be an improvement).
> > 
> > _After_ DMI match the walk over all PCI devices is not a big deal. The code
> > will be nicer. But maybe there is a better choice? Like checking CPUID? Or
> > maybe something interesting is present in the ACPI tables?
> 
> pci_find_next_bus() and pci_walk_bus() with a callback or
> list_for_each_entry()?
> Then pci_match_id() and finally test if the matched device has proper bus and
> devfn numbers. Doesn't look like a recipe for nice code.

Check how pmc_atom_init() is implemented.

> I'll check ACPI tables tomorrow but I doubt there's anything done properly
> in the BIOS (even int13 support is buggy and requires GRUB patch).

Yeah...

-- 
With Best Regards,
Andy Shevchenko


