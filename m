Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65842312826;
	Wed, 10 Jun 2026 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095492; cv=none; b=je8zfLJHsrTTY/P/Sc0/IP+kYvy/wR/RXf8gf8akOk5A/m0Cw+L/f4RIi3zkdGF9t6Sbt+6wmpi8gj0gPH1ySNGdVFYgQf4uWxQqXORQgL7HWrjAvvXdJP96e6sRYzzX5rTE02GNqVF/LwOhCLUvPBuKz7xJ8tX//in6NGtw/k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095492; c=relaxed/simple;
	bh=awaqJM2vkM2379GX8wlCePQaPeHMcu+BJu3pUenZ9Wo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nftnuFtsKsogIK1ym4KpSSYaz0CS3gE0rjgApEmvTeqFRFqdPmfjXXPRKn4/8tnhIch6ymbzvnA4nN+0VErJzIF9gIK6J/Ut5QJ8FkYdn6q8Ti8Zr7pejnfDwenWaeLY19J2cGcs3MQupxxxswPpHESb6Naq55W4AzBAe+RBvP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlpH4j1W; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlpH4j1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781095492; x=1812631492;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=awaqJM2vkM2379GX8wlCePQaPeHMcu+BJu3pUenZ9Wo=;
  b=QlpH4j1W3rP4zNxNYybQY76tYlT49sxBRgENkxSUjYRriLw17NPu689C
   7y94oh3cqdfJYEJGUoAqz99o8uwpJrUQag1GvSffETWLe4+bwv9mqpnoU
   XZOjXjrJj6cZbKIO6Q7KaarMaMlWHjyxlevZo0Egi1P5tvW3zMC5BUknu
   vsnwVj2qA9qz8aliLy+DQ20pemHqcTDUlog+Y+K+jmUxHQB1mmNKWlM58
   YsVV9RTIK3C8Hiah3HMZmrdf1MqGuISbzjJeI/9HNhu96CC6b9HNbgTQ+
   P+KPAJkTikczwk6SF4fcVQS/Wyv2PptdGDKpoCSyCq2Iv3DZW8RbFsFnh
   Q==;
X-CSE-ConnectionGUID: YdH86aHZR0iTv7XxW0LqoQ==
X-CSE-MsgGUID: 10JTSuYPSEy7JkvV2XwEwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92205680"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92205680"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 05:44:51 -0700
X-CSE-ConnectionGUID: m/Qod7NdRHmYQbTkuYqDbg==
X-CSE-MsgGUID: wHDLezu+SJuhMt1/exKcYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="242024676"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 05:44:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 15:44:44 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: Hans de Goede <hansg@kernel.org>, irenic.rajneesh@gmail.com, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    srinivas.pandruvada@linux.intel.com, xi.pardee@linux.intel.com
Subject: Re: [PATCH v6 05/15] platform/x86/intel/pmt: Cache the telemetry
 discovery header
In-Reply-To: <6337062b826c4169eb48389ed581a4fe6085c409.1780248804.git.david.e.box@linux.intel.com>
Message-ID: <df8c3d8f-a1ab-6cc6-022b-63f33da2e884@linux.intel.com>
References: <cover.1780248804.git.david.e.box@linux.intel.com> <6337062b826c4169eb48389ed581a4fe6085c409.1780248804.git.david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 31 May 2026, David E. Box wrote:

> pmt_telem_header_decode() only needs the discovery header dwords, but it
> currently decodes them by reading directly from entry->disc_table.
> 
> Cache the discovery header in intel_pmt_entry when the device is created
> and have telemetry decode use the cached values instead of performing MMIO
> reads at decode time.
> 
> The DVSEC discovery resource for a namespace is sized by its per-entry
> entry_size (in dwords), which can be less than the 4-dword cache (e.g.
> telemetry uses entry_size = 3, i.e. 12 bytes). Cap the memcpy_fromio()
> to resource_size(disc_res) so the new cache does not read past the
> mapped region. Any unread dwords stay zero from the zero-initialized
> allocation of the containing struct.
> 
> This keeps the telemetry header decode path independent of how the
> discovery data is backed and avoids baking a direct MMIO assumption into
> the feature-specific decode logic.
> 
> Assisted-by: GitHub-Copilot:claude-opus-4.7
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> V6 changes:
>   - Added #include <linux/minmax.h> for min_t() macro used in
>     memcpy_fromio() size calculation (Ilpo).
> 
> V5 changes:
>   - Cap memcpy_fromio() of the cached discovery header to
>     resource_size(disc_res) so the newly introduced cache does not
>     over-read namespaces whose DVSEC entry_size is smaller than the
>     cache (e.g. telemetry has entry_size = 3, 12 bytes).
> 
> V4 - No changes
> 
> V3 changes:
>   - New patch split out from PMT header-fetch rework to cache discovery
>     header data before downstream decode/population.
>   - Added to carry the post-v3 bug fix while preserving the original series
>     ordering intent.
> 
>  drivers/platform/x86/intel/pmt/class.c     | 12 ++++++++++++
>  drivers/platform/x86/intel/pmt/class.h     |  1 +
>  drivers/platform/x86/intel/pmt/telemetry.c | 12 ++++++------
>  3 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index 7da8279b54f8..44a0a52014fc 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -12,6 +12,7 @@
>  #include <linux/log2.h>
>  #include <linux/intel_vsec.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/pci.h>
> @@ -383,6 +384,17 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespa
>  	if (IS_ERR(entry->disc_table))
>  		return PTR_ERR(entry->disc_table);
>  
> +	/*
> +	 * The mapped discovery resource may be smaller than disc_header (its
> +	 * size is the namespace's DVSEC entry_size in dwords, which can be
> +	 * less than 4). Cap the copy to the actual resource size to avoid
> +	 * reading past the mapped region; any unread dwords stay zero from
> +	 * the zero-initialized allocation of the containing struct.
> +	 */
> +	memcpy_fromio(entry->disc_header, entry->disc_table,
> +		      min_t(size_t, sizeof(entry->disc_header),
> +			    resource_size(disc_res)));

I seem to have missed earlier that both of these are size_t already, so 
min() should suffice.

> +
>  	if (ns->pmt_pre_decode) {
>  		ret = ns->pmt_pre_decode(intel_vsec_dev, entry);
>  		if (ret)
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index 8a0db0ef58c1..84202fc7920c 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -44,6 +44,7 @@ struct intel_pmt_entry {
>  	struct telem_endpoint	*ep;
>  	struct pci_dev		*pcidev;
>  	struct intel_pmt_header	header;
> +	u32			disc_header[4];
>  	struct bin_attribute	pmt_bin_attr;
>  	const struct attribute_group *attr_grp;
>  	struct kobject		*kobj;
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
> index d22f633638be..953f35b6daec 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -72,16 +72,16 @@ static bool pmt_telem_region_overlaps(struct device *dev, u32 guid, u32 type)
>  static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
>  				   struct device *dev)
>  {
> -	void __iomem *disc_table = entry->disc_table;
>  	struct intel_pmt_header *header = &entry->header;
> +	u32 *disc_header = entry->disc_header;
>  
> -	header->access_type = TELEM_ACCESS(readl(disc_table));
> -	header->guid = readl(disc_table + TELEM_GUID_OFFSET);
> -	header->base_offset = readl(disc_table + TELEM_BASE_OFFSET);
> +	header->access_type = TELEM_ACCESS(disc_header[0]);
> +	header->guid = disc_header[1];
> +	header->base_offset = disc_header[2];
>  
>  	/* Size is measured in DWORDS, but accessor returns bytes */
> -	header->size = TELEM_SIZE(readl(disc_table));
> -	header->telem_type = TELEM_TYPE(readl(entry->disc_table));
> +	header->size = TELEM_SIZE(disc_header[0]);
> +	header->telem_type = TELEM_TYPE(disc_header[0]);
>  
>  	return 0;
>  }
> 

-- 
 i.

