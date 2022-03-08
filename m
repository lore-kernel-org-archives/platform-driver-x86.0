Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2B8C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Mar 2022 14:45:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347559AbiCHOp6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Mar 2022 09:45:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241932AbiCHOpw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Mar 2022 09:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A3743B296
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Mar 2022 06:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646750695;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lj+ogFbbdmviV6uhwsQsAUfte/KXkdEUifmBFjYpEbI=;
        b=Lve3sxmgTSfBbSLqqxRt84xQc4ueHAt6HHy68RaX+7XTiwc5qtKGhfcIIMAyjtk4e9MS5m
        ls1aS7V9R9BstD3U9mV8FqWpbMbztCRhYKzR/rFwFlGJKGhpJRNVSV2zhHEiJI9Po8yF6F
        98FAkUDVtCeSKOyA17T7ANlGKoh8R7U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-Lp07LZFOMVSk_xBB-En2LQ-1; Tue, 08 Mar 2022 09:44:53 -0500
X-MC-Unique: Lp07LZFOMVSk_xBB-En2LQ-1
Received: by mail-ed1-f69.google.com with SMTP id x5-20020a50ba85000000b004161d68ace6so5602933ede.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Mar 2022 06:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lj+ogFbbdmviV6uhwsQsAUfte/KXkdEUifmBFjYpEbI=;
        b=UHHtEBs1QUkgSV6OqlhdwfeHV6qyvIg3PWKstOs6Q+Dbs0GRf49zh/bezQlJOJp56W
         iMHgYMXjYv5QBSEEeVqEG1QKGWkP6Tax6H4vwq9Z7nGjv0q22Rjxf3mzHY0f9z7df8Q2
         JrwTe6A/65nfxJz3lxgOu5L3DtsGVgFxodx0ML3WpmiJfaATHIDO497KjH3H0WnSvM1r
         9yA6gZtvhLMQqELDV6YvptLUsR1WYWwbod5UBhR7SOZW6593LjCv2uAt7oR1YnznZAyq
         GBYzXHwen55WeXaoQuGeFjLULAzD7fFw7y+QHEo5JysQavr36N9ByT+A7HU8Ov87SHul
         lwHg==
X-Gm-Message-State: AOAM533iZ++XOdX0e3woNyG6maeJ7fRM4mY35icPaJzEBaXSQNenB9/T
        plRpta6fzdeDFfwqQs1Nv7RoLk4EUeuORFIcSbBRiBGHaKvGwzlJOPET8Y51VQeUFmRHtl+4FVg
        Br+9QCZJ3l2r8kNTttzBxf3ibZvK4JiFcnA==
X-Received: by 2002:a17:906:40a:b0:6db:3e2a:a7ce with SMTP id d10-20020a170906040a00b006db3e2aa7cemr5769108eja.255.1646750692727;
        Tue, 08 Mar 2022 06:44:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzB0DjYyKxulq90EsbG7eUWcdnzx/EVSEVPJ7EpU/AisLrsVlMS7aJoKOrJV9B5Q4prNsJsqg==
X-Received: by 2002:a17:906:40a:b0:6db:3e2a:a7ce with SMTP id d10-20020a170906040a00b006db3e2aa7cemr5769097eja.255.1646750692545;
        Tue, 08 Mar 2022 06:44:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id u9-20020a170906124900b006ce88a505a1sm6107649eja.179.2022.03.08.06.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 06:44:52 -0800 (PST)
Message-ID: <0739f2f1-8c46-5fb2-2e1e-070a41eabc1d@redhat.com>
Date:   Tue, 8 Mar 2022 15:44:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] platform: x86: huawei-wmi: check the return value of
 device_create_file()
Content-Language: en-US
To:     Jia-Ju Bai <baijiaju1990@gmail.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220303022421.313-1-baijiaju1990@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220303022421.313-1-baijiaju1990@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/3/22 03:24, Jia-Ju Bai wrote:
> The function device_create_file() in huawei_wmi_battery_add() can fail,
> so its return value should be checked.
> 
> Fixes: 355a070b09ab ("platform/x86: huawei-wmi: Add battery charging thresholds")
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
> v2:
> * Fix the code format.
>   Thank Hans for good advice.

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


> 
> ---
>  drivers/platform/x86/huawei-wmi.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
> index a2d846c4a7ee..eac3e6b4ea11 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -470,10 +470,17 @@ static DEVICE_ATTR_RW(charge_control_thresholds);
>  
>  static int huawei_wmi_battery_add(struct power_supply *battery)
>  {
> -	device_create_file(&battery->dev, &dev_attr_charge_control_start_threshold);
> -	device_create_file(&battery->dev, &dev_attr_charge_control_end_threshold);
> +	int err = 0;
>  
> -	return 0;
> +	err = device_create_file(&battery->dev, &dev_attr_charge_control_start_threshold);
> +	if (err)
> +		return err;
> +
> +	err = device_create_file(&battery->dev, &dev_attr_charge_control_end_threshold);
> +	if (err)
> +		device_remove_file(&battery->dev, &dev_attr_charge_control_start_threshold);
> +
> +	return err;
>  }
>  
>  static int huawei_wmi_battery_remove(struct power_supply *battery)

