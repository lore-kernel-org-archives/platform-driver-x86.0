Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB39D187321
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723478941; cv=none; b=HAAeHW2otG3GtiofAMJyIzagTgo/H9PZcn5/hndrAaRN74IpR321dBvST/lHQ06f+pV5tLA+PmWouL9Yu81M1L/dIso007IVOuW9zY3p5DlpBI6FqzqgvY7TDsJZnqFKY2h236AxiVrk1mITJnnPX3IbWB4FNWD50Zeg2TeLCpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723478941; c=relaxed/simple;
	bh=e08OJkuEny10oByN/hY+p3cyrHWyUGYv1LLtpjeptyU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mHm4YpVDU5mBoQh6xGGDQ8/fkSF21Myru0HV938hn3WJXEx01drrNJUfW9v4T0nS51MUh9uvm7HGycEoDmwjy4bRHZNPUTWY96+IyT9EqPPpycETa6T0G0qL6TdW7yOTEDyYXcevqspe6258UzyQW7lAb0mcOqDwhIb0DBVJaq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UU6gSYur; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UU6gSYur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723478940; x=1755014940;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=e08OJkuEny10oByN/hY+p3cyrHWyUGYv1LLtpjeptyU=;
  b=UU6gSYuryQNZ5g4vr74vAirv05Knsx26L93kIRZsMOIkxc96q0+XIbyc
   UhlWdF8rF3xXmyu+WXg9WS0IlEa1+kjiaT1uLXnSWtXYtwcenewNrSCIg
   DsKC4gaXxkHadaAZPuJj77gINfRmfTLxKhylfpKWAJmbY/WfnlBQnV+pm
   gDrj48Qch7zDcMwFJWPTqwaPul2rIaqZ1kwW8G7VV8DZ30dCXOCJx7Aob
   HkaNvTWq4e63OtAvq9MkMxL15JFvTA090BcV7m2UrO5I/wa40L/1xjhuu
   VuiXpbnRngGOEWs4S1qRbwAUJsEtGh4X+F5f5QhvFa9UpJZ2dJfwKSKMK
   A==;
X-CSE-ConnectionGUID: opxjWhOXR5mXWD56FXz34g==
X-CSE-MsgGUID: NiQ9Js4cRLKFFzUtuUSVRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25467163"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="25467163"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 09:08:57 -0700
X-CSE-ConnectionGUID: D5xBDft+SSajkqfedS15XA==
X-CSE-MsgGUID: jK+UxP/WT1OgzvZ4+xzqnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="63239579"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.25])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 09:08:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Aug 2024 19:08:51 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Update SMU metrics table for
 1AH family series
In-Reply-To: <20240812140951.310550-2-Shyam-sundar.S-k@amd.com>
Message-ID: <38c845ba-16b7-8825-48da-47f557096b6e@linux.intel.com>
References: <20240812140951.310550-1-Shyam-sundar.S-k@amd.com> <20240812140951.310550-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Aug 2024, Shyam Sundar S K wrote:

> The SMU metrics table has been revised for the 1AH family series.
> Introduce a new metrics table structure to retrieve comprehensive metrics
> information from the PMFW. This information will be utilized by the PMF
> driver to adjust system thermals.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 14 ++++++++-
>  drivers/platform/x86/amd/pmf/pmf.h  | 49 +++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/spc.c  | 47 +++++++++++++++++++--------
>  3 files changed, 96 insertions(+), 14 deletions(-)
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
> index 9fc26f672f12..7e2035ed3c8e 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -198,6 +198,53 @@ struct apmf_fan_idx {
>  	u32 fan_ctl_idx;
>  } __packed;
>  
> +struct smu_pmf_metrics_v2 {
> +	u16 core_frequency[16]; /* MHz */
> +	u16 core_power[16]; /* mW */
> +	u16 core_temp[16]; /* centi-C */
> +	u16 gfx_temp; /* centi-C */
> +	u16 soc_temp; /* centi-C */
> +	u16 stapm_opn_limit; /* mW */
> +	u16 stapm_cur_limit; /* mW */
> +	u16 infra_cpu_maxfreq; /* MHz */
> +	u16 infra_gfx_maxfreq; /* MHz */
> +	u16 skin_temp; /* centi-C */
> +	u16 gfxclk_freq; /* MHz */
> +	u16 fclk_freq; /* MHz */
> +	u16 gfx_activity; /* GFX busy % [0-100] */
> +	u16 socclk_freq; /* MHz */
> +	u16 vclk_freq; /* MHz */
> +	u16 vcn_activity; /* VCN busy % [0-100] */
> +	u16 vpeclk_freq; /* MHz */
> +	u16 ipuclk_freq; /* MHz */
> +	u16 ipu_busy[8]; /* NPU busy % [0-100] */
> +	u16 dram_reads; /* MB/sec */
> +	u16 dram_writes; /* MB/sec */
> +	u16 core_c0residency[16]; /* C0 residency % [0-100] */
> +	u16 ipu_power; /* mW */
> +	u32 apu_power; /* mW */
> +	u32 gfx_power; /* mW */
> +	u32 dgpu_power; /* mW */
> +	u32 socket_power; /* mW */
> +	u32 all_core_power; /* mW */
> +	u32 filter_alpha_value; /* time constant [us] */
> +	u32 metrics_counter;
> +	u16 memclk_freq; /* MHz */
> +	u16 mpipuclk_freq; /* MHz */
> +	u16 ipu_reads; /* MB/sec */
> +	u16 ipu_writes; /* MB/sec */

Please align all those comments with tab to make this easier to read.

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
> index 3c153fb1425e..3173f6b6d6f0 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -58,25 +58,46 @@ static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
>  	u16 max, avg = 0;
>  	int i;
>  
> -	memset(dev->buf, 0, sizeof(dev->m_table));
> +	memset(dev->buf, 0, dev->mtable_size);
>  	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> -	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
>  
> -	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
> -	in->ev_info.skin_temperature = dev->m_table.skin_temp;
> -
> -	/* Get the avg and max C0 residency of all the cores */
> -	max = dev->m_table.avg_core_c0residency[0];
> -	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
> -		avg += dev->m_table.avg_core_c0residency[i];
> -		if (dev->m_table.avg_core_c0residency[i] > max)
> -			max = dev->m_table.avg_core_c0residency[i];
> +	switch (dev->cpu_id) {
> +	case AMD_CPU_ID_PS:
> +		memcpy(&dev->m_table, dev->buf, dev->mtable_size);
> +		in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
> +		in->ev_info.skin_temperature = dev->m_table.skin_temp;
> +		in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
> +
> +		/* Get the avg and max C0 residency of all the cores */
> +		max = dev->m_table.avg_core_c0residency[0];
> +		for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
> +			avg += dev->m_table.avg_core_c0residency[i];
> +			if (dev->m_table.avg_core_c0residency[i] > max)
> +				max = dev->m_table.avg_core_c0residency[i];
> +		}
> +		avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0residency));
> +		break;
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +		memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
> +		in->ev_info.socket_power = dev->m_table_v2.apu_power + dev->m_table_v2.dgpu_power;
> +		in->ev_info.skin_temperature = dev->m_table_v2.skin_temp;
> +		in->ev_info.gfx_busy = dev->m_table_v2.gfx_activity;
> +
> +		/* Get the avg and max C0 residency of all the cores */
> +		max = dev->m_table_v2.core_c0residency[0];
> +		for (i = 0; i < ARRAY_SIZE(dev->m_table_v2.core_c0residency); i++) {
> +			avg += dev->m_table_v2.core_c0residency[i];
> +			if (dev->m_table_v2.core_c0residency[i] > max)
> +				max = dev->m_table_v2.core_c0residency[i];
> +		}
> +		avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table_v2.core_c0residency));

Please add a helper to calculate the avg & max.

> +		break;
> +	default:
> +		dev_err(dev->dev, "Unsupported cpuid: 0x%x", dev->cpu_id);
>  	}
>  
> -	avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0residency));
>  	in->ev_info.avg_c0residency = avg;
>  	in->ev_info.max_c0residency = max;
> -	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
>  }
>  
>  static const char * const pmf_battery_supply_name[] = {
> 

-- 
 i.

