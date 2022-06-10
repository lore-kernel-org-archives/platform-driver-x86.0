Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A84FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Jun 2022 18:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347158AbiFJSs1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Jun 2022 14:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350421AbiFJSsZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jun 2022 14:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E442B13D40
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 11:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654886904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2kuLRtRoKUifo/tKfS7LdiA/ElsrLzJlIXXi0O8EF0U=;
        b=a+a/GDlYy2ZU2G+z32ixAH4q3lg1fZweTBSjmBFgjHM0/4cXOSKFocItTUdYZcep9uZon1
        7vQo4zMjN532NcYjB5Tlvf6pUP3xR0nEO3WNGaln+IqgDQT8WD3ucvWkFkOr9sE6ed4Uxr
        hRmS2WsS7z1iTY2+5AT2BdpQz88JmAk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-8Qtm7qgHP4uExtDsg9StLw-1; Fri, 10 Jun 2022 14:48:22 -0400
X-MC-Unique: 8Qtm7qgHP4uExtDsg9StLw-1
Received: by mail-ej1-f70.google.com with SMTP id lv2-20020a170906bc8200b0070e0d6bcec0so9982402ejb.6
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 11:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2kuLRtRoKUifo/tKfS7LdiA/ElsrLzJlIXXi0O8EF0U=;
        b=fAdRw6iE10t6R8Us3QuPz+5MDBk/1Gor0cGB5LvOR32+XN5wWsYbTpRYUaLJWTqDxC
         OHRM8fxhdPHEStRC0WJ4NUqQGg6V55HsOx3jiXnqMu2PWFH1gwmj317z8R5CsxsmXXC4
         3XYlQbyPCrUShs/cwrLX1B50wNs4OoQRw3yhF/aa0peUJNZBIxHeGrjusNup/ZE0AUL+
         L/XQp4tjCiw22oXqnlFhGss5iDbDZHRNab2SDZ7yHzeCMjIebJOXc8wHxDZU8/ySnEWT
         dbr+99QwyimEbnNgh6j6UhTWhVMVEVxAvCGiQMTuW8JiemjoTspGNL99dIwBwYSc7fsc
         hb5w==
X-Gm-Message-State: AOAM530s5EydLTepq+W7Ww7yhiSr+REi44e1VLtdNrKrGjYuz1XmXskM
        IoImtGgJiYnz19M3DZ3i7Phr/byFXxr44wiZKcvkYhADfzBHEvinUbIodi+a376Ts/ujhBu6jLc
        /wSdE87mZ6FKvcNW7ET7JYVUwjLeLhellug==
X-Received: by 2002:a17:906:414f:b0:711:ce99:69ec with SMTP id l15-20020a170906414f00b00711ce9969ecmr25093234ejk.724.1654886900344;
        Fri, 10 Jun 2022 11:48:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqEM5tPbFuvpNe/haxDXhAPPziWrdTs8l89PJk48KAGAYo4y++uBvXFWfvBsk2LG4uj5ozZA==
X-Received: by 2002:a17:906:414f:b0:711:ce99:69ec with SMTP id l15-20020a170906414f00b00711ce9969ecmr25093220ejk.724.1654886900122;
        Fri, 10 Jun 2022 11:48:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id ga33-20020a1709070c2100b0070a50832376sm11716543ejc.154.2022.06.10.11.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 11:48:19 -0700 (PDT)
Message-ID: <25e78a1e-6ec2-845c-61b6-ec3f0d6766de@redhat.com>
Date:   Fri, 10 Jun 2022 20:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: Add check for
 platform_driver_register
Content-Language: en-US
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        santoshkumar.yadav@barco.com, peter.korsgaard@barco.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220526090345.1444172-1-jiasheng@iscas.ac.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220526090345.1444172-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/26/22 11:03, Jiasheng Jiang wrote:
> As platform_driver_register() could fail, it should be better
> to deal with the return value in order to maintain the code
> consisitency.
> 
> Fixes: 86af1d02d458 ("platform/x86: Support for EC-connected GPIOs for identify LED/button on Barco P50 board")
> 
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

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
>  drivers/platform/x86/barco-p50-gpio.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
> index 05534287bc26..8dd672339485 100644
> --- a/drivers/platform/x86/barco-p50-gpio.c
> +++ b/drivers/platform/x86/barco-p50-gpio.c
> @@ -405,11 +405,14 @@ MODULE_DEVICE_TABLE(dmi, dmi_ids);
>  static int __init p50_module_init(void)
>  {
>  	struct resource res = DEFINE_RES_IO(P50_GPIO_IO_PORT_BASE, P50_PORT_CMD + 1);
> +	int ret;
>  
>  	if (!dmi_first_match(dmi_ids))
>  		return -ENODEV;
>  
> -	platform_driver_register(&p50_gpio_driver);
> +	ret = platform_driver_register(&p50_gpio_driver);
> +	if (ret)
> +		return ret;
>  
>  	gpio_pdev = platform_device_register_simple(DRIVER_NAME, PLATFORM_DEVID_NONE, &res, 1);
>  	if (IS_ERR(gpio_pdev)) {

