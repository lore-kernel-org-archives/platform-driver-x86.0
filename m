Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727A44028E3;
	Thu, 28 May 2026 18:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779993480; cv=none; b=J+uhJflR1MKjiDCs6koT5DFVa0Epe8AYl0iyeHAW14rU1zWe2NO5/7EWkW0i+dcGEPHFpMVBEgGDY4IQ3GJq/8ABl2VAxvZreAw+Tj6jRJ2TTMNprHWorkTZL7sOs7qcdKUUxICA4jARg54PpNesEV8p+Hwpvuf+65HLDti5DAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779993480; c=relaxed/simple;
	bh=dDT1FEDCzDdf+vb3HWry9r9m2KDtB8faesshBAeQYd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RweWs7BEpraEy8RGHAfyiWOYhJjt7iS3TpLX87Ek8lxG7u9fo2KwjLlh0F0B8VGKh1/CTD/L0ssPXJBnWd/lkBCEPipqumj9AjM/PS1f3nW7selRB3AszCRsn3/GJs2E8FofZCXbzwH1sF843aXlnCzqDEFAoan6Spfgy/lAuXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mq+3rnOu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mq+3rnOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779993479; x=1811529479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dDT1FEDCzDdf+vb3HWry9r9m2KDtB8faesshBAeQYd4=;
  b=Mq+3rnOu4LJ+n4F2ugPVtpIYTHAcqaMqKOyCu8YSMvuAV6PvWsJwBLl4
   RyrFs/QP/sUus3A9seLa71C9BPjG9bqgKPor3aY+42+i5hnN0gF8x+/Qa
   NDhPj/9w9DHO6ifnd6KlQXbo84cG6BDJGd7APw0qKmeX5+ugQp9tx19iK
   fignkjno+demgHFyx2pN+8sKIGqwA/ldd5iOqVb7i9XkDeFYtsMMeYpXb
   C56vj6ZMYej0DTNkXyibKlg7M1cRChhBxmjpmcUnvIkkOJejNKbA+3293
   +8ao9tjJX85vDUXsukDoAycdbkp6/DW9yNIcv/b7AE1c2dapxCJdlxPos
   A==;
X-CSE-ConnectionGUID: 4PUtRwGDSpGnv5NSo9HBaA==
X-CSE-MsgGUID: apAkQBjGR7qIjNi8oQJQKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="84732915"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="84732915"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 11:37:58 -0700
X-CSE-ConnectionGUID: yPE4Lp+UQhefeNRi65LySw==
X-CSE-MsgGUID: 3u/EsXv2QoitLjvrQHc8BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="242781614"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 11:37:58 -0700
Date: Thu, 28 May 2026 11:37:57 -0700
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xi Pardee <xi.pardee@linux.intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v5 06/16] platform/x86/intel/pmt: Unify header fetch and
 add ACPI source
Message-ID: <lev7yk7g3idd3qeqzdztiydfipnc4hy6hwff45ymj6mdzr3td6@4dpft3qn4rod>
References: <20260522022147.4137494-1-david.e.box@linux.intel.com>
 <20260522022147.4137494-7-david.e.box@linux.intel.com>
 <071b5732-591f-d228-2a11-1f3f16e21673@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <071b5732-591f-d228-2a11-1f3f16e21673@linux.intel.com>

On Fri, May 22, 2026 at 01:21:29PM +0300, Ilpo Järvinen wrote:
> On Thu, 21 May 2026, David E. Box wrote:
> 
> > Allow the PMT class to read discovery headers from either PCI MMIO or
> > ACPI-provided entries, depending on the discovery source. The new
> > source-aware fetch helper retrieves the first two QWORDs for both paths
> > while keeping the mapped discovery table available for users such as
> > crashlog.
> > 
> > Split intel_pmt_populate_entry() into source-specific resolvers:
> >   - pmt_resolve_access_pci(): handles both ACCESS_LOCAL and ACCESS_BARID
> >     for PCI-backed devices and sets entry->pcidev. Same existing
> >     functionality.
> >   - pmt_resolve_access_acpi(): handles only ACCESS_BARID for ACPI-backed
> >     devices, rejecting ACCESS_LOCAL which has no valid semantics without
> >     a physical discovery resource.
> > 
> > Also, when copying discovery headers, bind the copy size to the canonical
> > discovery header definition instead of relying on separate literals.
> > 
> > This maintains existing PCI behavior and makes no functional changes
> > for PCI devices.
> > 
> > Assisted-by: GitHub-Copilot:claude-opus-4.7
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> > V5 changes:
> >   - Cap memcpy_fromio() in pmt_get_headers() PCI branch to
> >     resource_size() of the discovery resource, matching the cap
> >     added in the cache-introducing patch.
> >   - Documented in the ACPI branch that disc_table is intentionally
> >     NULL on that source, so consumers that dereference disc_table
> >     must only be wired to INTEL_VSEC_DISC_PCI namespaces.
> 
> Please rebase this on top of the most recent for-next code as it seems to 
> have developed a context conflict with a recently applied change.
> 
> > V4 changes:
> >   - Added discovery header width macro, INTEL_VSEC_ACPI_DISC_DWORDS, in
> >     shared intel_vsec header and in definitions.
> >   - Aliased to PMT_DISC_HEADER_DWORDS and converted PMT discovery header
> >     arrays to use it.
> >   - Replaced literal header copy sizes with entry->disc_header size in
> >     pmt_get_headers() for PCI and ACPI paths.
> > 
> > V3 changes:
> >   - Folded the header fetch rework back into intel_pmt_dev_create() after
> >     dropping the previous common header decode helper patch
> >   - Cleaned up line wrapping/indentation
> > 
> > V2 changes:
> >   - In pmt_resolve_access_acpi(), moved dev_err() call to single line
> >     instead of split across two lines
> >   - Restructured error handling in intel_pmt_populate_entry(), moving error
> >     returns from after switch/case into each case statement for better
> >     readability
> >   - Addressed Ilpo's feedback on error message formatting and error
> >     handling patterns
> > 
> >  drivers/platform/x86/intel/pmt/class.c | 157 +++++++++++++++++++++----
> >  drivers/platform/x86/intel/pmt/class.h |   3 +-
> >  include/linux/intel_vsec.h             |   5 +-
> >  3 files changed, 142 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> > index 246e11837800..1a77709edc6a 100644
> > --- a/drivers/platform/x86/intel/pmt/class.c
> > +++ b/drivers/platform/x86/intel/pmt/class.c
> > @@ -204,9 +204,9 @@ struct class intel_pmt_class = {
> >  };
> >  EXPORT_SYMBOL_GPL(intel_pmt_class);
> >  
> > -static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
> > -				    struct intel_vsec_device *ivdev,
> > -				    int idx)
> > +static int pmt_resolve_access_pci(struct intel_pmt_entry *entry,
> > +				  struct intel_vsec_device *ivdev,
> > +				  int idx)
> >  {
> >  	struct pci_dev *pci_dev = to_pci_dev(ivdev->dev);
> >  	struct device *dev = &ivdev->auxdev.dev;
> > @@ -286,6 +286,81 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
> >  	}
> >  
> >  	entry->pcidev = pci_dev;
> > +
> > +	return 0;
> > +}
> > +
> > +static int pmt_resolve_access_acpi(struct intel_pmt_entry *entry,
> > +				   struct intel_vsec_device *ivdev)
> > +{
> > +	struct pci_dev *pci_dev = NULL;
> > +	struct device *dev = &ivdev->auxdev.dev;
> > +	struct intel_pmt_header *header = &entry->header;
> > +	u8 bir;
> > +
> > +	if (dev_is_pci(ivdev->dev))
> > +		pci_dev = to_pci_dev(ivdev->dev);
> > +
> > +	/*
> > +	 * The base offset should always be 8 byte aligned.
> > +	 *
> > +	 * For non-local access types the lower 3 bits of base offset
> > +	 * contains the index of the base address register where the
> > +	 * telemetry can be found.
> > +	 */
> > +	bir = GET_BIR(header->base_offset);
> > +
> > +	switch (header->access_type) {
> > +	case ACCESS_BARID:
> > +		/* ACPI platform drivers use base_addr */
> > +		if (ivdev->base_addr) {
> > +			entry->base_addr = ivdev->base_addr +
> > +					   GET_ADDRESS(header->base_offset);
> > +			break;
> > +		}
> > +
> > +		/* If base_addr is not provided, then this is an ACPI companion device */
> > +		if (!pci_dev) {
> > +			dev_err(dev, "ACCESS_BARID requires PCI BAR resources or base_addr\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		entry->base_addr = pci_resource_start(pci_dev, bir) +
> > +			GET_ADDRESS(header->base_offset);
> > +		break;
> > +	default:
> > +		dev_err(dev, "Unsupported access type %d for ACPI based PMT\n",
> > +			header->access_type);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
> > +				    struct intel_vsec_device *ivdev,
> > +				    int idx)
> > +{
> > +	struct intel_pmt_header *header = &entry->header;
> > +	struct device *dev = &ivdev->auxdev.dev;
> > +	int ret;
> > +
> > +	switch (ivdev->src) {
> > +	case INTEL_VSEC_DISC_PCI:
> > +		ret = pmt_resolve_access_pci(entry, ivdev, idx);
> > +		if (ret)
> > +			return ret;
> > +		break;
> > +	case INTEL_VSEC_DISC_ACPI:
> > +		ret = pmt_resolve_access_acpi(entry, ivdev);
> > +		if (ret)
> > +			return ret;
> > +		break;
> > +	default:
> > +		dev_err(dev, "Unknown discovery source: %d\n", ivdev->src);
> > +		return -EINVAL;
> > +	}
> > +
> >  	entry->guid = header->guid;
> >  	entry->size = header->size;
> >  	entry->cb = ivdev->priv_data;
> > @@ -370,29 +445,71 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
> >  	return ret;
> >  }
> >  
> > +static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
> > +			   struct intel_pmt_entry *entry,
> > +			   u32 headers[PMT_DISC_HEADER_DWORDS])
> > +{
> > +	struct device *dev = &ivdev->auxdev.dev;
> > +	size_t header_bytes = sizeof(entry->disc_header);
> > +
> > +	switch (ivdev->src) {
> > +	case INTEL_VSEC_DISC_PCI: {
> > +		struct resource *disc_res = &ivdev->resource[idx];
> > +		void __iomem *disc_table;
> > +
> > +		disc_table = devm_ioremap_resource(dev, disc_res);
> > +		if (IS_ERR(disc_table))
> > +			return PTR_ERR(disc_table);
> > +
> > +		/*
> > +		 * The mapped resource is sized by the namespace's DVSEC
> > +		 * entry_size (in dwords), which can be less than
> > +		 * PMT_DISC_HEADER_DWORDS (e.g. telemetry uses entry_size = 3,
> > +		 * 12 bytes). Cap the copy to resource_size() to avoid reading
> > +		 * past the mapped region; any unread dwords stay zero from
> > +		 * the zero-initialized allocation of the containing struct.
> > +		 */
> > +		memcpy_fromio(headers, disc_table,
> > +			      min_t(size_t, header_bytes,
> > +				    resource_size(disc_res)));
> > +		memcpy(entry->disc_header, headers, header_bytes);
> > +
> > +		/* Used by crashlog driver */
> > +		entry->disc_table = disc_table;
> > +
> > +		return 0;
> > +	}
> > +	case INTEL_VSEC_DISC_ACPI: {
> > +		memcpy(headers, &ivdev->acpi_disc[idx][0], header_bytes);
> > +		memcpy(entry->disc_header, headers, header_bytes);
> > +		/*
> > +		 * No MMIO mapping exists on the ACPI source path; the cached
> > +		 * headers are the only view of the discovery record. Consumers
> > +		 * that dereference disc_table (e.g. crashlog) must therefore
> > +		 * only be wired to namespaces backed by INTEL_VSEC_DISC_PCI.
> > +		 */
> > +		entry->disc_table = NULL;
> > +
> > +		return 0;
> > +	}
> > +	default:
> > +		dev_err(dev, "Unknown discovery source type: %d\n", ivdev->src);
> > +		break;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> >  int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespace *ns,
> >  			 struct intel_vsec_device *intel_vsec_dev, int idx)
> >  {
> >  	struct device *dev = &intel_vsec_dev->auxdev.dev;
> > -	struct resource	*disc_res;
> > +	u32 headers[PMT_DISC_HEADER_DWORDS];
> >  	int ret;
> >  
> > -	disc_res = &intel_vsec_dev->resource[idx];
> > -
> > -	entry->disc_table = devm_ioremap_resource(dev, disc_res);
> > -	if (IS_ERR(entry->disc_table))
> > -		return PTR_ERR(entry->disc_table);
> > -
> > -	/*
> > -	 * The mapped discovery resource may be smaller than disc_header (its
> > -	 * size is the namespace's DVSEC entry_size in dwords, which can be
> > -	 * less than 4). Cap the copy to the actual resource size to avoid
> > -	 * reading past the mapped region; any unread dwords stay zero from
> > -	 * the zero-initialized allocation of the containing struct.
> > -	 */
> > -	memcpy_fromio(entry->disc_header, entry->disc_table,
> > -		      min_t(size_t, sizeof(entry->disc_header),
> > -			    resource_size(disc_res)));
> > +	ret = pmt_get_headers(intel_vsec_dev, idx, entry, headers);
> 
> Why do you pass headers to it as this function seems to not need them?
> 
> (This could be a leftover from the common decoding approach which is no 
> longer pursued, I don't remember how it worked here).
> 
> Please also note the sashiko's uninitialized headers comment (which 
> changes assumptions made in patch 5) which I also mentioned in patch 5 
> comments. But it looks to me pmt_get_headers() could copy directly to 
> ->disc_header and avoid that problem altogether (the entry reuse still 
> looks a problem though which can leave pseudogarbage into the tail of 
> ->disc_header).

Too many concurrent projects and AI reliance. I dropped the unneeded header
and added a zero memset to just avoid any dependency on the caller doing a
zero init. Thanks.

David

> 
> -- 
>  i.
> 
> > +	if (ret)
> > +		return ret;
> >  
> >  	if (ns->pmt_pre_decode) {
> >  		ret = ns->pmt_pre_decode(intel_vsec_dev, entry);
> > diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> > index 84202fc7920c..950fa4ee300d 100644
> > --- a/drivers/platform/x86/intel/pmt/class.h
> > +++ b/drivers/platform/x86/intel/pmt/class.h
> > @@ -18,6 +18,7 @@
> >  /* PMT discovery base address/offset register layout */
> >  #define GET_BIR(v)		((v) & GENMASK(2, 0))
> >  #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
> > +#define PMT_DISC_HEADER_DWORDS INTEL_VSEC_ACPI_DISC_DWORDS
> >  
> >  struct device;
> >  struct pci_dev;
> > @@ -44,7 +45,7 @@ struct intel_pmt_entry {
> >  	struct telem_endpoint	*ep;
> >  	struct pci_dev		*pcidev;
> >  	struct intel_pmt_header	header;
> > -	u32			disc_header[4];
> > +	u32			disc_header[PMT_DISC_HEADER_DWORDS];
> >  	struct bin_attribute	pmt_bin_attr;
> >  	const struct attribute_group *attr_grp;
> >  	struct kobject		*kobj;
> > diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> > index 1fe5665a9d02..4c58a7f5031e 100644
> > --- a/include/linux/intel_vsec.h
> > +++ b/include/linux/intel_vsec.h
> > @@ -28,6 +28,7 @@
> >  #define INTEL_DVSEC_TABLE_BAR(x)	((x) & GENMASK(2, 0))
> >  #define INTEL_DVSEC_TABLE_OFFSET(x)	((x) & GENMASK(31, 3))
> >  #define TABLE_OFFSET_SHIFT		3
> > +#define INTEL_VSEC_ACPI_DISC_DWORDS	4
> >  
> >  struct device;
> >  struct pci_dev;
> > @@ -122,7 +123,7 @@ struct intel_vsec_platform_info {
> >  	struct device *parent;
> >  	struct intel_vsec_header **headers;
> >  	const struct vsec_feature_dependency *deps;
> > -	u32 (*acpi_disc)[4];
> > +	u32 (*acpi_disc)[INTEL_VSEC_ACPI_DISC_DWORDS];
> >  	enum intel_vsec_disc_source src;
> >  	void *priv_data;
> >  	unsigned long caps;
> > @@ -154,7 +155,7 @@ struct intel_vsec_device {
> >  	struct auxiliary_device auxdev;
> >  	struct device *dev;
> >  	struct resource *resource;
> > -	u32 (*acpi_disc)[4];
> > +	u32 (*acpi_disc)[INTEL_VSEC_ACPI_DISC_DWORDS];
> >  	enum intel_vsec_disc_source src;
> >  	struct ida *ida;
> >  	int num_resources;
> > 
