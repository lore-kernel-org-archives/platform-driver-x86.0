Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.182.83.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546495;
	b=wKLnjc9g8anTyPBbCRvD3UQ/Bj/7RCbXR//D8lVOxnTXpddij9ya2fuflhE5DkcWdyrm
	 K/xv0CUJLd7eIyUEYSXTT/hQ8E+gEsuZmzyAx9z7xkExalskdKtoO/14T+wOMm7DHx2Np
	 djUwjpc/X2IjyZSAbVMW6HP2oXriKdv20h2NcXC2A2/FUzM1s308E5bOLppOPxWk3HnGg
	 YuojCMcHgIjYUV6y/04jYFauEI0P9FOO/HN2rpHEFKnO6tNdVnrfG+uokLl7vImcwAqQn
	 Ze++znYpeMNGkHJaz6zkgfsY8lpfLeQ1jY6a4+H7fhzHWgJcCOTyzVtqKNQ4Sgmxe+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546495;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:User-Agent:
	 Cc:References:In-Reply-To:X-KMail-QuotePrefix:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Message-Id;
	bh=xWx07hQAQEf3GH573CNjQAbUU2ZkD7rXxcgYXnJXHeU=;
	b=fvK0OECkjGKP+LU3ZC/I5srFpDBYhzuBPv9Vz21iFZjR9O3KKYALXuWYtVyAfkexGuy6
	 tssmWGqXFFDkS6ZWdL0B0u1Noj19ZWnufAzznh0m2vuLuAfaBWwDQA1man9Vu4NS5CSY+
	 QxhyLNEAc/4i24NDbMFQ6eN588WclG5y4k8klhNr8SHafLHvN0tQ35CSKoK1jewn6BPhf
	 T78dHS1lnwS1lUJnShKmDS8keSXY0h35XMAW1Dd4NcquOo6DpZaDo1EtSXk3/lzwhnyJ3
	 tE/ADUvoKoyOKtGXMVdgUafDLhE5qHCIaBrzutAPII85rGNmWVb3mznA1CyATghJnAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zary.sk;
	spf=pass smtp.mailfrom=zary.sk;
	dkim=pass header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b="KW8/1dKI";
	arc=none smtp.remote-ip=194.182.83.82
Received: from mail.zary.sk (mail.zary.sk [194.182.83.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77751606A31E;
	Tue, 24 Nov 2026 18:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77751606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zary.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zary.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=KW8/1dKI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zary.sk; s=key1;
	t=1795546492; bh=cYqA6cEcJMdxRSJY9c06GS8iKc9wLCGMPd6HmnWHN74=;
	h=From:To:Subject:Date:Cc:References:In-Reply-To:From;
	b=KW8/1dKISn5LQH+t8L01KTkGlQAbsNn9yrttgOOezqERH1tvgYEQh9gD+zagJtG5w
	 0oCX2V4cCt5Qk92sEdDHWx488ZdqbJKmy1XFPXuRuYl5tQJhpOMhsHmuC0V4Ke+exW
	 iLng/OqFfVUw6ZWxbXpW99oiKTaiRgwMasixylJjbxELW4pmiwQKqLnT4D6VZOY2/C
	 5cAlRF7LggwC9G9hcaYc+l+aED/nl9rSy9mHU8jK5RpQgJAYwEDpuCZmTy/lN/SvXx
	 5gf0xk15YKbKbnxitQ//RUc1f5UdhAmituOH/fZblFMYeyToGQos28hJaXwvW7Sr+Q
	 f4HO5jKyDNtJA==
Received: from [192.168.0.2] (188-167-58-127.dynamic.chello.sk [188.167.58.127])
	by mail.zary.sk (Postfix) with ESMTPSA id 514A8BED91;
	Tue, 24 Nov 2026 19:54:52 +0100 (CET)
From: Ondrej Zary <linux@zary.sk>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3] Introduce Synology x86 NAS LEDs driver
Date: Tue, 24 Nov 2026 19:54:47 +0100
User-Agent: KMail/1.9.10
Cc: Hans de Goede <hansg@kernel.org>,
 Ilpo =?iso-8859-1?q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261124125616.1168560-1-linux@zary.sk> <awXDRNPad3iWtwdp@ashevche-desk.local>
In-Reply-To: <awXDRNPad3iWtwdp@ashevche-desk.local>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202611241954.47791.linux@zary.sk>

On Tuesday 24 November 2026 18:03:00 Andy Shevchenko wrote:
> On Tue, Nov 24, 2026 at 01:45:46PM +0100, Ondrej Zary wrote:
> > Add platform driver for Synology x86-based NAS devices to support HDD LEDs
> > controlled by ICH9 GPIO pins.
> > 
> > Only DS411+II is supported for now (DS411+ should be the same except CPU).
> > 
> > Unfortunately, the DMI data in BIOS is not very helpful to identify the
> > device as almost all strings are "To be filled by O.E.M.". Match also the
> > BIOS date and then check presence of PCI devices (host bridge, LPC bridge,
> > onboard SiI3531 SATA controller and i82574L ethernet controller) to avoid
> > activation on other systems.
> > 
> > Buttons and other LEDs are not supported by this driver because they're
> > controlled by a PIC MCU (connected through serial port).
> 
> ...
> 
> > +struct synology_pci_dev {
> > +	unsigned int bus;
> > +	unsigned int devfn;
> > +	struct pci_device_id id;
> > +};
> > +
> > +/* onboard PCI devices found in DS411+ to confirm the machine type (after DMI match) */
> > +static const struct synology_pci_dev ds411plus_pci_devices[] __initconst = {
> > +	/* 00:00.0 Host bridge: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx DMI Bridge */
> > +	{ 0, PCI_DEVFN(0, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0xa000,
> > +					       PCI_VENDOR_ID_INTEL, 0xa000) } },
> > +	/* 00:1f.0 ISA bridge: Intel Corporation 82801IR (ICH9R) LPC Interface Controller */
> > +	{ 0, PCI_DEVFN(0x1f, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x2916,
> > +						  PCI_VENDOR_ID_INTEL, 0x2916) } },
> 
> > +	/* 02:00.0 Mass storage controller: Silicon Image, Inc. SiI 3531 Serial ATA Controller */
> > +	{ 2, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_CMD, 0x3531,
> > +						  PCI_VENDOR_ID_CMD, 0x3531) } },
> > +	/* 03:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network Connection */
> > +	{ 3, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x10d3,
> > +						  PCI_VENDOR_ID_INTEL, 0x0000) } },
> > +	{}
> 
> > +};
> 
> > +/* check if all PCI devices in the list are present at specified locations */
> > +static bool __init synology_pci_devices_present(const struct synology_pci_dev *list)
> > +{
> > +	const struct synology_pci_dev *d;
> > +
> > +	for (d = list; d->id.vendor; d++) {
> > +		struct pci_dev *pdev = pci_get_domain_bus_and_slot(0, d->bus, d->devfn);
> > +
> > +		if (!pdev)
> > +			return false;
> 
> > +		bool matched = d->id.vendor == pdev->vendor &&
> > +			       d->id.device == pdev->device &&
> > +			       d->id.subvendor == pdev->subsystem_vendor &&
> > +			       d->id.subdevice == pdev->subsystem_device;
> 
> Don't mix variable definitions with the code (it's exceptionally possible
> for a couple of cases, none of which is this one). Can't it use
> pci_match_id() approach with driver_data? (If we ever need this check.)

I don't see how can pci_match_id() be used here. I can merge pci bus and
devfun into driver_data to fit into pci_device_id table but there's no
pci_dev which could be matched against that table (and walking all PCI
devices does not seem to be an improvement).
 
-- 
Ondrej Zary
