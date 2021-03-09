Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B56C433E6
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Mar 2021 13:25:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7787C64EBB
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Mar 2021 13:25:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbhCINYi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Mar 2021 08:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbhCINYb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Mar 2021 08:24:31 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35996C06174A;
        Tue,  9 Mar 2021 05:24:31 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo6242533wmq.4;
        Tue, 09 Mar 2021 05:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cLqnVuKuFuZQ++0ePuUnM1AiknBJ6qGOFZib/XotzbY=;
        b=buh/KLMIQGIX4go50r+3gnvbw4mC1j/wpRz0DJFoHxBMaEe/gr7Y8vDlaCELmlac9p
         4qlH/X4r9SqXFlnKNOQ1YFan4U4GVEWKJAdk6Ek44QMDE1kwTT5MBxOzRj69QEVcdihy
         phmEkq76ATbQIFsFCaMHDrjmYj1JISUEWkjp68T/WnnkeIkcL5XYm36uBHptc0tPITew
         A1a07gyMvHlWmPL/EHEAZKxyrY6bUsDFYdDfv3Ifb3MT0lnZ8wjSVRdB/Q00IgRipSYQ
         K7NhGX7ZVQW42TvO4f62zPgaDZ/7pPCYEQUrOQPmDHD+u3ZSFFzJIjCR8QEy1vzziiOD
         VhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cLqnVuKuFuZQ++0ePuUnM1AiknBJ6qGOFZib/XotzbY=;
        b=K8oFMrs3ycrnKiBjLFcWj4XBzO6Qj0IRdTq8yv3cSB3fyJ3eo7D6a27fbjrYXt0nVc
         FyQ7gRctNvqcCZ13C5Pd+rph5Hq6rPFSgQlIzGtD/oO70oMmzt5zlGAXmDFfY3skr1xU
         XpI+JomCsMRlLCb9CTZNVcSdZNhRs3WMCfHHNXPfMtyvtGX4rYggR8r+7a7tdGQ8uIJb
         BUM/5+SBxuS68x1+Jn4UXV/+2ZJDhkSckt2d7wBm9TpgqI1dtupGGDGxOoV5/Ngw7IAt
         leRBNSqLnMfz71e+mBRRG+tcA+KukYYrzF+nXTDS/5NlENvwRQyM1zVbZ4XdPXmsNT8x
         MlyQ==
X-Gm-Message-State: AOAM531LVJ47orgfCwSuNQAQ02yo3ihQHVM2Q9lVGqqGQGPZHUNxtRlJ
        b6yRCzXxawWtLdY8aex6sgs3hxBpdeM=
X-Google-Smtp-Source: ABdhPJxKWiby4MOwEq/NlX/JDUKG0qy/bSy8RQn1mY7fUyoq+Cetq0QuNZU3h7H2j1aoFzbXJWsmTw==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr4011453wmk.101.1615296270002;
        Tue, 09 Mar 2021 05:24:30 -0800 (PST)
Received: from [192.168.2.202] (p5487b975.dip0.t-ipconnect.de. [84.135.185.117])
        by smtp.gmail.com with ESMTPSA id u2sm4475845wmm.5.2021.03.09.05.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 05:24:29 -0800 (PST)
Subject: Re: [PATCH -next] platform/surface: aggregator_registry: Make symbol
 'ssam_base_hub_group' static
To:     'Wei Yongjun <weiyongjun1@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210309131500.1885772-1-weiyongjun1@huawei.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <b16458f8-a4ce-f8ef-0c64-e00c312e3d1e@gmail.com>
Date:   Tue, 9 Mar 2021 14:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210309131500.1885772-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 3/9/21 2:15 PM, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The sparse tool complains as follows:
> 
> drivers/platform/surface/surface_aggregator_registry.c:355:30: warning:
>   symbol 'ssam_base_hub_group' was not declared. Should it be static?
> 
> This symbol is not used outside of surface_aggregator_registry.c, so this
> commit marks it static.

Right, this should be static.

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

Thanks,
Max

> 
> Fixes: 797e78564634 ("platform/surface: aggregator_registry: Add base device hub")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>   .../platform/surface/surface_aggregator_registry.c  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index cdb4a95af3e8..86cff5fce3cd 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -352,7 +352,7 @@ static struct attribute *ssam_base_hub_attrs[] = {
>   	NULL,
>   };
>   
> -const struct attribute_group ssam_base_hub_group = {
> +static const struct attribute_group ssam_base_hub_group = {
>   	.attrs = ssam_base_hub_attrs,
>   };
>   
> 
