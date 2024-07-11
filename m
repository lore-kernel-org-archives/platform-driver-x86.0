Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B89D13C3D5
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720696601; cv=none; b=XX2wTCOEfBWVGkip0oh9431F1mgF9tPZG8Ukawm/8nL6pRtKxYIb1mxWFHpxbr5ddOkX+/sSFcYmMQnYURjOqSF8hd88IVrAUR3zXt3KUS4C3x6QEbCbeSDlOJrwiyVsP0ZTsoa+/YwZqh0VsYGn5OqupmB0Vm7sdkM1qkmwhHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720696601; c=relaxed/simple;
	bh=MYNcE5OdclA2SYOVPy6cMN48VOgpbyI4AicBX7FXFV4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=W8Ex/TpDQ/LAIz5CR5PjX042w1g2PMF+cCHCT4TDV4TUl0ZOverBPK18QqVp9eR8oYKAre/8f9oF3c51EUHlyb2YCFgqhPNh/GsD86Dd3Sq1umLWFkXi//z3QX5RFM5aFoPzUfiatoBtZ28HGHXGWdIClGX+h9ijk5tf7sxgjwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyOYc+Sh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyOYc+Sh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720696599; x=1752232599;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MYNcE5OdclA2SYOVPy6cMN48VOgpbyI4AicBX7FXFV4=;
  b=XyOYc+ShRLR7U9+ljHn+7WPl97dT1UlVgaDdpFKx/tvA7y/SAQig15GQ
   zoJ09mcN2QWetco5aC4XUESeMbQQ3He7By5uNQeijOHd/8CzMe6+sOEG3
   9p20qaqp1JRgdNue0CkkkW7ZlSbCOqeq8F+xYeWiFDaiwWP2PxCcboWcz
   MNsHjBBmNSB/erNc0384ENXD2x7eO8pi3be1X0NLWJ03cByuV65YVKOj7
   d0xIEwexIMvxaArLgqcZBsH9/tt7+TiSXpWXnGpABNHdwVuU2VqbdVvCp
   2vVQOk5HCSE7+jsUXt37FLemzKTr06eX478H8IqS/pr4FRm93/EU8MWRL
   A==;
X-CSE-ConnectionGUID: vDWuD9G6SwWz479bPs4KTA==
X-CSE-MsgGUID: wJXVUHeSTDy+0+gbHxN4IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17770543"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="17770543"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 04:16:38 -0700
X-CSE-ConnectionGUID: w0i6HdbyTLuqHhzbiaITPA==
X-CSE-MsgGUID: U/DhFRIwSWygm3zlu3DgWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="48606419"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.127])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 04:16:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jul 2024 14:16:33 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
    david.e.box@linux.intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v6 2/6] platform/x86/intel/vsec: Add PMT read callbacks
In-Reply-To: <20240710192249.3915396-3-michael.j.ruhl@intel.com>
Message-ID: <18866bce-1b3a-83b6-c861-6eedbd185265@linux.intel.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com> <20240710192249.3915396-3-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Jul 2024, Michael J. Ruhl wrote:

> From: "David E. Box" <david.e.box@linux.intel.com>
> 
> Some PMT providers require device specific actions before their telemetry
> can be read. Provide assignable PMT read callbacks to allow providers to
> perform those actions.
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/vsec.c |  1 +
>  include/linux/intel_vsec.h        | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 2b46807f868b..7b5cc9993974 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>  	intel_vsec_dev->num_resources = header->num_entries;
>  	intel_vsec_dev->quirks = info->quirks;
>  	intel_vsec_dev->base_addr = info->base_addr;
> +	intel_vsec_dev->priv_data = info->priv_data;
>  
>  	if (header->id == VSEC_ID_SDSI)
>  		intel_vsec_dev->ida = &intel_vsec_sdsi_ida;
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 1a287541a2f9..4569a55e8645 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -67,6 +67,19 @@ enum intel_vsec_quirks {
>  	VSEC_QUIRK_EARLY_HW     = BIT(4),
>  };
>  
> +/**
> + * struct pmt_callbacks - Callback infrastructure for PMT devices
> + * ->read_telem() when specified, called by client driver to access PMT data (instead
> + * of direct copy).
> + * @args:  pci device info pointer

PCI

> + * @guid:  ID of data to acccss
> + * @data:  buffer for the data to be copied
> + * @count: size of buffer
> + */
> +struct pmt_callbacks {
> +	int (*read_telem)(void *args, u32 guid, u64 *data, u32 count);

Can you explain why args is void * and not struct pci_dev *? I was already 
unsure earlier why void * is needed but now you even explicitly documented
it to be "pci device info pointer".

> +};
> +
>  /**
>   * struct intel_vsec_platform_info - Platform specific data
>   * @parent:    parent device in the auxbus chain
> @@ -78,6 +91,7 @@ enum intel_vsec_quirks {
>  struct intel_vsec_platform_info {
>  	struct device *parent;
>  	struct intel_vsec_header **headers;
> +	void *priv_data;
>  	unsigned long caps;
>  	unsigned long quirks;
>  	u64 base_addr;
> 

-- 
 i.

