Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D83FC77B6F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Apr 2023 08:26:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbjDKI0X (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Apr 2023 04:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjDKI0A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Apr 2023 04:26:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC9B4469E
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 01:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681201449;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0ROB7X3iyC6485MTDFG+d3/NUOQhj35Ymt9eD1S9zm0=;
        b=WZI8mBDZwi45UtFdrN62SMRSH0Sm5IzduASX2LzRQL8uDFwz6NHz86pbCJcTHVf9jH2jAv
        2zt5mOTlFoQpdGxKmWCK2p1q5S4dSMwTUp589LsCeacYImCxaLAEGZ/v8849Mr0Uh521aI
        JoH+Eav2p4PP38ypbEWpllRQ4Py74tE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-rYSkyLdIPwKUGDATS4Na8A-1; Tue, 11 Apr 2023 04:24:08 -0400
X-MC-Unique: rYSkyLdIPwKUGDATS4Na8A-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-504a37e1c3bso693076a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 01:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201447; x=1683793447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ROB7X3iyC6485MTDFG+d3/NUOQhj35Ymt9eD1S9zm0=;
        b=krbuvlSPAD/ZWh4UD2ypHHjsNGq8bvAd2fnSA68/JQa59x9TJhBsJrPYuELSI/L0qt
         9UHQ0RamJMVjCGqJGKnRpm4nUpd8ob8BTyPBBQZGcKESpG51RAMrHk7KCgBT0PBlVZ+h
         IDl1i1Wm2RGOyWAqJWXxrUUQ365dJqOWkIccWbVfaWRlZW7iSpK20QAY2aMNrG+/sS0u
         E3z9y/jB7WjNWMnEHHiepjvwm7qrW+kQKMn8YFymwmSyrky5FxLB7JJRXDAU3ECnDw5U
         SuHbomf71w+vq+m57zC0JyO8Zje71WyH7cB1cuTEe1WrberMGxfGnXXsRxG/30rvASaV
         VudA==
X-Gm-Message-State: AAQBX9enpcS/gFwvrGEc6upBRlhaT1ylDMhKX3n6dexx0NELiZF9nbTZ
        T3RH3jqHENYCep5ScCPlFqckh4Pi+LuKMgClUZ9rwYm4tbIhpZMEc1D29EEydpTKGhTYV+fVMSV
        dlILgaZDjNW2BN679/Gpb3VQ1DrTMcdwBkA==
X-Received: by 2002:aa7:de09:0:b0:504:8d0c:211b with SMTP id h9-20020aa7de09000000b005048d0c211bmr1808359edv.14.1681201447633;
        Tue, 11 Apr 2023 01:24:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350YQtE2nfSP90n3Pik28Xy+JOgaCaH1o4pt+jFUFkcHObILPNl572v1TrNmmInJMY5VezhnnxA==
X-Received: by 2002:aa7:de09:0:b0:504:8d0c:211b with SMTP id h9-20020aa7de09000000b005048d0c211bmr1808334edv.14.1681201447225;
        Tue, 11 Apr 2023 01:24:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id jl25-20020a17090775d900b0094b360a281dsm1249737ejc.123.2023.04.11.01.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:24:06 -0700 (PDT)
Message-ID: <6cdf5433-cd84-6ce0-46cd-acb9415cec01@redhat.com>
Date:   Tue, 11 Apr 2023 10:24:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] platform/x86/amd/pmf: Add PMF acpi debug support
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com
References: <20230406164807.50969-1-Shyam-sundar.S-k@amd.com>
 <20230406164807.50969-2-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230406164807.50969-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 4/6/23 18:48, Shyam Sundar S K wrote:
> PMF driver maintains an internal config store for each PMF feature
> after the feature init happens. Having a debug mechanism to triage
> in-field issues w.r.t to mode switch not happening based on the OEM
> fed values via the ACPI method to PMF driver is becoming the need of
> the hour. Add support to get more ACPI debug spew guarded by a CONFIG.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Kconfig     |  11 +++
>  drivers/platform/x86/amd/pmf/auto-mode.c | 120 +++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/cnqf.c      |  66 ++++++++++++-
>  drivers/platform/x86/amd/pmf/sps.c       |  55 +++++++++++
>  4 files changed, 250 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 6d89528c3177..f4fd764e55a6 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -15,3 +15,14 @@ config AMD_PMF
>  
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called amd_pmf.
> +
> +config AMD_PMF_ACPI_DEBUG
> +	bool "AMD PMF acpi debug"
> +	depends on AMD_PMF
> +	help
> +	 Enabling this option would give more debug information on the OEM fed
> +	 power setting values for each of the PMF feature. PMF driver gets this
> +	 information after evaluating a ACPI method and the information is stored
> +	 in the PMF config store.
> +
> +	 Say Y here to enable more debug logs and Say N here if you are not sure.
> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
> index 96a8e1832c05..777490fcf8b9 100644
> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -15,6 +15,98 @@
>  static struct auto_mode_mode_config config_store;
>  static const char *state_as_str(unsigned int state);
>  
> +#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
> +static void amd_pmf_dump_auto_mode_defaults(struct auto_mode_mode_config data)

Please use a pointer here. Right now you are making a copy of the entire
struct on the stack and stack space is limited in the kernel.

> +{
> +	struct auto_mode_mode_settings *auto_mode;
> +
> +	pr_debug("Auto Mode Data - BEGIN\n");
> +
> +	/* time constant */
> +	pr_debug("balanced_to_perf: %u\n",
> +		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE]
> +		 .time_constant);
> +	pr_debug("perf_to_balanced: %u\n",
> +		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE]
> +		 .time_constant);
> +	pr_debug("quiet_to_balanced: %u\n",
> +		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant);
> +	pr_debug("balanced_to_quiet: %u\n",
> +		 config_store.transition[AUTO_TRANSITION_TO_QUIET].time_constant);
> +
> +	/* power floor */
> +	pr_debug("pfloor_perf: %u\n", config_store.mode_set[AUTO_PERFORMANCE].power_floor);
> +	pr_debug("pfloor_balanced: %u\n", config_store.mode_set[AUTO_BALANCE].power_floor);
> +	pr_debug("pfloor_quiet: %u\n", config_store.mode_set[AUTO_QUIET].power_floor);
> +
> +	/* Power delta for mode change */
> +	pr_debug("pd_balanced_to_perf: %u\n",
> +		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
> +	pr_debug("pd_perf_to_balanced: %u\n",
> +		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
> +	pr_debug("pd_quiet_to_balanced: %u\n",
> +		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
> +	pr_debug("pd_balanced_to_quiet: %u\n",
> +		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta);
> +
> +	/* skin temperature limits */
> +	auto_mode = &config_store.mode_set[AUTO_PERFORMANCE_ON_LAP];
> +	pr_debug("stt_apu_perf_on_lap: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_perf_on_lap: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_perf_on_lap: %u\n", auto_mode->power_control.stt_min);
> +
> +	auto_mode = &config_store.mode_set[AUTO_PERFORMANCE];
> +	pr_debug("stt_apu_perf: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_perf: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_perf: %u\n", auto_mode->power_control.stt_min);
> +
> +	auto_mode = &config_store.mode_set[AUTO_BALANCE];
> +	pr_debug("stt_apu_balanced: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_balanced: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_balanced: %u\n", auto_mode->power_control.stt_min);
> +
> +	auto_mode = &config_store.mode_set[AUTO_QUIET];
> +	pr_debug("stt_apu_quiet: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_quiet: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_quiet: %u\n", auto_mode->power_control.stt_min);
> +
> +	/* SPL based power limits */
> +	auto_mode = &config_store.mode_set[AUTO_PERFORMANCE_ON_LAP];
> +	pr_debug("fppt_perf_on_lap: %u\n", auto_mode->power_control.fppt);
> +	pr_debug("sppt_perf_on_lap: %u\n", auto_mode->power_control.sppt);
> +	pr_debug("spl_perf_on_lap: %u\n", auto_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_perf_on_lap: %u\n", auto_mode->power_control.sppt_apu_only);
> +
> +	auto_mode = &config_store.mode_set[AUTO_PERFORMANCE];
> +	pr_debug("fppt_perf: %u\n", auto_mode->power_control.fppt);
> +	pr_debug("sppt_perf: %u\n", auto_mode->power_control.sppt);
> +	pr_debug("spl_perf: %u\n", auto_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_perf: %u\n", auto_mode->power_control.sppt_apu_only);
> +
> +	auto_mode = &config_store.mode_set[AUTO_BALANCE];
> +	pr_debug("fppt_balanced: %u\n", auto_mode->power_control.fppt);
> +	pr_debug("sppt_balanced: %u\n", auto_mode->power_control.sppt);
> +	pr_debug("spl_balanced: %u\n", auto_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_balanced: %u\n", auto_mode->power_control.sppt_apu_only);
> +
> +	auto_mode = &config_store.mode_set[AUTO_QUIET];
> +	pr_debug("fppt_quiet: %u\n", auto_mode->power_control.fppt);
> +	pr_debug("sppt_quiet: %u\n", auto_mode->power_control.sppt);
> +	pr_debug("spl_quiet: %u\n", auto_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_quiet: %u\n", auto_mode->power_control.sppt_apu_only);
> +
> +	/* Fan ID */
> +	pr_debug("fan_id_perf: %lu\n",
> +		 config_store.mode_set[AUTO_PERFORMANCE].fan_control.fan_id);
> +	pr_debug("fan_id_balanced: %lu\n",
> +		 config_store.mode_set[AUTO_BALANCE].fan_control.fan_id);
> +	pr_debug("fan_id_quiet: %lu\n",
> +		 config_store.mode_set[AUTO_QUIET].fan_control.fan_id);
> +
> +	pr_debug("Auto Mode Data - END\n");
> +}

Please add:

#else
static void amd_pmf_dump_auto_mode_defaults(struct auto_mode_mode_config *data) {}

here.

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
> +#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
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
> @@ -262,6 +378,10 @@ static void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
>  	/* set to initial default values */
>  	config_store.current_mode = AUTO_BALANCE;
>  	dev->socket_power_history_idx = -1;
> +
> +#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
> +	amd_pmf_dump_auto_mode_defaults(config_store);
> +#endif

And drop the #ifdef and #endif lines here.

>  }
>  
>  int amd_pmf_reset_amt(struct amd_pmf_dev *dev)
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 4beb22a19466..4b9691cd592a 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -13,6 +13,60 @@
>  
>  static struct cnqf_config config_store;
>  
> +#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
> +static const char *amd_pmf_cnqf_state_as_str(unsigned int state)
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
> +static void amd_pmf_cnqf_dump_defaults(struct apmf_dyn_slider_output data, int idx)

Please use a pointer here. Right now you are making a copy of the entire
struct on the stack and stack space is limited in the kernel.

> +{
> +	int i;
> +
> +	pr_debug("CnQF %s Defaults - BEGIN\n", idx ? "DC" : "AC");
> +	pr_debug("size: %u\n", data.size);
> +	pr_debug("flags: %u\n", data.flags);
> +
> +	/* Time constants */
> +	pr_debug("t_perf_to_turbo: %u\n", data.t_perf_to_turbo);
> +	pr_debug("t_balanced_to_perf: %u\n", data.t_balanced_to_perf);
> +	pr_debug("t_quiet_to_balanced: %u\n", data.t_quiet_to_balanced);
> +	pr_debug("t_balanced_to_quiet: %u\n", data.t_balanced_to_quiet);
> +	pr_debug("t_perf_to_balanced: %u\n", data.t_perf_to_balanced);
> +	pr_debug("t_turbo_to_perf: %u\n", data.t_turbo_to_perf);
> +
> +	for (i = 0 ; i < CNQF_MODE_MAX ; i++) {
> +		pr_debug("pfloor_%s: %u\n", amd_pmf_cnqf_state_as_str(i), data.ps[i].pfloor);
> +		pr_debug("fppt_%s: %u\n", amd_pmf_cnqf_state_as_str(i), data.ps[i].fppt);
> +		pr_debug("sppt_%s: %u\n", amd_pmf_cnqf_state_as_str(i), data.ps[i].sppt);
> +		pr_debug("sppt_apuonly_%s: %u\n", amd_pmf_cnqf_state_as_str(i),
> +			 data.ps[i].sppt_apu_only);
> +		pr_debug("spl_%s: %u\n", amd_pmf_cnqf_state_as_str(i),
> +			 data.ps[i].spl);
> +		pr_debug("stt_minlimit_%s: %u\n", amd_pmf_cnqf_state_as_str(i),
> +			 data.ps[i].stt_min_limit);
> +		pr_debug("stt_skintemp_apu_%s: %u\n", amd_pmf_cnqf_state_as_str(i),
> +			 data.ps[i].stt_skintemp[STT_TEMP_APU]);
> +		pr_debug("stt_skintemp_hs2_%s: %u\n", amd_pmf_cnqf_state_as_str(i),
> +			 data.ps[i].stt_skintemp[STT_TEMP_HS2]);
> +		pr_debug("fan_id_%s: %d\n", amd_pmf_cnqf_state_as_str(i), data.ps[i].fan_id);
> +	}
> +
> +	pr_debug("CnQF %s Defaults - END\n", idx ? "DC" : "AC");
> +}

Please add:

#else
static void amd_pmf_cnqf_dump_defaults(struct apmf_dyn_slider_output *data, int idx) {}

here.

> +#endif
> +
>  static int amd_pmf_set_cnqf(struct amd_pmf_dev *dev, int src, int idx,
>  			    struct cnqf_config *table)
>  {
> @@ -275,10 +329,18 @@ static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
>  		if (!is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC + i))
>  			continue;
>  
> -		if (i == POWER_SOURCE_AC)
> +		if (i == POWER_SOURCE_AC) {
>  			ret = apmf_get_dyn_slider_def_ac(dev, &out);
> -		else
> +#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
> +			amd_pmf_cnqf_dump_defaults(out, i);
> +#endif

And drop the #ifdef and #endif lines here.

> +		} else {
>  			ret = apmf_get_dyn_slider_def_dc(dev, &out);
> +#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
> +			amd_pmf_cnqf_dump_defaults(out, i);
> +#endif

And here.

> +		}
> +
>  		if (ret) {
>  			dev_err(dev->dev, "APMF apmf_get_dyn_slider_def_dc failed :%d\n", ret);
>  			return ret;
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index bed762d47a14..affb8ef4f203 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -12,6 +12,58 @@
>  
>  static struct amd_pmf_static_slider_granular config_store;
>  
> +#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
> +static const char *slider_as_str(unsigned int state)
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
> +static const char *source_as_str(unsigned int state)
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
> +static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular data)

Please use a pointer here. Right now you are making a copy of the entire
struct on the stack and stack space is limited in the kernel.

> +{
> +	int i, j;
> +
> +	pr_debug("Static Slider Data - BEGIN\n");
> +
> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
> +		for (j = 0; j < POWER_MODE_MAX; j++) {
> +			pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
> +			pr_debug("SPL: %u mW\n", data.prop[i][j].spl);
> +			pr_debug("SPPT: %u mW\n", data.prop[i][j].sppt);
> +			pr_debug("SPPT_ApuOnly: %u mW\n", data.prop[i][j].sppt_apu_only);
> +			pr_debug("FPPT: %u mW\n", data.prop[i][j].fppt);
> +			pr_debug("STTMinLimit: %u mW\n", data.prop[i][j].stt_min);
> +			pr_debug("STT_SkinTempLimit_APU: %u C\n",
> +				 data.prop[i][j].stt_skin_temp[STT_TEMP_APU]);
> +			pr_debug("STT_SkinTempLimit_HS2: %u C\n",
> +				 data.prop[i][j].stt_skin_temp[STT_TEMP_HS2]);
> +		}
> +	}
> +
> +	pr_debug("Static Slider Data - END\n");
> +}

Please add:

#else
static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data) {}

here.

> +#endif
> +
>  static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>  {
>  	struct apmf_static_slider_granular_output output;
> @@ -36,6 +88,9 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>  			idx++;
>  		}
>  	}
> +#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
> +	amd_pmf_dump_sps_defaults(config_store);
> +#endif

And drop the #ifdef and #endif lines here.

>  }
>  
>  void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,

Regards,

Hans

