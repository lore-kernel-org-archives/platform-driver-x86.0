Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200419;
	b=KJlHntOq1jtN4oxqr1N/Ag1kgbNDR7LQ9pvg83E1yLjRA+ov/zNa29NLppXEd/5dU+hK
	 9yGhZ96Uh9cejru5vuBzMjEeTzA4x//X/eIG0i5OMcaQwGhH5JAX03X1Ualj7bOVBrEJg
	 OvZbB3Xg/qVJLvledIE1yME7n3TeFKA1hGEKRTM0EkCVB2PIU9CiykTjzTBufxq3UR54m
	 WB+RY1BYaTlT7WpoWyFmxr326u7WTwMCYa6Jzlo5eDolOWLb1oMhaePyjd+kr4XjolFfF
	 n04fI5lgzP9ukmIRRUIeFBtGm8UkxjTvxPrxfr7sv1+5lkgzy2NwbZeIXU7RlTIxvqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200419;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ia0x+pACF1K9HCuLkZWWac0M+ogoPX3ZfNj2OaZa2OA=;
	b=sKKpXrUdORtafJaJqpyOPjdFeHjqVtdz1I0Jvq34A/18BrRME2xPLAA3NOQXEE7b+3mB
	 Xh01Mw7eiYoYtEuSUpjbDiFeoWwGMWA6Hi78mM7QfaKtzUPgWe+ny3x3Q8y6zZgbmRxbv
	 THXtXL/0LUXGp04Tor2vNajJrkn6rTWvV8CZnsf5F/ddqPBZcT0DqQkPp39MxHjRP92kn
	 yEo931Tg+gnuWSSmEMB2cWepj+k3v8Yeu05BrPG0wpn/xX0kpiBj7kY+gacyuWYunbuEh
	 E+/qUPk46GCZCSR/I09Ott8s8qG3AbQ2UreDFf1asaF0jt98owMT9RAxm7KCSG4M6+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="mKVl9/rA";
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E1760A2627
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 18:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80E1760A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mKVl9/rA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795200415; x=1826736415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N+VSW4uPep8hYlahsQ7vQAETe15wJAnJqWGaF0rcx3o=;
  b=mKVl9/rAYqJbGQlSz2mAqs0HMT4jn2crDhdHzylxBTsT/oZV/uu7Q4Aw
   m3vYnAl76dGXtGcHmRHb2DyBczNhJI0ABsO3AMF3A8HcHJzG/WxQg5MJq
   aw6Qy4VG99ddHXwcs2ERinwAGSJ+5AlYVKad1NvXn6nQi6lHn68yVjSF0
   jV7NvL3IYxMO/DrxbOFXIUraproM7A7LRHTLVXcwgKtqZkJmR0kOuFZpP
   Ezw6pQpVPYdPWLH5jVhJG8ta8DaTEQWAnRCMI/jmi1+lv81mf/yCw+CDG
   YDKTzJrtH454Pw7RpTodcSkUNZPRpasv8jNBzioSzkv1Pay6RUE2xWer9
   w==;
X-CSE-ConnectionGUID: fW36LFYvQ6C0QcXMaZ/GmQ==
X-CSE-MsgGUID: YCzJaliyThyH34XpQTdwQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4081475"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4081475"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 10:46:54 -0800
X-CSE-ConnectionGUID: F4reeuN2TzipXpJMwnTHbQ==
X-CSE-MsgGUID: StATuObYQiyoB9b86yhqTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11335364"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 10:46:53 -0800
Date: Fri, 20 Nov 2026 10:46:52 -0800
From: David Box <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com, 
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, airlied@gmail.com, 
	simona@ffwll.ch, anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
	matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: Re: [PATCH v20 01/19] platform/x86/intel/pmt: Introduce a callback
 for discovery data
Message-ID: <awCVffJPFq8vV9x0@debox1-desk4>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
 <20261120021929.473553-22-michael.j.ruhl@intel.com>
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
In-Reply-To: <20261120021929.473553-22-michael.j.ruhl@intel.com>

On Thu, Nov 19, 2026 at 06:19:31PM -0800, Michael J. Ruhl wrote:
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
> reading discovery data.
> 
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
> -- 
> 2.43.0
> 
>

Reviewed-by: David E. Box david.e.box@linux.intel.com
