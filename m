Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D653C73D9;
	Fri, 22 May 2026 10:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444532; cv=none; b=rzVEWJ0q8GMJV2vlkhNa0WeEQv+1ejo91aEruI15rFKwjE14omqufz7GcpPtY6KMDavbjfKFsolbYuoaCoxWnL1X9m5cguIL97UQCTIFdMlrYtASV7PDLwpx6MOpSh27zQYMD9ljYr5YhbINeoe8ln7sn/RQcL6m+wDNthUhXMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444532; c=relaxed/simple;
	bh=GU/rMFHsGkCx/BK/K5v3KWEUk8acw/9O5xUbdUFwPhM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EaZhM2d2Hi+ppGx110yrZW8XKbnRnkDLTi53MbrrGt+zLx3t7BIGa//6gjA2B7nTgDkrb+c1LZhzslkEQRYM3Xpm/xTo5xG/KksvKdNtC2ijgldNmEUeftJ7LroZzwHGoSxJ54PuEPGc9XR9j8D+zMuMI/WuOnyPzj3daaLaJmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyPJ7Xwd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyPJ7Xwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779444532; x=1810980532;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GU/rMFHsGkCx/BK/K5v3KWEUk8acw/9O5xUbdUFwPhM=;
  b=nyPJ7Xwd4AUHi3ZOzgZKd7tXbHf3SJf0lRgQCTfaHm3E9dmktnPQO+3W
   uq7rWSj2eI3AjxMh4qA/lQIJPkTZpAB23my6owyZOh52RhYRpO1xa4vc0
   ieBAcBhUomuYCJvEjE6T/MDpC7CGAU/Kk6z41+TDekZ7cvjSXSNt93OCS
   ZSLOi0K3So/XB5Djg4y6NOJJk9p7J8qR49hRIU4w/O3DZtXKp7GVSa9Mn
   TPYekR5CwXn2de9K1oo/YPZhRw7LcjVe8DTrUgZmazZUJ4s2JK2sJSt0D
   qjLhfSj/o41ibG598B6A5YDn9FeUaag6U5HUVy/MoTnrwLweZVmNqrud5
   g==;
X-CSE-ConnectionGUID: w/ThnK0RQnOqdpkztkYLVg==
X-CSE-MsgGUID: +fkS36SmTXa8hPGAP8QN+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80341863"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80341863"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:08:51 -0700
X-CSE-ConnectionGUID: TTkTyHn+QrS8P7cAIQCIbQ==
X-CSE-MsgGUID: h3+jf1DRRQKb7rzK2u1phw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="245935887"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:08:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 13:08:45 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Xi Pardee <xi.pardee@linux.intel.com>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v5 05/16] platform/x86/intel/pmt: Cache the telemetry
 discovery header
In-Reply-To: <20260522022147.4137494-6-david.e.box@linux.intel.com>
Message-ID: <e4652b97-c527-a3b8-9190-5c67c83cbeb2@linux.intel.com>
References: <20260522022147.4137494-1-david.e.box@linux.intel.com> <20260522022147.4137494-6-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 May 2026, David E. Box wrote:

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

sashiko seems to not agree with it being always zero-initialized and 
to me it looks there's some merit to that because of pmt_telem_probe() 
code reusing entry:

        for (i = 0; i < intel_vsec_dev->num_resources; i++) {
                struct intel_pmt_entry *entry = &priv->entry[priv->num_entries];

                mutex_lock(&ep_lock);
                ret = intel_pmt_dev_create(entry, &pmt_telem_ns, intel_vsec_dev, i);
                mutex_unlock(&ep_lock);
                if (ret < 0)
                        goto abort_probe;
                if (ret)
                        continue;

                priv->num_entries++;

With the subsequent change to u32 headers[PMT_DISC_HEADER_DWORDS];
in the next patch, the array will not be in zero-initialized state at 
all AFAICT.

> This keeps the telemetry header decode path independent of how the
> discovery data is backed and avoids baking a direct MMIO assumption into
> the feature-specific decode logic.
> 
> Assisted-by: GitHub-Copilot:claude-opus-4.7
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
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
>  drivers/platform/x86/intel/pmt/class.c     | 11 +++++++++++
>  drivers/platform/x86/intel/pmt/class.h     |  1 +
>  drivers/platform/x86/intel/pmt/telemetry.c | 12 ++++++------
>  3 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index 7da8279b54f8..246e11837800 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -383,6 +383,17 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespa
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

You forgot to add include for min_t(). Please add it before module.h (even 
if the includes are not fully in alphabetical order atm).

> +			    resource_size(disc_res)));
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

