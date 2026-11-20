Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210158;
	b=bmROtOUBx1MBuxYqR6pnqKVRsRZfXjKBlY+XK22pgPgTpgdZpiVCPFUthI5PiHDwjgBG
	 CiAiHi1CcCEuZq//dSim9NuMsLbcqVGNma6In5NtZLnOcrl5BXg8n6nvU01JvXflwjbpH
	 mETD8wK+ZGNcBdXusXHDaQjp/1t5Uz8nFoQcNxusDS9jBDZXdOIsTZp9wHlNBzkx8Z5q6
	 iyiLw+PqEt40O+TPkF4waz74CWFQRV8qZ3jq8bnbxjOpmiVtjKY4WplpZsEpSS5Oh4plt
	 NvIBuKCTZDrZBCFmCkQTU/gb+SFU49ZnzL/nVZsk2G0TDkDtKkfzQimKIog/ekcXYIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210158;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=cBUotwN9lysnDFycErFiE+uhGygZ/ElvmmiMOUsxP2o=;
	b=22Dq/BM46HtQrfeFszv3KlvytHgvtGpZJQ9/GeRks2puYXYtBHEEBhbpsbURaVFhVLSI
	 HmWqZWpfsueiUwSk5Fn5di9u1lClqKLzmo6jDkjeBQPU9yKOtlf7qIPvNQezUe8duYFvT
	 1QyXBYXrxXNZhJzB2dPfTGaxmpGe2NE4pzSJDOavdTXA3VvQbYBdSeMEIfWMDCJmjUyxM
	 uPZIa2roe+o33Vl1imEePKod4LUXmCxmMcDu/G3KW7LjRMytrnR70+FMk6DyRHKE+R3pg
	 KdOS/lf0kd7NOdw4siKeVaHnTn8yBP+R55m875489RUsV+aDvOl+6cPhSx0jU/k5EUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NYmTBkCT;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A26606A6A8
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 21:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A26606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NYmTBkCT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795210156; x=1826746156;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=P+V8BShP0v43QyYe4tSw+7bDk9/zDSvgValQXrjXTr8=;
  b=NYmTBkCTYRRQJEBfB/G6/g7SC/yMRyQJmrEqVslGZpSVxWEHJ/XcnLRk
   /6F1DIYGB9B10EHyK58zhPhNfhNoj5eYnccKHTS9gOOw6aBOIbEj15eoE
   oH4ncsOq6p+6/OOWglE01OdGAf98dS24locSCgR7OjyoNfaWjehgtXSYz
   ABWIWCrSSmDR0oyDoJhveUrAsp8PmaNffyx1sL6O8hxlQD8yV07Lmpfgt
   0jHlxaU77b8ryibkayqkKViNZDhh6bPn+8X09R3A9wVdMx6LKvSgi3R4X
   JCmnjmDUSnM+KHieU9jfId0GRD3uBjILxZSHuuasRPpphnzzqz14U2g6g
   g==;
X-CSE-ConnectionGUID: pLf5CgvuQaKTAEHYwWSDiA==
X-CSE-MsgGUID: B+6E8uFfQtmYZOULcFrDvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3986716"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3986716"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 13:29:09 -0800
X-CSE-ConnectionGUID: fZgIaiAsRTC2uwelP45D5A==
X-CSE-MsgGUID: Nj92JNr2TWuB49Mj6z4mKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10687141"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 13:29:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 20 Nov 2026 23:29:00 +0200 (EET)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: Re: [PATCH v21 01/19] platform/x86/intel/pmt: Introduce a callback
 for discovery data
In-Reply-To: <20261120205540.1220643-22-michael.j.ruhl@intel.com>
Message-ID: <07de3fd3-c7bb-74f2-9f3c-72c79271aed0@linux.intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com> <20261120205540.1220643-22-michael.j.ruhl@intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Nov 2026, Michael J. Ruhl wrote:

> Some devices require special handling to access discovery data.
> 
> Crescent Island GPUs have a windowed access to discovery and data.
> Because of this, direct access to the devices MMIO space can be unsafe.
> 
> A further difficuly is the read_data path requires a GUID which will
> not be known until after discovery, so the current read_data callback
> cannot be used.
> 
> Provide a callback that uses the capbility and disocvery index, for

typo x2.

> reading discovery data.
> 
> Reviewed-by: David E. Box <david.e.box@linux.intel.com>
> Suggested-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/class.c | 18 ++++++++++++------
>  include/linux/intel_vsec.h             | 10 ++++++++++
>  2 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index 2b11c4012f6a..601cdf68f0bc 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -466,12 +466,17 @@ static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
>  	switch (ivdev->src) {
>  	case INTEL_VSEC_DISC_PCI: {
>  		struct resource *disc_res = &ivdev->resource[idx];
> +		struct pmt_callbacks *cb = ivdev->priv_data;
>  		void __iomem *disc_table;
> +		int ret = 0;
>  
>  		disc_table = devm_ioremap_resource(dev, disc_res);
>  		if (IS_ERR(disc_table))
>  			return PTR_ERR(disc_table);
>  
> +		/* Used by crashlog driver */
> +		entry->disc_table = disc_table;
> +
>  		/*
>  		 * The mapped resource is sized by the namespace's DVSEC
>  		 * entry_size (in dwords), which can be less than the default
> @@ -480,13 +485,14 @@ static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
>  		 * region.
>  		 */
>  		memset(entry->disc_header, 0, header_bytes);
> -		memcpy_fromio(entry->disc_header, disc_table,
> -			      min(header_bytes, resource_size(disc_res)));
> -
> -		/* Used by crashlog driver */
> -		entry->disc_table = disc_table;
>  
> -		return 0;
> +		if (cb && cb->read_discovery)
> +			ret = cb->read_discovery(ivdev->dev, ivdev->cap_id, idx,
> +						 entry->disc_header);
> +		else
> +			memcpy_fromio(entry->disc_header, disc_table,
> +				      min(header_bytes, resource_size(disc_res)));
> +		return ret;
>  	}
>  	case INTEL_VSEC_DISC_ACPI: {
>  		memcpy(entry->disc_header, &ivdev->acpi_disc[idx][0], header_bytes);
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 8686e79c4f75..e4afdb6478e3 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -94,6 +94,11 @@ enum intel_vsec_quirks {
>   * * data:  buffer for the data to be copied
>   * * off:   offset into the requested buffer
>   * * count: size of buffer
> + * @read_discovery: when specified called by client driver to read PMT discovery structs
> + * * dev:       device reference for the callback's use
> + * * cap_id:    ilog2 of VSEC_CAP value
> + * * idx:       index to access based on the capability header enumerated by intel_vsec_register()
> + * * disc_data: PMT_DISC_DWORDS dword sized buffer for the discovery data to be copied
>   * @read_reg: when specified called by client driver to read PMT state
>   * * dev:      device reference for the callback's use
>   * * guid:     ID of data to access
> @@ -104,9 +109,14 @@ enum intel_vsec_quirks {
>   * * guid:     ID of data to access
>   * * reg_data: register data
>   * * offset:   offset of register to write
> + *
> + * NOTE: Callbacks may be called from the client driver's probe and remove paths.
> + *       A parent MUST not hold a lock taken by the callbacks across the registration
> + *       path or while its devices are being removed.
>   */
>  struct pmt_callbacks {
>  	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
> +	int (*read_discovery)(struct device *dev, unsigned long cap_id, u32 idx, u32 *disc_data);
>  	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offset);
>  	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offset);
>  };
> 

-- 
 i.

