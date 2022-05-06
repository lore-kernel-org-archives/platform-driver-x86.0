Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E43C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 May 2022 10:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390863AbiEFKUs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 May 2022 06:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390848AbiEFKUk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 May 2022 06:20:40 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6768E5DE54
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 May 2022 03:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651832216;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Xud7uwrBJQp09CDp6iWu0jKEwddEsa6/N5MDwrytMs=;
        b=Eu6t7zLmnEp3clEeZEeGhn8AQC07QiBIYyrSh5Ty9yjnwEh0XxgvEsVaz8DbyQW+QJC/IK
        kmjeKg9tQFefkTS9r+bKNTzwgOXvaZGBaRv6E/pnM2fWflRvrYpEDLTgegvZl9r/U9xwKc
        9o5Kg1TLpa5Xx9i3BWDLO7Fq+9bxl9w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-irEm2Iw-P-iaLds_YnsUNQ-1; Fri, 06 May 2022 06:16:55 -0400
X-MC-Unique: irEm2Iw-P-iaLds_YnsUNQ-1
Received: by mail-ed1-f72.google.com with SMTP id n4-20020a5099c4000000b00418ed58d92fso3791529edb.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 May 2022 03:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2Xud7uwrBJQp09CDp6iWu0jKEwddEsa6/N5MDwrytMs=;
        b=bwEwsthuY6YNI2VWjIy2W2VzDZO27ltUgcqhc19rWs4b/13hneMgihkbrmKAgSOHGp
         MfYFCs/BFHF0+HGa2fQqfonPcz0z1ZqUN/itn+FL3QEFDvidhH48sSWvbuJexSyQS9Ol
         FAQs+OzK5/fnSb483sCy7+gUsy6+H1tr0x/HE7r4RYr8xInoRARzpLai3ZXOMf52OPRj
         jumR2TJqXuiAJNbm3x1YvTiBdIJ6wh4TS+xU2uAmPukgkjmaTAnKKQpYGKEE1uFXO7u0
         sCJJQ5ztreOYUqsEx0poNppNQgtDoiajAD31jKhi9h35Y4B9HHAm2JuJx3futmrxDUHZ
         i9Og==
X-Gm-Message-State: AOAM532/KoRJaz6aXcT7d0G0nl9JrzWIP4I4dD+/kmoZiNeVD4jcmJmH
        L0+vEM+fPeILT2b8Z+m7x3Uz+QaK/2TyN1U8+nrjkWeYH5vLn4Oj81I7FdNy6YQ1hlBCnXqfgAK
        OeqRPzC0EeUU3V3n9/UODL/34FNzza11VzA==
X-Received: by 2002:a50:8dca:0:b0:425:e8a3:a79f with SMTP id s10-20020a508dca000000b00425e8a3a79fmr2617240edh.155.1651832214302;
        Fri, 06 May 2022 03:16:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPp70x5jydjKAjbzZnfZubFIs/Gv63VewFlYk6NVOg+/LbYRr24IiG4Bf7XvMh/SheFZdFTg==
X-Received: by 2002:a50:8dca:0:b0:425:e8a3:a79f with SMTP id s10-20020a508dca000000b00425e8a3a79fmr2617220edh.155.1651832214082;
        Fri, 06 May 2022 03:16:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id dk20-20020a0564021d9400b0042617ba63c0sm2078264edb.74.2022.05.06.03.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 03:16:53 -0700 (PDT)
Message-ID: <f0af4593-78ad-f277-39b8-002c156ffed4@redhat.com>
Date:   Fri, 6 May 2022 12:16:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/surface: aggregator: Fix initialization order
 when compiling as builtin module
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?Q?Bla=c5=be_Hrastnik?= <blaz@mxxn.io>
References: <20220429195738.535751-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220429195738.535751-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/29/22 21:57, Maximilian Luz wrote:
> When building the Surface Aggregator Module (SAM) core, registry, and
> other SAM client drivers as builtin modules (=y), proper initialization
> order is not guaranteed. Due to this, client driver registration
> (triggered by device registration in the registry) races against bus
> initialization in the core.
> 
> If any attempt is made at registering the device driver before the bus
> has been initialized (i.e. if bus initialization fails this race) driver
> registration will fail with a message similar to:
> 
>     Driver surface_battery was unable to register with bus_type surface_aggregator because the bus was not initialized
> 
> Switch from module_init() to subsys_initcall() to resolve this issue.
> Note that the serdev subsystem uses postcore_initcall() so we are still
> able to safely register the serdev device driver for the core.
> 
> Fixes: c167b9c7e3d6 ("platform/surface: Add Surface Aggregator subsystem")
> Reported-by: Blaž Hrastnik <blaz@mxxn.io>
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

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
>  drivers/platform/surface/aggregator/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/aggregator/core.c b/drivers/platform/surface/aggregator/core.c
> index d384d36098c2..a62c5dfe42d6 100644
> --- a/drivers/platform/surface/aggregator/core.c
> +++ b/drivers/platform/surface/aggregator/core.c
> @@ -817,7 +817,7 @@ static int __init ssam_core_init(void)
>  err_bus:
>  	return status;
>  }
> -module_init(ssam_core_init);
> +subsys_initcall(ssam_core_init);
>  
>  static void __exit ssam_core_exit(void)
>  {

