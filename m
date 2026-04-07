Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AA23A3E73;
	Tue,  7 Apr 2026 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559925; cv=none; b=hHLtw+9zqnuy+Mq2GrGxXDEfgVArOtB1MtZFcWN8cgTPfhRJBsG0ZJ9awLhaWkQD1hjdrvGXc9Eir88HfIkTZjn3nEgUhinlfVzGw0F4BbUpBvjQBfSHqPXOGCT/bTjVxRavIK1G66/TN+s9BxU9KoOFRyeOtK+xV822r0quQS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559925; c=relaxed/simple;
	bh=3xtFcrZzJQsUS111TKXmprxHxr7KKjI+rNCVkNW7KTQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dtyqOFZyVTad6BUU+82ObOCTEWw66Y8p1gO2/W/qLqC5gWEOX/GHxlZlIT8CSPFFHxjz/6g7oLaBMKOxbCmBSVcWEn7BHXfC6v4c0QxhN/7GCdGbxcmkAZspTMoyESxCAHEG07O5dY29vd8cjyGLOJzrYL1QKrcjKk1SZLWSoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miHzUuSe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miHzUuSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775559924; x=1807095924;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3xtFcrZzJQsUS111TKXmprxHxr7KKjI+rNCVkNW7KTQ=;
  b=miHzUuSelU74r9o6Vl+PSpoa/Q7qE44b+87fjn9bhINNQnQ+4ur2i9fT
   qPvgjPqDML2olqMlhOyY7m5NmRE6Oeg531v42/C4BHHKnu4WENaB43I/h
   SdkQhryK6cE6sBpu2IzxTIg98geYp8oVOmLxL6hB+ts/tPGIh6LoIYvmH
   vg29KgDBuVHphr/hXbHoJ1jXmRbLICV5m5LQhAcNeJ0KkidZxSFjGT+5e
   gD7LEMCL/AsU6aurYzDnXPP6g3o+Wy5y2PwMAuE7ef5iq5oEUot9Z+VF4
   VAeKRngZWNf3IOgNJurdaxsjs0SvtLOEbNj5aWyrVs7DX6QZ76aqM/hpi
   Q==;
X-CSE-ConnectionGUID: lnDf5GrsTpGoNGwlKlmXMQ==
X-CSE-MsgGUID: /0EEhd2eQmmzb9+CwJLnwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80378147"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="80378147"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 04:05:24 -0700
X-CSE-ConnectionGUID: 7YKd/krjRC22VjUFGX9D+g==
X-CSE-MsgGUID: 1y7YEyv/SqiufhResH0dfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228075415"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 04:05:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 14:05:17 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V2 04/17] platform/x86/intel/pmt: Move header decode into
 common helper
In-Reply-To: <20260325014819.1283566-5-david.e.box@linux.intel.com>
Message-ID: <c82ac37a-6e83-7c1e-bc60-22c9d7e27c24@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com> <20260325014819.1283566-5-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Mar 2026, David E. Box wrote:

> Unify PMT discovery table parsing by moving header decode logic into the
> class driver. A new helper, pmt_read_header(), now fills in the standard
> header fields from the discovery table, replacing the per-namespace
> pmt_header_decode callbacks in telemetry and crashlog.
> 
> This centralizes the discovery table bit-field definitions in class.h,
> removes duplicate decode code from telemetry and crashlog, and prepares the
> PMT class for additional discovery sources.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> 
> V2 changes:
> - Added PMT_GET_SIZE_BYTES(v), addressing Ilpo feedback on macro naming
>   and unit clarity
> - Also in PMT_GET_SIZE_BYTES(v) change ((v) << 2) to ((v) * sizeof(u32))
>   for clarity
> - Removed unused macros from crashlog.c per feedback from Ilpo
> 
>  drivers/platform/x86/intel/pmt/class.c     | 37 +++++++++++++++-------
>  drivers/platform/x86/intel/pmt/class.h     | 15 +++++++--
>  drivers/platform/x86/intel/pmt/crashlog.c  | 23 --------------
>  drivers/platform/x86/intel/pmt/telemetry.c | 26 ---------------
>  4 files changed, 39 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index 9b315334a69b..d652b21261f0 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -8,6 +8,7 @@
>   * Author: "Alexander Duyck" <alexander.h.duyck@linux.intel.com>
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/kernel.h>
>  #include <linux/log2.h>
>  #include <linux/intel_vsec.h>
> @@ -368,26 +369,40 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  	return ret;
>  }
>  
> -int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespace *ns,
> -			 struct intel_vsec_device *intel_vsec_dev, int idx)
> +static int pmt_read_header(struct intel_vsec_device *ivdev, int idx,
> +			   struct intel_pmt_entry *entry)
>  {
> -	struct device *dev = &intel_vsec_dev->auxdev.dev;
> -	struct resource	*disc_res;
> -	int ret;
> +	struct intel_pmt_header *header = &entry->header;
> +	struct device *dev = &ivdev->auxdev.dev;
> +	u64 headers[2];
>  
> -	disc_res = &intel_vsec_dev->resource[idx];
> -
> -	entry->disc_table = devm_ioremap_resource(dev, disc_res);
> +	entry->disc_table = devm_ioremap_resource(dev, &ivdev->resource[idx]);
>  	if (IS_ERR(entry->disc_table))
>  		return PTR_ERR(entry->disc_table);
>  
> +	memcpy_fromio(headers, entry->disc_table, 2 * sizeof(u64));
> +
> +	header->access_type = FIELD_GET(PMT_ACCESS_TYPE, headers[0]);
> +	header->telem_type = FIELD_GET(PMT_TELEM_TYPE, headers[0]);
> +	header->size = PMT_GET_SIZE_BYTES(headers[0]);

Hi David,

There might be something I'm missing that is not apparent from the code 
alone, but when I look the old code in pmt_crashlog_header_decode(), it 
has this:

#define SIZE_OFFSET            0xC
...
	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));

...I can't understand how this transformation is equivalent as it was 
previously read from 0xC which would belong into header[1], right?

I think it warrants an explanation in changelog if it's an intended 
change.

-- 
 i.

> +	header->guid = FIELD_GET(PMT_GUID32, headers[0]);
> +	header->base_offset = FIELD_GET(PMT_BASE_OFFSET, headers[1]);
> +
> +	return 0;
> +}
> +
> +int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespace *ns,
> +			 struct intel_vsec_device *intel_vsec_dev, int idx)
> +{
> +	int ret;
> +
>  	if (ns->pmt_pre_decode) {
>  		ret = ns->pmt_pre_decode(intel_vsec_dev, entry);
>  		if (ret)
>  			return ret;
>  	}
>  
> -	ret = ns->pmt_header_decode(entry, dev);
> +	ret = pmt_read_header(intel_vsec_dev, idx, entry);
>  	if (ret)
>  		return ret;
>  
> @@ -397,11 +412,11 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespa
>  			return ret;
>  	}
>  
> -	ret = intel_pmt_populate_entry(entry, intel_vsec_dev, disc_res);
> +	ret = intel_pmt_populate_entry(entry, intel_vsec_dev, &intel_vsec_dev->resource[idx]);
>  	if (ret)
>  		return ret;
>  
> -	return intel_pmt_dev_register(entry, ns, dev);
> +	return intel_pmt_dev_register(entry, ns, &intel_vsec_dev->auxdev.dev);
>  }
>  EXPORT_SYMBOL_NS_GPL(intel_pmt_dev_create, "INTEL_PMT");
>  
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index 8a0db0ef58c1..96ebb15f0053 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -11,6 +11,19 @@
>  
>  #include "telemetry.h"
>  
> +/* PMT Discovery Table DWORD 1 */
> +#define PMT_ACCESS_TYPE		GENMASK_ULL(3, 0)
> +#define PMT_TELEM_TYPE		GENMASK_ULL(7, 4)
> +#define PMT_SIZE		GENMASK_ULL(27, 12)
> +#define PMT_GUID32		GENMASK_ULL(63, 32)
> +
> +/* PMT Discovery Table DWORD 2 */
> +#define PMT_BASE_OFFSET		GENMASK_ULL(31, 0)
> +#define PMT_TELE_ID		GENMASK_ULL(63, 32)
> +
> +/* Convert DWORD size to bytes */
> +#define PMT_GET_SIZE_BYTES(h)	((FIELD_GET(PMT_SIZE, h)) * sizeof(u32))
> +
>  /* PMT access types */
>  #define ACCESS_BARID		2
>  #define ACCESS_LOCAL		3
> @@ -61,8 +74,6 @@ struct intel_pmt_entry {
>  struct intel_pmt_namespace {
>  	const char *name;
>  	struct xarray *xa;
> -	int (*pmt_header_decode)(struct intel_pmt_entry *entry,
> -				 struct device *dev);
>  	int (*pmt_pre_decode)(struct intel_vsec_device *ivdev,
>  			      struct intel_pmt_entry *entry);
>  	int (*pmt_post_decode)(struct intel_vsec_device *ivdev,
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index f936daf99e4d..ef1826b15cf4 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -26,14 +26,8 @@
>  
>  /* Crashlog Discovery Header */
>  #define CONTROL_OFFSET		0x0
> -#define GUID_OFFSET		0x4
> -#define BASE_OFFSET		0x8
> -#define SIZE_OFFSET		0xC
> -#define GET_ACCESS(v)		((v) & GENMASK(3, 0))
>  #define GET_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
>  #define GET_VERSION(v)		(((v) & GENMASK(19, 16)) >> 16)
> -/* size is in bytes */
> -#define GET_SIZE(v)		((v) * sizeof(u32))
>  
>  /*
>   * Type 1 Version 0
> @@ -516,28 +510,11 @@ static int pmt_crashlog_pre_decode(struct intel_vsec_device *ivdev,
>  	return 0;
>  }
>  
> -static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
> -				      struct device *dev)
> -{
> -	void __iomem *disc_table = entry->disc_table;
> -	struct intel_pmt_header *header = &entry->header;
> -
> -	header->access_type = GET_ACCESS(readl(disc_table));
> -	header->guid = readl(disc_table + GUID_OFFSET);
> -	header->base_offset = readl(disc_table + BASE_OFFSET);
> -
> -	/* Size is measured in DWORDS, but accessor returns bytes */
> -	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
> -
> -	return 0;
> -}
> -
>  static DEFINE_XARRAY_ALLOC(crashlog_array);
>  static struct intel_pmt_namespace pmt_crashlog_ns = {
>  	.name = "crashlog",
>  	.xa = &crashlog_array,
>  	.pmt_pre_decode = pmt_crashlog_pre_decode,
> -	.pmt_header_decode = pmt_crashlog_header_decode,
>  };
>  
>  /*
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
> index d22f633638be..80773e3c3efa 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -27,14 +27,6 @@
>  
>  #include "class.h"
>  
> -#define TELEM_SIZE_OFFSET	0x0
> -#define TELEM_GUID_OFFSET	0x4
> -#define TELEM_BASE_OFFSET	0x8
> -#define TELEM_ACCESS(v)		((v) & GENMASK(3, 0))
> -#define TELEM_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
> -/* size is in bytes */
> -#define TELEM_SIZE(v)		(((v) & GENMASK(27, 12)) >> 10)
> -
>  /* Used by client hardware to identify a fixed telemetry entry*/
>  #define TELEM_CLIENT_FIXED_BLOCK_GUID	0x10000000
>  
> @@ -69,23 +61,6 @@ static bool pmt_telem_region_overlaps(struct device *dev, u32 guid, u32 type)
>  	return false;
>  }
>  
> -static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
> -				   struct device *dev)
> -{
> -	void __iomem *disc_table = entry->disc_table;
> -	struct intel_pmt_header *header = &entry->header;
> -
> -	header->access_type = TELEM_ACCESS(readl(disc_table));
> -	header->guid = readl(disc_table + TELEM_GUID_OFFSET);
> -	header->base_offset = readl(disc_table + TELEM_BASE_OFFSET);
> -
> -	/* Size is measured in DWORDS, but accessor returns bytes */
> -	header->size = TELEM_SIZE(readl(disc_table));
> -	header->telem_type = TELEM_TYPE(readl(entry->disc_table));
> -
> -	return 0;
> -}
> -
>  static int pmt_telem_post_decode(struct intel_vsec_device *ivdev,
>  				 struct intel_pmt_entry *entry)
>  {
> @@ -135,7 +110,6 @@ static DEFINE_XARRAY_ALLOC(telem_array);
>  static struct intel_pmt_namespace pmt_telem_ns = {
>  	.name = "telem",
>  	.xa = &telem_array,
> -	.pmt_header_decode = pmt_telem_header_decode,
>  	.pmt_post_decode = pmt_telem_post_decode,
>  	.pmt_add_endpoint = pmt_telem_add_endpoint,
>  };
> 
