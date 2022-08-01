Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D05EC19F2A
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 14:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbiHAOBJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 10:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbiHAOBH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 10:01:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ED0F5A444
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 07:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659362464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y0ineRtP3rQvGGvZQr5sBt+JXBF1HVaowt9fEGhvzs0=;
        b=TIvkefpQ3tVexJW5qHOjDwoI9A18e5foqO88/Wg7hEERKKcHkpkB/cc45z/VcLjvpQz72J
        SxnfDh1dv24ngKO8MVazZcPDHGMXIVvpF+hDAmS0tmEqloK/wVOd+NUUB15DBehf2QHkht
        kAhsQYoi9tDFJ42J+cqCG/fJ6DkvaMs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-_zFAGfYiOPCQAy55QZhgWw-1; Mon, 01 Aug 2022 10:01:03 -0400
X-MC-Unique: _zFAGfYiOPCQAy55QZhgWw-1
Received: by mail-ej1-f71.google.com with SMTP id hr24-20020a1709073f9800b0072b57c28438so3007027ejc.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 07:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y0ineRtP3rQvGGvZQr5sBt+JXBF1HVaowt9fEGhvzs0=;
        b=GD1N7NvF6n5gFs3O0vCN07fD9ZBpu24My/6uKygHpL5LetnQBkPzcOkLErtrE2we1y
         h9XtgzJ5Ok8BVv4O30ij+abeU5SH6Ci8DPRkmihncs+dD9kpUS7dMxRbwKpmH4t4xoll
         RxmWbC81ZgEZTmXiEprO6j/te/AsnbZM5IxMn3e9gUV98BpodJlpTksIfxvVNqJpnQaV
         c8L3jBD6vkAFR4LTXmZ5kzFg2IeZrjx4CPrJeKy4QRG0DCyJFiJ1+CgcWYs2Q0yXrNO1
         mao2h7iGQNWkYZXVboSodZ/0PYexCmIo0Ys4RHwNlUo2i2+SFJ9f8jDHRX0l8uaHP00U
         6pDA==
X-Gm-Message-State: AJIora9+Ub8j5gzYZ6d05j+p1ubVxdozodOPzbZ4M9QLdcqIfUXZx84/
        sIhEWKqhnWmz63xb95m9D2sn5OtOfNCf6RzM9kehZaKfhkzxPCZfdUCfY5A4Jha6e+uR5m065uY
        +XKEAW3BvqzlA/Ao1gMuPWp0jglEaz85aGw==
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id fj2-20020a1709069c8200b006e12c941616mr12847209ejc.64.1659362462123;
        Mon, 01 Aug 2022 07:01:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s4e2zwbF0GEfmOKdd4ORsBcD1+oOBrBKi9RV53ui4UXWQSRpzMDmaEFSYMrJjwkh2pjqetKQ==
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id fj2-20020a1709069c8200b006e12c941616mr12847191ejc.64.1659362461853;
        Mon, 01 Aug 2022 07:01:01 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id b17-20020a1709063cb100b0072eddcc807fsm5215756ejh.155.2022.08.01.07.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 07:01:00 -0700 (PDT)
Message-ID: <b4200b73-90a1-9a05-0390-cfc41fc92590@redhat.com>
Date:   Mon, 1 Aug 2022 16:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 RESEND 09/11] platform/x86/amd/pmf: Handle AMT and CQL
 events for Auto mode
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-10-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220728182028.2082096-10-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 7/28/22 20:20, Shyam Sundar S K wrote:
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
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Mark Pearson <markpearson@lenovo.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c      | 59 ++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/auto-mode.c | 22 +++++++++
>  drivers/platform/x86/amd/pmf/core.c      | 32 +++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h       | 22 +++++++++
>  4 files changed, 135 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 724150ec58fb..dedaebf18d88 100644
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
> @@ -99,6 +101,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>  {
>  	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>  	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
> +	func->sbios_requests = mask & APMF_FUNC_SBIOS_REQUESTS;
>  	func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
>  	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
>  }
> @@ -167,6 +170,44 @@ int apmf_get_auto_mode_def(struct apmf_if *apmf_if, struct apmf_auto_mode *data)
>  					 data, sizeof(*data));
>  }
>  
> +int apmf_get_sbios_requests(struct apmf_if *apmf_if, struct apmf_sbios_req *req)
> +{
> +	return apmf_if_call_store_buffer(apmf_if, APMF_FUNC_SBIOS_REQUESTS,
> +									 req, sizeof(*req));
> +}
> +
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
> +
> +		if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
> +			pr_debug("PMF: AMT is supported and notifications %s\n",
> +				 req.amt_event ? "Enabled" : "Disabled");
> +			pmf_dev->is_amt_event = !!req.amt_event;
> +		}
> +
> +		if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
> +			pr_debug("PMF: CQL is supported and notifications %s\n",
> +				 req.cql_event ? "Enabled" : "Disabled");
> +			pmf_dev->is_cql_event = !!req.cql_event;
> +
> +			/* update the target mode information */
> +			amd_pmf_update_2_cql(pmf_dev);

I forgot to mention that this needs an "if (pmf_dev->amt_enabled)" guard so
that the handler does not mess with the limits while AMT is disabled, even
if CQL events are received while AMT is disabled.

> +		}
> +	}
> +}
> +
>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
>  {
>  	struct apmf_verify_interface output;
> @@ -211,12 +252,19 @@ static int apmf_get_system_params(struct apmf_if *apmf_if)
>  
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
> @@ -256,6 +304,17 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
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
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index ef71f8326248..bfae779ccc23 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -93,6 +93,27 @@ int amd_pmf_get_power_source(void)
>  		return POWER_SOURCE_DC;
>  }
>  
> +static void amd_pmf_reset_amt(struct amd_pmf_dev *dev)
> +{
> +	pr_debug("resetting AMT thermals\n");
> +	dev->amt_running = false;
> +
> +	/*
> +	 * OEM BIOS implementation guide says that if the auto mode is enabled
> +	 * the platform_profile registration shall be done by the OEM driver.
> +	 * There could be cases where both static slider and auto mode BIOS
> +	 * functions are enabled and we could end up in a race. To avoid that
> +	 * add a protection and touch the static slider only if that's enabled
> +	 * from the BIOS side.
> +	 */
> +
> +	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> +		u8 mode = amd_pmf_get_pprof_modes(dev);
> +
> +		amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
> +	}
> +}
> +
>  static void amd_pmf_get_metrics(struct work_struct *work)
>  {
>  	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
> @@ -103,6 +124,9 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>  	/* Get the current profile information */
>  	current_profile = READ_ONCE(dev->current_profile);
>  
> +	if (!dev->is_amt_event)
> +		dev_dbg(dev->dev, "amt event: %s\n", dev->is_amt_event ? "Enabled" : "Disabled");
> +
>  	/* Transfer table contents */
>  	memset(&dev->m_table, 0, sizeof(dev->m_table));
>  	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> @@ -112,6 +136,14 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>  	/* Calculate the avg SoC power consumption */
>  	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>  
> +	if (dev->is_amt_event) {
> +		/* Apply the Auto Mode transition */
> +		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
> +	} else if (!dev->is_amt_event && dev->amt_running) {
> +		/* reset to other mode if we receive a AMT disable event */
> +		amd_pmf_reset_amt(dev);
> +	}
> +
>  	dev->start_time = ktime_to_ms(ktime_get());
>  	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
>  }
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 4618ddc5a662..0f8b25524845 100644
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
> @@ -49,6 +50,7 @@
>  /* AMD PMF BIOS interfaces */
>  struct apmf_if_functions {
>  	bool system_params;
> +	bool sbios_requests;
>  	bool sbios_heartbeat;
>  	bool auto_mode_def;
>  	bool fan_table_idx;
> @@ -80,6 +82,21 @@ struct apmf_system_params {
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
> +} __packed;
> +
>  struct apmf_fan_idx {
>  	u16 size;
>  	u8 fan_ctl_mode;
> @@ -161,6 +178,9 @@ struct amd_pmf_dev {
>  	struct smu_pmf_metrics m_table;
>  	struct delayed_work work_buffer;
>  	ktime_t start_time;
> +	bool is_amt_event;
> +	bool is_cql_event;
> +	bool amt_running;
>  };
>  
>  struct apmf_sps_prop_granular {
> @@ -320,5 +340,7 @@ int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data)
>  void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>  void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
> +int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req);
> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev);
>  
>  #endif /* PMF_H */

