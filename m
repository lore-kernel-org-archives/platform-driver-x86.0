Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70051C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 May 2022 16:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233545AbiEKQEG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 May 2022 12:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344230AbiEKQEG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 May 2022 12:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DD064199B24
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 09:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652285044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=byqMNSdf6bnIBh4DurWrX7V2g59mmEQr+NLKUpUehNY=;
        b=AS9OgPWRRuMvKtkeoGIiJ6luackU2oUsCjzyLPi0u1vnvCMf4Khaq3o+8F7azPdmiHpZBd
        oW/lARuce1acri/sEi/ThOzCsjS6ntkOxw36v7p6sFCX4GnaV5/1tLCQI0VGnE08QTjq5P
        sYVti1FKR7blt5Rr6JtqUT8gKglGObA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-b41OR9DYPnKsCYnWL27wKQ-1; Wed, 11 May 2022 12:04:00 -0400
X-MC-Unique: b41OR9DYPnKsCYnWL27wKQ-1
Received: by mail-ed1-f70.google.com with SMTP id bf14-20020a0564021a4e00b0042872820fddso1631972edb.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 09:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=byqMNSdf6bnIBh4DurWrX7V2g59mmEQr+NLKUpUehNY=;
        b=7BJXUAiAfRfHM92U4a7+ZYEQfAp3D3gOR9WaQ2dR0fAWAJoZhH7yzWeZUI8J/zICzY
         ezNBekbjqLrdlGPJ28dQXaIIsLEdZES5vVt7Ggu+GFis1n0gQfjeUMf1CTJU+kfsvSUV
         6CWfGNZIoIorgwARGvc8sfuU4cZWO3tJYvFZG62Z69MjRPagqGd9skMiq610vDtwcsru
         Ro+4p7vjgy2fQfClF6TDzL6nu1Fw8f2Urc+4Kt7jxmtdp0EGzJXZYsfp8YxzVqs7/gv5
         t05ZZLoeP2GgqVJfWnG3Nimsw3D/sJaSe+l3ogRZrhvYLQK+mobY8jPD+R80ImKDWKzX
         XNvg==
X-Gm-Message-State: AOAM533BI4+UdGe2Y1DzjznrEhnf7s+3AFRREou9t+W4Limb1X/7GV/N
        oUAvo0VzvX2nP39H8iZ+MadPFHXSx2QtB+qufqIc2qMJn05kK7e6LMsE/dEvic6Pe09Q9xz4l/3
        XUKNHLRIipG+DcOPyOsex35ebbSotqYfryg==
X-Received: by 2002:a17:906:3e05:b0:6f3:a14a:fd3f with SMTP id k5-20020a1709063e0500b006f3a14afd3fmr24340207eji.640.1652285038871;
        Wed, 11 May 2022 09:03:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz57bRJ8Xm97UzTQ6gASlTYMO34H4z/Jt5jP3gub5wjACPTo4dTYHQBBEZVD8jqkcn8T3Pliw==
X-Received: by 2002:a17:906:3e05:b0:6f3:a14a:fd3f with SMTP id k5-20020a1709063e0500b006f3a14afd3fmr24340190eji.640.1652285038652;
        Wed, 11 May 2022 09:03:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id v22-20020aa7d9d6000000b0042617ba6392sm1337013eds.28.2022.05.11.09.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 09:03:58 -0700 (PDT)
Message-ID: <1bdf6cfd-7690-f949-8eee-e545af979a3a@redhat.com>
Date:   Wed, 11 May 2022 18:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH V2] samsung-laptop: use kobj_to_dev()
Content-Language: en-US
To:     cgel.zte@gmail.com, andy.shevchenko@gmail.com
Cc:     chi.minghao@zte.com.cn, corentin.chary@gmail.com,
        linux-kernel@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, zealci@zte.com.cn
References: <CAHp75Vc+G1JNkxBcpyXge9qsGpT0m4erBV1aEi4bMHDYfE-JOw@mail.gmail.com>
 <20220511021522.1488373-1-chi.minghao@zte.com.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220511021522.1488373-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/11/22 04:15, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Use kobj_to_dev() instead of open-coding it.
> 
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>

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
> v1->v2:
> 	remove Reported-by: Zeal Robot <zealci@zte.com.cn>
> 
>  drivers/platform/x86/samsung-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
> index 19f6b456234f..c187dcdf82f0 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -1208,7 +1208,7 @@ static int __init samsung_backlight_init(struct samsung_laptop *samsung)
>  static umode_t samsung_sysfs_is_visible(struct kobject *kobj,
>  					struct attribute *attr, int idx)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct samsung_laptop *samsung = dev_get_drvdata(dev);
>  	bool ok = true;
>  

