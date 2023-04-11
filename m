Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66992C7619A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Apr 2023 08:28:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbjDKI2W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Apr 2023 04:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbjDKI2D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Apr 2023 04:28:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44AC94226
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681201562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ianVYgdHnuf+b6fncStL3XcypceOXyphlHeUk90627c=;
        b=PVolNvMX63hD2vUSZuLjI/AY4ePYEEIiWtgphWpZTIjWs5x3oApQO91vUex88Qm5btswkf
        qpgxCd/M+doAxVESDahcaQg2GoPv1sZ/pr/hanZLu/s8+k5xWMt9w6LLTVFwaQVN+Pm5Jz
        yVRvvdmLCfVLDKMTaZm90jdigPtLcUY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-FQiR6JbTNJyGQ91fKY-1Ag-1; Tue, 11 Apr 2023 04:26:01 -0400
X-MC-Unique: FQiR6JbTNJyGQ91fKY-1Ag-1
Received: by mail-ej1-f70.google.com with SMTP id fy17-20020a1709069f1100b00948fd62a55cso4223249ejc.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 01:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201560; x=1683793560;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ianVYgdHnuf+b6fncStL3XcypceOXyphlHeUk90627c=;
        b=kGJdV7ButWI2yZmqIahyRDRAWOInh60uEQCMa6V60IVRIK+qfYxouKZJw85ZqErvSj
         GFaFMYc4nmhXLT/157Uu8ePfpY2ZIoBgN02aW7LMGZR4mfDoEv/F0KpGDEUcBF8qbFmp
         NAiGCFtE4YZPmUqFflNdWtOqLMrYiHGCzjIH57pULUZYNXv/3gnS3EPzN3sZOupnIHkV
         BcsbssDtDmbLYMNHVytETq483PwYqUntE7J5CCc7JpSw/VAUR9gpkQxciwUYs3lrGnFX
         H8pIvH577JaS+UvgcnEmWn9INi/ChWaspofux+p6Dvsa0ESvyvc9+4+czzi7Q+nPg740
         zxuw==
X-Gm-Message-State: AAQBX9fN5UnIqFKZ03PvqzdSpLvDBN6QDOEJ4qJC0EqA5nTVDbffmiIR
        f3Nv/d05wn0BQZe8vkawE86A12up/HcuERlVqwZDiU9KZ9jT1jiJTb5FOOMZ1ByV5l5ZvKEVp1J
        FWRxUAh3PhEJv308mcrG0452/bk4ObFKd1w==
X-Received: by 2002:a17:906:e087:b0:94a:a0d7:b7bc with SMTP id gh7-20020a170906e08700b0094aa0d7b7bcmr3744751ejb.10.1681201559828;
        Tue, 11 Apr 2023 01:25:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350aFJhtfWqcz8aMhi/tKJdfnryJenv1/fl9wwK81ePJmGeEOiSFdM7klL3eT/ptAA2KmQuNJyw==
X-Received: by 2002:a17:906:e087:b0:94a:a0d7:b7bc with SMTP id gh7-20020a170906e08700b0094aa0d7b7bcmr3744742ejb.10.1681201559550;
        Tue, 11 Apr 2023 01:25:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id wv1-20020a170907080100b0094c4dd34a0asm1128681ejb.114.2023.04.11.01.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:25:59 -0700 (PDT)
Message-ID: <d5725b00-b421-7800-5cf0-e9ab6d57cdf8@redhat.com>
Date:   Tue, 11 Apr 2023 10:25:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] platform/x86/amd/pmf: Add PMF debug facilities
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com
References: <20230406164807.50969-1-Shyam-sundar.S-k@amd.com>
 <20230406164807.50969-3-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230406164807.50969-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/6/23 18:48, Shyam Sundar S K wrote:
> At times, when the mode transitions fail to happen, the current
> driver does not give enough debug information on why the transition
> failed or the default preset values did not load. Having an on-demand
> logs guarded by CONFIG would be helpful in such cases.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Kconfig     | 10 ++++++++++
>  drivers/platform/x86/amd/pmf/auto-mode.c | 22 ++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/cnqf.c      | 19 +++++++++++++++++++
>  3 files changed, 51 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index f4fd764e55a6..7129de0fb9fb 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -26,3 +26,13 @@ config AMD_PMF_ACPI_DEBUG
>  	 in the PMF config store.
>  
>  	 Say Y here to enable more debug logs and Say N here if you are not sure.
> +
> +config AMD_PMF_DEBUG_FACILITIES
> +	bool "PMF debug facilities"
> +	depends on AMD_PMF
> +	help
> +	 Enabling this option would give more debug information on the PMF interna
> +	 counters such as time constants, power thresholds, target modes and
> +	 power mode transitions of auto mode and CnQF features.
> +
> +	 Say Y here to enable logs and Say N here if you are not sure.

Do we really need *both* CONFIG_AMD_PMF_ACPI_DEBUG and CONFIG_AMD_PMF_DEBUG_FACILITIES ?

To me it seems that both could be covered by a generic CONFIG_AMD_PMF_DEBUG option ?
especially since this patch only adds a few extra dev_dbg-s.

> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
> index 777490fcf8b9..560379b5cda7 100644
> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -177,11 +177,33 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>  			config_store.transition[i].applied = false;
>  			update = true;
>  		}
> +
> +#ifdef CONFIG_AMD_PMF_DEBUG_FACILITIES
> +		dev_dbg(dev->dev, "[AUTO MODE] time_ms:%lld avg_power:%d mode:%s timer:%u tc:%d\n",
> +			time_elapsed_ms, avg_power,
> +			state_as_str(config_store.current_mode),
> +			config_store.transition[i].timer,
> +			config_store.transition[i].time_constant);
> +
> +		dev_dbg(dev->dev, "[AUTO MODE] shiftup:%d pt:%d pf:%d pd:%u\n",
> +			config_store.transition[i].shifting_up,
> +			config_store.transition[i].power_threshold,
> +			config_store.mode_set[i].power_floor,
> +			config_store.transition[i].power_delta);
> +#endif
>  	}
>  
>  	dev_dbg(dev->dev, "[AUTO_MODE] avg power: %u mW mode: %s\n", avg_power,
>  		state_as_str(config_store.current_mode));
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG_FACILITIES
> +	dev_dbg(dev->dev, "[AUTO MODE] priority1: %u, priority2: %u, priority3: %u, priority4: %u",
> +		config_store.transition[0].applied,
> +		config_store.transition[1].applied,
> +		config_store.transition[2].applied,
> +		config_store. transition[3].applied);
> +#endif
> +
>  	if (update) {
>  		for (j = 0; j < AUTO_TRANSITION_MAX; j++) {
>  			/* Apply the mode with highest priority indentified */
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 4b9691cd592a..1f25016b3865 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -174,6 +174,13 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
>  		config_store.trans_param[src][i].count++;
>  
>  		tp = &config_store.trans_param[src][i];
> +
> +#ifdef CONFIG_AMD_PMF_DEBUG_FACILITIES
> +		dev_dbg(dev->dev, "avg_power:%d total_power:%d count:%d timer:%d\n", avg_power,
> +			config_store.trans_param[src][i].total_power,
> +			config_store.trans_param[src][i].count,
> +			config_store.trans_param[src][i].timer);
> +#endif
>  		if (tp->timer >= tp->time_constant && tp->count) {
>  			avg_power = tp->total_power / tp->count;
>  
> @@ -194,6 +201,18 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
>  	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
>  		avg_power, socket_power, state_as_str(config_store.current_mode));
>  
> +#ifdef AMD_PMF_DEBUG_FACILITIES
> +	dev_dbg(dev->dev, "[CNQF] priority 1: %u, priority 2: %u, priority 3: %u",
> +		config_store.trans_param[src][0].priority,
> +		config_store.trans_param[src][1].priority,
> +		config_store.trans_param[src][2].priority);
> +
> +	dev_dbg(dev->dev, "[CNQF] priority 4: %u, priority 5: %u, priority 6: %u",
> +		config_store.trans_param[src][3].priority,
> +		config_store.trans_param[src][4].priority,
> +		config_store.trans_param[src][5].priority);
> +#endif
> +
>  	for (j = 0; j < CNQF_TRANSITION_MAX; j++) {
>  		/* apply the highest priority */
>  		if (config_store.trans_param[src][j].priority) {


Regards,

Hans


