Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011FAC77B72
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 09:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjDQJeI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 05:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjDQJeG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 05:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 359745587
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 02:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681723904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qcHfH2b4MwEtoOs3TDmmoOPumAASM5MB8EBgd9vlX3k=;
        b=M7RbfiFOtIBXPen030YMGk95kgdfn2dbeAjDrjRNfRM678pf9RJuZtkidOYZ7sxguV37mC
        VQXCdf+t332M9UZjB2DLtZtew5OxkT+cBDgN1uCD2V4Xv3uDFVRH5NS7j9dl1TmFUAqhxn
        zf1UewpxI707bwj1P9dq9LmS9FrAzeQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-QitsYLQWOva6BsS2oQa_yg-1; Mon, 17 Apr 2023 05:31:41 -0400
X-MC-Unique: QitsYLQWOva6BsS2oQa_yg-1
Received: by mail-ed1-f70.google.com with SMTP id e30-20020a50a69e000000b0050690ba4f68so3073015edc.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 02:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681723899; x=1684315899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcHfH2b4MwEtoOs3TDmmoOPumAASM5MB8EBgd9vlX3k=;
        b=f+Xjrelr6sAS5lActBNTT/G+cQRBLdNtS8ETunkjZbU5IWwAZqC3vWR2z9kZ2Y/V5n
         n1kBBZiPYRCW64OS+j+SAEEzAfg1110FU609XWGq5VWyipRLe5JaJaQ+dBKsPGj2uMd3
         lNif0htunk3baR00nfhhKJwVZfX4kyBngOO5/0/j9imFUm4m6IK1qJXKNgjsmVFAPjS+
         8KDwq7JjoBwCOk14IDT8EH1rbonZZLDspDhuKETf7KGtc+Qtrup6+35JaEOwtD0gySwJ
         rz90CDsdrkyQ0nsvaoJGmiKfo9h5Okuf3ou6cbx73woZ1AcmxkgkdSn+F5hAu0RxJFpD
         8d6A==
X-Gm-Message-State: AAQBX9fVxBQ/dHLMt1GutdUUwGzB14fb61eWaZaU6R+vLjdmFy3VD/lX
        0IOa9wA7ZILDeCE9xsryI1Np/IxnOfgX4KBlOzx0c9/uF4V0lNTv/YNjtte0Juv55g8mbaAGpfp
        0LVFcmyAkgbR6A80V/SeGlYNYGQ+L639ifXTLUcnygw==
X-Received: by 2002:a17:906:2412:b0:93e:908d:cfe2 with SMTP id z18-20020a170906241200b0093e908dcfe2mr7668618eja.0.1681723899423;
        Mon, 17 Apr 2023 02:31:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZZwr6o2mOtwj86onDgqeM4Ym3Ya2dPcoox+kSgvoPQ0mGmPB1Od7kESXdbbQC7EF/Da/F6/g==
X-Received: by 2002:a17:906:2412:b0:93e:908d:cfe2 with SMTP id z18-20020a170906241200b0093e908dcfe2mr7668604eja.0.1681723899080;
        Mon, 17 Apr 2023 02:31:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w18-20020a1709064a1200b0094e92b50076sm6319940eju.133.2023.04.17.02.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 02:31:38 -0700 (PDT)
Message-ID: <59264fbd-8137-579f-4e70-b3fff64a3931@redhat.com>
Date:   Mon, 17 Apr 2023 11:31:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmf: Add PMF acpi debug support
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com
References: <20230412105242.2602148-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230412105242.2602148-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 4/12/23 12:52, Shyam Sundar S K wrote:
> PMF driver maintains an internal config store for each PMF feature
> after the feature init happens. Having a debug mechanism to triage
> in-field issues w.r.t to mode switch not happening based on the OEM
> fed values via the ACPI method to PMF driver is becoming the need of
> the hour. Add support to get more ACPI debug spew guarded by a CONFIG.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Please prepare a new version of this series addressing
Ilpo's review remarks.

Regards,

Hans




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

