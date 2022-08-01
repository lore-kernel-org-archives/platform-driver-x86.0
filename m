Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6623DC00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 13:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbiHAN4C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 09:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbiHANz6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 09:55:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB9CA25C5D
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 06:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659362155;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d5WG/OUXBU4lGMUQewG0rF+kab0/NGSM3/n1ktkRZRs=;
        b=i+gwkaBB1kMYUBjorW285Fsq3J44G9FcUXqw7lLKcYa2xTs4n5IioHqf3oG9+V2ZAUXilw
        s+glZfJDV3xnTLXg+uUmzT9tHv8E/weeYokgt71FtT1KNNLYK7bFoAjF8BPiPXnY529DiL
        nTwh+6Ehnbq1FgHs5O3XGH55PbCplnQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-8dH9DzC9OxC_-UCNwsMBZA-1; Mon, 01 Aug 2022 09:55:54 -0400
X-MC-Unique: 8dH9DzC9OxC_-UCNwsMBZA-1
Received: by mail-ed1-f69.google.com with SMTP id b15-20020a056402278f00b0043acaf76f8dso7312473ede.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 06:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d5WG/OUXBU4lGMUQewG0rF+kab0/NGSM3/n1ktkRZRs=;
        b=Rug5EfpsOImsusjBSTjFZhA/g6wbIzSe62abdycKxPq753yLjnRnl21A7T+wjfRoNc
         RBCZNboVAUENsDzWzxmhqSXYe2ajx5tXB6JFLZhVEcS6ZWgbdOoDsa7E13LHTMJwArVA
         XCBNcWLQR3UaWBrjfnd+PPF/R6SQCtE6cRq4QKBhhOWjEWlbYrqZlNb//LS04bodRXHl
         UGWojmhHpXn7ar5gMynOBstps5IJSeVxkY/xBbQ6bomKucid08ULqTidd+CXwxWstNVz
         qG1gWdlpicTuanY5D9cquqLSf9/6SfAk1mHw6c5RUwm9SmVQUZT1kAk2pqSp7s7st3eD
         cOGQ==
X-Gm-Message-State: AJIora9pc7y7qJk7xdNd84aiV4EpUeHknfb2DPP7uwPFi/y0b/o6ND9P
        QfdfPyBzUhX5r08hOPX8h30VobCcavyL+83PjW0HfZ1Xru1EcoTpp9I2AnX/Msb7OB0FtcVnz17
        Ogzpg3jgu/s7gczjrpaBI3ATv18Q7cbIj9A==
X-Received: by 2002:a17:907:1b1f:b0:72f:56db:cce9 with SMTP id mp31-20020a1709071b1f00b0072f56dbcce9mr12397672ejc.605.1659362152318;
        Mon, 01 Aug 2022 06:55:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vMQ7vYjc5DVwcVOxOLmfyt00VuhKof5MTFJIgkTpLsb1aQDTjVjLDbBnyRFvjScIHuZmkrDg==
X-Received: by 2002:a17:907:1b1f:b0:72f:56db:cce9 with SMTP id mp31-20020a1709071b1f00b0072f56dbcce9mr12397651ejc.605.1659362151930;
        Mon, 01 Aug 2022 06:55:51 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709063d3200b00726298147b1sm5181176ejf.161.2022.08.01.06.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 06:55:51 -0700 (PDT)
Message-ID: <a4b27d9d-f217-f9da-ac48-487e851f23e3@redhat.com>
Date:   Mon, 1 Aug 2022 15:55:50 +0200
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

Hi,

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

I just noticed that this is not correct, this should be:

	func->system_params = mask & BIT(APMF_FUNC_... - 1);

Which does something completely different!

Also this information is duplicated by:

is_apmf_func_supported(APMF_FUNC_...) so please drop the apmf_if_functions
struct completely and use is_apmf_func_supported() everywhere.

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

IMHO it would be better to change the test for [un]registering the handler to:

	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE) &&
	    is_apmf_func_supported(APMF_FUNC_SBIOS_REQUESTS))

and then the sbios_requests test here (in apmf_event_handler()) can be dropped.

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

The is_amt_event variable is not storing if the last event was an amt_event but
rather wether AMT is enabled or not, so please rename it to amt_enabled.

Also by just setting the flag here you are introducing a race, at least on
AMT disabling.

1: amd_pmf_get_metrics() is running, has just passed the
   "if (dev->is_amt_event)" check and is about to call amd_pmf_trans_automode().

2. apmf_event_handler() gets called to disable AMT

3. apmf_event_handler() finishes and the firmware now starts programming the
   limits because thinkpad_acpi's platform_profile has been set to !balanced.

4.  amd_pmf_get_metrics() continues and calls amd_pmf_trans_automode()
5.  amd_pmf_trans_automode() reprograms the limits, overriding the ones
    set by the firmware eventhough AMT is disabled at this point.

To avoid this race apmf_event_handler() and amd_pmf_get_metrics() should both
lock a newly added shared update_mutex mutex while running so that they cannot
both run at the same time.

###

Likewise restoring the static slider settings on AMT disable is also racy
and to fix that the amd_pmf_reset_amt(dev);should be moved here; and then for
consistency and cleanness the setting of the initial AMT values should also
be moved here.

This will result in adding the following code here:

		dev_dbg(dev->dev, "amt enabled: %d\n", dev->amt_enabled);

		if (pmf_dev->amt_enabled)
			amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
		else		
			amd_pmf_reset_amt(dev);

Also be handling the flanks (enabled<->disabled transitions) here like this there
no longer is a need for a separate amt_running variable to detect the flanks in other
places.

> +		}
> +
> +		if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
> +			pr_debug("PMF: CQL is supported and notifications %s\n",
> +				 req.cql_event ? "Enabled" : "Disabled");
> +			pmf_dev->is_cql_event = !!req.cql_event;

is_cql_event is only used to pass req.cql_event to amd_pmf_update_2_cql()
please drop it from struct amd_pmf_dev and make it an argument to
amd_pmf_update_2_cql()

> +
> +			/* update the target mode information */
> +			amd_pmf_update_2_cql(pmf_dev);
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

Hmm, is this the handle for: "\\_SB_.PMF" ? as in the parent of:

#define APMF_METHOD "\\_SB_.PMF_.APMF"

?

In that case then apmf_if_call() can use:

	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);

	...

	status = acpi_evaluate_object(ahandle, "APMF", &apmf_if_arg_list, &buffer);

and the whole:

+	status = acpi_get_handle(NULL, (acpi_string) APMF_METHOD, &apmf_if_handle);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+

bit + storing the handle + also:

+#define APMF_METHOD "\\_SB_.PMF_.APMF"

can then all be dropped. That would be a nice cleanup and then calling
dev_err(...) for the ACPI errors also makes even more sense	


>  	if (pmf_dev->apmf_if->func.sbios_heartbeat)
>  		cancel_delayed_work_sync(&pmf_dev->heart_beat);
> +
> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE))

As mentioned above IMHO it would make sense to make this check:

	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE) &&
	    is_apmf_func_supported(APMF_FUNC_SBIOS_REQUESTS))

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

As mentioned above IMHO it would make sense to make this check:

	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE) &&
	    is_apmf_func_supported(APMF_FUNC_SBIOS_REQUESTS))

What is missing here is detecting the initial AMT and CQL values and configuring
things accordingly. Maybe this can be done by calling apmf_event_handler
manually once before registering it ?

Note the initial state detection must be done before registering the handler
to avoid races.

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

As suggested above this is best done on receiving the amt_event.

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

This comment seems odd. The is_apmf_func_supported() does not help to
avoid the race. This check is necessary to avoid amd_pmf_update_slider()
on systems where amd_pmf_load_defaults_sps() does not run. Otherwise
amd_pmf_update_slider() ends up writing uninitialized (all 0) limits.

To fix the race the amd_pmf_update_slider() call must be done before
apmf_event_handler() exits as suggested above. The feature check has
nothing to do with the race ...



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

This is weird, you check for !is_amt_event so this will only ever log:
"amt event: Disabled" so the check in the dev_dbg is not necessary. Also this is
best done when receiving the amt-event, as suggested above so this can just be dropped.

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

As discussed above the amd_pmf_reset_amt() call must be done from inside
apmf_event_handler(). So the whole "else if (...) {}" block can be dropped here.

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

The is_amt_event variable is not storing if the last event was an amt_event but
rather wether AMT is enabled or not, so please rename it to amt_enabled.

> +	bool is_cql_event;
> +	bool amt_running;

As discussed both these struct members can be dropped.

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

Regards,

Hans

