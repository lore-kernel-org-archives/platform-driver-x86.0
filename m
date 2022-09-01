Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F38ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Sep 2022 15:43:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbiIAPnM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Sep 2022 11:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbiIAPnJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Sep 2022 11:43:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723FC8A1D7
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Sep 2022 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662046987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zPoitkGieiA519AGfM1lLFH3EIE6WMP8WybuQF7XBQY=;
        b=QrWr+D/+WA5vkBPm+QszWJOwYRfvsn5M5NcGCyimTC9ByR8Btjps1Dxl4BN66cSYLEHkBT
        ZtqolGnuZpJsnAPtxGiloJ4JxouDlGGqv5+YgmpOfmXdj1r+5TCanUj/ck8S+zWdtg0VGD
        4jEj44ivrQ7dkW5tnFMKY8QJsirL1Zo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-413-wl8EOQ09PvyKPT3jWWl1ZQ-1; Thu, 01 Sep 2022 11:43:06 -0400
X-MC-Unique: wl8EOQ09PvyKPT3jWWl1ZQ-1
Received: by mail-ed1-f72.google.com with SMTP id z20-20020a05640235d400b0043e1e74a495so12092093edc.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Sep 2022 08:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zPoitkGieiA519AGfM1lLFH3EIE6WMP8WybuQF7XBQY=;
        b=eNtXtWM0nQ5wToT5NT0H05WQOFwdoquZnTI78MG/OF4cgN0MDysh10RrpW21XFV2Aj
         n+mzqduK7d75SbdWRkD5QAjZO+EG20VqPfZK44D5DgKcMOud5sCz2Vjv2rhADGjnAqBT
         fYQYoWhLTSvzlYqR4c7J1Jjo4SPRUs2MPEbK/kK+DRX0yYYxBdMdRTci0avLPctW5uHV
         ecQpOKVXlMSOw2rKS9bJvTmthPWkGfR2gLykSz65Ix1MkAfzCSyI9u4IZEs5jB9eXXgP
         aUGCF+tnIKXEWfRwXskEwIlKDRY72Ry6tfeCuAYG9nVZ3RabGQKYZyCrlMvmcyP9MPf0
         5Rww==
X-Gm-Message-State: ACgBeo2nPY2fFFqOMFi5EjHKQUnxnZc+lpG+bmELP/CUZb6nBS7rTkPy
        sEZC6e8i1LFyhc30pPAzj4SWpaA143IKJD9KWZrdUcw22Pl0hwfIbZwECKmd8LiD2oRE36SYceI
        6JoA2knDvABCV3cf0qWK2Ggw8B9R0FquSSA==
X-Received: by 2002:a17:906:9b09:b0:741:879e:fa with SMTP id eo9-20020a1709069b0900b00741879e00famr13609767ejc.573.1662046984748;
        Thu, 01 Sep 2022 08:43:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5skRuTJgjGK/5n5XrmzssooAjFbQ1CE9Ph1X052a+kR7D00THN55FR8+GL484EgzVxktcOKw==
X-Received: by 2002:a17:906:9b09:b0:741:879e:fa with SMTP id eo9-20020a1709069b0900b00741879e00famr13609754ejc.573.1662046984592;
        Thu, 01 Sep 2022 08:43:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id vp10-20020a17090712ca00b0072b1bc9b37fsm8612934ejb.22.2022.09.01.08.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:43:04 -0700 (PDT)
Message-ID: <b8a5038b-3d3a-4a2c-8fca-32b47f11e85c@redhat.com>
Date:   Thu, 1 Sep 2022 17:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1] platform/x86/intel: pmc/core: Add Raptor Lake support
 to pmc core driver
Content-Language: en-US
To:     Gayatri Kammela <gayatri.kammela@linux.intel.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, irenic.rajneesh@gmail.com,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Box <david.e.box@intel.com>
References: <20220830182001.3693030-1-gayatri.kammela@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220830182001.3693030-1-gayatri.kammela@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/30/22 20:20, Gayatri Kammela wrote:
> Add Raptor Lake client parts (both RPL and RPL_S) support to pmc core
> driver. Raptor Lake client parts reuse all the Alder Lake PCH IPs.
> 
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: David Box <david.e.box@intel.com>
> Signed-off-by: Gayatri Kammela <gayatri.kammela@linux.intel.com>

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
>  drivers/platform/x86/intel/pmc/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index a1fe1e0dcf4a..17ec5825d13d 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1914,6 +1914,8 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
>  	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_N,		&tgl_reg_map),
>  	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE,		&adl_reg_map),
>  	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P,        &tgl_reg_map),
> +	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE,		&adl_reg_map),
> +	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_S,	&adl_reg_map),
>  	{}
>  };
>  
> 
> base-commit: b90cb1053190353cc30f0fef0ef1f378ccc063c5

