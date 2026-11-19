Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118781;
	b=hyAfK9xyKaDHBxAs3r1RITC2zgm0RlsXOjfcPnaFqGItN638RxaeDkyBa3bKaYrJuvJ5
	 0t4qz7lhRp3pEC2BOG50TtbmbtPw4Qp/WMWDunmGRBof9rD16Jf+NzldnuK810n5jA2l7
	 75LTQE4ciD7v45eBvOyaiwnQfLxVDnZmMuGXv+a03+CQK0XSvhHH5wI11tnB07Vlj9sAK
	 EDSVnxq68DQoIg2cfuZFCQWFH59GojhcQmeaYiqYgo8+l9OCYTzmRxqAiu2b/WYcGULHk
	 S/4DtoDXQmZFCfscTH3HoqxyDAEfyM1UTQk3AU8Uuz0eJbwgBgSTqaZTg5aDtQjhJZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118781;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wu1CvrUICSbkFrhJ2A1a2S5M/9R0urNxXACOQZxZAko=;
	b=GxpsSrWeRRLGr1ceULH01fuFrty7SOV/Amzo5Y7S2rzS+5IXsGSIsUsx7XPFiskacRDq
	 JA1J4kpal/3pHj12INnfCrpJs7lrNkZgX8eXbZGDdsnnxd5iuJwvA46gTnQ1iBGhi9hGl
	 3i+Aht7FvQGzb19tNVnC7bcK4z2ZqFI00mSsiyhdWDsfuG4ZKjn2gO/Ir3xdf0uBB6GKQ
	 eA9dtOBLTlDxIVb9Qtl7RDj02zGNLqyLth0fOBHoqfb2trISJbbfdqBCOb+/AkrD5Xh9z
	 zXfMsDAj4V0pokOP5SfD89mntwM/9hfUf9rJwne6UA+Ac0blmAA+32010yhiY8n5C/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iMvwbD2H;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828A5606A320
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 20:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 828A5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iMvwbD2H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795118781; x=1826654781;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vsR2EGP7SeexplW+kxReTrZsPbOybEyDEK433F6aF/I=;
  b=iMvwbD2HQp1vAR3XAMt3bcSVeBb86E29jBVxujQt92rUR3qybTX2eM+h
   VpdO+SXTJFzt6EVYOSpjMmqGtWpQsfCi8PtOpL85O+Xh66BEes6c4K9rv
   nRoaGa+2TQoDwf7UdY6Es4P9nwRMw8b1Elg3hu8zXAWCQAMzKUgnti0my
   kJKqo8p8+yB67965RrwGTwe8mcqGy7mARfXqyatg5P7jLA/2CPszfmapq
   cIhhmDcmxQYXIRVbU10KZeiOAswmRznw80Q+wPZkJvPhJULgdNNUDQl1V
   1Ai+Y1IUFAC+KaqGFG7lSAPFXcJ4dyE5ROOhd2/N53rQUE8gaTPdFxY5Q
   g==;
X-CSE-ConnectionGUID: UGNucUdNQlumKpIlgYkn6g==
X-CSE-MsgGUID: RqZ/OK0tQESRYhmUh/Q1Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4004231"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4004231"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:06:20 -0800
X-CSE-ConnectionGUID: 426KpIHTTcCmYUzosU5wCw==
X-CSE-MsgGUID: /QC5P606SO+Og54tJIqJyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12374082"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:06:20 -0800
Date: Thu, 19 Nov 2026 12:06:19 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com, 
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, airlied@gmail.com, 
	simona@ffwll.ch, anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
	matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: Re: [PATCH v19 01/19] platform/x86/intel/pmt: Introduce a callback
 for discovery data
Message-ID: <av9VBvyYtp_XmAMZ@debox1-desk4>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
 <20261119155438.40762-22-michael.j.ruhl@intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119155438.40762-22-michael.j.ruhl@intel.com>

Hi Mike,


On Thu, Nov 19, 2026 at 07:54:39AM -0800, Michael J. Ruhl wrote:
> Some devices require special handling to access discovery data.
>
> Provide a callback to allow for the special handling.

The commit message could say why the handling is needed: On CRI the
discovery entries sit behind the shared PMT window, so a direct read
from the PMT drivers isn't safe, and the entry is identified by
capability and index because its GUID isn't known until it has been
read.

>
> Suggested-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/class.c | 18 ++++++++++++------
>  include/linux/intel_vsec.h             |  6 ++++++
>  2 files changed, 18 insertions(+), 6 deletions(-)
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

The resource_size() cap only applies to the MMIO path, so the callback
is expected to fill exactly PMT_DISC_DWORDS dwords. Fine for CRI, but
please document that (see below), since there's no length argument.

>  	}
>  	case INTEL_VSEC_DISC_ACPI: {
>  		memcpy(entry->disc_header, &ivdev->acpi_disc[idx][0], header_bytes);
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 8686e79c4f75..400231989b49 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -94,6 +94,11 @@ enum intel_vsec_quirks {
>   * * data:  buffer for the data to be copied
>   * * off:   offset into the requested buffer
>   * * count: size of buffer
> + * @read_discovery: when specified called by client driver to read PMT discovery structs
> + * * dev:     device reference for the callback's use
> + * * cap_id: telem, crashlog, etc, ilog2 of VSEC_CAP value
> + * * idx:     element to access
> + * * disc_data:  buffer for the discovery data to be copied

A few things for the kernel-doc:

- disc_data: say it holds PMT_DISC_DWORDS dwords.

- idx: say it is the index of the entry within its capability header,
  as enumerated by intel_vsec_register().

- The sub-items are not aligned

>   * @read_reg: when specified called by client driver to read PMT state
>   * * dev:      device reference for the callback's use
>   * * guid:     ID of data to access
> @@ -107,6 +112,7 @@ enum intel_vsec_quirks {
>   */
>  struct pmt_callbacks {
>  	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
> +	int (*read_discovery)(struct device *dev, unsigned long cap_id, u32 idx, u32 *disc_data);
>  	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offset);
>  	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offset);
>  };

Most important, please document the calling context. With this change
the callbacks can be called from the client driver's probe, which is
what the crashlog notification relies on. Something like this after
the member list:

 * The callbacks may be called from the client driver's probe and remove
 * paths. A parent must not hold a lock taken by its callbacks across
 * the registration path or while its devices are being removed.

David
