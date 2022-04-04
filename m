Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E940C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 13:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiDDNcH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 09:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352686AbiDDNcF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 09:32:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ED1CE1EEC1
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649079009;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nRwIzU35RFV24MotolnoU7GJboLYAGylG3pVGa9Oths=;
        b=S5j88GK7Od4ckwYf8i6/6YcAfNiTxfH7IStTl3fYCBws+pdjlmd5X1+fQFOK0i4gMsdttd
        OT/DBo7V4sYSn/Fiql9LPKnb9nK2ffPW5L2Uku/rFdiTs/ee8Czf4yhbE4fjWMp01QPyYf
        A2tnnRjWRkGLYpgu5rMUvew0sSUJLNo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-VTd-khLKMN6XRMblpaFOrw-1; Mon, 04 Apr 2022 09:30:07 -0400
X-MC-Unique: VTd-khLKMN6XRMblpaFOrw-1
Received: by mail-ej1-f72.google.com with SMTP id gn11-20020a1709070d0b00b006e6e59438f8so2085979ejc.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Apr 2022 06:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nRwIzU35RFV24MotolnoU7GJboLYAGylG3pVGa9Oths=;
        b=OcqMouF0onDV8s9kZR3Tj6vY52kPqpTr3D8zATN6kmW34i34JX0QFnApYd9ifKN9xk
         WIyUWf/GNdXjH5/9qeZR1xzz3eT78aL1C7+2gHl0f5UMmXWxSxerVDy0D/z9xmt1f6GR
         kTDgGX7BYXA/chDhOWkQZW7wOd8iZAR7LHnrHuhyYiS7lOIhmxwh8gXjABeVBEBNcRNw
         jhC88YFxurBeI++NFhUP4PiQm1j+4J0NUuSb5DiX/dmQqhBBuw0aISsOnphwAAEaDmuD
         CdMtOwWZT5IrnM9EH6/WAEVFnqqVu3GK0aRtfKpGtNv9aFOqWG1xU9kVBA9ciJ30Sdyp
         dobw==
X-Gm-Message-State: AOAM533ZcRlk3WUpw5UK8Cy2B3YWYW9Cxz/R08GYZgZd4n6DLsGmqr/S
        Zc871eMDGfNKdhfFgD27EDbwhrSPZULJXWXO0c/nI/W019GrTJtmyRWFqP6F6rgqfVcBVBV8zuT
        QTkeQe2zpc8go2qABtdnDLX9VghSXRT4RnQ==
X-Received: by 2002:a05:6402:1e90:b0:419:4cdc:8b05 with SMTP id f16-20020a0564021e9000b004194cdc8b05mr33216275edf.211.1649079006749;
        Mon, 04 Apr 2022 06:30:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/h7QadbxpwMpWnjIBS4WTd1CwyUjzgQocOaJDG0sKf88TrM/0HN7eAoRcGLttPKS51hKLGg==
X-Received: by 2002:a05:6402:1e90:b0:419:4cdc:8b05 with SMTP id f16-20020a0564021e9000b004194cdc8b05mr33216257edf.211.1649079006559;
        Mon, 04 Apr 2022 06:30:06 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g2-20020aa7dc42000000b00418ef55eabcsm5339033edu.83.2022.04.04.06.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 06:30:06 -0700 (PDT)
Message-ID: <121c8136-8d8d-3f4f-dac2-443f5adceea6@redhat.com>
Date:   Mon, 4 Apr 2022 15:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] samsung-laptop: Fix an unsigned subtraction which can
 never be negative
Content-Language: en-US
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        corentin.chary@gmail.com
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20220322061830.105579-1-jiapeng.chong@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220322061830.105579-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/22/22 07:18, Jiapeng Chong wrote:
> Eliminate the follow smatch warnings:
> 
> drivers/platform/x86/samsung-laptop.c:1124 kbd_led_set() warn: unsigned
> 'value' is never less than zero.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

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
>  drivers/platform/x86/samsung-laptop.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
> index c1d9ed9b7b67..19f6b456234f 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -1121,8 +1121,6 @@ static void kbd_led_set(struct led_classdev *led_cdev,
>  
>  	if (value > samsung->kbd_led.max_brightness)
>  		value = samsung->kbd_led.max_brightness;
> -	else if (value < 0)
> -		value = 0;
>  
>  	samsung->kbd_led_wk = value;
>  	queue_work(samsung->led_workqueue, &samsung->kbd_led_work);

