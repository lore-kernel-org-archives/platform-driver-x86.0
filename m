Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A63C04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 21:48:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiG0VsD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 17:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiG0VsC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 17:48:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2433511A23
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 14:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658958480;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4YSLnzjinJJRI+D88VH39Oy1Vc+0bxZ9OidGoCxtqiU=;
        b=GHazBoSnYO11iTMaDC7ahQ/dBTbwA8Bm4NsawBVwjSd5QJbxLuNdHtg7IQGeQMzg0bml4K
        P9eWmbuu9K96adJAfsViLNRq90Aw/EzyDHlAwWpKEbmwCPZJgHHYETgSxQaAtQXuO+W1rv
        4LMA0pQ5RC/bv99zWdK6PMyv1p3Y4Ow=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-Eu9LIn29M46YleyKxJOIsg-1; Wed, 27 Jul 2022 17:47:58 -0400
X-MC-Unique: Eu9LIn29M46YleyKxJOIsg-1
Received: by mail-ed1-f72.google.com with SMTP id y2-20020a056402440200b0043bd6c898deso5570eda.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 14:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=4YSLnzjinJJRI+D88VH39Oy1Vc+0bxZ9OidGoCxtqiU=;
        b=cYLHi2qbG3iqdAhmm4MQiWlVqg38+ES+D4WGhwws1JcJwaPwuHH6oSgF58S7T13k51
         vRJCrH4ZSOnfwI07G8CJcyT1z7Cuc1Q6n8LtJ828HwrUtO8O4RI1Mm51PMj0+mHl2rg7
         zgArUd7NXEwRKU3CMA/ApJdh7ezpGZhCeOv+Y4u9Fl6g7MC62i2FWj/4WCgaf4z4M70S
         dSjJLOyOoYDRCwOrbmGpLHfsb4c4GctN3/4e3ngn/Nw2KjTLnFTcQGTiFAIJXnbTc+KI
         0gJvje7O9Pa9oqYnc3/oU1Xy521Mk6utIIOFOGa4SWWdwIYv8nhrz2X2naCsrjInpl0G
         Su+Q==
X-Gm-Message-State: AJIora//uZqV3XBtp511SzJJ2Syex7CfH4JPXTVqUpwIv6nafn90oSt0
        jRGtCfMEKLtt2iByNLgggb+13pdlhHT139P762xYI5GXdO8d7km/LkH0gAJd+tkxuLHE9IY9DkM
        5x+46grS7HU9ZhYjqkKSQqRes2+LfIh4i1A==
X-Received: by 2002:a05:6402:510f:b0:43b:f3d2:94a9 with SMTP id m15-20020a056402510f00b0043bf3d294a9mr18409318edd.103.1658958477574;
        Wed, 27 Jul 2022 14:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uTTFcQOW3qQ9S79YqkCQGKT16eFWC63VClVApqoIg21n2Wsv6nEJIkMG452sXaFQaB4EzfOg==
X-Received: by 2002:a05:6402:510f:b0:43b:f3d2:94a9 with SMTP id m15-20020a056402510f00b0043bf3d294a9mr18409296edd.103.1658958477053;
        Wed, 27 Jul 2022 14:47:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id n15-20020a05640206cf00b0043be9b2f7d2sm6318547edy.38.2022.07.27.14.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 14:47:07 -0700 (PDT)
Message-ID: <4585d2c6-6ac1-a697-d54a-f173e9821446@redhat.com>
Date:   Wed, 27 Jul 2022 23:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 13/15] platform/x86/amd/pmf: Handle AMT and CQL events
 for Auto mode
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-14-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
In-Reply-To: <20220712145847.3438544-14-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

<resend with Cc list fixed>

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> The transition to auto-mode happens when the PMF driver receives
> AMT (Auto Mode transition) event. transition logic will reside in the
> PMF driver but the events would come from other supported drivers[1].
> 
> The thermal parameters would vary between when a performance "on-lap" mode
> is detected and versus when not. The CQL event would get triggered from
> other drivers, so that PMF driver would adjust the system thermal config
> based on the ACPI inputs.
> 
> OEMs can control whether or not to enable AMT or CQL via other supported
> drivers[1] but the actual transition logic resides in the AMD PMF driver.
> When an AMT event is received the automatic mode transition RAPL algorithm
> will run. When a CQL event is received an performance "on-lap" mode will
> be enabled and thermal parameters will be adjusted accordingly.
> 
> [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=review-hans&id=755b249250df1b612d982f3b702c831b26ecdf73
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c      | 90 +++++++++++++++++++++++-
>  drivers/platform/x86/amd/pmf/auto-mode.c | 22 ++++++
>  drivers/platform/x86/amd/pmf/cnqf.c      |  4 +-
>  drivers/platform/x86/amd/pmf/core.c      | 18 ++++-
>  drivers/platform/x86/amd/pmf/pmf.h       | 29 +++++++-
>  5 files changed, 156 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index e9f33e61659f..4bde86aeafa0 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -12,6 +12,8 @@
>  #include "pmf.h"
>  
>  #define APMF_METHOD "\\_SB_.PMF_.APMF"
> +#define APMF_CQL_NOTIFICATION	2
> +#define APMF_AMT_NOTIFICATION	3
>  
>  static unsigned long supported_func;
>  
> @@ -55,6 +57,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>  {
>  	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>  	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
> +	func->sbios_requests = mask & APMF_FUNC_SBIOS_REQUESTS;
>  	func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
>  	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
>  	func->dyn_slider_ac = mask & APMF_FUNC_DYN_SLIDER_GRANULAR_AC;
> @@ -292,6 +295,36 @@ int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_o
>  	return err;
>  }
>  
> +int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req)
> +{
> +	union acpi_object *info;
> +	size_t size;
> +	int err = 0;
> +
> +	info = apmf_if_call(ampf_if, APMF_FUNC_SBIOS_REQUESTS, NULL);
> +	if (!info)
> +		return -EIO;
> +
> +	size = *(u16 *)info->buffer.pointer;
> +
> +	if (size < sizeof(union acpi_object)) {
> +		pr_err("PMF: buffer too small %zu\n", size);
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	size = min(sizeof(*req), size);
> +	memset(req, 0, sizeof(*req));
> +	memcpy(req, info->buffer.pointer, size);
> +
> +	pr_debug("PMF: %s: pending_req:%d cql:%d amt:%d\n", __func__,
> +		 req->pending_req, req->cql_event, req->amt_event);
> +
> +out:
> +	kfree(info);
> +	return err;
> +}
> +
>  static acpi_handle apmf_if_probe_handle(void)
>  {
>  	acpi_handle handle = NULL;
> @@ -312,18 +345,62 @@ static acpi_handle apmf_if_probe_handle(void)
>  	return handle;
>  }
>  
> +static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
> +{
> +	struct amd_pmf_dev *pmf_dev = data;
> +	struct apmf_if *apmf_if = pmf_dev->apmf_if;
> +	int ret;
> +
> +	if (apmf_if->func.sbios_requests) {
> +		struct apmf_sbios_req req;
> +
> +		ret = apmf_get_sbios_requests(apmf_if, &req);
> +		if (ret) {
> +			dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
> +			return;
> +		}
> +		if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
> +			pr_debug("PMF: AMT is supported and notifications %s\n",
> +				 req.amt_event ? "Enabled" : "Disabled");
> +			if (req.amt_event)
> +				pmf_dev->is_amt_event = true;
> +			else
> +				pmf_dev->is_amt_event = !!req.amt_event;
> +		}
> +
> +		if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
> +			pr_debug("PMF: CQL is supported and notifications %s\n",
> +				 req.cql_event ? "Enabled" : "Disabled");
> +			if (req.cql_event)
> +				pmf_dev->is_cql_event = true;
> +			else
> +				pmf_dev->is_cql_event = !!req.cql_event;
> +
> +			/* update the target mode information */
> +			amd_pmf_update_2_cql(pmf_dev);
> +		}
> +	}
> +}
> +
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>  {
> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> +
>  	if (pmf_dev->apmf_if->func.sbios_heartbeat)
>  		cancel_delayed_work_sync(&pmf_dev->heart_beat);
> +
> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE))
> +		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY,
> +					   apmf_event_handler);
>  }
>  
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  {
> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>  	struct apmf_notification_cfg *n;
>  	acpi_handle apmf_if_handle;
>  	struct apmf_if *apmf_if;
> -	int ret;
> +	int ret, status;
>  
>  	apmf_if_handle = apmf_if_probe_handle();
>  	if (!apmf_if_handle)
> @@ -360,6 +437,17 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  		schedule_delayed_work(&pmf_dev->heart_beat, 0);
>  	}
>  
> +	/* Install the APMF Notify handler */
> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
> +		status = acpi_install_notify_handler(ahandle,
> +						     ACPI_ALL_NOTIFY,
> +						     apmf_event_handler, pmf_dev);
> +		if (ACPI_FAILURE(status)) {
> +			dev_err(pmf_dev->dev, "failed to install notify handler\n");
> +			return -ENODEV;
> +		}
> +	}
> +
>  out:
>  	return ret;
>  }
> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
> index 954fde25e71e..a85ef4b95cdb 100644
> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -111,6 +111,13 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>  	bool update = false;
>  	int i, j;
>  
> +	if (!dev->amt_running && dev->is_amt_event) {
> +		dev_dbg(dev->dev, "setting AMT thermals\n");
> +		amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
> +		dev->amt_running = true;
> +		return;
> +	}
> +
>  	/* Get the average moving average computed by auto mode algorithm */
>  	avg_power = amd_pmf_get_moving_avg(socket_power);
>  
> @@ -161,6 +168,21 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>  	}
>  }
>  
> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev)
> +{
> +	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
> +			dev->is_cql_event ? AUTO_PERFORMANCE_ON_LAP : AUTO_PERFORMANCE;
> +	if ((config_store.current_mode == AUTO_PERFORMANCE ||
> +	     config_store.current_mode == AUTO_PERFORMANCE_ON_LAP) &&
> +	    config_store.current_mode !=
> +	    config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode) {
> +		config_store.current_mode =
> +				config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode;
> +		amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
> +	}
> +	dev_dbg(dev->dev, "updated CQL thermals\n");
> +}
> +
>  static void amd_pmf_get_power_threshold(void)
>  {
>  	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 2b03ae1ad37f..eba8f0d79a62 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -101,7 +101,7 @@ static const char *state_as_str(unsigned int state)
>  	}
>  }
>  
> -void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms)
> +void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms)
>  {
>  	struct cnqf_tran_params *tp;
>  	int src, i, j, index = 0;
> @@ -117,7 +117,7 @@ void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_
>  	}
>  
>  	for (i = 0; i < CNQF_TRANSITION_MAX; i++) {
> -		config_store.trans_param[src][i].timer += time_lapsed_ms;
> +		config_store.trans_param[src][i].timer += time_elapsed_ms;
>  		config_store.trans_param[src][i].total_power += socket_power;
>  		config_store.trans_param[src][i].count++;
>  
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 674ddf599135..2a3dacfb2005 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -109,10 +109,15 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>  	enum platform_profile_option current_profile;
>  	ktime_t time_elapsed_ms;
>  	int socket_power;
> +	u8 mode;
>  
>  	/* Get the current profile information */
>  	platform_profile_get(&current_profile);
>  
> +	if (!dev->is_amt_event)
> +		dev_dbg(dev->dev, "%s amt event: %s\n", __func__,
> +			dev->is_amt_event ? "Enabled" : "Disabled");
> +
>  	/* Transfer table contents */
>  	memset(&dev->m_table, 0, sizeof(dev->m_table));
>  	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> @@ -123,8 +128,17 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>  	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>  
>  	if (current_profile == PLATFORM_PROFILE_BALANCED) {

Hmm, I guess this is also why the platform_profile_get() is necessary ? Because
on Thinkpads thinkpad_acpi is expected to be the platform_profile provider and
then the PMF code wants to know the platform_profile setting from thinkpad_acpi ?

Can you please explain the expected interactions between thinkpad_acpi and
this code here a bit more ?

Since we now only call amd_pmf_trans_automode() based on the AMT flag and
that flag is controlled by the thinkpad BIOS/EC can we not expect that flag
to be cleared when the profile is not balanced and can we thus not just drop
the current_profile == PLATFORM_PROFILE_BALANCED check all together?

It seems to me that if current_profile == PLATFORM_PROFILE_BALANCED
then enable AMT, else disable it, logic belongs inside thinkpad_acpi
and not here?

Regards,

Hans

> -		/* Apply the Auto Mode transition */
> -		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
> +		if (dev->is_amt_event) {
> +			/* Apply the Auto Mode transition */
> +			amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
> +		} else if (!dev->is_amt_event && dev->amt_running) {
> +			pr_debug("resetting AMT thermals\n");
> +			mode = amd_pmf_get_pprof_modes(dev);
> +			amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
> +			dev->amt_running = false;
> +		}
> +	} else {
> +		dev->amt_running = false;
>  	}
>  
>  	if (dev->cnqf_feat) {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 0532f49e9613..9ae9812353cd 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -17,6 +17,7 @@
>  /* APMF Functions */
>  #define APMF_FUNC_VERIFY_INTERFACE			0
>  #define APMF_FUNC_GET_SYS_PARAMS			1
> +#define APMF_FUNC_SBIOS_REQUESTS			2
>  #define APMF_FUNC_SBIOS_HEARTBEAT			4
>  #define APMF_FUNC_AUTO_MODE					5
>  #define APMF_FUNC_SET_FAN_IDX				7
> @@ -51,6 +52,7 @@
>  /* AMD PMF BIOS interfaces */
>  struct apmf_if_functions {
>  	bool system_params;
> +	bool sbios_requests;
>  	bool sbios_heartbeat;
>  	bool auto_mode_def;
>  	bool fan_table_idx;
> @@ -84,6 +86,24 @@ struct apmf_system_params {
>  	u32 heartbeat_int;
>  } __packed;
>  
> +struct apmf_sbios_req {
> +	u16 size;
> +	u32 pending_req;
> +	u8 rsd;
> +	u8 cql_event;
> +	u8 amt_event;
> +	u32 fppt;
> +	u32 sppt;
> +	u32 fppt_apu_only;
> +	u32 spl;
> +	u32 stt_min_limit;
> +	u8 skin_temp_apu;
> +	u8 skin_temp_hs2;
> +	u8 dps_enable;
> +	u32 custom_policy_1;
> +	u32 custom_policy_2;
> +} __packed;
> +
>  struct apmf_fan_idx {
>  	u16 size;
>  	u8 fan_ctl_mode;
> @@ -171,6 +191,9 @@ struct amd_pmf_dev {
>  #endif /* CONFIG_DEBUG_FS */
>  	bool cnqf_feat;
>  	bool cnqf_running;
> +	bool is_amt_event;
> +	bool is_cql_event;
> +	bool amt_running;
>  };
>  
>  struct apmf_sps_prop_granular {
> @@ -417,9 +440,11 @@ int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
>  /* Auto Mode Layer */
>  void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev);
>  int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data);
> +int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req);
>  void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
> -void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev);
> +void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>  
>  /* CnQF Layer */
>  int apmf_get_dyn_slider_def_ac(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data);
> @@ -427,6 +452,6 @@ int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_o
>  void amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
>  void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev);
> -void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
> +void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>  
>  #endif /* PMF_H */

