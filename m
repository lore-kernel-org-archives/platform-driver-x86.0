Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602726;
	b=23/jFlZoDeZZ37GRb+zRYWIVWV1WYtw/H0WkIZnqF9fojBSLc4fPApI6BPwBG6V1L/jR
	 WQxHRXIfgWXiOuwAqivCz+DTsnPeFRT3ffrcihS4TDRLtK8JxIvCJcHCoMuXd5iXFOn+N
	 o0cj1D0oDLRSsqjNqy7toZOq6mn0Uh4Q6Itpt5K+6txrg4ePdvnRM6GqMET++d78JWw2F
	 vRLJwcfrCQeo4X45rBvGYm2h2qdqOYc5zkKh4hJrphNVcPqEebHm4TOrWbL06taBMhrB/
	 Ng4mZ6/MjlYRIqT4j19gXTUUqL/7xJF83CoHabOMhX5L7Wakvez7ZkIMNflmCvIGjFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602726;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=1b3G6GxbiZBbU/8AlyiVp74+qJPE/yScLNVQh+n2gvE=;
	b=nqSU2o0jXiJvHoDTQNcV2PvcK6sNgbJQDygkUy7/mXMQLA7ZYipSvvoaxK4NCbFypSXw
	 tAqNdBIjDNdqlB2BSRbR3+zmuVoVDM9aQdMwk4GZ0XqlrOrEMb9UzBXfS95qwDK4Ydb1g
	 EyVFOMa0fddH5hNJkJQHDNSPqTefb5p2NlVRX8IkOoJe3FLrLSR/F6h1bJEdmzjOT/5s6
	 XNuKtDNdjMnO6Mch7jSrEvKDDhv9TAaEyPS4qOZ+im6Dq68zZTnK/B6/fh8QlcyB+ot0M
	 RvF2Ny42O7ususIPr1B+oZJM0YgEQkUdT6EiIwR9UofKDGQVin/FSA65oXo/d/MQcnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fse3XTiF;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C45606A331;
	Wed, 25 Nov 2026 10:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05C45606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fse3XTiF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795602725; x=1827138725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EoNcVBVL5/XOcwz7JDHzf2htc/6N/yGvuDF99xINDTg=;
  b=Fse3XTiFUmNXYt8pq/eIt+Ab6JhDziBipqKQv/9m1+dtUuNzpC4YnGXG
   kTzHZ42Iq0j7610yysxPdMLtAuyHp3S1nV+8VHdQ8lpTk4a5Z8GniN0s3
   b1dHc/e/WW1WrZPihCn5Zws6cktk5dB9cQiYYmof8ZSqNPSOdeFzbUvBP
   g/VKTHd7lnRF58bbenrCQKOujrpGPvWr/AXx676zX53bAIu2wCaWG00iY
   mJfBdnCTyh7fE1GYorH2LsGZwLQ1RDq6AtUKnnCzURqauuw5xVXCGRuws
   nrXN0mWj3OVIdoINXw0iy/LetQpahfMS5DPjB/0yIqQNpCAHNzUUvzfBj
   Q==;
X-CSE-ConnectionGUID: hCjWB3uVSgu9IfUA75lAUg==
X-CSE-MsgGUID: sU3II4YVQ4Cctwm4OfJ2bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4361437"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4361437"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 02:28:52 -0800
X-CSE-ConnectionGUID: veLQEaJWSYSx6BSeQffMzQ==
X-CSE-MsgGUID: 44uh7AAhR5ifkPZKQY/sUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12048813"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.73])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 02:28:50 -0800
Date: Wed, 25 Nov 2026 12:28:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ondrej Zary <linux@zary.sk>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] Introduce Synology x86 NAS LEDs driver
Message-ID: <awa4YJkwVaoqaF0L@ashevche-desk.local>
References: <20261124125616.1168560-1-linux@zary.sk>
 <202611241954.47791.linux@zary.sk>
 <awXv4b3cjVlOc0NT@ashevche-desk.local>
 <202611250911.51673.linux@zary.sk>
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
In-Reply-To: <202611250911.51673.linux@zary.sk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 25, 2026 at 09:11:51AM +0100, Ondrej Zary wrote:
> On Tuesday 24 November 2026, Andy Shevchenko wrote:
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
> > 
> 
> I don't know much about ACPI but can't find any Synology traces.
> 
> # acpidump -s
> Firmware Warning (ACPI): Incorrect checksum in table [GSCI] - 0x83, should be 0x34 (20250404/utcksum-100)
> ACPI: GSCI 0x0000000000000000 002024 (v01 052112 GMCHSCI  20120521 MSFT 00000097)
> ACPI: MCFG 0x0000000000000000 00003C (v01 052112 OEMMCFG  20120521 MSFT 00000097)
> ACPI: APIC 0x0000000000000000 00006C (v01 052112 APIC1409 20120521 MSFT 00000097)
> Firmware Warning (ACPI): Incorrect checksum in table [OEMB] - 0x6F, should be 0x03 (20250404/utcksum-100)
> ACPI: OEMB 0x0000000000000000 000082 (v01 052112 OEMB1409 20120521 MSFT 00000097)
> ACPI: DSDT 0x0000000000000000 006B21 (v01 1AAAA  1AAAA005 00000005 INTL 20051117)
> ACPI: FACP 0x0000000000000000 000084 (v01 052112 FACP1409 20120521 MSFT 00000097)
> ACPI: HPET 0x0000000000000000 000038 (v01 052112 OEMHPET  20120521 MSFT 00000097)
> ACPI: FACS 0x0000000000000000 000040
> 
> 
> ACPI devices look very generic:
> AWY0001:00
> INT0800:00
> INTC0102:00
> ITE8704:00
> LNXCPU:00
> LNXCPU:01
> LNXCPU:02
> LNXCPU:03
> LNXPWRBN:00
> LNXSYBUS:00
> LNXSYBUS:01
> LNXSYSTM:00
> PNP0000:00
> PNP0100:00
> PNP0103:00
> PNP0200:00
> PNP0303:00
> PNP0401:00
> PNP0501:00
> PNP0501:01
> PNP0700:00
> PNP0800:00
> PNP0A08:00
> PNP0B00:00
> PNP0C01:00
> PNP0C01:01
> PNP0C02:00
> PNP0C02:01
> PNP0C02:02
> PNP0C02:03
> PNP0C02:04
> PNP0C04:00
> PNP0C0C:00
> PNP0C0E:00
> PNP0C0F:00
> PNP0C0F:01
> PNP0C0F:02
> PNP0C0F:03
> PNP0C0F:04
> PNP0C0F:05
> PNP0C0F:06
> PNP0C0F:07
> PNP0C31:00
> PNP0F03:00

Can you add the platform to https://linux-hardware.org/?view=howto ?

-- 
With Best Regards,
Andy Shevchenko


