Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551206;
	b=L2681khvSZ4Qc9NGsxd5nL3M64wME257P3v6vG69uidwA7oaqYXQytl8dbr49V/c/S9N
	 VFQqL8ZVnJvSgCMz6yEW3i9+ZNsBca/5hihXy0TbCdd3/sknkarMOC7jUy8nZ8wb+gISW
	 4lB+T4RVyw4GXeNfCpQ7snMijeaLBo5M9pxw+WXqOyTV8pXPnwv09Y+jloOL+HJH8swtv
	 PV6LozLi+9P/2e8vzfKBcKg2qbciYTTSqyIaf/C/zooYQ/jq5lEK4XWSBLES9uBBhhSil
	 7LweZMxr33/EeURjOU05kAUlAxKGD7CiNqB88TbEqQTSBVOXset6G0+94Qx+Oj/eR4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551206;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=gQf8frNguLobZXWUrQ/hXoMW/a/GtbObUQWRboDaXds=;
	b=40uroZEU//7ihwBQLZ7aPZfJWxwjlQsOKKQ9NecWFroVH5sbX8e5f4mbePZSNJR+G15g
	 l08oh+60MoKHcnXWcvpJ+U8QJZtGSNaRVOg184hgSQjv0NoS8Et0Opwa8isxK7h6RJXnO
	 d8Z02RJYzfU9fbYmp7bBqNjBJ2QxQxbrP598V9LteHCnYWxvG2kyTIKbguSziYsrsq6h8
	 Jl4t+L8Re/h77K7XWpR9mVN5KmQWjTuB9j9UXhTboCqOcaVdUCFGUJzlXjzvOKJiXTk+C
	 UmqGPR4GqdlgTpE/ZfM2ADwNs0ITKvU3/P0oUoUUyQn0OoNluCh/HbpiT5oadxZPHyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hTxXe1Fo;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E76606A323;
	Tue, 24 Nov 2026 20:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02E76606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hTxXe1Fo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795551206; x=1827087206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kh+JTYsJsidFbyYhu4Wjfbi7GT4ar0AQn5xuM00xc5w=;
  b=hTxXe1FowpN+s6imHt32HIwt4GF3vzkDytY2vZMCpPXfE99j9+zJDGMm
   Bc3tWuKKtBTDT7/AmebVd033t8A8c02swqFNlvkJc4WF4TmCHoYNkT/E5
   +UAmamclKg1WbGOhmUAW699pYJr1bZz8lNqeM6UWfO7df6cxXPfNbBL9d
   m9XP4wbXO5YywB/JEx/10kqlgyYtlRRIcO57AirUzZTXyLThHmK/ut2c8
   JufYk6ujFZzARwzOmYg2JJ4+pNgSHCpygxXfkpzhYAflhOFn45B3NYD+K
   7ugho5oqS+NzWKW5TYV8FqY4dXdmjT0MJNoJ/jUlzS+v3Bi3OJWUSDb+s
   g==;
X-CSE-ConnectionGUID: 9GEVUhElTKGyuRzaWD4X6Q==
X-CSE-MsgGUID: M0tU3MQqR+K+edz4XyqqNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4466501"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4466501"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 12:13:25 -0800
X-CSE-ConnectionGUID: 7xhsbpQhRRCrmXDpICRhGA==
X-CSE-MsgGUID: QfHW+koQS9ifJVHCo91vpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11645451"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 12:13:23 -0800
Date: Tue, 24 Nov 2026 22:13:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ondrej Zary <linux@zary.sk>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Introduce Synology x86 NAS LEDs driver
Message-ID: <awXv4b3cjVlOc0NT@ashevche-desk.local>
References: <20261124125616.1168560-1-linux@zary.sk>
 <awXDRNPad3iWtwdp@ashevche-desk.local>
 <202611241954.47791.linux@zary.sk>
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
In-Reply-To: <202611241954.47791.linux@zary.sk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 24, 2026 at 07:54:47PM +0100, Ondrej Zary wrote:
> On Tuesday 24 November 2026 18:03:00 Andy Shevchenko wrote:
> > On Tue, Nov 24, 2026 at 01:45:46PM +0100, Ondrej Zary wrote:

...

> > > +struct synology_pci_dev {
> > > +	unsigned int bus;
> > > +	unsigned int devfn;
> > > +	struct pci_device_id id;
> > > +};
> > > +
> > > +/* onboard PCI devices found in DS411+ to confirm the machine type (after DMI match) */
> > > +static const struct synology_pci_dev ds411plus_pci_devices[] __initconst = {
> > > +	/* 00:00.0 Host bridge: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx DMI Bridge */
> > > +	{ 0, PCI_DEVFN(0, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0xa000,
> > > +					       PCI_VENDOR_ID_INTEL, 0xa000) } },
> > > +	/* 00:1f.0 ISA bridge: Intel Corporation 82801IR (ICH9R) LPC Interface Controller */
> > > +	{ 0, PCI_DEVFN(0x1f, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x2916,
> > > +						  PCI_VENDOR_ID_INTEL, 0x2916) } },
> > 
> > > +	/* 02:00.0 Mass storage controller: Silicon Image, Inc. SiI 3531 Serial ATA Controller */
> > > +	{ 2, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_CMD, 0x3531,
> > > +						  PCI_VENDOR_ID_CMD, 0x3531) } },
> > > +	/* 03:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network Connection */
> > > +	{ 3, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x10d3,
> > > +						  PCI_VENDOR_ID_INTEL, 0x0000) } },
> > > +	{}
> > 
> > > +};
> > 
> > > +/* check if all PCI devices in the list are present at specified locations */
> > > +static bool __init synology_pci_devices_present(const struct synology_pci_dev *list)
> > > +{
> > > +	const struct synology_pci_dev *d;
> > > +
> > > +	for (d = list; d->id.vendor; d++) {
> > > +		struct pci_dev *pdev = pci_get_domain_bus_and_slot(0, d->bus, d->devfn);
> > > +
> > > +		if (!pdev)
> > > +			return false;
> > 
> > > +		bool matched = d->id.vendor == pdev->vendor &&
> > > +			       d->id.device == pdev->device &&
> > > +			       d->id.subvendor == pdev->subsystem_vendor &&
> > > +			       d->id.subdevice == pdev->subsystem_device;
> > 
> > Don't mix variable definitions with the code (it's exceptionally possible
> > for a couple of cases, none of which is this one). Can't it use
> > pci_match_id() approach with driver_data? (If we ever need this check.)
> 
> I don't see how can pci_match_id() be used here. I can merge pci bus and
> devfun into driver_data to fit into pci_device_id table but there's no
> pci_dev which could be matched against that table (and walking all PCI
> devices does not seem to be an improvement).

_After_ DMI match the walk over all PCI devices is not a big deal. The code
will be nicer. But maybe there is a better choice? Like checking CPUID? Or
maybe something interesting is present in the ACPI tables?

-- 
With Best Regards,
Andy Shevchenko


