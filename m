Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81D0C00140
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Aug 2022 11:15:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiHELPB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Aug 2022 07:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237960AbiHELPA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Aug 2022 07:15:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AF32265552
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Aug 2022 04:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659698097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qsERzGieE1c3g17Wa6jea0syEy+nwPejsZhzs984kjo=;
        b=VbGJV/jrdLi26RE4bHNWGV1OfDxTJfXV/R38CveWI+q5ShXJ1Dm4q4IHNn51f+HEWyQU9d
        RStZqwVM5NMeKXWTEjs2DEAEsG/PIS3v3YG1YOo5rCSaL8KumnhPRZ5YiLK8kQLSwMmmuQ
        TuawHhVA66z5lq1PUACuItHzgPd54MY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-nlfpL7aINEuSxPbJxFshug-1; Fri, 05 Aug 2022 07:14:56 -0400
X-MC-Unique: nlfpL7aINEuSxPbJxFshug-1
Received: by mail-ed1-f69.google.com with SMTP id v19-20020a056402349300b0043d42b7ddefso1402470edc.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Aug 2022 04:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=qsERzGieE1c3g17Wa6jea0syEy+nwPejsZhzs984kjo=;
        b=MsJVfmMEeUnc38gTfkSpf5BU9532gTlZU4g2LGjcDaJuEbczFxm9j2f50RUaUIELNp
         0kDLomHAh69Uxq06cA40EGxi+gk7Bo9dDB9asZEsynN4G4KrupvVfCTmiOKzcGnAkBoo
         fl9DTdedJF7WnAY99z6n/nlR7pbeCEGfSxQGubPV21otpE68C85MT+NQeRvnuFvKmY0/
         hQXcyd18K/U6BGD1Af3f3Su/2h6rYkM+zuYJxZhuwpxsDMlC6pKS5UTzEpH3UurAu4w5
         p3Y7AOd70eRFmipdr58dLkRDZudWSlCfzBproG+vThp+ogmoOfB+J5Id+m+XPpSG7Cs4
         YFsg==
X-Gm-Message-State: ACgBeo2joDPBGggriDGi5FUyksh/VkrBXS0fl3o2KwSXd2ZtP8u1dVrU
        n8NBe/UInX1HTEyPlYfGePbR+EsqjVDX/5ccuKW+VGZX15ZgQBQEpMv4hB7NBvMqnk4mN3R5PGT
        G85FQZQqy6M1/VEcDHD70017uRnpzIpyaSQ==
X-Received: by 2002:a05:6402:2789:b0:440:44b6:849b with SMTP id b9-20020a056402278900b0044044b6849bmr98619ede.387.1659698095528;
        Fri, 05 Aug 2022 04:14:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4QrcbtOn1KSOXDKqmVijRolpz94r9b6GZX7HP2vqQWQ64vwaV7TVLLiHKwB/CVYtNS2H7Qxg==
X-Received: by 2002:a05:6402:2789:b0:440:44b6:849b with SMTP id b9-20020a056402278900b0044044b6849bmr98603ede.387.1659698095307;
        Fri, 05 Aug 2022 04:14:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id a15-20020a05640213cf00b0043c92c44c53sm1900966edx.93.2022.08.05.04.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 04:14:54 -0700 (PDT)
Message-ID: <26f233ac-39f2-e7cb-ef8e-5279c869c884@redhat.com>
Date:   Fri, 5 Aug 2022 13:14:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 09/11] platform/x86/amd/pmf: Handle AMT and CQL events
 for Auto mode
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
References: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
 <20220802151149.2123699-10-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220802151149.2123699-10-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/2/22 17:11, Shyam Sundar S K wrote:
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
>  drivers/platform/x86/amd/pmf/acpi.c      | 66 ++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/auto-mode.c | 38 ++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c      |  9 ++++
>  drivers/platform/x86/amd/pmf/pmf.h       | 22 ++++++++
>  4 files changed, 135 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 401fee381e90..24d269bef92b 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -11,6 +11,9 @@
>  #include <linux/acpi.h>
>  #include "pmf.h"
>  
> +#define APMF_CQL_NOTIFICATION  2
> +#define APMF_AMT_NOTIFICATION  3
> +
>  static union acpi_object *apmf_if_call(struct amd_pmf_dev *pdev, int fn, struct acpi_buffer *param)
>  {
>  	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> @@ -149,6 +152,47 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
>  }
>  
> +int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
> +{
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
> +									 req, sizeof(*req));
> +}
> +
> +static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
> +{
> +	struct amd_pmf_dev *pmf_dev = data;
> +	struct apmf_sbios_req req;
> +	int ret;
> +
> +	mutex_lock(&pmf_dev->update_mutex);
> +	ret = apmf_get_sbios_requests(pmf_dev, &req);
> +	if (ret) {
> +		dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);

This is missing a mutex_unlock, I will fix this up (using a goto) while
merging this.

Regards,

Hans


> +		return;
> +	}
> +
> +	if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
> +		dev_dbg(pmf_dev->dev, "AMT is supported and notifications %s\n",
> +			req.amt_event ? "Enabled" : "Disabled");
> +		pmf_dev->amt_enabled = !!req.amt_event;
> +
> +		if (pmf_dev->amt_enabled)
> +			amd_pmf_handle_amt(pmf_dev);
> +		else
> +			amd_pmf_reset_amt(pmf_dev);
> +	}
> +
> +	if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
> +		dev_dbg(pmf_dev->dev, "CQL is supported and notifications %s\n",
> +			req.cql_event ? "Enabled" : "Disabled");
> +
> +		/* update the target mode information */
> +		if (pmf_dev->amt_enabled)
> +			amd_pmf_update_2_cql(pmf_dev, req.cql_event);
> +	}
> +	mutex_unlock(&pmf_dev->update_mutex);
> +}
> +
>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
>  {
>  	struct apmf_verify_interface output;
> @@ -190,12 +234,20 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
>  
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>  {
> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> +
>  	if (pmf_dev->hb_interval)
>  		cancel_delayed_work_sync(&pmf_dev->heart_beat);
> +
> +	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
> +	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS))
> +		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler);
>  }
>  
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  {
> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> +	acpi_status status;
>  	int ret;
>  
>  	ret = apmf_if_verify_interface(pmf_dev);
> @@ -216,6 +268,20 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  		schedule_delayed_work(&pmf_dev->heart_beat, 0);
>  	}
>  
> +	/* Install the APMF Notify handler */
> +	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
> +	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS)) {
> +		status = acpi_install_notify_handler(ahandle,
> +						     ACPI_ALL_NOTIFY,
> +						     apmf_event_handler, pmf_dev);
> +		if (ACPI_FAILURE(status)) {
> +			dev_err(pmf_dev->dev, "failed to install notify handler\n");
> +			return -ENODEV;
> +		}
> +		/* Call the handler once manually to catch up with possibly missed notifies. */
> +		apmf_event_handler(ahandle, 0, pmf_dev);
> +	}
> +
>  out:
>  	return ret;
>  }
> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
> index 99f5a2396b0b..4e4ec6023525 100644
> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -108,6 +108,21 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>  	}
>  }
>  
> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event)
> +{
> +	int mode = config_store.current_mode;
> +
> +	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
> +				   is_cql_event ? AUTO_PERFORMANCE_ON_LAP : AUTO_PERFORMANCE;
> +
> +	if ((mode == AUTO_PERFORMANCE || mode == AUTO_PERFORMANCE_ON_LAP) &&
> +	    mode != config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode) {
> +		mode = config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode;
> +		amd_pmf_set_automode(dev, mode, NULL);
> +	}
> +	dev_dbg(dev->dev, "updated CQL thermals\n");
> +}
> +
>  static void amd_pmf_get_power_threshold(void)
>  {
>  	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
> @@ -249,6 +264,29 @@ void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
>  	dev->socket_power_history_idx = -1;
>  }
>  
> +void amd_pmf_reset_amt(struct amd_pmf_dev *dev)
> +{
> +	/*
> +	 * OEM BIOS implementation guide says that if the auto mode is enabled
> +	 * the platform_profile registration shall be done by the OEM driver.
> +	 * There could be cases where both static slider and auto mode BIOS
> +	 * functions are enabled, in that case enable static slider updates
> +	 * only if it advertised as supported.
> +	 */
> +
> +	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> +		u8 mode = amd_pmf_get_pprof_modes(dev);
> +
> +		dev_dbg(dev->dev, "resetting AMT thermals\n");
> +		amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
> +	}
> +}
> +
> +void amd_pmf_handle_amt(struct amd_pmf_dev *dev)
> +{
> +	amd_pmf_set_automode(dev, config_store.current_mode, NULL);
> +}
> +
>  void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev)
>  {
>  	cancel_delayed_work_sync(&dev->work_buffer);
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 42d803b49d97..4467d682cd11 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -99,6 +99,7 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>  	ktime_t time_elapsed_ms;
>  	int socket_power;
>  
> +	mutex_lock(&dev->update_mutex);
>  	/* Transfer table contents */
>  	memset(dev->buf, 0, sizeof(dev->m_table));
>  	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> @@ -108,8 +109,14 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>  	/* Calculate the avg SoC power consumption */
>  	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>  
> +	if (dev->amt_enabled) {
> +		/* Apply the Auto Mode transition */
> +		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
> +	}
> +
>  	dev->start_time = ktime_to_ms(ktime_get());
>  	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
> +	mutex_unlock(&dev->update_mutex);
>  }
>  
>  static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
> @@ -329,6 +336,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	amd_pmf_dbgfs_register(dev);
>  
>  	mutex_init(&dev->lock);
> +	mutex_init(&dev->update_mutex);
>  	dev_info(dev->dev, "registered PMF device successfully\n");
>  
>  	return 0;
> @@ -339,6 +347,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
>  	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
>  
>  	mutex_destroy(&dev->lock);
> +	mutex_destroy(&dev->update_mutex);
>  	amd_pmf_deinit_features(dev);
>  	apmf_acpi_deinit(dev);
>  	amd_pmf_dbgfs_unregister(dev);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index ce092a529261..4078665c8e06 100644
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
> @@ -63,6 +64,21 @@ struct apmf_system_params {
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
> @@ -147,6 +163,8 @@ struct amd_pmf_dev {
>  	ktime_t start_time;
>  	int socket_power_history[AVG_SAMPLE_SIZE];
>  	int socket_power_history_idx;
> +	bool amt_enabled;
> +	struct mutex update_mutex; /* protects race between ACPI handler and metrics thread */
>  };
>  
>  struct apmf_sps_prop_granular {
> @@ -303,5 +321,9 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
>  void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>  void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
> +int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
>  
> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
> +void amd_pmf_reset_amt(struct amd_pmf_dev *dev);
> +void amd_pmf_handle_amt(struct amd_pmf_dev *dev);
>  #endif /* PMF_H */

