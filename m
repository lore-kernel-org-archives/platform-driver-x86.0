Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.182.83.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606449;
	b=ylqGODu7OfKRwdwmt6Ri+03ZtoBBhkVUgFEVWb8GoGTvHpZXWZci28o/1HuqKtXhxixg
	 15kmDPHsB3LIRsCUlZ0MRXKTdIw3BuWvXCOp+pf073EA3IP1dwb6u7p2B6nMUbItNdYQB
	 T2POR/ehUPjEh9LSBfn3I4d/NyOIgOHNT9Uv4baVVm/UJ7POyd6nHW1KTPHFcMUttBEXK
	 OtC0+1DVz+iYy8YSsI2jsgR9W44gQ9tLNFYzuMYbfYhyniyM9oulgNOY7r6e6WMQGgbzs
	 pqVj0ecBlEiwYeGFBzWID3LTDVinAo7DV9EVVlTd50CrJqraFp2+HwY1LAk/DTT7iXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606449;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:User-Agent:
	 Cc:References:In-Reply-To:X-KMail-QuotePrefix:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Message-Id;
	bh=HKoDU+dLsCmuCJRgFHrfhtjWazV++JljIFE+J0sXE58=;
	b=jpGBNe6cEHRmz8wzfoXmI/h+pt+ip9G/QUihW2iRXUPHyM9DXGXKKsbvpgC2aG6acvbx
	 1HT+EGYoDvalDNymQipY0uyVU+/QyznkLyjkLa3umMtR2iRteX8DG2oLAn3LUxsFT1dCM
	 E/lVdm3Ah2RDq1EkDNyzJ28ItvQVu801u8lozKX37xjhFy0J6bUChGPDkoSWa7H7hcYCv
	 byrDKPqC018LRD28jwpqTC8gh+bWh5oiHxSKP8n/eUWisjAlBD91w2E98PuNTubQFg3zd
	 Kt7QFKXmssGVCTDPuQ3Xs1zGWLd14OrVbX3YuEmXxtq0UmkUaE9o8FnH2sfeW0E78YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zary.sk;
	spf=pass smtp.mailfrom=zary.sk;
	dkim=pass header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=LKmrfzwL;
	arc=none smtp.remote-ip=194.182.83.82
Received: from mail.zary.sk (mail.zary.sk [194.182.83.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DD1606A321;
	Wed, 25 Nov 2026 11:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97DD1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zary.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zary.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=LKmrfzwL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zary.sk; s=key1;
	t=1795606446; bh=NaR0diMCtuXyVZO/NVpxvjHdL+7bjn4HQuViZ5NuIGw=;
	h=From:To:Subject:Date:Cc:References:In-Reply-To:From;
	b=LKmrfzwLLDE/KEOO7O7RVZBot1PYLMneMmIGb7fhgQAtTOLslhFubKFjzmhiAxmQS
	 AemCr7w0e6I9eLAwXTmQFUCs4PBNRCXifSZzn0Zcr2jEOFTmEHbwkpyh/xXmZxprRT
	 CQVcotXZuCR++/F7jY6KMUL46aLF5QDCuJipXf6utvqpT69df6NPKA1OwtBuXCES2w
	 4gPdy/aAtscTp61z91I+cR04NEzmUp8VcPYScJq33lmGze4XILz3hqs1KCVqO+DEJ6
	 Yd8lOrY5UZyWL+H2ZdeoOGfu5OWd78YySEedwJ5cSeABxmRNmy1tQcyAz6mgq4hCnE
	 cIl++6HZjLr2Q==
Received: from [192.168.1.3] (mail.gsystem.sk [37.58.14.130])
	by mail.zary.sk (Postfix) with ESMTPSA id 0CDC8BED51;
	Wed, 25 Nov 2026 12:34:06 +0100 (CET)
From: Ondrej Zary <linux@zary.sk>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3] Introduce Synology x86 NAS LEDs driver
Date: Wed, 25 Nov 2026 12:33:55 +0100
User-Agent: KMail/1.9.10
Cc: linux-kernel@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 Ilpo =?iso-8859-1?q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20261124125616.1168560-1-linux@zary.sk> <202611250911.51673.linux@zary.sk> <awa4YJkwVaoqaF0L@ashevche-desk.local>
In-Reply-To: <awa4YJkwVaoqaF0L@ashevche-desk.local>
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
Message-Id: <202611251233.56539.linux@zary.sk>

On Wednesday 25 November 2026, Andy Shevchenko wrote:
> On Wed, Nov 25, 2026 at 09:11:51AM +0100, Ondrej Zary wrote:
> > On Tuesday 24 November 2026, Andy Shevchenko wrote:
> > > On Tue, Nov 24, 2026 at 07:54:47PM +0100, Ondrej Zary wrote:
> > > > On Tuesday 24 November 2026 18:03:00 Andy Shevchenko wrote:
> > > > > On Tue, Nov 24, 2026 at 01:45:46PM +0100, Ondrej Zary wrote:
> 
> ...
> 
> > > > > > +struct synology_pci_dev {
> > > > > > +	unsigned int bus;
> > > > > > +	unsigned int devfn;
> > > > > > +	struct pci_device_id id;
> > > > > > +};
> > > > > > +
> > > > > > +/* onboard PCI devices found in DS411+ to confirm the machine type (after DMI match) */
> > > > > > +static const struct synology_pci_dev ds411plus_pci_devices[] __initconst = {
> > > > > > +	/* 00:00.0 Host bridge: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx DMI Bridge */
> > > > > > +	{ 0, PCI_DEVFN(0, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0xa000,
> > > > > > +					       PCI_VENDOR_ID_INTEL, 0xa000) } },
> > > > > > +	/* 00:1f.0 ISA bridge: Intel Corporation 82801IR (ICH9R) LPC Interface Controller */
> > > > > > +	{ 0, PCI_DEVFN(0x1f, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x2916,
> > > > > > +						  PCI_VENDOR_ID_INTEL, 0x2916) } },
> > > > > 
> > > > > > +	/* 02:00.0 Mass storage controller: Silicon Image, Inc. SiI 3531 Serial ATA Controller */
> > > > > > +	{ 2, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_CMD, 0x3531,
> > > > > > +						  PCI_VENDOR_ID_CMD, 0x3531) } },
> > > > > > +	/* 03:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network Connection */
> > > > > > +	{ 3, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x10d3,
> > > > > > +						  PCI_VENDOR_ID_INTEL, 0x0000) } },
> > > > > > +	{}
> > > > > 
> > > > > > +};
> > > > > 
> > > > > > +/* check if all PCI devices in the list are present at specified locations */
> > > > > > +static bool __init synology_pci_devices_present(const struct synology_pci_dev *list)
> > > > > > +{
> > > > > > +	const struct synology_pci_dev *d;
> > > > > > +
> > > > > > +	for (d = list; d->id.vendor; d++) {
> > > > > > +		struct pci_dev *pdev = pci_get_domain_bus_and_slot(0, d->bus, d->devfn);
> > > > > > +
> > > > > > +		if (!pdev)
> > > > > > +			return false;
> > > > > 
> > > > > > +		bool matched = d->id.vendor == pdev->vendor &&
> > > > > > +			       d->id.device == pdev->device &&
> > > > > > +			       d->id.subvendor == pdev->subsystem_vendor &&
> > > > > > +			       d->id.subdevice == pdev->subsystem_device;
> > > > > 
> > > > > Don't mix variable definitions with the code (it's exceptionally possible
> > > > > for a couple of cases, none of which is this one). Can't it use
> > > > > pci_match_id() approach with driver_data? (If we ever need this check.)
> > > > 
> > > > I don't see how can pci_match_id() be used here. I can merge pci bus and
> > > > devfun into driver_data to fit into pci_device_id table but there's no
> > > > pci_dev which could be matched against that table (and walking all PCI
> > > > devices does not seem to be an improvement).
> > > 
> > > _After_ DMI match the walk over all PCI devices is not a big deal. The code
> > > will be nicer. But maybe there is a better choice? Like checking CPUID? Or
> > > maybe something interesting is present in the ACPI tables?
> > > 
> > 
> > I don't know much about ACPI but can't find any Synology traces.
> > 
> > # acpidump -s
> > Firmware Warning (ACPI): Incorrect checksum in table [GSCI] - 0x83, should be 0x34 (20250404/utcksum-100)
> > ACPI: GSCI 0x0000000000000000 002024 (v01 052112 GMCHSCI  20120521 MSFT 00000097)
> > ACPI: MCFG 0x0000000000000000 00003C (v01 052112 OEMMCFG  20120521 MSFT 00000097)
> > ACPI: APIC 0x0000000000000000 00006C (v01 052112 APIC1409 20120521 MSFT 00000097)
> > Firmware Warning (ACPI): Incorrect checksum in table [OEMB] - 0x6F, should be 0x03 (20250404/utcksum-100)
> > ACPI: OEMB 0x0000000000000000 000082 (v01 052112 OEMB1409 20120521 MSFT 00000097)
> > ACPI: DSDT 0x0000000000000000 006B21 (v01 1AAAA  1AAAA005 00000005 INTL 20051117)
> > ACPI: FACP 0x0000000000000000 000084 (v01 052112 FACP1409 20120521 MSFT 00000097)
> > ACPI: HPET 0x0000000000000000 000038 (v01 052112 OEMHPET  20120521 MSFT 00000097)
> > ACPI: FACS 0x0000000000000000 000040
> > 
> > 
> > ACPI devices look very generic:
> > AWY0001:00
> > INT0800:00
> > INTC0102:00
> > ITE8704:00
> > LNXCPU:00
> > LNXCPU:01
> > LNXCPU:02
> > LNXCPU:03
> > LNXPWRBN:00
> > LNXSYBUS:00
> > LNXSYBUS:01
> > LNXSYSTM:00
> > PNP0000:00
> > PNP0100:00
> > PNP0103:00
> > PNP0200:00
> > PNP0303:00
> > PNP0401:00
> > PNP0501:00
> > PNP0501:01
> > PNP0700:00
> > PNP0800:00
> > PNP0A08:00
> > PNP0B00:00
> > PNP0C01:00
> > PNP0C01:01
> > PNP0C02:00
> > PNP0C02:01
> > PNP0C02:02
> > PNP0C02:03
> > PNP0C02:04
> > PNP0C04:00
> > PNP0C0C:00
> > PNP0C0E:00
> > PNP0C0F:00
> > PNP0C0F:01
> > PNP0C0F:02
> > PNP0C0F:03
> > PNP0C0F:04
> > PNP0C0F:05
> > PNP0C0F:06
> > PNP0C0F:07
> > PNP0C31:00
> > PNP0F03:00
> 
> Can you add the platform to https://linux-hardware.org/?view=howto ?

https://linux-hardware.org/?probe=1d48e86441


-- 
Ondrej Zary
