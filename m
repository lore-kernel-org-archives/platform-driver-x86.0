Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6816716DEA9
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2024 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723540147; cv=none; b=KoqTh+WShyUsSDZDIyBa3iITKLE/r8sPri7KgiDRFsAy/EiS04yDGoEzOT3FJ9qlzS1tAQ0C5PONFLb+pE9KBZdqU23hVHi61Sb1+ZJ+78QERQ4XclQZ+9C398AWIFRs1VHmGvPTkCmuB88QFJ3JziXWD2RrQQiGivDQQZQE26w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723540147; c=relaxed/simple;
	bh=6acG8ZlrzxnK/8NjSAjQa9unu+r+xBMZThYfi/01Ews=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mtPSZkZDN1bIkdoVnxZfw3+mICdDsgGsUsGgYH/XdQkM7ehZ1RbsoN99BA5Jb1LPTjVsYvwsK2KNtcUkrwaawmQk2dvxPz8X++5DYNJ0qR4jNjynMxfv7EmzGnzjR4WIrkoT5GMuzXMScH6hFXoa5t0/41beHOatLXqrRHcuWS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QG+HiJ7N; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QG+HiJ7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723540146; x=1755076146;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6acG8ZlrzxnK/8NjSAjQa9unu+r+xBMZThYfi/01Ews=;
  b=QG+HiJ7NgRUmUn6o2XB9brnsYSNhEbsteSc8H1htKOAqlMVP1ss7+Vj2
   jGtwJUITR3i7NlqEzbkC14/uGP9eJplo4StSwb8PqAQDsgql1wHaS2/OC
   UqtRWwnz8vjEVamha3Ldd0FKaLDdlh0jxsS6QUZzG/iCHuqE6QLV9CXc6
   Fgubh8LswkEH8MajICXF52/C348h7bMN5zFOVio9jbb2qDTqIo2RBBROQ
   8YZyo763A8iLlJFpJDfIA316+MK008S4ESeTzWiTSjOkBM+WdhAaCRMNO
   EzkVHcXJx271juRU4+zj4yt2QkgTWwFaGqC4LI07aAGbu/iqQdrNHDCn5
   g==;
X-CSE-ConnectionGUID: oBNECn1pRJ6s3pGqXxOvJw==
X-CSE-MsgGUID: 650opWcFTkWen5IjuMCG6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="39137520"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="39137520"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 02:09:05 -0700
X-CSE-ConnectionGUID: JStGZ0HyQM2+CgSgXnu5Mg==
X-CSE-MsgGUID: bukTCJWMRmW8Ag4M2BGYvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58906137"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.153])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 02:09:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 13 Aug 2024 12:08:59 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Update SMU metrics table
 for 1AH family series
In-Reply-To: <20240813090040.364504-2-Shyam-sundar.S-k@amd.com>
Message-ID: <943494f2-5a0e-877a-d7b7-59180fec86b5@linux.intel.com>
References: <20240813090040.364504-1-Shyam-sundar.S-k@amd.com> <20240813090040.364504-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Aug 2024, Shyam Sundar S K wrote:

> The SMU metrics table has been revised for the 1AH family series.
> Introduce a new metrics table structure to retrieve comprehensive metrics
> information from the PMFW. This information will be utilized by the PMF
> driver to adjust system thermals.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2:
>  - Align comments
>  - add helper for max and avg calculation of C0 residency
> 
>  drivers/platform/x86/amd/pmf/core.c | 14 ++++++-
>  drivers/platform/x86/amd/pmf/pmf.h  | 49 +++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/spc.c  | 61 ++++++++++++++++++++++-------
>  3 files changed, 108 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 88314b0277a3..0ba9045224d9 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -255,7 +255,19 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
>  
>  	/* Get Metrics Table Address */
>  	if (alloc_buffer) {
> -		dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
> +		switch (dev->cpu_id) {
> +		case AMD_CPU_ID_PS:
> +		case AMD_CPU_ID_RMB:
> +			dev->mtable_size = sizeof(dev->m_table);
> +			break;
> +		case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +			dev->mtable_size = sizeof(dev->m_table_v2);
> +			break;
> +		default:
> +			dev_err(dev->dev, "Invalid cpu id: 0x%x", dev->cpu_id);
> +		}
> +
> +		dev->buf = kzalloc(dev->mtable_size, GFP_KERNEL);
>  		if (!dev->buf)
>  			return -ENOMEM;
>  	}
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 9fc26f672f12..8ce8816da9c1 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -198,6 +198,53 @@ struct apmf_fan_idx {
>  	u32 fan_ctl_idx;
>  } __packed;
>  
> +struct smu_pmf_metrics_v2 {
> +	u16 core_frequency[16];		/* MHz */
> +	u16 core_power[16];		/* mW */
> +	u16 core_temp[16];		/* centi-C */
> +	u16 gfx_temp;			/* centi-C */
> +	u16 soc_temp;			/* centi-C */
> +	u16 stapm_opn_limit;		/* mW */
> +	u16 stapm_cur_limit;		/* mW */
> +	u16 infra_cpu_maxfreq;		/* MHz */
> +	u16 infra_gfx_maxfreq;		/* MHz */
> +	u16 skin_temp;			/* centi-C */
> +	u16 gfxclk_freq;		/* MHz */
> +	u16 fclk_freq;			/* MHz */
> +	u16 gfx_activity;		/* GFX busy % [0-100] */
> +	u16 socclk_freq;		/* MHz */
> +	u16 vclk_freq;			/* MHz */
> +	u16 vcn_activity;		/* VCN busy % [0-100] */
> +	u16 vpeclk_freq;		/* MHz */
> +	u16 ipuclk_freq;		/* MHz */
> +	u16 ipu_busy[8];		/* NPU busy % [0-100] */
> +	u16 dram_reads;			/* MB/sec */
> +	u16 dram_writes;		/* MB/sec */
> +	u16 core_c0residency[16];	/* C0 residency % [0-100] */
> +	u16 ipu_power;			/* mW */
> +	u32 apu_power;			/* mW */
> +	u32 gfx_power;			/* mW */
> +	u32 dgpu_power;			/* mW */
> +	u32 socket_power;		/* mW */
> +	u32 all_core_power;		/* mW */
> +	u32 filter_alpha_value;		/* time constant [us] */
> +	u32 metrics_counter;
> +	u16 memclk_freq;		/* MHz */
> +	u16 mpipuclk_freq;		/* MHz */
> +	u16 ipu_reads;			/* MB/sec */
> +	u16 ipu_writes;			/* MB/sec */
> +	u32 throttle_residency_prochot;
> +	u32 throttle_residency_spl;
> +	u32 throttle_residency_fppt;
> +	u32 throttle_residency_sppt;
> +	u32 throttle_residency_thm_core;
> +	u32 throttle_residency_thm_gfx;
> +	u32 throttle_residency_thm_soc;
> +	u16 psys;
> +	u16 spare1;
> +	u32 spare[6];
> +} __packed;
> +
>  struct smu_pmf_metrics {
>  	u16 gfxclk_freq; /* in MHz */
>  	u16 socclk_freq; /* in MHz */
> @@ -295,6 +342,7 @@ struct amd_pmf_dev {
>  	int hb_interval; /* SBIOS heartbeat interval */
>  	struct delayed_work heart_beat;
>  	struct smu_pmf_metrics m_table;
> +	struct smu_pmf_metrics_v2 m_table_v2;
>  	struct delayed_work work_buffer;
>  	ktime_t start_time;
>  	int socket_power_history[AVG_SAMPLE_SIZE];
> @@ -319,6 +367,7 @@ struct amd_pmf_dev {
>  	bool smart_pc_enabled;
>  	u16 pmf_if_version;
>  	struct input_dev *pmf_idev;
> +	size_t mtable_size;
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 3c153fb1425e..910ba7925f13 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -53,30 +53,61 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
>  #endif
>  
> -static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +static void amd_pmf_get_c0_residency(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
>  	u16 max, avg = 0;
>  	int i;
>  
> -	memset(dev->buf, 0, sizeof(dev->m_table));
> -	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> -	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> -
> -	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
> -	in->ev_info.skin_temperature = dev->m_table.skin_temp;
> -
>  	/* Get the avg and max C0 residency of all the cores */
> -	max = dev->m_table.avg_core_c0residency[0];
> -	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
> -		avg += dev->m_table.avg_core_c0residency[i];
> -		if (dev->m_table.avg_core_c0residency[i] > max)
> -			max = dev->m_table.avg_core_c0residency[i];
> +	switch (dev->cpu_id) {
> +	case AMD_CPU_ID_PS:
> +		max = dev->m_table.avg_core_c0residency[0];
> +		for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
> +			avg += dev->m_table.avg_core_c0residency[i];
> +			if (dev->m_table.avg_core_c0residency[i] > max)
> +				max = dev->m_table.avg_core_c0residency[i];
> +		}
> +		avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0residency));
> +		break;
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +		max = dev->m_table_v2.core_c0residency[0];
> +		for (i = 0; i < ARRAY_SIZE(dev->m_table_v2.core_c0residency); i++) {
> +			avg += dev->m_table_v2.core_c0residency[i];
> +			if (dev->m_table_v2.core_c0residency[i] > max)
> +				max = dev->m_table_v2.core_c0residency[i];
> +		}
> +		avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table_v2.core_c0residency));

This is not what I meant. Add a helper which takes the c0residency array 
as a pointer and the number of elements (+ the pointers to result 
variables, obviously). The helper should not care which struct the values 
come from.

-- 
 i.

> +		break;
>  	}
>  
> -	avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0residency));
>  	in->ev_info.avg_c0residency = avg;
>  	in->ev_info.max_c0residency = max;
> -	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
> +}
> +
> +static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	/* Get the updated metrics table data */
> +	memset(dev->buf, 0, dev->mtable_size);
> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> +
> +	switch (dev->cpu_id) {
> +	case AMD_CPU_ID_PS:
> +		memcpy(&dev->m_table, dev->buf, dev->mtable_size);
> +		in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
> +		in->ev_info.skin_temperature = dev->m_table.skin_temp;
> +		in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
> +		amd_pmf_get_c0_residency(dev, in);
> +		break;
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +		memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
> +		in->ev_info.socket_power = dev->m_table_v2.apu_power + dev->m_table_v2.dgpu_power;
> +		in->ev_info.skin_temperature = dev->m_table_v2.skin_temp;
> +		in->ev_info.gfx_busy = dev->m_table_v2.gfx_activity;
> +		amd_pmf_get_c0_residency(dev, in);
> +		break;
> +	default:
> +		dev_err(dev->dev, "Unsupported cpuid: 0x%x", dev->cpu_id);
> +	}
>  }
>  
>  static const char * const pmf_battery_supply_name[] = {
> 

