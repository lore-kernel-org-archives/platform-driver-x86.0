Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EB8C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Dec 2022 15:36:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiLHPgA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Dec 2022 10:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbiLHPfo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Dec 2022 10:35:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB457E41C
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Dec 2022 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670513569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ch+bMl5xfA9Hf3nS+/biOqToHC0qb1UdXSnrlmsi/Rc=;
        b=KDNA8rL0L6X1CZS5mPHrpBLaki1y65QbJi1fnbtxPsNXxtK5OKJpXrpPoB0iKX0xvO/E4t
        gNJpu/txD9YEe1iZnMnCBKfCT0fXpWGnVsKzHpWY96noxmceAjoFC2yloLyQpc6im53P5w
        yxDmhdV6h+NS0xz2q9D1G5RFUfeUdQc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-loF9p4NBPBOgr4BSVvBzTg-1; Thu, 08 Dec 2022 10:32:48 -0500
X-MC-Unique: loF9p4NBPBOgr4BSVvBzTg-1
Received: by mail-ej1-f71.google.com with SMTP id hq42-20020a1709073f2a00b007c100387d64so1385371ejc.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Dec 2022 07:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ch+bMl5xfA9Hf3nS+/biOqToHC0qb1UdXSnrlmsi/Rc=;
        b=DXIbzVme2aTUrJ7aVV3G/2yfvyCjASESEgznCDstoHi3+/P9EDrKqhFhvjQQnT5O97
         B9VeE3xXTc7grXBm8dHedDnSBN1UOy2A6CgtWZQIun0Q2pn7McFdTC9hsXK18qpTiYTZ
         PW9wXNPYJhrZLV0MqY4PVmqSp1p6ZZ460A6aQst+Ls0bIGwlXgH1hSCWorx+SqXuCv5m
         wzKpmO1EGCwjYZvEMxQqTBXTDjp1tliS7L7XUyHQ0q8ySx+HVdqaWczMOWeEEwbk8VV4
         EGBmky7wY6Ril+Nrw1gSnBqJfbUw1d+58LbgNPVg75PEQVQS8CGAzQTDgjfvAPtQrFcn
         /lAw==
X-Gm-Message-State: ANoB5pm0PE+sUSc9ggXIALkkWjQKL6ejFCul7zf82VeaH6HAL3aTqJoE
        Xge2NmulVLWPnccTLq/rCMTzo4pY5AINncHxCNaFBWfHjBfl5Bjj9tSOQ4AUkzO5pJg3JNYUQGB
        4PfVFBXy5rjXq7viFiyYmME9VhPet6SYWOA==
X-Received: by 2002:a05:6402:10c3:b0:462:9baa:e3b6 with SMTP id p3-20020a05640210c300b004629baae3b6mr2330563edu.29.1670513567379;
        Thu, 08 Dec 2022 07:32:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6P5yoOOuo2f0PZ+KC9fdSNgnGA/vUIF5+EZ/cxnnP+CruEtg/L+db1HtLIcam7aP48WyAgTQ==
X-Received: by 2002:a05:6402:10c3:b0:462:9baa:e3b6 with SMTP id p3-20020a05640210c300b004629baae3b6mr2330545edu.29.1670513567178;
        Thu, 08 Dec 2022 07:32:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b20-20020aa7dc14000000b00457b5ba968csm3480779edu.27.2022.12.08.07.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 07:32:46 -0800 (PST)
Message-ID: <87f62d40-9b2d-8a99-0758-cf2a482ef56d@redhat.com>
Date:   Thu, 8 Dec 2022 16:32:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] platform/x86: mxm-wmi: fix memleak in
 mxm_wmi_call_mx[ds|mx]()
Content-Language: en-US, nl
To:     Yu Liao <liaoyu15@huawei.com>, markgross@kernel.org
Cc:     airlied@redhat.com, mjg@redhat.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        liwei391@huawei.com
References: <20221129011101.2042315-1-liaoyu15@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221129011101.2042315-1-liaoyu15@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/29/22 02:11, Yu Liao wrote:
> The ACPI buffer memory (out.pointer) returned by wmi_evaluate_method()
> is not freed after the call, so it leads to memory leak.
> 
> The method results in ACPI buffer is not used, so just pass NULL to
> wmi_evaluate_method() which fixes the memory leak.
> 
> Fixes: 99b38b4acc0d ("platform/x86: add MXM WMI driver.")
> Signed-off-by: Yu Liao <liaoyu15@huawei.com>

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
>  drivers/platform/x86/mxm-wmi.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/mxm-wmi.c b/drivers/platform/x86/mxm-wmi.c
> index 9a19fbd2f734..9a457956025a 100644
> --- a/drivers/platform/x86/mxm-wmi.c
> +++ b/drivers/platform/x86/mxm-wmi.c
> @@ -35,13 +35,11 @@ int mxm_wmi_call_mxds(int adapter)
>  		.xarg = 1,
>  	};
>  	struct acpi_buffer input = { (acpi_size)sizeof(args), &args };
> -	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>  	acpi_status status;
>  
>  	printk("calling mux switch %d\n", adapter);
>  
> -	status = wmi_evaluate_method(MXM_WMMX_GUID, 0x0, adapter, &input,
> -				     &output);
> +	status = wmi_evaluate_method(MXM_WMMX_GUID, 0x0, adapter, &input, NULL);
>  
>  	if (ACPI_FAILURE(status))
>  		return status;
> @@ -60,13 +58,11 @@ int mxm_wmi_call_mxmx(int adapter)
>  		.xarg = 1,
>  	};
>  	struct acpi_buffer input = { (acpi_size)sizeof(args), &args };
> -	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>  	acpi_status status;
>  
>  	printk("calling mux switch %d\n", adapter);
>  
> -	status = wmi_evaluate_method(MXM_WMMX_GUID, 0x0, adapter, &input,
> -				     &output);
> +	status = wmi_evaluate_method(MXM_WMMX_GUID, 0x0, adapter, &input, NULL);
>  
>  	if (ACPI_FAILURE(status))
>  		return status;

