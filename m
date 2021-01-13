Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82223C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 09:31:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 261212339D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 09:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbhAMJa5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 04:30:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43666 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726803AbhAMJa4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 04:30:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610530169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4NzzU9gTPLBRDuVevAdWIrw84i9fziQn8LtNJFPsNd0=;
        b=IvLG2/qQM43Yehh2SjzkinyVH03TQgxhFzsXy7lwjqiCLpIP2PJOmBsG3x1z6G6O0HHq9+
        xWoPlHnLWuzJ1fpLs4J4q1/yTczEJSHLCDFnlMKHUoAWyiX+vKApmNI7I7iiYCjy//qlcl
        gqYOd0qkNDSVfKcJlksAQ6l+TJ0LRcU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-jW5Spf7DPym3xS6IHBiAmw-1; Wed, 13 Jan 2021 04:29:27 -0500
X-MC-Unique: jW5Spf7DPym3xS6IHBiAmw-1
Received: by mail-ej1-f70.google.com with SMTP id r26so666943ejx.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jan 2021 01:29:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4NzzU9gTPLBRDuVevAdWIrw84i9fziQn8LtNJFPsNd0=;
        b=sYn+0cyzxIHNrYrRfbOdZEgXrbgv5q7J9ZBUjTBbpmeVot9wpfTf227paH9O9ToaJP
         OkIekY4eIvZfI2pojtC0BdLg9tRB7SsjlwHCbv7EfnCCiVAmquvBjALg23NrJP3yneKg
         dHC142nY4OHHmI0+2zA/9hB/KeZHu0WbxDoxKfhM7uEvFRzhS9xVsn4wSUjk3P9Z+7Tb
         GtbmmA9lG5yCiSSiUTgU51/rPrdozMhrgyCaF+ptRLRVkxrpXu7Pu7kvqhPWlcLsXxKJ
         LRc4fHsTwdKbduhnjmfHpbourJqlbDIc7+eQwSiVU4aohtfU70BIjrnsu9gWHVwwo7S7
         kgGg==
X-Gm-Message-State: AOAM533W/B1eM8ODf+cwFIb0FN7sLueut6P7qt19GdqoE/D3FX1Vava1
        lvQ4Uo8HK/EN6lDiaZlVWEMGPndaHK25Q4ajsu+QjgsVBsB1/C6x/K9bMGUU4neP/zsQ9HvrHXD
        N15XfJOhScum4XiWeJrvzFBeuJkmeqCQB7Q==
X-Received: by 2002:a05:6402:1383:: with SMTP id b3mr1018146edv.100.1610530166182;
        Wed, 13 Jan 2021 01:29:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw08XHHl+TDZXjj1je5Q6TE0RpJVI0OZmCedBYN1dWUmsBxearRIitgOcyOVfvefIbxc6D4MA==
X-Received: by 2002:a05:6402:1383:: with SMTP id b3mr1018139edv.100.1610530166059;
        Wed, 13 Jan 2021 01:29:26 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id bq20sm469449ejb.64.2021.01.13.01.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 01:29:25 -0800 (PST)
Subject: Re: [PATCH] platform/surface: aggregator: prevent information leak in
 ssam_cdev_request()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <X/6sVaewHLPzv00U@mwanda>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <de261fcb-7362-3c03-eecd-292e0a0038a5@redhat.com>
Date:   Wed, 13 Jan 2021 10:29:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <X/6sVaewHLPzv00U@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/13/21 9:16 AM, Dan Carpenter wrote:
> If copy_struct_from_user() fails at the start of the function then this
> function calls put_user(rsp.length, &r->response.length) before
> "rsp.length" is set to zero.  That is a potential security issue because
> it discloses kernel stack data to user space.
> 
> Fixes: 178f6ab77e61 ("platform/surface: Add Surface Aggregator user-space interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for your patch, another fix for this was already submitted:
https://patchwork.kernel.org/project/platform-driver-x86/patch/20210111154851.325404-2-luzmaximilian@gmail.com/

So I'm dropping this patch from my queue.

Regards,

Hans



> ---
>  drivers/platform/surface/surface_aggregator_cdev.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_cdev.c b/drivers/platform/surface/surface_aggregator_cdev.c
> index 340d15b148b9..05e9eb118d76 100644
> --- a/drivers/platform/surface/surface_aggregator_cdev.c
> +++ b/drivers/platform/surface/surface_aggregator_cdev.c
> @@ -67,7 +67,7 @@ static long ssam_cdev_request(struct ssam_cdev *cdev, unsigned long arg)
>  	struct ssam_cdev_request __user *r;
>  	struct ssam_cdev_request rqst;
>  	struct ssam_request spec;
> -	struct ssam_response rsp;
> +	struct ssam_response rsp = {};
>  	const void __user *plddata;
>  	void __user *rspdata;
>  	int status = 0, ret = 0, tmp;
> @@ -96,8 +96,6 @@ static long ssam_cdev_request(struct ssam_cdev *cdev, unsigned long arg)
>  		spec.flags |= SSAM_REQUEST_UNSEQUENCED;
>  
>  	rsp.capacity = rqst.response.length;
> -	rsp.length = 0;
> -	rsp.pointer = NULL;
>  
>  	/* Get request payload from user-space. */
>  	if (spec.length) {
> 

