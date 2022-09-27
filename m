Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7088C07E9D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Sep 2022 12:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbiI0M7p (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Sep 2022 08:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbiI0M7p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 08:59:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D41BC38
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 05:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664283582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZE6QgJJjSFrOkdzpubLj4Jh5JprIy65m0ipjwvNHwSc=;
        b=dJs70umcU4aPTh51N0TUYZdfNYrH5eSjIkk9jvMqw7wmhaVAmhDbLkh3rUmsDPM9S0u/9O
        NQhCGK+v6ilJUzPKBhZW4ZFQVwSSAucmg5u/9QAe5F+FOsH/HrIeWn7+uz7w4ez8thveMv
        NFZk+rMk1Y53xrM+nGYAEalUe1lL81w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-oG8qk8ZoMKuyXZqS_4pxoA-1; Tue, 27 Sep 2022 08:59:41 -0400
X-MC-Unique: oG8qk8ZoMKuyXZqS_4pxoA-1
Received: by mail-ed1-f69.google.com with SMTP id r11-20020a05640251cb00b004516feb8c09so7700740edd.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 05:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZE6QgJJjSFrOkdzpubLj4Jh5JprIy65m0ipjwvNHwSc=;
        b=Lb85gZRCrPx39zCY0NIiJHCjdf9FEKZsN+JSHi3xpnNTpB08LN7PQ88h2SPJ0Uz3Vn
         HuyI8bZOH9R0k2udwaO85gppHxN6RHwpucTQsdkRr/4Ih3YnnjzxSRwmNlV7eTZjapLs
         ac9/G2C8xwltRvuQidBqcdofOoCBEbXO5yGgjWD51rZpoiS+8YwFc4wxBm8whgprhlI6
         z+Izwq7zrdnMt4GV8agdekkvPxiPHLyqiadgHODPPok28n9bVGVLyB5H02o72MeHrEjY
         fFRAJhRc1YWuBQs9w4+gqGdVupyNuE7Z0sfimPjaCGv5g3n8NZE+sfADXrCaKPaPzNpY
         Lw6g==
X-Gm-Message-State: ACrzQf0Y4zGb0wr83uN4fIdoSMCVT2VA3DWP1MYDVUr6uhvZsCtNpvme
        /RjeY2+QnCRZunWWmT4riShWde2SC0aWzdkLqfV0ScPivx/6KqM1lXmjq5HEdJ4vgJVDYxtRkeS
        rWxFZlaplPAEY33xftBivz1X4YeSE5m959Q==
X-Received: by 2002:aa7:c050:0:b0:453:4427:a947 with SMTP id k16-20020aa7c050000000b004534427a947mr27436676edo.172.1664283580125;
        Tue, 27 Sep 2022 05:59:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7uwOdbevsXOyN6gUT18uuW1OYr6BxBhp8fgwoLOOLDEmSeaxG6FL34y5qWen5yiMb1/HJwsg==
X-Received: by 2002:aa7:c050:0:b0:453:4427:a947 with SMTP id k16-20020aa7c050000000b004534427a947mr27436648edo.172.1664283579910;
        Tue, 27 Sep 2022 05:59:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id r10-20020a1709061baa00b00783f32d7eaesm735164ejg.164.2022.09.27.05.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 05:59:38 -0700 (PDT)
Message-ID: <265af833-6bdb-5d58-d383-60940975b882@redhat.com>
Date:   Tue, 27 Sep 2022 14:59:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] platform/x86/amd/pmf: Remove unused power_delta instances
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        mario.limonciello@amd.com
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220922165118.163165-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220922165118.163165-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/22/22 18:51, Shyam Sundar S K wrote:
> Initial version of the PMF ACPI documentation had the concept
> of "power_delta" which is removed in the recent revisions.
> 
> So the entire cnqf_power_delta structure is never used/updated.
> Hence removing it.
> 
> Fixes: 1738061c9ec8 ("platform/x86/amd/pmf: Add support for CnQF")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
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
>  drivers/platform/x86/amd/pmf/cnqf.c | 12 ++++++------
>  drivers/platform/x86/amd/pmf/pmf.h  | 11 -----------
>  2 files changed, 6 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 927f3c8cd971..668c7c0fea83 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -45,27 +45,27 @@ static void amd_pmf_update_power_threshold(int src)
>  
>  	tp = &config_store.trans_param[src][CNQF_TRANSITION_TO_QUIET];
>  	ts = &config_store.mode_set[src][CNQF_MODE_BALANCE];
> -	tp->power_threshold = ts->power_floor - tp->power_delta;
> +	tp->power_threshold = ts->power_floor;
>  
>  	tp = &config_store.trans_param[src][CNQF_TRANSITION_TO_TURBO];
>  	ts = &config_store.mode_set[src][CNQF_MODE_PERFORMANCE];
> -	tp->power_threshold = ts->power_floor - tp->power_delta;
> +	tp->power_threshold = ts->power_floor;
>  
>  	tp = &config_store.trans_param[src][CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE];
>  	ts = &config_store.mode_set[src][CNQF_MODE_BALANCE];
> -	tp->power_threshold = ts->power_floor - tp->power_delta;
> +	tp->power_threshold = ts->power_floor;
>  
>  	tp = &config_store.trans_param[src][CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE];
>  	ts = &config_store.mode_set[src][CNQF_MODE_PERFORMANCE];
> -	tp->power_threshold = ts->power_floor - tp->power_delta;
> +	tp->power_threshold = ts->power_floor;
>  
>  	tp = &config_store.trans_param[src][CNQF_TRANSITION_FROM_QUIET_TO_BALANCE];
>  	ts = &config_store.mode_set[src][CNQF_MODE_QUIET];
> -	tp->power_threshold = ts->power_floor - tp->power_delta;
> +	tp->power_threshold = ts->power_floor;
>  
>  	tp = &config_store.trans_param[src][CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE];
>  	ts = &config_store.mode_set[src][CNQF_MODE_TURBO];
> -	tp->power_threshold = ts->power_floor - tp->power_delta;
> +	tp->power_threshold = ts->power_floor;
>  }
>  
>  static const char *state_as_str(unsigned int state)
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 097f3f5d33a3..e5dc3ae238c7 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -333,7 +333,6 @@ struct cnqf_mode_settings {
>  
>  struct cnqf_tran_params {
>  	u32 time_constant; /* minimum time required to switch to next mode */
> -	u32 power_delta; /* minimum power required to switch to next mode */
>  	u32 power_threshold;
>  	u32 timer; /* elapsed time. if timer > timethreshold, it will move to next mode */
>  	u32 total_power;
> @@ -343,21 +342,11 @@ struct cnqf_tran_params {
>  	enum cnqf_mode target_mode;
>  };
>  
> -struct cnqf_power_delta {
> -	u32 to_turbo;
> -	u32 balance_to_perf;
> -	u32 quiet_to_balance;
> -	u32 to_quiet;
> -	u32 perf_to_balance;
> -	u32 turbo_to_perf;
> -};
> -
>  struct cnqf_config {
>  	struct cnqf_tran_params trans_param[POWER_SOURCE_MAX][CNQF_TRANSITION_MAX];
>  	struct cnqf_mode_settings mode_set[POWER_SOURCE_MAX][CNQF_MODE_MAX];
>  	struct power_table_control defaults;
>  	enum cnqf_mode current_mode;
> -	struct cnqf_power_delta power_delta[POWER_SOURCE_MAX];
>  	u32 power_src;
>  	u32 avg_power;
>  };

