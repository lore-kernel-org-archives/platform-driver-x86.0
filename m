Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B2D363C6D
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 15:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480489; cv=none; b=JbjaL21H59NL6hcoh4qoc2mFT7pdg25QBuSjYVdrpLzSvIYorH89aMqDF3CSjTjNjaMZ230myZHFTFzQhHJzvVr6EBJ68GM5DNPsoNzu5SslU+Oktro58Phi9gLQNZd4xbqmMBx3erGJDGWmMRYWQud9ml2YenWIMLVLFDt5GSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480489; c=relaxed/simple;
	bh=mV+OtMfc2GAElTe9EyxbB198aKyY8rcT4s6H7u3vSIE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a2OUd2ex2U+SuIc8HfUJgBStdrTB5okpgHGyTP3yqGsAk1yXsnCwAQutnCn/50XXVgMknsKxqNZPuwaPDTFXPolLUL5e3v8qEpV+AA1foI15UcaNzmUgcFlLHiUJsWVXxk3z9IZW4ATggvCHKv1+uSQQlXudi7pu5eNGbLQBlro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKZbyByU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKZbyByU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763480487; x=1795016487;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mV+OtMfc2GAElTe9EyxbB198aKyY8rcT4s6H7u3vSIE=;
  b=JKZbyByUmz645oixKaNsIVfOvWNsb345v5Oz4Xeea0eQ9fvwyypAQOMx
   p9+FiuDqC6/L7gUp46kqaUOtJ987BbISvgVnY2Qay8kaQGQY68yB5Ndiz
   Nc/njFqV2gh7SKWFlE2f5gi+xtLX/2mTTMPOhhW1PZolYvWVmRPpsQVjZ
   FG1XofU88PygpuBHhKvqlULhs9tOg1lYRHANQFuncKaQbmZ3nnEsZa188
   6Uu32OrrL3yY7oY+/CHYfsQfcTmrf9bbTnoAd0pMRDfd/e/Bh7DIsQep+
   mzAfwoxjXNQtTVQ1+V4Ktk12v9m1pEMTwNO02PS1d2qtFQJyvo78QAfNe
   g==;
X-CSE-ConnectionGUID: K/9yXVDrRmilOdceoNvMQw==
X-CSE-MsgGUID: SWNI/CejSHeiOGUrosP69Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76857539"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76857539"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 07:41:26 -0800
X-CSE-ConnectionGUID: erImOp3cQf66zWzINcMy8g==
X-CSE-MsgGUID: 1K2OUeIFTxq2+BiQ4x4k/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195242552"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 07:41:23 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 17:41:19 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, lizhi.hou@amd.com
Subject: Re: [PATCH v2 2/5] platform/x86/amd/pmf: Use explicit SET_CMD/GET_CMD
 flags in amd_pmf_send_cmd()
In-Reply-To: <20251111063737.4156385-3-Shyam-sundar.S-k@amd.com>
Message-ID: <2e640a82-eb91-14dc-3f34-5e862df14e59@linux.intel.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com> <20251111063737.4156385-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Nov 2025, Shyam Sundar S K wrote:

> Add SET_CMD and GET_CMD constants and replace boolean values passed as the
> get/set argument to amd_pmf_send_cmd() with the new explicit flags. This
> improves readability, avoids ambiguity around true/false and 0/1 usage.
> There is no functional change.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/auto-mode.c | 14 ++++-----
>  drivers/platform/x86/amd/pmf/cnqf.c      | 14 ++++-----
>  drivers/platform/x86/amd/pmf/core.c      |  6 ++--
>  drivers/platform/x86/amd/pmf/pmf.h       |  3 ++
>  drivers/platform/x86/amd/pmf/spc.c       |  2 +-
>  drivers/platform/x86/amd/pmf/sps.c       | 38 ++++++++++++------------
>  drivers/platform/x86/amd/pmf/tee-if.c    | 20 ++++++-------
>  7 files changed, 50 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
> index a184922bba8d..faf15a8f74bb 100644
> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -114,14 +114,14 @@ static void amd_pmf_set_automode(struct amd_pmf_dev *dev, int idx,
>  {
>  	struct power_table_control *pwr_ctrl = &config_store.mode_set[idx].power_control;
>  
> -	amd_pmf_send_cmd(dev, SET_SPL, false, pwr_ctrl->spl, NULL);
> -	amd_pmf_send_cmd(dev, SET_FPPT, false, pwr_ctrl->fppt, NULL);
> -	amd_pmf_send_cmd(dev, SET_SPPT, false, pwr_ctrl->sppt, NULL);
> -	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pwr_ctrl->sppt_apu_only, NULL);
> -	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pwr_ctrl->stt_min, NULL);
> -	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
> +	amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, pwr_ctrl->spl, NULL);
> +	amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, pwr_ctrl->fppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, pwr_ctrl->sppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD, pwr_ctrl->sppt_apu_only, NULL);
> +	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD, pwr_ctrl->stt_min, NULL);
> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
>  			 fixp_q88_fromint(pwr_ctrl->stt_skin_temp[STT_TEMP_APU]), NULL);
> -	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
>  			 fixp_q88_fromint(pwr_ctrl->stt_skin_temp[STT_TEMP_HS2]), NULL);
>  
>  	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 207a0b33d8d3..5469fefb6001 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -76,14 +76,14 @@ static int amd_pmf_set_cnqf(struct amd_pmf_dev *dev, int src, int idx,
>  
>  	pc = &config_store.mode_set[src][idx].power_control;
>  
> -	amd_pmf_send_cmd(dev, SET_SPL, false, pc->spl, NULL);
> -	amd_pmf_send_cmd(dev, SET_FPPT, false, pc->fppt, NULL);
> -	amd_pmf_send_cmd(dev, SET_SPPT, false, pc->sppt, NULL);
> -	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pc->sppt_apu_only, NULL);
> -	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pc->stt_min, NULL);
> -	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
> +	amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, pc->spl, NULL);
> +	amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, pc->fppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, pc->sppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD, pc->sppt_apu_only, NULL);
> +	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD, pc->stt_min, NULL);
> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
>  			 fixp_q88_fromint(pc->stt_skin_temp[STT_TEMP_APU]), NULL);
> -	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
>  			 fixp_q88_fromint(pc->stt_skin_temp[STT_TEMP_HS2]), NULL);
>  
>  	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index bc544a4a5266..a659cedc4533 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -131,7 +131,7 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>  
>  	/* Transfer table contents */
>  	memset(dev->buf, 0, sizeof(dev->m_table));
> -	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
>  	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
>  
>  	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
> @@ -289,8 +289,8 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
>  	hi = phys_addr >> 32;
>  	low = phys_addr & GENMASK(31, 0);
>  
> -	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
> -	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
> +	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, SET_CMD, hi, NULL);
> +	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, SET_CMD, low, NULL);
>  
>  	return 0;
>  }
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 6ea5380f3b23..19e413bd89bc 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -120,6 +120,9 @@ struct cookie_header {
>  #define APTS_MAX_STATES		16
>  #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
>  
> +#define SET_CMD		0
> +#define GET_CMD		1

amd_pmf_send_cmd() takes bool so I don't know why these are defined as 
numbers?

Other than that, things look much better than before this change.

--
 i.

>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>  
>  /* APTS PMF BIOS Interface */
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 85192c7536b8..b10229def18a 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -202,7 +202,7 @@ static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
>  {
>  	/* Get the updated metrics table data */
>  	memset(dev->buf, 0, dev->mtable_size);
> -	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
>  
>  	switch (dev->cpu_id) {
>  	case AMD_CPU_ID_PS:
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index c28f3c5744c2..0b70a5153f46 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -192,15 +192,15 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>  
>  static void amd_pmf_update_slider_v2(struct amd_pmf_dev *dev, int idx)
>  {
> -	amd_pmf_send_cmd(dev, SET_PMF_PPT, false, apts_config_store.val[idx].pmf_ppt, NULL);
> -	amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false,
> +	amd_pmf_send_cmd(dev, SET_PMF_PPT, SET_CMD, apts_config_store.val[idx].pmf_ppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, SET_CMD,
>  			 apts_config_store.val[idx].ppt_pmf_apu_only, NULL);
> -	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
> +	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD,
>  			 apts_config_store.val[idx].stt_min_limit, NULL);
> -	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
>  			 fixp_q88_fromint(apts_config_store.val[idx].stt_skin_temp_limit_apu),
>  			 NULL);
> -	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
>  			 fixp_q88_fromint(apts_config_store.val[idx].stt_skin_temp_limit_hs2),
>  			 NULL);
>  }
> @@ -211,30 +211,30 @@ void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
>  	int src = amd_pmf_get_power_source();
>  
>  	if (op == SLIDER_OP_SET) {
> -		amd_pmf_send_cmd(dev, SET_SPL, false, config_store.prop[src][idx].spl, NULL);
> -		amd_pmf_send_cmd(dev, SET_FPPT, false, config_store.prop[src][idx].fppt, NULL);
> -		amd_pmf_send_cmd(dev, SET_SPPT, false, config_store.prop[src][idx].sppt, NULL);
> -		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
> +		amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, config_store.prop[src][idx].spl, NULL);
> +		amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, config_store.prop[src][idx].fppt, NULL);
> +		amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, config_store.prop[src][idx].sppt, NULL);
> +		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD,
>  				 config_store.prop[src][idx].sppt_apu_only, NULL);
> -		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
> +		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD,
>  				 config_store.prop[src][idx].stt_min, NULL);
> -		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
>  				 fixp_q88_fromint(config_store.prop[src][idx].stt_skin_temp[STT_TEMP_APU]),
>  				 NULL);
> -		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
>  				 fixp_q88_fromint(config_store.prop[src][idx].stt_skin_temp[STT_TEMP_HS2]),
>  				 NULL);
>  	} else if (op == SLIDER_OP_GET) {
> -		amd_pmf_send_cmd(dev, GET_SPL, true, ARG_NONE, &table->prop[src][idx].spl);
> -		amd_pmf_send_cmd(dev, GET_FPPT, true, ARG_NONE, &table->prop[src][idx].fppt);
> -		amd_pmf_send_cmd(dev, GET_SPPT, true, ARG_NONE, &table->prop[src][idx].sppt);
> -		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, true, ARG_NONE,
> +		amd_pmf_send_cmd(dev, GET_SPL, GET_CMD, ARG_NONE, &table->prop[src][idx].spl);
> +		amd_pmf_send_cmd(dev, GET_FPPT, GET_CMD, ARG_NONE, &table->prop[src][idx].fppt);
> +		amd_pmf_send_cmd(dev, GET_SPPT, GET_CMD, ARG_NONE, &table->prop[src][idx].sppt);
> +		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, GET_CMD, ARG_NONE,
>  				 &table->prop[src][idx].sppt_apu_only);
> -		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, true, ARG_NONE,
> +		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, GET_CMD, ARG_NONE,
>  				 &table->prop[src][idx].stt_min);
> -		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, true, ARG_NONE,
> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, GET_CMD, ARG_NONE,
>  				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_APU]);
> -		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, true, ARG_NONE,
> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, GET_CMD, ARG_NONE,
>  				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_HS2]);
>  	}
>  }
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 6e8116bef4f6..44fc69cfe10e 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -83,7 +83,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  		switch (out->actions_list[idx].action_index) {
>  		case PMF_POLICY_SPL:
>  			if (dev->prev_data->spl != val) {
> -				amd_pmf_send_cmd(dev, SET_SPL, false, val, NULL);
> +				amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, val, NULL);
>  				dev_dbg(dev->dev, "update SPL: %u\n", val);
>  				dev->prev_data->spl = val;
>  			}
> @@ -91,7 +91,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  
>  		case PMF_POLICY_SPPT:
>  			if (dev->prev_data->sppt != val) {
> -				amd_pmf_send_cmd(dev, SET_SPPT, false, val, NULL);
> +				amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, val, NULL);
>  				dev_dbg(dev->dev, "update SPPT: %u\n", val);
>  				dev->prev_data->sppt = val;
>  			}
> @@ -99,7 +99,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  
>  		case PMF_POLICY_FPPT:
>  			if (dev->prev_data->fppt != val) {
> -				amd_pmf_send_cmd(dev, SET_FPPT, false, val, NULL);
> +				amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, val, NULL);
>  				dev_dbg(dev->dev, "update FPPT: %u\n", val);
>  				dev->prev_data->fppt = val;
>  			}
> @@ -107,7 +107,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  
>  		case PMF_POLICY_SPPT_APU_ONLY:
>  			if (dev->prev_data->sppt_apuonly != val) {
> -				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, val, NULL);
> +				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD, val, NULL);
>  				dev_dbg(dev->dev, "update SPPT_APU_ONLY: %u\n", val);
>  				dev->prev_data->sppt_apuonly = val;
>  			}
> @@ -115,7 +115,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  
>  		case PMF_POLICY_STT_MIN:
>  			if (dev->prev_data->stt_minlimit != val) {
> -				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, val, NULL);
> +				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD, val, NULL);
>  				dev_dbg(dev->dev, "update STT_MIN: %u\n", val);
>  				dev->prev_data->stt_minlimit = val;
>  			}
> @@ -123,7 +123,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  
>  		case PMF_POLICY_STT_SKINTEMP_APU:
>  			if (dev->prev_data->stt_skintemp_apu != val) {
> -				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
>  						 fixp_q88_fromint(val), NULL);
>  				dev_dbg(dev->dev, "update STT_SKINTEMP_APU: %u\n", val);
>  				dev->prev_data->stt_skintemp_apu = val;
> @@ -132,7 +132,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  
>  		case PMF_POLICY_STT_SKINTEMP_HS2:
>  			if (dev->prev_data->stt_skintemp_hs2 != val) {
> -				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
>  						 fixp_q88_fromint(val), NULL);
>  				dev_dbg(dev->dev, "update STT_SKINTEMP_HS2: %u\n", val);
>  				dev->prev_data->stt_skintemp_hs2 = val;
> @@ -141,7 +141,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  
>  		case PMF_POLICY_P3T:
>  			if (dev->prev_data->p3t_limit != val) {
> -				amd_pmf_send_cmd(dev, SET_P3T, false, val, NULL);
> +				amd_pmf_send_cmd(dev, SET_P3T, SET_CMD, val, NULL);
>  				dev_dbg(dev->dev, "update P3T: %u\n", val);
>  				dev->prev_data->p3t_limit = val;
>  			}
> @@ -149,7 +149,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  
>  		case PMF_POLICY_PMF_PPT:
>  			if (dev->prev_data->pmf_ppt != val) {
> -				amd_pmf_send_cmd(dev, SET_PMF_PPT, false, val, NULL);
> +				amd_pmf_send_cmd(dev, SET_PMF_PPT, SET_CMD, val, NULL);
>  				dev_dbg(dev->dev, "update PMF PPT: %u\n", val);
>  				dev->prev_data->pmf_ppt = val;
>  			}
> @@ -157,7 +157,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  
>  		case PMF_POLICY_PMF_PPT_APU_ONLY:
>  			if (dev->prev_data->pmf_ppt_apu_only != val) {
> -				amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false, val, NULL);
> +				amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, SET_CMD, val, NULL);
>  				dev_dbg(dev->dev, "update PMF PPT APU ONLY: %u\n", val);
>  				dev->prev_data->pmf_ppt_apu_only = val;
>  			}
> 
