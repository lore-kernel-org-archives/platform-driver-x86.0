Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DE03DCDA2;
	Wed, 10 Jun 2026 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095443; cv=none; b=Rz9Y1P7xZMs9L64Pz3XtgPuL60UT9iqCKxnnPKrAfh/9IiNjSfX0OG0bxFr8yCnWLWQT+oTcITQRk7P/6cq3PHuGTdmPopTM0WAjmb/ZyJ9e8h/+1bK78P6bEXx7n5682MN43Opelyxz3BP7mJUr2jwX4TxLEjrQyV/QuCdtmCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095443; c=relaxed/simple;
	bh=zn3/jG9lqLwwECbtmlKCezCFOb3QamccpD7V9LhyhvA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LahWo+LW5LGJCbY2NDI3ZxGwqdjN13qqbFpBMdROMUYq3ctGBWxnALReX0UYsyZ6bxh7CXxejLLU4k6IbC5WIg1e5vhcc2YKkbaG5YFtdqhJw+B1MHm3aiDTku0TrN5a7Rvt/9az7CgziqEaXScJBfrQ95cet6YSMBInCzYAC6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jECLXE3l; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jECLXE3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781095443; x=1812631443;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zn3/jG9lqLwwECbtmlKCezCFOb3QamccpD7V9LhyhvA=;
  b=jECLXE3lfBiBLYCaXfgOfhDygL3ODFaiPQFCIYKE5Gl40RTHFiH/Ce5E
   1wbiCFrino7iw6mlhqZjKGfcl91aMqBm0Z7pOWaiUaUieEm6+kSoqAWy7
   AF9H2xjshBir/fJD7HrBsrx/XTx3RF0LgLjNUyYXRWBPDBg+b+Qs+iI8J
   auKXSZtFQeGEoACOatbdPjC03ErIeRFR/PvQ7r9YuI5/5N32nQ5jOpray
   FfipS64XeMkYlUm4jToTdDh2bgdx0LdLvlKC4Ue6zfv50SImy0V++srDk
   d+S7CRCe+EQiyWYHebC91lIUmo0pUnVJe34rZ3VQoj1m19ss6uVlNYq69
   A==;
X-CSE-ConnectionGUID: wop4uQAvRiG8CxqrLhJZ5g==
X-CSE-MsgGUID: NNPGPV/eQwq6qtbHORvTlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92205560"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92205560"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 05:44:01 -0700
X-CSE-ConnectionGUID: wb9/1GozQL+lnXxHwYWycQ==
X-CSE-MsgGUID: w1Ydb+HxTX2zt3Q2fy6epg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="242024494"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 05:43:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 15:43:52 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: Hans de Goede <hansg@kernel.org>, irenic.rajneesh@gmail.com, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    srinivas.pandruvada@linux.intel.com, xi.pardee@linux.intel.com
Subject: Re: [PATCH v6 06/15] platform/x86/intel/pmt: Unify header fetch and
 add ACPI source
In-Reply-To: <64a001eb6f3ef227163caf43dfb81c2d45a51fd1.1780248804.git.david.e.box@linux.intel.com>
Message-ID: <f912c686-3f39-46d6-5171-af156edd2457@linux.intel.com>
References: <cover.1780248804.git.david.e.box@linux.intel.com> <64a001eb6f3ef227163caf43dfb81c2d45a51fd1.1780248804.git.david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 31 May 2026, David E. Box wrote:

> Allow the PMT class to read discovery headers from either PCI MMIO or
> ACPI-provided entries, depending on the discovery source. The new
> source-aware fetch helper caches the canonical discovery header for both
> paths, capping PCI MMIO reads to the mapped resource size, while keeping
> the mapped PCI discovery table available for users such as crashlog.
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
> Assisted-by: GitHub-Copilot:claude-opus-4.7
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> V6 changes:
>   - Removed unneeded headers parameter from pmt_get_headers() (Ilpo).
>   - Added memset() to zero-initialize disc_header before copying to avoid
>     uninitialized data in entry reuse scenarios (Ilpo/Sashiko).
> 
> V5 changes:
>   - Bounded memcpy_fromio() to resource_size() of the mapped DVSEC entry
>     to avoid over-reading namespaces with smaller entry_size.
>   - Documented that entry->disc_table = NULL in the ACPI branch is
>     intentional and that consumers must only be wired to
>     INTEL_VSEC_DISC_PCI namespaces if they dereference disc_table.
> 
> V4 - Replaced local raw ACPI discovery pointer type u32 (*)[4] with
>      acpi_disc_t for consistency with exported PMC helper types.
> 
> V3 - No changes
> 
> V2 changes:
>   - Replaced intermediate header-decode helper with inline ACPI path
>   - Removed separate disc_acpi resource
>   - Moved ACPI fetch directly into intel_pmt_dev_create
> 
>  drivers/platform/x86/intel/pmt/class.c | 152 +++++++++++++++++++++----
>  drivers/platform/x86/intel/pmt/class.h |   2 +-
>  include/linux/intel_vsec.h             |   5 +-
>  3 files changed, 136 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index 44a0a52014fc..75c411ad92a6 100644
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

Please align to the rval like the one above.

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
> @@ -371,29 +446,66 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  	return ret;
>  }
>  
> +static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
> +			   struct intel_pmt_entry *entry)
> +{
> +	struct device *dev = &ivdev->auxdev.dev;
> +	size_t header_bytes = sizeof(entry->disc_header);
> +
> +	switch (ivdev->src) {
> +	case INTEL_VSEC_DISC_PCI: {
> +		struct resource *disc_res = &ivdev->resource[idx];
> +		void __iomem *disc_table;
> +
> +		disc_table = devm_ioremap_resource(dev, disc_res);
> +		if (IS_ERR(disc_table))
> +			return PTR_ERR(disc_table);
> +
> +		/*
> +		 * The mapped resource is sized by the namespace's DVSEC
> +		 * entry_size (in dwords), which can be less than the default
> +		 * size (e.g. telemetry uses entry_size = 3, 12 bytes). Cap the
> +		 * copy to resource_size() to avoid reading past the mapped
> +		 * region.
> +		 */
> +		memset(entry->disc_header, 0, header_bytes);
> +		memcpy_fromio(entry->disc_header, disc_table,
> +			      min_t(size_t, header_bytes, resource_size(disc_res)));

Both should be size_t already so min() should suffice.

> +
> +		/* Used by crashlog driver */
> +		entry->disc_table = disc_table;
> +
> +		return 0;
> +	}
> +	case INTEL_VSEC_DISC_ACPI: {
> +		memcpy(entry->disc_header, &ivdev->acpi_disc[idx][0], header_bytes);
> +		/*
> +		 * No MMIO mapping exists on the ACPI source path; the cached
> +		 * headers are the only view of the discovery record. Consumers
> +		 * that dereference disc_table (e.g. crashlog) must therefore
> +		 * only be wired to namespaces backed by INTEL_VSEC_DISC_PCI.
> +		 */
> +		entry->disc_table = NULL;
> +
> +		return 0;
> +	}
> +	default:
> +		dev_err(dev, "Unknown discovery source type: %d\n", ivdev->src);
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespace *ns,
>  			 struct intel_vsec_device *intel_vsec_dev, int idx)
>  {
>  	struct device *dev = &intel_vsec_dev->auxdev.dev;
> -	struct resource	*disc_res;
>  	int ret;
>  
> -	disc_res = &intel_vsec_dev->resource[idx];
> -
> -	entry->disc_table = devm_ioremap_resource(dev, disc_res);
> -	if (IS_ERR(entry->disc_table))
> -		return PTR_ERR(entry->disc_table);
> -
> -	/*
> -	 * The mapped discovery resource may be smaller than disc_header (its
> -	 * size is the namespace's DVSEC entry_size in dwords, which can be
> -	 * less than 4). Cap the copy to the actual resource size to avoid
> -	 * reading past the mapped region; any unread dwords stay zero from
> -	 * the zero-initialized allocation of the containing struct.
> -	 */
> -	memcpy_fromio(entry->disc_header, entry->disc_table,
> -		      min_t(size_t, sizeof(entry->disc_header),
> -			    resource_size(disc_res)));
> +	ret = pmt_get_headers(intel_vsec_dev, idx, entry);
> +	if (ret)
> +		return ret;
>  
>  	if (ns->pmt_pre_decode) {
>  		ret = ns->pmt_pre_decode(intel_vsec_dev, entry);
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index 84202fc7920c..a0ece4fc3837 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -44,7 +44,7 @@ struct intel_pmt_entry {
>  	struct telem_endpoint	*ep;
>  	struct pci_dev		*pcidev;
>  	struct intel_pmt_header	header;
> -	u32			disc_header[4];
> +	u32			disc_header[PMT_DISC_DWORDS];
>  	struct bin_attribute	pmt_bin_attr;
>  	const struct attribute_group *attr_grp;
>  	struct kobject		*kobj;
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 07ea563f524e..843cda8f8644 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -28,6 +28,7 @@
>  #define INTEL_DVSEC_TABLE_BAR(x)	((x) & GENMASK(2, 0))
>  #define INTEL_DVSEC_TABLE_OFFSET(x)	((x) & GENMASK(31, 3))
>  #define TABLE_OFFSET_SHIFT		3
> +#define PMT_DISC_DWORDS		4
>  
>  struct device;
>  struct pci_dev;
> @@ -122,7 +123,7 @@ struct intel_vsec_platform_info {
>  	struct device *parent;
>  	struct intel_vsec_header **headers;
>  	const struct vsec_feature_dependency *deps;
> -	u32 (*acpi_disc)[4];
> +	u32 (*acpi_disc)[PMT_DISC_DWORDS];
>  	enum intel_vsec_disc_source src;
>  	void *priv_data;
>  	unsigned long caps;
> @@ -153,7 +154,7 @@ struct intel_vsec_platform_info {
>  struct intel_vsec_device {
>  	struct auxiliary_device auxdev;
>  	struct device *dev;
> -	u32 (*acpi_disc)[4];
> +	u32 (*acpi_disc)[PMT_DISC_DWORDS];
>  	enum intel_vsec_disc_source src;
>  	struct ida *ida;
>  	int num_resources;
> 

-- 
 i.

