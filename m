Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D026C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Dec 2021 16:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbhLJRA7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Dec 2021 12:00:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56683 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229821AbhLJRA6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Dec 2021 12:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639155443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rzeV8e563ubww0RTTrR8TIH1th19UWmc6oPCR1FYHig=;
        b=f1zT9MB7+SCR+dttVQHi/EdG5rpSXz5r53yzPFJ2E/Y0q2KyVoFY679kzG3NIpgFYkWGLQ
        8KP/2sU1PMH/7yehmsswQXWYHVSUkpYZ7gSQ9ms2yG2pNcbrWT9KtLt453D77i4virl6st
        tn2Qsa8Tzaww4EYZSHYoG27x8iaN9Rk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-jCwnygLCOnOVn8Ap47BSMQ-1; Fri, 10 Dec 2021 11:57:22 -0500
X-MC-Unique: jCwnygLCOnOVn8Ap47BSMQ-1
Received: by mail-wr1-f70.google.com with SMTP id p17-20020adff211000000b0017b902a7701so2513649wro.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Dec 2021 08:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rzeV8e563ubww0RTTrR8TIH1th19UWmc6oPCR1FYHig=;
        b=ExHANcLEGbSY5KeGm+0izNlnj5HP57C8b0KJ/IRio7MgoTdo5TesOYACQRMF8hpI1d
         oFZF5idB9QWi52Dtep2BDdOvKpEMFftUX6IcA3broJqN9BmCCinpaTTckUUGb6SPGvbc
         a1+dOF90uz5KcDNKNMPwOoR32Ne9MSLuiqvb6ZYFj3GNEpkqxT4smYt9ty0bBPeHknvB
         KYfHxwsVt+FnpyKFiw68Sya0vb/lru2MpwGWveDY5PpDqPqd4xuJC1IobjwzTdW7LStg
         KwyTcYMF+BmxJGAXA9hwrTV+Lb9ylNnXEhhMARK94FnT4F0fhVN9BiM7UCQzdvTC/4g4
         ccjw==
X-Gm-Message-State: AOAM531RNExuEB8HSb3EEiqN5MgzwM50sU+aeKhCqypLm+3698pbp/oS
        7AtFA6Z9QwhJekNNXe2ZtYU8GaQ+R513dxcMm/rIXekIg/SLcP/GGyxGmarMES1ROf05MoLYhij
        UxkxrMAfXNkjgMLOfxJOi0+wVqxULmeh5Gw==
X-Received: by 2002:adf:e0d0:: with SMTP id m16mr15214314wri.74.1639155440858;
        Fri, 10 Dec 2021 08:57:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2gK/oWWEW4wGM6US1FC/izLejsINm4hcPUJh6i717fxzUPBKpCLbtPe0RbzOpYqE/WQdjqw==
X-Received: by 2002:adf:e0d0:: with SMTP id m16mr15214300wri.74.1639155440700;
        Fri, 10 Dec 2021 08:57:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id l5sm12104083wms.16.2021.12.10.08.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 08:57:20 -0800 (PST)
Message-ID: <5070829f-fe15-b7c7-f461-83122c0fa9c6@redhat.com>
Date:   Fri, 10 Dec 2021 17:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: amd-pmc: only use callbacks for suspend
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     stable@vger.kernel.org
References: <20211210143529.10594-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211210143529.10594-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 12/10/21 15:35, Mario Limonciello wrote:
> This driver is intended to be used exclusively for suspend to idle
> so callbacks to send OS_HINT during hibernate and S5 will set OS_HINT
> at the wrong time leading to an undefined behavior.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

I notice that there are no [Bug]Link tags here ?  It would be helpful
to have some links to tickets / forum-posts from people who are actually
hitting issues because of this. Both so that people with similar issues
can then compare the symptoms as described in the links, as well as for
me to get an idea of how urgent of a fix this is.

Regards,

Hans




> ---
>  drivers/platform/x86/amd-pmc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 841c44cd64c2..230593ae5d6d 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -508,7 +508,8 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops amd_pmc_pm_ops = {
> -	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(amd_pmc_suspend, amd_pmc_resume)
> +	.suspend_noirq = amd_pmc_suspend,
> +	.resume_noirq = amd_pmc_resume,
>  };
>  
>  static const struct pci_device_id pmc_pci_ids[] = {
> 

