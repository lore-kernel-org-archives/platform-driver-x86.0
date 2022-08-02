Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140F7C00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 13:24:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233816AbiHBNYn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 09:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236302AbiHBNYm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 09:24:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5E96A15A34
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 06:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659446679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p5uvoi5fs/BJCEkTLs91MjtCfyC7MyukUQycZe3Baok=;
        b=hRiaruxGW/xT8tfW7s0WckqXIeN5k/6T6BLV6Hb8vtu5eQYEPXkVTIo95vNyfM8E+4gHAh
        RqStl+qD9yYUxfNZlvAnz+f5kuHwUGNushjn3QwJ5Lb/s9JrNs1XHUeBOiRctxH6qZGD33
        8Y5k7Qiqq2TEJnmhBWXaHjnJXGcesSU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-H_DgeYynOea-Yq3DBCH61A-1; Tue, 02 Aug 2022 09:24:38 -0400
X-MC-Unique: H_DgeYynOea-Yq3DBCH61A-1
Received: by mail-ed1-f72.google.com with SMTP id j19-20020a05640211d300b0043ddce5c23aso2176398edw.14
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Aug 2022 06:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p5uvoi5fs/BJCEkTLs91MjtCfyC7MyukUQycZe3Baok=;
        b=KEEq0pe25ML+hq8Hn/vWKpnlCXZyj2VCdRH97PuTz5CTN8cnH6zGytV28jOl/Ya56H
         hYajxOTGU0fHiYfeFdz2rzORbTpDAlnyj92ZGi0iGBUVkfIpcOWGJWh0Kg1Er5/XoR9I
         CAz5qhcw0bkqk36EFyqJKn4HZt5JlslaIGiYuOWgAEA9zPR53rmRyQqvX8Da/ZhMbkJN
         /0idfeKwRcNds55kRCmYbB6/wo+USvXg5EK5ryUEMplN9P9F/aRb8Tte4+AXDQMcVae/
         Y8UNmPUg+8Xbk1GRNanZbls3qFJSio5GTlumSoUBr1G81nr/E+ebPZ6ssB5T9xscIDdN
         6/NQ==
X-Gm-Message-State: AJIora8qlMUyCZ0G1z3ukEMkrdWz3jPmFm2I1jHp6AXHu95cJyx2xuS7
        mlAa42ccx2DWisaWEgBmowmkoUHftEOhtLe+OjLLS0fB5BmYo1ICRSp6kyeRnCsnQrfvoDI0/xi
        lmiLx5Cn1uvYte6JAVQCIRhfgqvigrlBzvQ==
X-Received: by 2002:a05:6402:4028:b0:43a:8d67:faeb with SMTP id d40-20020a056402402800b0043a8d67faebmr20654645eda.90.1659446676685;
        Tue, 02 Aug 2022 06:24:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1shDo+Ca9qqYeS/1hZThn2LgaxWFBSwfq/R6/RsI8MVQs7EHvXOVNpSXTw3hvjXmibdi7fRhQ==
X-Received: by 2002:a05:6402:4028:b0:43a:8d67:faeb with SMTP id d40-20020a056402402800b0043a8d67faebmr20654622eda.90.1659446676446;
        Tue, 02 Aug 2022 06:24:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ck28-20020a0564021c1c00b0043df40e4cfdsm958864edb.35.2022.08.02.06.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 06:24:36 -0700 (PDT)
Message-ID: <0d4f175f-3d5b-dfe5-3ab3-db7777fe875e@redhat.com>
Date:   Tue, 2 Aug 2022 15:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 09/11] platform/x86/amd/pmf: Handle AMT and CQL events
 for Auto mode
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
 <20220802112545.2118632-10-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220802112545.2118632-10-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/2/22 13:25, Shyam Sundar S K wrote:
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
>  drivers/platform/x86/amd/pmf/acpi.c      | 64 ++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/auto-mode.c | 38 ++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c      |  9 ++++
>  drivers/platform/x86/amd/pmf/pmf.h       | 22 ++++++++
>  4 files changed, 133 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 200e31033d94..70084807a2e7 100644
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
> @@ -154,6 +157,47 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
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
> +		return;
> +	}
> +
> +	if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
> +		dev_dbg(pmf_dev->dev, "AMT is supported and notifications %s\n",
> +			req.amt_event ? "Enabled" : "Disabled");
> +		pmf_dev->amt_enabled = !!req.amt_event;
> +	}
> +
> +	if (pmf_dev->amt_enabled)
> +		amd_pmf_handle_amt(pmf_dev);
> +	else
> +		amd_pmf_reset_amt(pmf_dev);

AFAICT this should be inside the:

	if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {

block, pmf_dev->amt_enabled only is updated in that block and
re-doing the amd_pmf_handle_amt() / reset_amt() calls when
pmf_dev->amt_enabled is not changed is not necessary.

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
> @@ -195,12 +239,20 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
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
> @@ -221,6 +273,18 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
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
> index 8c92cd6871df..cc88a02b488d 100644
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
> @@ -307,5 +325,9 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
>  void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>  void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
> +int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
>  
> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
> +void amd_pmf_reset_amt(struct amd_pmf_dev *dev);
> +void amd_pmf_handle_amt(struct amd_pmf_dev *dev);
>  #endif /* PMF_H */

Except for the 1 remark this looks good to me.

Regards,

Hans

