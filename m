Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49746C77B75
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 May 2023 13:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242184AbjEONUZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 May 2023 09:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242248AbjEONUE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 May 2023 09:20:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA601FF7
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 May 2023 06:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684156744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ugyx/9y/SaIK86UZMSfmQ9t3C9x9uaubBNLGKyjVDLg=;
        b=CWQ/asFQtRo1LQnhHr9eBOFSZS9I6Ovalx/u0k6xDsSs40Idjgz5Q1/x0mDeF38kH33Iiu
        LNmGjZqCvdrj7fJrc+HpjfD+BfqcCaMiRy2/GXL3O6hZ6zAsBq4+WXkdIkPXyExajzQZmY
        Dre0IU1eW+pT1j3NUj+1PlXZY04wZlk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-F81V8mozMjSE0REsmfvpXg-1; Mon, 15 May 2023 09:19:01 -0400
X-MC-Unique: F81V8mozMjSE0REsmfvpXg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-965cd056598so1507668866b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 May 2023 06:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684156739; x=1686748739;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ugyx/9y/SaIK86UZMSfmQ9t3C9x9uaubBNLGKyjVDLg=;
        b=TR4qOBU5FDCO99p3lr1VXiOCX2AOAuE8lNkOYNqC9LaL8pWq44Qi2jAHs7MNA5NJ9e
         TimYCxxvvw8ev9ku15+2WWRb7GKiFkpm10YlX1VwtlZmOSHUiscuMGEuzpIqFBDOymc6
         nDBF2gjHXCmsGxtZ8q3GA98iY4E3ib3IJbJiQh3OzswVApv/YYmJQc8C++07gpQQdXVM
         XIEOL9emc8BokTznwDyJsVEd4WB4pbi9/0M8K+ef7IfKzY/tuTM8ENqJdjCZSBqRDfpg
         ylaBsFNkibYG6wwRnMcQ5FllejUDgWhvfjYqwla0Errc9NMh44ZYXKWvIhSIEdxO7fc6
         uTEA==
X-Gm-Message-State: AC+VfDxLEF9elAVkQ0+6NIKz+uKQmLzx/LbyNqlyeI76Nh/HiUbKG1KT
        oOo3tb0Hci0FEbBHGX00tk6MihKZzJmZBSZtkbbFKiyUDSkIMMQAFu8+526stX8KVGovqCqPUaL
        ba5Mmj+CMhE9t5ciJG0UVDhVmnJN2sWFNVw==
X-Received: by 2002:a17:907:6e14:b0:96a:48ed:531d with SMTP id sd20-20020a1709076e1400b0096a48ed531dmr16117064ejc.27.1684156739247;
        Mon, 15 May 2023 06:18:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6JWzlHApINa+ycH1jnoPw6aSTUWG/l60eV6Y9supVwFV5kN51lEwPRyPn3ih5y1dXs0mgpDA==
X-Received: by 2002:a17:907:6e14:b0:96a:48ed:531d with SMTP id sd20-20020a1709076e1400b0096a48ed531dmr16117043ejc.27.1684156738805;
        Mon, 15 May 2023 06:18:58 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ia21-20020a170907a07500b00966392de4easm9652061ejc.14.2023.05.15.06.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 06:18:58 -0700 (PDT)
Message-ID: <3e5e8697-5f19-ac1f-0dc1-be90a1707232@redhat.com>
Date:   Mon, 15 May 2023 15:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/2] platform/x86/amd/pmf: Add PMF acpi debug support
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com
References: <20230510144751.66601-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230510144751.66601-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/10/23 16:47, Shyam Sundar S K wrote:
> PMF driver maintains an internal config store for each PMF feature
> after the feature init happens. Having a debug mechanism to triage
> in-field issues w.r.t to mode switch not happening based on the OEM
> fed values via the ACPI method to PMF driver is becoming the need of
> the hour. Add support to get more ACPI debug spew guarded by a CONFIG.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
> v4:
>  - No change
> 
> v3:
>  - Based on review-hans branch
>  - Address Ilpo's review remarks
>  - use the right format specifiers while printing the data
> 
> v2:
>  - Based on review-hans branch
>  - use a pointer and not create a local copy while dumping
>  - use dummy #else blocks
> 
>  drivers/platform/x86/amd/pmf/Kconfig     |  11 +++
>  drivers/platform/x86/amd/pmf/auto-mode.c | 120 +++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/cnqf.c      |  56 +++++++++++
>  drivers/platform/x86/amd/pmf/sps.c       |  55 +++++++++++
>  4 files changed, 242 insertions(+)
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
> index 96a8e1832c05..64425201d353 100644
> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -15,6 +15,100 @@
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
> +	pr_debug("balanced_to_perf: %u ms\n",
> +		 data->transition[AUTO_TRANSITION_TO_PERFORMANCE].time_constant);
> +	pr_debug("perf_to_balanced: %u ms\n",
> +		 data->transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].time_constant);
> +	pr_debug("quiet_to_balanced: %u ms\n",
> +		 data->transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant);
> +	pr_debug("balanced_to_quiet: %u ms\n",
> +		 data->transition[AUTO_TRANSITION_TO_QUIET].time_constant);
> +
> +	/* power floor */
> +	pr_debug("pfloor_perf: %u mW\n", data->mode_set[AUTO_PERFORMANCE].power_floor);
> +	pr_debug("pfloor_balanced: %u mW\n", data->mode_set[AUTO_BALANCE].power_floor);
> +	pr_debug("pfloor_quiet: %u mW\n", data->mode_set[AUTO_QUIET].power_floor);
> +
> +	/* Power delta for mode change */
> +	pr_debug("pd_balanced_to_perf: %u mW\n",
> +		 data->transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
> +	pr_debug("pd_perf_to_balanced: %u mW\n",
> +		 data->transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
> +	pr_debug("pd_quiet_to_balanced: %u mW\n",
> +		 data->transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
> +	pr_debug("pd_balanced_to_quiet: %u mW\n",
> +		 data->transition[AUTO_TRANSITION_TO_QUIET].power_delta);
> +
> +	/* skin temperature limits */
> +	its_mode = &data->mode_set[AUTO_PERFORMANCE_ON_LAP];
> +	pr_debug("stt_apu_perf_on_lap: %u C\n",
> +		 its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_perf_on_lap: %u C\n",
> +		 its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_perf_on_lap: %u mW\n", its_mode->power_control.stt_min);
> +
> +	its_mode = &data->mode_set[AUTO_PERFORMANCE];
> +	pr_debug("stt_apu_perf: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_perf: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_perf: %u mW\n", its_mode->power_control.stt_min);
> +
> +	its_mode = &data->mode_set[AUTO_BALANCE];
> +	pr_debug("stt_apu_balanced: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_balanced: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_balanced: %u mW\n", its_mode->power_control.stt_min);
> +
> +	its_mode = &data->mode_set[AUTO_QUIET];
> +	pr_debug("stt_apu_quiet: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_quiet: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_quiet: %u mW\n", its_mode->power_control.stt_min);
> +
> +	/* SPL based power limits */
> +	its_mode = &data->mode_set[AUTO_PERFORMANCE_ON_LAP];
> +	pr_debug("fppt_perf_on_lap: %u mW\n", its_mode->power_control.fppt);
> +	pr_debug("sppt_perf_on_lap: %u mW\n", its_mode->power_control.sppt);
> +	pr_debug("spl_perf_on_lap: %u mW\n", its_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_perf_on_lap: %u mW\n", its_mode->power_control.sppt_apu_only);
> +
> +	its_mode = &data->mode_set[AUTO_PERFORMANCE];
> +	pr_debug("fppt_perf: %u mW\n", its_mode->power_control.fppt);
> +	pr_debug("sppt_perf: %u mW\n", its_mode->power_control.sppt);
> +	pr_debug("spl_perf: %u mW\n", its_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_perf: %u mW\n", its_mode->power_control.sppt_apu_only);
> +
> +	its_mode = &data->mode_set[AUTO_BALANCE];
> +	pr_debug("fppt_balanced: %u mW\n", its_mode->power_control.fppt);
> +	pr_debug("sppt_balanced: %u mW\n", its_mode->power_control.sppt);
> +	pr_debug("spl_balanced: %u mW\n", its_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_balanced: %u mW\n", its_mode->power_control.sppt_apu_only);
> +
> +	its_mode = &data->mode_set[AUTO_QUIET];
> +	pr_debug("fppt_quiet: %u mW\n", its_mode->power_control.fppt);
> +	pr_debug("sppt_quiet: %u mW\n", its_mode->power_control.sppt);
> +	pr_debug("spl_quiet: %u mW\n", its_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_quiet: %u mW\n", its_mode->power_control.sppt_apu_only);
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
> @@ -140,6 +234,30 @@ static void amd_pmf_get_power_threshold(void)
>  	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_threshold =
>  		config_store.mode_set[AUTO_PERFORMANCE].power_floor -
>  		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta;
> +
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	pr_debug("[AUTO MODE TO_QUIET] pt: %u mW pf: %u mW pd: %u mW\n",
> +		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold,
> +		 config_store.mode_set[AUTO_BALANCE].power_floor,
> +		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta);
> +
> +	pr_debug("[AUTO MODE TO_PERFORMANCE] pt: %u mW pf: %u mW pd: %u mW\n",
> +		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_threshold,
> +		 config_store.mode_set[AUTO_BALANCE].power_floor,
> +		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
> +
> +	pr_debug("[AUTO MODE QUIET_TO_BALANCE] pt: %u mW pf: %u mW pd: %u mW\n",
> +		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE]
> +		 .power_threshold,
> +		 config_store.mode_set[AUTO_QUIET].power_floor,
> +		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
> +
> +	pr_debug("[AUTO MODE PERFORMANCE_TO_BALANCE] pt: %u mW pf: %u mW pd: %u mW\n",
> +		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE]
> +		 .power_threshold,
> +		 config_store.mode_set[AUTO_PERFORMANCE].power_floor,
> +		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
> +#endif
>  }
>  
>  static const char *state_as_str(unsigned int state)
> @@ -262,6 +380,8 @@ static void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
>  	/* set to initial default values */
>  	config_store.current_mode = AUTO_BALANCE;
>  	dev->socket_power_history_idx = -1;
> +
> +	amd_pmf_dump_auto_mode_defaults(&config_store);
>  }
>  
>  int amd_pmf_reset_amt(struct amd_pmf_dev *dev)
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 4beb22a19466..35af7c18f600 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -13,6 +13,61 @@
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
> +	pr_debug("flags: 0x%x\n", data->flags);
> +
> +	/* Time constants */
> +	pr_debug("t_perf_to_turbo: %u ms\n", data->t_perf_to_turbo);
> +	pr_debug("t_balanced_to_perf: %u ms\n", data->t_balanced_to_perf);
> +	pr_debug("t_quiet_to_balanced: %u ms\n", data->t_quiet_to_balanced);
> +	pr_debug("t_balanced_to_quiet: %u ms\n", data->t_balanced_to_quiet);
> +	pr_debug("t_perf_to_balanced: %u ms\n", data->t_perf_to_balanced);
> +	pr_debug("t_turbo_to_perf: %u ms\n", data->t_turbo_to_perf);
> +
> +	for (i = 0 ; i < CNQF_MODE_MAX ; i++) {
> +		pr_debug("pfloor_%s: %u mW\n", state_as_str_cnqf(i), data->ps[i].pfloor);
> +		pr_debug("fppt_%s: %u mW\n", state_as_str_cnqf(i), data->ps[i].fppt);
> +		pr_debug("sppt_%s: %u mW\n", state_as_str_cnqf(i), data->ps[i].sppt);
> +		pr_debug("sppt_apuonly_%s: %u mW\n",
> +			 state_as_str_cnqf(i), data->ps[i].sppt_apu_only);
> +		pr_debug("spl_%s: %u mW\n", state_as_str_cnqf(i), data->ps[i].spl);
> +		pr_debug("stt_minlimit_%s: %u mW\n",
> +			 state_as_str_cnqf(i), data->ps[i].stt_min_limit);
> +		pr_debug("stt_skintemp_apu_%s: %u C\n", state_as_str_cnqf(i),
> +			 data->ps[i].stt_skintemp[STT_TEMP_APU]);
> +		pr_debug("stt_skintemp_hs2_%s: %u C\n", state_as_str_cnqf(i),
> +			 data->ps[i].stt_skintemp[STT_TEMP_HS2]);
> +		pr_debug("fan_id_%s: %u\n", state_as_str_cnqf(i), data->ps[i].fan_id);
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
> @@ -284,6 +339,7 @@ static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
>  			return ret;
>  		}
>  
> +		amd_pmf_cnqf_dump_defaults(&out, i);
>  		amd_pmf_update_mode_set(i, &out);
>  		amd_pmf_update_trans_data(i, &out);
>  		amd_pmf_update_power_threshold(i);
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

