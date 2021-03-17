Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C58C43381
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 17:47:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02DFC64DE4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 17:47:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbhCQRrI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Mar 2021 13:47:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27018 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232709AbhCQRrB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Mar 2021 13:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616003220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qaX90kJ0jKMhI8jGOsNhOtE/1We2a/DpzYlW58HcaFM=;
        b=G2AigI+AWcsJXa4v/e7vXlytwVvL+FyOCWy2u1zNJl2uh3uAGlrzsiCfziuVAcZsHeOaTT
        FouDVeqjKcCj+rVjE+HOR8wIK28rBmpm6XDelbG6GabyblbshMEtX46aHhtSIZgX+jGE7m
        C8P837u5OYBu4sQ6AddSS/ls/x0cCVY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-MT1KD9TeOp-4nJq-p7-N8Q-1; Wed, 17 Mar 2021 13:46:56 -0400
X-MC-Unique: MT1KD9TeOp-4nJq-p7-N8Q-1
Received: by mail-ed1-f69.google.com with SMTP id q25so5053312eds.16
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 10:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qaX90kJ0jKMhI8jGOsNhOtE/1We2a/DpzYlW58HcaFM=;
        b=oQ9gRE3JzsQk37k/TkX03KBPGaiikinpACpO5dXUKRTVpXG/wGxEsjTOWK3EnxM0vx
         KSUPEAVCBsNunS934FEhfuOZ8/dTGnqcHdXueHhgGBgk2/g+wITzwkS0aX7uuF8MRPDe
         PNGpH7Jz4AbhZwXmgPl/9jz+xL/YLpIKtfOwK5UwSCKSn13wz7Fxbx0nXDJQWkwXXTTf
         NpfrV3YYzRz+x0k00WGelQZAOHOo8Ai/zi0lrt12Hhox1ix9o3vj9I9jezdU46FuvnFu
         JDF03NPfIm6S0uSiH2Lsa0xxMeYky7RKANcx4x+ZCsVbXPv5KqrNK7iXXg1dw7Xzd/7j
         TXbQ==
X-Gm-Message-State: AOAM53304NfDsGcVt7yrzfpOqFe80QnyN9fdVNx6apLTXP3eKuaipdhe
        QXpA424SaieiHvHrS23HqtASVaJqS7JO/wARpGqBu5pAmdV7NGlooe0tq4vfDsO+MUFANlBOiXx
        Aq6qoI0Tmjt42B/QkOmWveUbR3KttqY8sZQ==
X-Received: by 2002:aa7:d7da:: with SMTP id e26mr44093965eds.269.1616003214886;
        Wed, 17 Mar 2021 10:46:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5fR7gox4NLViF6kYrZbBcrTsaJtgoP+kGkrzH7XkQsNjoaMKtFr9yuY/Tt4gUhbwt903FLQ==
X-Received: by 2002:aa7:d7da:: with SMTP id e26mr44093952eds.269.1616003214777;
        Wed, 17 Mar 2021 10:46:54 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a26sm14392972edm.15.2021.03.17.10.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 10:46:54 -0700 (PDT)
Subject: Re: [PATCH -next] platform/surface: aggregator_registry: Make symbol
 'ssam_base_hub_group' static
To:     'Wei Yongjun <weiyongjun1@huawei.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210309131500.1885772-1-weiyongjun1@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <efe7b835-b03e-e945-f164-219d0b5e1147@redhat.com>
Date:   Wed, 17 Mar 2021 18:46:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309131500.1885772-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/9/21 2:15 PM, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The sparse tool complains as follows:
> 
> drivers/platform/surface/surface_aggregator_registry.c:355:30: warning:
>  symbol 'ssam_base_hub_group' was not declared. Should it be static?
> 
> This symbol is not used outside of surface_aggregator_registry.c, so this
> commit marks it static.
> 
> Fixes: 797e78564634 ("platform/surface: aggregator_registry: Add base device hub")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

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
>  .../platform/surface/surface_aggregator_registry.c  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index cdb4a95af3e8..86cff5fce3cd 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -352,7 +352,7 @@ static struct attribute *ssam_base_hub_attrs[] = {
>  	NULL,
>  };
>  
> -const struct attribute_group ssam_base_hub_group = {
> +static const struct attribute_group ssam_base_hub_group = {
>  	.attrs = ssam_base_hub_attrs,
>  };
>  
> 

