Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B32AC7619A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Apr 2023 11:24:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjDLLYC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Apr 2023 07:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjDLLYC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 07:24:02 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0837D8E
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 04:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681298617; x=1712834617;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sEpOZN8yRoh+5UgB2LWBCeFMtaWbk+3OPejeX7HZ37A=;
  b=gBCAQerKJWoIFVg1jAySV1DG86UpfCgDXpy4GnrDG7OW7Lce2XL6cWN3
   sHwsnz0nPCMfNeUStCATosAYGjipaz61Mf7zR3PlVr56W0rqcT2Sfzvdg
   WrAl2tcVBHRL/9Gq9h8L+ReuGeFS+UarcUAj+5zKWRjx6BwhG1er/D5pt
   SA1oObCDv2GiTj636ribw/JkOqUVJjgl8EIsSiIH7iclCGjZ94cNHu3MH
   4dDu961sNuNPBlz0Xdz8Lk4O1/ToapJnfBgn/dJ/ovtAn3WJG6t5tAPBC
   Wg7FvuUdsU3rQ+md5v8E4wuiTD16/0rm8DO7hiZij2mIrpbCLkaW2du5A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="332560012"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="332560012"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 04:22:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="1018711163"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="1018711163"
Received: from chanse1-mobl2.ger.corp.intel.com ([10.251.213.80])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 04:22:22 -0700
Date:   Wed, 12 Apr 2023 14:22:20 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmf: Add PMF acpi debug
 support
In-Reply-To: <20230412105242.2602148-1-Shyam-sundar.S-k@amd.com>
Message-ID: <628a8c27-f0cd-1117-72eb-35a171e69c67@linux.intel.com>
References: <20230412105242.2602148-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 12 Apr 2023, Shyam Sundar S K wrote:

> PMF driver maintains an internal config store for each PMF feature
> after the feature init happens. Having a debug mechanism to triage
> in-field issues w.r.t to mode switch not happening based on the OEM
> fed values via the ACPI method to PMF driver is becoming the need of
> the hour. Add support to get more ACPI debug spew guarded by a CONFIG.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2:
>  - Based on review-hans branch
>  - use a pointer and not create a local copy while dumping
>  - use dummy #else blocks
> 
>  drivers/platform/x86/amd/pmf/Kconfig     |  11 +++
>  drivers/platform/x86/amd/pmf/auto-mode.c | 118 +++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/cnqf.c      |  61 +++++++++++-
>  drivers/platform/x86/amd/pmf/sps.c       |  55 +++++++++++
>  4 files changed, 243 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index d87986adf91e..3064bc8ea167 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -16,3 +16,14 @@ config AMD_PMF
>  
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called amd_pmf.
> +
> +config AMD_PMF_DEBUG
> +	bool "PMF debug information"
> +	depends on AMD_PMF
> +	help
> +	 Enabling this option would give more debug information on the OEM fed
> +	 power setting values for each of the PMF feature. PMF driver gets this
> +	 information after evaluating a ACPI method and the information is stored
> +	 in the PMF config store.
> +
> +	 Say Y here to enable more debug logs and Say N here if you are not sure.
> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
> index 96a8e1832c05..557a962b48f9 100644
> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -15,6 +15,98 @@
>  static struct auto_mode_mode_config config_store;
>  static const char *state_as_str(unsigned int state);
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +static void amd_pmf_dump_auto_mode_defaults(struct auto_mode_mode_config *data)
> +{
> +	struct auto_mode_mode_settings *its_mode;
> +
> +	pr_debug("Auto Mode Data - BEGIN\n");
> +
> +	/* time constant */
> +	pr_debug("balanced_to_perf: %u\n",
> +		 data->transition[AUTO_TRANSITION_TO_PERFORMANCE].time_constant);
> +	pr_debug("perf_to_balanced: %u\n",
> +		 data->transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].time_constant);
> +	pr_debug("quiet_to_balanced: %u\n",
> +		 data->transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant);
> +	pr_debug("balanced_to_quiet: %u\n",
> +		 data->transition[AUTO_TRANSITION_TO_QUIET].time_constant);
> +
> +	/* power floor */
> +	pr_debug("pfloor_perf: %u\n", data->mode_set[AUTO_PERFORMANCE].power_floor);
> +	pr_debug("pfloor_balanced: %u\n", data->mode_set[AUTO_BALANCE].power_floor);
> +	pr_debug("pfloor_quiet: %u\n", data->mode_set[AUTO_QUIET].power_floor);
> +
> +	/* Power delta for mode change */
> +	pr_debug("pd_balanced_to_perf: %u\n",
> +		 data->transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
> +	pr_debug("pd_perf_to_balanced: %u\n",
> +		 data->transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
> +	pr_debug("pd_quiet_to_balanced: %u\n",
> +		 data->transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
> +	pr_debug("pd_balanced_to_quiet: %u\n",
> +		 data->transition[AUTO_TRANSITION_TO_QUIET].power_delta);
> +
> +	/* skin temperature limits */
> +	its_mode = &data->mode_set[AUTO_PERFORMANCE_ON_LAP];
> +	pr_debug("stt_apu_perf_on_lap: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_perf_on_lap: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_perf_on_lap: %u\n", its_mode->power_control.stt_min);
> +
> +	its_mode = &data->mode_set[AUTO_PERFORMANCE];
> +	pr_debug("stt_apu_perf: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_perf: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_perf: %u\n", its_mode->power_control.stt_min);
> +
> +	its_mode = &data->mode_set[AUTO_BALANCE];
> +	pr_debug("stt_apu_balanced: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_balanced: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_balanced: %u\n", its_mode->power_control.stt_min);
> +
> +	its_mode = &data->mode_set[AUTO_QUIET];
> +	pr_debug("stt_apu_quiet: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_quiet: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_quiet: %u\n", its_mode->power_control.stt_min);
> +
> +	/* SPL based power limits */
> +	its_mode = &data->mode_set[AUTO_PERFORMANCE_ON_LAP];
> +	pr_debug("fppt_perf_on_lap: %u\n", its_mode->power_control.fppt);
> +	pr_debug("sppt_perf_on_lap: %u\n", its_mode->power_control.sppt);
> +	pr_debug("spl_perf_on_lap: %u\n", its_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_perf_on_lap: %u\n", its_mode->power_control.sppt_apu_only);
> +
> +	its_mode = &data->mode_set[AUTO_PERFORMANCE];
> +	pr_debug("fppt_perf: %u\n", its_mode->power_control.fppt);
> +	pr_debug("sppt_perf: %u\n", its_mode->power_control.sppt);
> +	pr_debug("spl_perf: %u\n", its_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_perf: %u\n", its_mode->power_control.sppt_apu_only);
> +
> +	its_mode = &data->mode_set[AUTO_BALANCE];
> +	pr_debug("fppt_balanced: %u\n", its_mode->power_control.fppt);
> +	pr_debug("sppt_balanced: %u\n", its_mode->power_control.sppt);
> +	pr_debug("spl_balanced: %u\n", its_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_balanced: %u\n", its_mode->power_control.sppt_apu_only);
> +
> +	its_mode = &data->mode_set[AUTO_QUIET];
> +	pr_debug("fppt_quiet: %u\n", its_mode->power_control.fppt);
> +	pr_debug("sppt_quiet: %u\n", its_mode->power_control.sppt);
> +	pr_debug("spl_quiet: %u\n", its_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_quiet: %u\n", its_mode->power_control.sppt_apu_only);
> +
> +	/* Fan ID */
> +	pr_debug("fan_id_perf: %lu\n",
> +		 data->mode_set[AUTO_PERFORMANCE].fan_control.fan_id);
> +	pr_debug("fan_id_balanced: %lu\n",
> +		 data->mode_set[AUTO_BALANCE].fan_control.fan_id);
> +	pr_debug("fan_id_quiet: %lu\n",
> +		 data->mode_set[AUTO_QUIET].fan_control.fan_id);
> +
> +	pr_debug("Auto Mode Data - END\n");
> +}
> +#else
> +static void amd_pmf_dump_auto_mode_defaults(struct auto_mode_mode_config *data) {}
> +#endif
> +
>  static void amd_pmf_set_automode(struct amd_pmf_dev *dev, int idx,
>  				 struct auto_mode_mode_config *table)
>  {
> @@ -140,6 +232,30 @@ static void amd_pmf_get_power_threshold(void)
>  	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_threshold =
>  		config_store.mode_set[AUTO_PERFORMANCE].power_floor -
>  		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta;
> +
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	pr_debug("[AUTO MODE TO_QUIET] pt:%d pf:%d pd: %u",
> +		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold,
> +		 config_store.mode_set[AUTO_BALANCE].power_floor,

You used %d but power_threshold and power_floor are u32.
Missing \n?

Please check also the prints below, I won't mark them individually.

> +		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta);
> +
> +	pr_debug("[AUTO MODE TO_PERFORMANCE] pt:%d pf:%d pd: %u",
> +		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_threshold,
> +		 config_store.mode_set[AUTO_BALANCE].power_floor,
> +		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
> +
> +	pr_debug("[AUTO MODE QUIET_TO_BALANCE] pt:%d pf:%d pd: %u",
> +		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE]
> +		 .power_threshold,
> +		 config_store.mode_set[AUTO_QUIET].power_floor,
> +		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
> +
> +	pr_debug("[AUTO MODE PERFORMANCE_TO_BALANCE] pt:%d pf:%d pd: %u",
> +		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE]
> +		 .power_threshold,
> +		 config_store.mode_set[AUTO_PERFORMANCE].power_floor,
> +		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
> +#endif
>  }
>  
>  static const char *state_as_str(unsigned int state)
> @@ -262,6 +378,8 @@ static void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
>  	/* set to initial default values */
>  	config_store.current_mode = AUTO_BALANCE;
>  	dev->socket_power_history_idx = -1;
> +
> +	amd_pmf_dump_auto_mode_defaults(&config_store);
>  }
>  
>  int amd_pmf_reset_amt(struct amd_pmf_dev *dev)
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 4beb22a19466..371762ce8446 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -13,6 +13,59 @@
>  
>  static struct cnqf_config config_store;
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +static const char *state_as_str_cnqf(unsigned int state)
> +{
> +	switch (state) {
> +	case APMF_CNQF_TURBO:
> +		return "turbo";
> +	case APMF_CNQF_PERFORMANCE:
> +		return "performance";
> +	case APMF_CNQF_BALANCE:
> +		return "balance";
> +	case APMF_CNQF_QUIET:
> +		return "quiet";
> +	default:
> +		return "Unknown CnQF State";
> +	}
> +}
> +
> +static void amd_pmf_cnqf_dump_defaults(struct apmf_dyn_slider_output *data, int idx)
> +{
> +	int i;
> +
> +	pr_debug("Dynamic Slider %s Defaults - BEGIN\n", idx ? "DC" : "AC");
> +	pr_debug("size: %u\n", data->size);
> +	pr_debug("flags: %u\n", data->flags);

Should flags be printed with %x ?

> +
> +	/* Time constants */
> +	pr_debug("t_perf_to_turbo: %u\n", data->t_perf_to_turbo);
> +	pr_debug("t_balanced_to_perf: %u\n", data->t_balanced_to_perf);
> +	pr_debug("t_quiet_to_balanced: %u\n", data->t_quiet_to_balanced);
> +	pr_debug("t_balanced_to_quiet: %u\n", data->t_balanced_to_quiet);
> +	pr_debug("t_perf_to_balanced: %u\n", data->t_perf_to_balanced);
> +	pr_debug("t_turbo_to_perf: %u\n", data->t_turbo_to_perf);
> +
> +	for (i = 0 ; i < CNQF_MODE_MAX ; i++) {
> +		pr_debug("pfloor_%s: %u\n", state_as_str_cnqf(i), data->ps[i].pfloor);
> +		pr_debug("fppt_%s: %u\n", state_as_str_cnqf(i), data->ps[i].fppt);
> +		pr_debug("sppt_%s: %u\n", state_as_str_cnqf(i), data->ps[i].sppt);
> +		pr_debug("sppt_apuonly_%s: %u\n", state_as_str_cnqf(i), data->ps[i].sppt_apu_only);
> +		pr_debug("spl_%s: %u\n", state_as_str_cnqf(i), data->ps[i].spl);
> +		pr_debug("stt_minlimit_%s: %u\n", state_as_str_cnqf(i), data->ps[i].stt_min_limit);
> +		pr_debug("stt_skintemp_apu_%s: %u\n", state_as_str_cnqf(i),
> +			 data->ps[i].stt_skintemp[STT_TEMP_APU]);
> +		pr_debug("stt_skintemp_hs2_%s: %u\n", state_as_str_cnqf(i),
> +			 data->ps[i].stt_skintemp[STT_TEMP_HS2]);
> +		pr_debug("fan_id_%s: %d\n", state_as_str_cnqf(i), data->ps[i].fan_id);
> +	}
> +
> +	pr_debug("Dynamic Slider %s Defaults - END\n", idx ? "DC" : "AC");
> +}
> +#else
> +static void amd_pmf_cnqf_dump_defaults(struct apmf_dyn_slider_output *data, int idx) {}
> +#endif
> +
>  static int amd_pmf_set_cnqf(struct amd_pmf_dev *dev, int src, int idx,
>  			    struct cnqf_config *table)
>  {
> @@ -275,10 +328,14 @@ static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
>  		if (!is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC + i))
>  			continue;
>  
> -		if (i == POWER_SOURCE_AC)
> +		if (i == POWER_SOURCE_AC) {
>  			ret = apmf_get_dyn_slider_def_ac(dev, &out);
> -		else
> +			amd_pmf_cnqf_dump_defaults(&out, i);
> +		} else {
>  			ret = apmf_get_dyn_slider_def_dc(dev, &out);
> +			amd_pmf_cnqf_dump_defaults(&out, i);

Adds same dump line for both branches, put it once after the if/else 
blocks.

> +		}
> +
>  		if (ret) {
>  			dev_err(dev->dev, "APMF apmf_get_dyn_slider_def_dc failed :%d\n", ret);
>  			return ret;
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index bed762d47a14..0a4d0549ea03 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -12,6 +12,60 @@
>  
>  static struct amd_pmf_static_slider_granular config_store;
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +const char *slider_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case POWER_MODE_PERFORMANCE:
> +		return "PERFORMANCE";
> +	case POWER_MODE_BALANCED_POWER:
> +		return "BALANCED_POWER";
> +	case POWER_MODE_POWER_SAVER:
> +		return "POWER_SAVER";
> +	default:
> +		return "Unknown Slider State";
> +	}
> +}
> +
> +const char *source_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case POWER_SOURCE_AC:
> +		return "AC";
> +	case POWER_SOURCE_DC:
> +		return "DC";
> +	default:
> +		return "Unknown Power State";
> +	}
> +}
> +
> +static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data)
> +{
> +	int i, j;
> +
> +	pr_debug("Static Slider Data - BEGIN\n");
> +
> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
> +		for (j = 0; j < POWER_MODE_MAX; j++) {
> +			pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
> +			pr_debug("SPL: %u mW\n", data->prop[i][j].spl);
> +			pr_debug("SPPT: %u mW\n", data->prop[i][j].sppt);
> +			pr_debug("SPPT_ApuOnly: %u mW\n", data->prop[i][j].sppt_apu_only);
> +			pr_debug("FPPT: %u mW\n", data->prop[i][j].fppt);
> +			pr_debug("STTMinLimit: %u mW\n", data->prop[i][j].stt_min);
> +			pr_debug("STT_SkinTempLimit_APU: %u C\n",
> +				 data->prop[i][j].stt_skin_temp[STT_TEMP_APU]);
> +			pr_debug("STT_SkinTempLimit_HS2: %u C\n",
> +				 data->prop[i][j].stt_skin_temp[STT_TEMP_HS2]);

It's bit inconsistent to print units here, why not print them in the other 
places too?

> +		}
> +	}
> +
> +	pr_debug("Static Slider Data - END\n");
> +}
> +#else
> +static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data) {}
> +#endif
> +
>  static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>  {
>  	struct apmf_static_slider_granular_output output;
> @@ -36,6 +90,7 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>  			idx++;
>  		}
>  	}
> +	amd_pmf_dump_sps_defaults(&config_store);
>  }
>  
>  void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
> 

-- 
 i.

