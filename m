Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9C8C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:48:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5B9961260
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:48:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348687AbhDGOsa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60262 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242371AbhDGOsa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 10:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617806900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ra6+ya+Rqy8GTatufjTgONhh4VZqUf0aNMeNBSQUdK4=;
        b=Ic2JOcLInEDCMVXIuwYsVlV/W0EXOgc5HkCYGo3SCzKg2PdUB0Dzv4RHGwPtW0dfmKZxxp
        WWkHR2i7ota0/CenPA9xfUo1nzTvDCFrXnad1TMeNmGaBExaA94XZ1YtGIsCrXLlHg9tUR
        B/JvFv0QiZad7qjvGDkRpJm/RaiUM08=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-xYDqEnX8N0ywONC7YeeUyQ-1; Wed, 07 Apr 2021 10:48:19 -0400
X-MC-Unique: xYDqEnX8N0ywONC7YeeUyQ-1
Received: by mail-ed1-f72.google.com with SMTP id bo11so2126310edb.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 07:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ra6+ya+Rqy8GTatufjTgONhh4VZqUf0aNMeNBSQUdK4=;
        b=hjMDS13NmTad9GjG7Q361JaPvxdKnwuTC6M1H+UD/uiT8ZGuS4ISgghRMu+qNESWuI
         xORx6THnU9EjQyey8w0YiAICJKv5sQeK/d5Dcx+KdUb3mRvv76JdwQgsBlWuPAQxXGy+
         fb7cRx7x34AKEtbEs54kF2t2ZVSITyE0Q1nWJED2McXWawtF8xf/DGyBA57DTyffwA5g
         Gpp0txT95XWjCPyLZKJIrJoIo1xPYXCovMUBucFqUjm4kfbhtP78JoAUOcrU5oIy0gG8
         s3y9hQhnjnAjZGf1JMzzHpXRhIeGlEDrBAhmFZVY3q0NBCvpz+yHYSmfL7OLb1UwYoNs
         R0vg==
X-Gm-Message-State: AOAM530yCmGQJyD222SWRhi9pCPqRsUQtXwwLuVQ2WDQsE1WQSqAva7Z
        /YxrCrh/NYMqO+cfHDE051BAx6Vs3bqNWYopt2EuALvHXKQ+DpMKLzwW/dAfkWThLeaxuVIHKRc
        pUvxdSfKWKGg33dAyFbS+M104sMewlgdLPQ==
X-Received: by 2002:aa7:dc56:: with SMTP id g22mr4898912edu.219.1617806897962;
        Wed, 07 Apr 2021 07:48:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5I89z4vZnBAlqpduYxSC39AqH/BmYq16jgy+NVsZrplxEfbBpkjqb6448mimrZ72tAiTToQ==
X-Received: by 2002:aa7:dc56:: with SMTP id g22mr4898884edu.219.1617806897774;
        Wed, 07 Apr 2021 07:48:17 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ho19sm12440376ejc.57.2021.04.07.07.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 07:48:17 -0700 (PDT)
Subject: Re: [PATCH 8/9] platform/x86: intel_pmc_core: Add LTR registers for
 Tiger Lake
To:     "David E. Box" <david.e.box@linux.intel.com>,
        irenic.rajneesh@gmail.com, mgross@linux.intel.com,
        gayatri.kammela@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210401030558.2301621-1-david.e.box@linux.intel.com>
 <20210401030558.2301621-9-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ba4f7edf-298a-2859-5421-b9356fc1985d@redhat.com>
Date:   Wed, 7 Apr 2021 16:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210401030558.2301621-9-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/1/21 5:05 AM, David E. Box wrote:
> From: Gayatri Kammela <gayatri.kammela@intel.com>
> 
> Just like Ice Lake, Tiger Lake uses Cannon Lake's LTR information
> and supports a few additional registers. Hence add the LTR registers
> specific to Tiger Lake to the cnp_ltr_show_map[].
> 
> Also adjust the number of LTR IPs for Tiger Lake to the correct amount.
> 
> Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/intel_pmc_core.c | 2 ++
>  drivers/platform/x86/intel_pmc_core.h | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 458c0056e7a1..9168062c927e 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -383,6 +383,8 @@ static const struct pmc_bit_map cnp_ltr_show_map[] = {
>  	 * a list of core SoCs using this.
>  	 */
>  	{"WIGIG",		ICL_PMC_LTR_WIGIG},
> +	{"THC0",                TGL_PMC_LTR_THC0},
> +	{"THC1",                TGL_PMC_LTR_THC1},
>  	/* Below two cannot be used for LTR_IGNORE */
>  	{"CURRENT_PLATFORM",	CNP_PMC_LTR_CUR_PLT},
>  	{"AGGREGATED_SYSTEM",	CNP_PMC_LTR_CUR_ASLT},
> diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
> index f41f61aa7008..634130b589a2 100644
> --- a/drivers/platform/x86/intel_pmc_core.h
> +++ b/drivers/platform/x86/intel_pmc_core.h
> @@ -192,8 +192,10 @@ enum ppfear_regs {
>  #define ETR3_CLEAR_LPM_EVENTS_BIT		28
>  #define LPM_STS_LATCH_MODE_BIT			31
>  
> -#define TGL_NUM_IP_IGN_ALLOWED			22
>  #define TGL_PMC_SLP_S0_RES_COUNTER_STEP		0x7A
> +#define TGL_PMC_LTR_THC0			0x1C04
> +#define TGL_PMC_LTR_THC1			0x1C08
> +#define TGL_NUM_IP_IGN_ALLOWED			23
>  #define TGL_PMC_LPM_RES_COUNTER_STEP_X2		61	/* 30.5us * 2 */
>  
>  /*
> 

