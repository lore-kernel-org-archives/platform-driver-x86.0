Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6135AC433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Dec 2021 17:58:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240798AbhLUR6V (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Dec 2021 12:58:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37335 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240800AbhLUR6R (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Dec 2021 12:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640109496;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XcYSjP5MxF8ky63jKmhgS16ZkRXA53DCpgOi/5wh1dY=;
        b=ODbrYJdo1HKq2QCJk5nIfglH7MOfRDQyDrDj3iDlcQxVsGxNIEm8OmaSkjSq9Ijn4xNKcF
        gdNFMECSxo/BeZpvvzcL0l3pVrkypRkHqrSFwz0pal32cyqPq12IvxQfBq/LcVlmLM0dh/
        ON415YVJ87vvhYG1ZK3sEk7sIobF/iQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-6Z8EZ5qMN9GD7S5-27BFbA-1; Tue, 21 Dec 2021 12:58:15 -0500
X-MC-Unique: 6Z8EZ5qMN9GD7S5-27BFbA-1
Received: by mail-ed1-f71.google.com with SMTP id c19-20020a05640227d300b003f81c7154fbso10318487ede.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Dec 2021 09:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XcYSjP5MxF8ky63jKmhgS16ZkRXA53DCpgOi/5wh1dY=;
        b=xCElwAIZpi81vl1NRAIcAL4DDy9/7beYan/b9tm6B67QHXAYelS6CTPCXR+7jvUM2G
         RlKparZL3RXsYzwiN+M5bdeQoumlvv0CAipB/Xi4C/5afEIZq7kOLawpy+XH9Vjhu1bL
         EwUVL/TqTihZ7+nfPJ9UvE5+5GBhftC7UdViCtKiftr1YZnwncAq+Ng06qWThmrIUVcm
         8yEB2TnFR4eu5tqhQsZ/W88dZojniIA/EG/ndxtp9SqwXmVQfEjXHgVDJrhULQx2ddEB
         rBRsIWi6qkYx0orP9Sv2KyDSXzMJKuemkmXQwuVZqeaiW8pMVIG4H89KLpczGxOaLeAs
         2j7w==
X-Gm-Message-State: AOAM531EFxzZhXDl+DflRaWzbqX57wUpE8R1l17MXsY8o7xiTAG4cuil
        hxZzup04Xwc2fyKNVNAC7CRPsrqSABae28qCSVd5fvK2k3dJHWC0UUWTP6NjuzHQxHyUiOAFFsr
        qbfgtaUge+rNNiuCd5KBaKfwvO+QfVH7o2w==
X-Received: by 2002:a17:906:b047:: with SMTP id bj7mr3598173ejb.751.1640109494308;
        Tue, 21 Dec 2021 09:58:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuZAN4utpYI5CtBEON4RIMvzdZqcMLLNlWM8GTGHjVJImQn3HscBETkas7CT0bdtwB9kCUyQ==
X-Received: by 2002:a17:906:b047:: with SMTP id bj7mr3598161ejb.751.1640109494090;
        Tue, 21 Dec 2021 09:58:14 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id 1sm6792495ejg.163.2021.12.21.09.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 09:58:13 -0800 (PST)
Message-ID: <ae75080a-e111-a4c5-81c4-6b5329f233ec@redhat.com>
Date:   Tue, 21 Dec 2021 18:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: think-lmi: Prevent underflow in
 index_store()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20211217071209.GF26548@kili>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211217071209.GF26548@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/17/21 08:12, Dan Carpenter wrote:
> There needs to be a check to prevent negative offsets for
> setting->index.  I have reviewed this code and I think that the
> "if (block->instance_count <= instance)" check in __query_block() will
> prevent this from resulting in an out of bounds access.  But it's
> still worth fixing.
> 
> Fixes: 640a5fa50a42 ("platform/x86: think-lmi: Opcode support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
>  drivers/platform/x86/think-lmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 27ab8e4e5b83..0b73e16cccea 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -573,7 +573,7 @@ static ssize_t index_store(struct kobject *kobj,
>  	if (err < 0)
>  		return err;
>  
> -	if (val > TLMI_INDEX_MAX)
> +	if (val < 0 || val > TLMI_INDEX_MAX)
>  		return -EINVAL;
>  
>  	setting->index = val;
> 

