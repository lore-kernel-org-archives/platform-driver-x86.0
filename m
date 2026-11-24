Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.182.83.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558368;
	b=P7Lt92wn9LG0EK1Jx6h/cqjTHZbNhkGcsHGudjRSoBsmX4fXVy3RTJMqj2L2H20chZ69
	 PfUVyuMtrjE/sC09/D15gTM17WcA1cXLPyQOuTuF9aDKHNQrGH/P37xTzlD82rEAvzUaG
	 /cq9upYiXDxYLjQ3qbmThsLX4aJGW1BXN0dzYRGNDsNlxQ8n73SRQ8iDoru+MyBo+55sD
	 hkJf4S3XDIeBvvXsHWY/RbEXUx3npuvWoYHUmTUoRoMkAMGKiar5IL12A2bzeSmOlEU7p
	 TYxg/MnT8mV1NpGpFTjTTHoC1Gd+9fxPNQBbMWvYk3wu724KmeuuheGcmg/f4iHo4zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558368;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:User-Agent:
	 Cc:References:In-Reply-To:X-KMail-QuotePrefix:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Message-Id;
	bh=Iu4Vy/BsdfgvF8G+I0jLGO/egvFmzLAT2M7u80vbKmY=;
	b=lATnEpmrFPfjVT2zh8PNZYLfA3h7Gmif0IaGdd07Zr5qjglsiqXzDzLg2GoT9gHwE3DH
	 W+nNropYEI20WaRVRLDZJ3SWFl1IKqRYxnD1H8MRx4Xfe7d37vvp/UABJ8uIEbvAb1E3R
	 soupLznCqmKKyo/katJblrgOzozPzblDlgCbEwHjmVCRI8ls5JS4XlthbQBDkagSQ00r5
	 0aB5YbZ6uI6ztOy+cQy/bRek8okLsND7YtyVu1jXXwX7fLNqIG5cgmKdGwSvOhmHyj+iW
	 msv8EDZScY23ILHLIhaO09icRPrXC4XD6u62s0YnRofsBQigto1HznxDX0+ZproRVlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zary.sk;
	spf=pass smtp.mailfrom=zary.sk;
	dkim=pass header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=MaGJo95J;
	arc=none smtp.remote-ip=194.182.83.82
Received: from mail.zary.sk (mail.zary.sk [194.182.83.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A038606A31E;
	Tue, 24 Nov 2026 22:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A038606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zary.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zary.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=MaGJo95J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zary.sk; s=key1;
	t=1795558364; bh=80A+qbZMx1fUMDo3Gar3Wo8vl4C2u6p6EJDsDRlxjL4=;
	h=From:To:Subject:Date:Cc:References:In-Reply-To:From;
	b=MaGJo95J8LaB+8r8FS70RqSYApxPTLuGGcqST9aG4xwaauuitjd/bL75OsCBpoOB4
	 le4+op3yUCZIAm+yX0pbhfAG7I6gLhm1IUawe5ld4gHppDNZMaJ8dPzgEObVk3BZRM
	 6u0XO4COLYLrpEJdkcdKjlAI3QUUu9ECGq+x4UTw5NbGQCh20VG0c3yAlHSRK0WBd/
	 0cQWykbkn28b5ZoA3pKo+mkHHaSdmDblqScwlGot4FT2czuzZpfX8n89CpbI6LnnMI
	 ca91yifjehpR/2I1KVgRpIk/IHxxItNeEG3JOz3XJUtLebkLHklVXAda8hQAhqt7si
	 WJwpSROnjFgeg==
Received: from [192.168.0.2] (188-167-58-127.dynamic.chello.sk [188.167.58.127])
	by mail.zary.sk (Postfix) with ESMTPSA id 84AF2BEDE0;
	Tue, 24 Nov 2026 23:12:44 +0100 (CET)
From: Ondrej Zary <linux@zary.sk>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3] Introduce Synology x86 NAS LEDs driver
Date: Tue, 24 Nov 2026 23:12:38 +0100
User-Agent: KMail/1.9.10
Cc: Hans de Goede <hansg@kernel.org>,
 Ilpo =?iso-8859-1?q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261124125616.1168560-1-linux@zary.sk> <202611241954.47791.linux@zary.sk> <awXv4b3cjVlOc0NT@ashevche-desk.local>
In-Reply-To: <awXv4b3cjVlOc0NT@ashevche-desk.local>
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
Message-Id: <202611242312.38998.linux@zary.sk>

On Tuesday 24 November 2026 21:13:21 Andy Shevchenko wrote:
> On Tue, Nov 24, 2026 at 07:54:47PM +0100, Ondrej Zary wrote:
> > On Tuesday 24 November 2026 18:03:00 Andy Shevchenko wrote:
> > > On Tue, Nov 24, 2026 at 01:45:46PM +0100, Ondrej Zary wrote:
> 
> ...
> 
> > > > +struct synology_pci_dev {
> > > > +	unsigned int bus;
> > > > +	unsigned int devfn;
> > > > +	struct pci_device_id id;
> > > > +};
> > > > +
> > > > +/* onboard PCI devices found in DS411+ to confirm the machine type (after DMI match) */
> > > > +static const struct synology_pci_dev ds411plus_pci_devices[] __initconst = {
> > > > +	/* 00:00.0 Host bridge: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx DMI Bridge */
> > > > +	{ 0, PCI_DEVFN(0, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0xa000,
> > > > +					       PCI_VENDOR_ID_INTEL, 0xa000) } },
> > > > +	/* 00:1f.0 ISA bridge: Intel Corporation 82801IR (ICH9R) LPC Interface Controller */
> > > > +	{ 0, PCI_DEVFN(0x1f, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x2916,
> > > > +						  PCI_VENDOR_ID_INTEL, 0x2916) } },
> > > 
> > > > +	/* 02:00.0 Mass storage controller: Silicon Image, Inc. SiI 3531 Serial ATA Controller */
> > > > +	{ 2, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_CMD, 0x3531,
> > > > +						  PCI_VENDOR_ID_CMD, 0x3531) } },
> > > > +	/* 03:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network Connection */
> > > > +	{ 3, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x10d3,
> > > > +						  PCI_VENDOR_ID_INTEL, 0x0000) } },
> > > > +	{}
> > > 
> > > > +};
> > > 
> > > > +/* check if all PCI devices in the list are present at specified locations */
> > > > +static bool __init synology_pci_devices_present(const struct synology_pci_dev *list)
> > > > +{
> > > > +	const struct synology_pci_dev *d;
> > > > +
> > > > +	for (d = list; d->id.vendor; d++) {
> > > > +		struct pci_dev *pdev = pci_get_domain_bus_and_slot(0, d->bus, d->devfn);
> > > > +
> > > > +		if (!pdev)
> > > > +			return false;
> > > 
> > > > +		bool matched = d->id.vendor == pdev->vendor &&
> > > > +			       d->id.device == pdev->device &&
> > > > +			       d->id.subvendor == pdev->subsystem_vendor &&
> > > > +			       d->id.subdevice == pdev->subsystem_device;
> > > 
> > > Don't mix variable definitions with the code (it's exceptionally possible
> > > for a couple of cases, none of which is this one). Can't it use
> > > pci_match_id() approach with driver_data? (If we ever need this check.)
> > 
> > I don't see how can pci_match_id() be used here. I can merge pci bus and
> > devfun into driver_data to fit into pci_device_id table but there's no
> > pci_dev which could be matched against that table (and walking all PCI
> > devices does not seem to be an improvement).
> 
> _After_ DMI match the walk over all PCI devices is not a big deal. The code
> will be nicer. But maybe there is a better choice? Like checking CPUID? Or
> maybe something interesting is present in the ACPI tables?

pci_find_next_bus() and pci_walk_bus() with a callback or
list_for_each_entry()?
Then pci_match_id() and finally test if the matched device has proper bus and
devfn numbers. Doesn't look like a recipe for nice code.

I'll check ACPI tables tomorrow but I doubt there's anything done properly
in the BIOS (even int13 support is buggy and requires GRUB patch).

-- 
Ondrej Zary
