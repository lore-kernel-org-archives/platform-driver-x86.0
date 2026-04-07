Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0881E279792;
	Tue,  7 Apr 2026 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564064; cv=none; b=h9Mj8LUSe2/+xmyQ1cedP/dgPzouhsVk8I30HEYHhOAd53It/2fvFliDJVO95w+udfbMj0J8j9n931bBs6m/yPtiYWRokEk+2j0PCPes6CgtXc4yQ7FwEPOQ2wFL98Pue62HDQBhoeCnDw4ffkmVJzLCnAslu4r1hE+wdz17P4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564064; c=relaxed/simple;
	bh=IJ6ekCt4PZayFswcF7Mr5lTcg83Pnu5yBUwNHQA0X2A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=J4/Y9WpUzchZAXlM57PxZiXXSKkwPckBtNNHqxXOed3FjCjLia5vtIf8ECZ+pSiimzGaKB0NKP5x8J9l34OFz16FXKMOvJKdO0FqJJrvOqF3ZTR8gpqtYXw2S4hQETqQMs0aO80XLYEGWF7zXaEL45GBaygv5YxhhfCDzlsLMt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NA/q190I; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NA/q190I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775564063; x=1807100063;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IJ6ekCt4PZayFswcF7Mr5lTcg83Pnu5yBUwNHQA0X2A=;
  b=NA/q190IXa1ptfzV+0S4KVBmfA/oe/WvYxY+DZLGKNhUUS/nrxPNvuTU
   KVu6Y9SqR4xbySz1NxNQHhOmxqyD7cZbRcaMKeKzZsqILfw6fs5Px1k6E
   CDXAq0yV4NR9N/MHf1ZAJjAj9Zqr27RR1Oh3TUWJNERs7cY8oT7H4r4yY
   oYQQq+2zKAiZnkdd6Hjox19pnpvqh12NmZTQYIUa6cZgG51w7PJzBO286
   b5M/L5uzCC1GUAA9WXRnwGkIH0bXpGk6A0DyHuNHAGXp+VycwkR0UcwnC
   T2b5o4XnQuwj1herr+14wHSkRsFVXD5FT6do3cpo0vGyPSl0YayxqXe5P
   Q==;
X-CSE-ConnectionGUID: 5cutG9dDQyKTjon0cUrU7w==
X-CSE-MsgGUID: unesNIcxQgOL7eQ7vf2nAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87151875"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="87151875"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:14:22 -0700
X-CSE-ConnectionGUID: Pp1qUlFBRTaXCCDKJFvDuw==
X-CSE-MsgGUID: 40N++u4hR7asqz4to8meVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228421348"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:14:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 15:14:15 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com, 
    srinivas.pandruvada@linux.intel.com, xi.pardee@linux.intel.com, 
    hansg@kernel.org, linux-kernel@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V2 06/17] platform/x86/intel/pmt: Unify header fetch and
 add ACPI source
In-Reply-To: <20260325014819.1283566-7-david.e.box@linux.intel.com>
Message-ID: <eaaa0f6c-36ea-d9f6-a8b1-0c91551a1234@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com> <20260325014819.1283566-7-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Mar 2026, David E. Box wrote:

> Allow the PMT class to read discovery headers from either PCI MMIO or
> ACPI-provided entries, depending on the discovery source. The new
> source-aware fetch helper retrieves the first two QWORDs for both paths
> while keeping the mapped discovery table available for users such as
> crashlog.
> 
> Split intel_pmt_populate_entry() into source-specific resolvers:
>   - pmt_resolve_access_pci(): handles both ACCESS_LOCAL and ACCESS_BARID
>     for PCI-backed devices and sets entry->pcidev. Same existing
>     functionality.
>   - pmt_resolve_access_acpi(): handles only ACCESS_BARID for ACPI-backed
>     devices, rejecting ACCESS_LOCAL which has no valid semantics without
>     a physical discovery resource.
> 
> This maintains existing PCI behavior and makes no functional changes
> for PCI devices.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> 
> V2 changes:
> - In pmt_resolve_access_acpi(), moved dev_err() call to single line
>   instead of split across two lines
> - Restructured error handling in intel_pmt_populate_entry(), moving error
>   returns from after switch/case into each case statement for better
>   readability
> - Addressed Ilpo's feedback on error message formatting and error
>   handling patterns
> 
>  drivers/platform/x86/intel/pmt/class.c | 123 +++++++++++++++++++++++--
>  1 file changed, 114 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index 3fcea6a6e763..64678f55a20e 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -205,9 +205,9 @@ struct class intel_pmt_class = {
>  };
>  EXPORT_SYMBOL_GPL(intel_pmt_class);
>  
> -static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
> -				    struct intel_vsec_device *ivdev,
> -				    int idx)
> +static int pmt_resolve_access_pci(struct intel_pmt_entry *entry,
> +				  struct intel_vsec_device *ivdev,
> +				  int idx)
>  {
>  	struct pci_dev *pci_dev = to_pci_dev(ivdev->dev);
>  	struct device *dev = &ivdev->auxdev.dev;
> @@ -287,6 +287,81 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
>  	}
>  
>  	entry->pcidev = pci_dev;
> +
> +	return 0;
> +}
> +
> +static int pmt_resolve_access_acpi(struct intel_pmt_entry *entry,
> +				   struct intel_vsec_device *ivdev)
> +{
> +	struct pci_dev *pci_dev = NULL;
> +	struct device *dev = &ivdev->auxdev.dev;
> +	struct intel_pmt_header *header = &entry->header;
> +	u8 bir;
> +
> +	if (dev_is_pci(ivdev->dev))
> +		pci_dev = to_pci_dev(ivdev->dev);
> +
> +	/*
> +	 * The base offset should always be 8 byte aligned.
> +	 *
> +	 * For non-local access types the lower 3 bits of base offset
> +	 * contains the index of the base address register where the
> +	 * telemetry can be found.
> +	 */
> +	bir = GET_BIR(header->base_offset);
> +
> +	switch (header->access_type) {
> +	case ACCESS_BARID:
> +		/* ACPI platform drivers use base_addr */
> +		if (ivdev->base_addr) {
> +			entry->base_addr = ivdev->base_addr +
> +					   GET_ADDRESS(header->base_offset);
> +			break;
> +		}
> +
> +		/* If base_addr is not provided, then this is an ACPI companion device */
> +		if (!pci_dev) {
> +			dev_err(dev, "ACCESS_BARID requires PCI BAR resources or base_addr\n");
> +			return -EINVAL;
> +		}
> +
> +		entry->base_addr = pci_resource_start(pci_dev, bir) +
> +			GET_ADDRESS(header->base_offset);

Could you align this to pci_.

> +		break;
> +	default:
> +		dev_err(dev, "Unsupported access type %d for ACPI based PMT\n",
> +			header->access_type);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
> +				    struct intel_vsec_device *ivdev,
> +				    int idx)
> +{
> +	struct intel_pmt_header *header = &entry->header;
> +	struct device *dev = &ivdev->auxdev.dev;
> +	int ret;
> +
> +	switch (ivdev->src) {
> +	case INTEL_VSEC_DISC_PCI:
> +		ret = pmt_resolve_access_pci(entry, ivdev, idx);
> +		if (ret)
> +			return ret;
> +		break;
> +	case INTEL_VSEC_DISC_ACPI:
> +		ret = pmt_resolve_access_acpi(entry, ivdev);
> +		if (ret)
> +			return ret;
> +		break;
> +	default:
> +		dev_err(dev, "Unknown discovery source: %d\n", ivdev->src);
> +		return -EINVAL;
> +	}
> +
>  	entry->guid = header->guid;
>  	entry->size = header->size;
>  	entry->cb = ivdev->priv_data;
> @@ -371,18 +446,48 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  	return ret;
>  }
>  
> +static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
> +			   struct intel_pmt_entry *entry, u64 headers[2])
> +{
> +	struct device *dev = &ivdev->auxdev.dev;
> +
> +	switch (ivdev->src) {
> +	case INTEL_VSEC_DISC_PCI: {
> +		void __iomem *disc_table;
> +
> +		disc_table = devm_ioremap_resource(dev, &ivdev->resource[idx]);
> +		if (IS_ERR(disc_table))
> +			return PTR_ERR(disc_table);
> +
> +		memcpy_fromio(headers, disc_table, 2 * sizeof(u64));
> +
> +		/* Used by crashlog driver */
> +		entry->disc_table = disc_table;
> +
> +		return 0;
> +	}
> +	case INTEL_VSEC_DISC_ACPI:
> +		memcpy(headers, &ivdev->acpi_disc[idx][0], 2 * sizeof(u64));

You seem to repeat literal 2 when you mean the size of the headers so it 
would warrant a define (and perhaps using sizeof(headers) here with the 
memcpy() if it works with headers[2] being passed in as an array, I'm not 
sure how C handles that case).

It was in the earlier patch too as literal.

-- 
 i.

> +
> +		return 0;
> +	default:
> +		dev_err(dev, "Unknown discovery source type: %d\n", ivdev->src);
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int pmt_read_header(struct intel_vsec_device *ivdev, int idx,
>  			   struct intel_pmt_entry *entry)
>  {
>  	struct intel_pmt_header *header = &entry->header;
> -	struct device *dev = &ivdev->auxdev.dev;
>  	u64 headers[2];
> +	int ret;
>  
> -	entry->disc_table = devm_ioremap_resource(dev, &ivdev->resource[idx]);
> -	if (IS_ERR(entry->disc_table))
> -		return PTR_ERR(entry->disc_table);
> -
> -	memcpy_fromio(headers, entry->disc_table, 2 * sizeof(u64));
> +	ret = pmt_get_headers(ivdev, idx, entry, headers);
> +	if (ret)
> +		return ret;
>  
>  	header->access_type = FIELD_GET(PMT_ACCESS_TYPE, headers[0]);
>  	header->telem_type = FIELD_GET(PMT_TELEM_TYPE, headers[0]);
> 
