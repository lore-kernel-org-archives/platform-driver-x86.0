Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFF1C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B06E261990
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhCWT7d (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Mar 2021 15:59:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51363 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230018AbhCWT7N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Mar 2021 15:59:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616529552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZnU/WxIV38U6h+KpWHxuZSN2zS4UClavD9NJYvWgSiQ=;
        b=U9Sp2BtftljEgnsWKMYOzy281UXyisRjTNCKUgVk/cvWsinMEkp7ul57qE4/fW7FFqhb6D
        LjN9FHwLHNWALmwWbJayqWRX9RA29BDCW37q0+Ty7+FQwLEN8yWwqrIWu1Br0HisSxc5VF
        K4naGPHTSCtg73Z6hF9uuLlooceonaI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-nghMnesFN7GXY39nuJh0HQ-1; Tue, 23 Mar 2021 15:59:10 -0400
X-MC-Unique: nghMnesFN7GXY39nuJh0HQ-1
Received: by mail-ed1-f70.google.com with SMTP id n20so1499085edr.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Mar 2021 12:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZnU/WxIV38U6h+KpWHxuZSN2zS4UClavD9NJYvWgSiQ=;
        b=V2PyIHrYyF0anJ1OGyB7WPtULFAEpLsWWcGAGGgivCjdPZ1AtkEChNbOi3tghEpXaF
         HvMJEompfh5JvrUijiAyqTdSgGLpnCCbN/1aeWEui0A8RqX/Dioqb4bcVuwDyy5Ifh1F
         GIjoXsYgRGm8tLhLTjLkuov8m/AbFdl3inTQ9YZBvhmTY0/VPWGcEGtfR9GUpysDCglU
         Bg4nVXCVEcgjovxBppVzwe462dfjUQVgTVORKDqKNJn0pkn/CY7ICZAcUt1fa6uR89DP
         gJQgqD+OUyfev0ss+RXt0HHUPznVQP31Qo4rDAXO6JVer/NgUBJSqZhpCd8hBw1qpt3O
         EDJA==
X-Gm-Message-State: AOAM5331Z5lEiNenGCCBmicH9zQnoB0ZSYacHyePLQsZA/EmPRguBJbF
        e6iGT1TTsZV7N5b2i8dqgd83Whqgvxx3gFAVi5rd3xyxqWMmBBuBBQ6UoFAKxp6x22qcpU5n8Rk
        VCEMLq6cI9gwOK5+4S7W1w3F4Kmg1MKMnZw==
X-Received: by 2002:a05:6402:2058:: with SMTP id bc24mr6260147edb.243.1616529549297;
        Tue, 23 Mar 2021 12:59:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+vu1miGSiLvu0tDwIVVVskyv2SMYDx5RCClcXRYYxAqmgBO6rbIyn7Ks4ZDjtrsqXfZsjnQ==
X-Received: by 2002:a05:6402:2058:: with SMTP id bc24mr6260135edb.243.1616529549118;
        Tue, 23 Mar 2021 12:59:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y24sm1095eds.23.2021.03.23.12.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 12:59:08 -0700 (PDT)
Subject: Re: [PATCH] platform: mellanox: Typo fix in the file mlxbf-bootctl.c
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, andy@infradead.org,
        dvhart@infradead.org, vadimp@nvidia.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
References: <20210317095650.2036419-1-unixbhaskar@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0f460307-25e6-4aad-5d43-31bfee59ef75@redhat.com>
Date:   Tue, 23 Mar 2021 20:59:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210317095650.2036419-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/17/21 10:56 AM, Bhaskar Chowdhury wrote:
> 
> s/progamming/programming/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

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
>  drivers/platform/mellanox/mlxbf-bootctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-bootctl.c b/drivers/platform/mellanox/mlxbf-bootctl.c
> index 5d21c6adf1ab..1c7a288b59a5 100644
> --- a/drivers/platform/mellanox/mlxbf-bootctl.c
> +++ b/drivers/platform/mellanox/mlxbf-bootctl.c
> @@ -208,7 +208,7 @@ static ssize_t secure_boot_fuse_state_show(struct device *dev,
>  	 * 0011 = version 1, 0111 = version 2, 1111 = version 3). Upper 4 bits
>  	 * are a thermometer code indicating key programming has completed for
>  	 * key n (same encodings as the start bits). This allows for detection
> -	 * of an interruption in the progamming process which has left the key
> +	 * of an interruption in the programming process which has left the key
>  	 * partially programmed (and thus invalid). The process is to burn the
>  	 * eFuse for the new key start bit, burn the key eFuses, then burn the
>  	 * eFuse for the new key complete bit.
> --
> 2.30.2
> 

