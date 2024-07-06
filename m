Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E2826AC2
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jul 2024 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720272754; cv=none; b=Lbu42YepNf1Uk9B2mm7PB12vBcdzJ9Yke5DGCGprI5bAr4Memq8mLaNtSWCa1NAkokbiK60uXhelwWngKisNG64yb7f5gcvHuYs7qy/NWKHRIcaKuSbUI3ZQtGnFGwsxueqfg83wnEtq58oqHew/BYYbRmlFqYho4T61iiLRClk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720272754; c=relaxed/simple;
	bh=TvbkgR6YAEiXPWNzCw7cUR+4Y+xJC4FOm3iMGNldpu4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LjB+USMQa1q3fhqgGMX1aW3o2aXieOaqTUSHB6hnxFYGdYHnTxYLpVIIwLCQQPvbj+bslZEDvOU5km2ZnYGlScgxk/CGZLcUw8Tpx0uaf2HmkPuFbS50jRvYycfWU6619SN6kbp5O/V12Zc077FtmX9G0gt8/bpIMSUuE8/0L7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPnMPMTp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPnMPMTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720272753; x=1751808753;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TvbkgR6YAEiXPWNzCw7cUR+4Y+xJC4FOm3iMGNldpu4=;
  b=cPnMPMTpoJlVQzaJwtYkiQ276Yv0FaixMcGKt9EIKirNvJhPQz/S6NYQ
   3a48NV6DtolFXzgo9IcZ2w37kjG/tCvvRZyUj7rSZeqge6ET+0zN7EFgw
   ESfQBDnUBfDMrNEM2ELPK+gR7QSl90u8xHehfTLTACgsToaQVwVfl5fOm
   CpBoMapEf2cG+2Hl/Ck3esnad20P/NKz2si7WUFh1+S/gVw17TY+yah+n
   DZIlDVvb54BmrswhOIGTVtZ9wV5oIYM3ntYnDMzWh2OhNokK2q/2obdAy
   OVGOQUU9ug1gtP2tTpv4ME9T4EIGC1Eg3HYqZNLsa/c4h772y3Na9TxFs
   w==;
X-CSE-ConnectionGUID: Vl/aK9pKS6am5lCYCKg4dw==
X-CSE-MsgGUID: fyGXUNJpRjuuCESN3ucBvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="20436212"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="20436212"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 06:32:32 -0700
X-CSE-ConnectionGUID: u9yu2d73T4KOUjJV+AVQFg==
X-CSE-MsgGUID: z+w02edVSyGpsCt7re9Gmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="77823129"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.111])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 06:32:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 6 Jul 2024 16:32:25 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
    david.e.box@linux.intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v5 2/6] platform/x86/intel/vsec: Add PMT read callbacks
In-Reply-To: <20240701141730.3585133-3-michael.j.ruhl@intel.com>
Message-ID: <92c284d5-84ed-f2c5-0506-d1d5ab484362@linux.intel.com>
References: <20240701141730.3585133-1-michael.j.ruhl@intel.com> <20240701141730.3585133-3-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Jul 2024, Michael J. Ruhl wrote:

> From: "David E. Box" <david.e.box@linux.intel.com>
> 
> Some PMT providers require device specific actions before their telemetry
> can be read. Provide assignable PMT read callbacks to allow providers to
> perform those actions.
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/vsec.c | 1 +
>  include/linux/intel_vsec.h        | 5 +++++
>  2 files changed, 6 insertions(+)
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
> index ff7998cadab4..003301783331 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -67,10 +67,15 @@ enum intel_vsec_quirks {
>  	VSEC_QUIRK_EARLY_HW     = BIT(4),
>  };
>  
> +struct pmt_callbacks {
> +	int (*read_telem)(void *args, u32 guid, u64 *data, u32 count);
> +};

Please add kerneldoc.

> +
>  /* Platform specific data */
>  struct intel_vsec_platform_info {
>  	struct device *parent;
>  	struct intel_vsec_header **headers;
> +	void *priv_data;
>  	unsigned long caps;
>  	unsigned long quirks;
>  	u64 base_addr;

Where's the kerneldoc for this struct?

I know you moved things around in the earlier patch, but moving things 
into kernel-wide scope comes with a higher standard on documenting things.

-- 
 i.

