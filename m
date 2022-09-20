Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4815AC6FA82
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Sep 2022 20:08:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbiITUIs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Sep 2022 16:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbiITUIq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Sep 2022 16:08:46 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D072361D40
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Sep 2022 13:08:45 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l8so2947115wmi.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Sep 2022 13:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=UD8k0mQ5NpkaKNinDClx9j6el0r7CVPHHHta9WMZUNY=;
        b=M2pGRnVrzVLetQVLdTGOLZCPVpqysVCpKjsWh341XWHKC6OmIQ1wmcZnjlW9X3xhZk
         XP8QT5TfsTx03dfZA6jKU6CCd9S0bAvoOUBkKZ+HPJE551Fgn7TsD8EU6V+NrmVduQTz
         lhDHFlseorZRQFKvE6xWl/OzhxtMvCCdJPAl7FVZXddmivnvflzMSXs2u2VwhLRutJMj
         SQeLsLRTYfh7OP0IlTDJqEWHBBA4td1bCpxE57hf2KYdjEH2sWqkCxbMSt1CIub091Kh
         7QvZj1z0ipo1NGF7GrIpOIkLtsGx7xt2BA+0kcrQ46LYT3JRCmcvbVZRaHziP5xSrnMX
         fzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=UD8k0mQ5NpkaKNinDClx9j6el0r7CVPHHHta9WMZUNY=;
        b=cxmm+kPA43QtmONHR7/nhfhdk9lWAVELg83x007okJaiaF5+90PBffHkl6hGiv9aaE
         VAjJZnUODlZKJpSQuqG2uB1yVQH3hV13Ws7i2uIkamUNBu3dVGHpg11kfLoYVFH4xvNv
         6yuJ2T4FUdQ2Ro6GE/kDNA2cdjsTVHqIdDCMFCyBZBNe/TLrKr+OzFeEdph77romjR/u
         fafr4MlHFi0/I+DX9EyBupPm6jWtcrX3LNqMrxAPL6CVjt/P8mAcxdFruKCLnRx1uPFF
         JCdOt2/B6Ww+Y9W2fJ+F7kEhvF722zMPv3wQOeiifwlJ7UEzZZv2B7FWo6wxduDeRGOa
         9Jng==
X-Gm-Message-State: ACrzQf0bUxb+hyPku7BcebGD6Necein7l2sObskUoIHb0Qe5s/ZZ2m/S
        PD6kLwPS/D1762vTyRgdEv2V3AHtKWk=
X-Google-Smtp-Source: AMsMyM4gcN5QgzLR6UZErEhvOVmd40hzG2KzfgMPw+NF+N4171iUMtiNJnw03wbMJbEjjRwNih7GSA==
X-Received: by 2002:a05:600c:20b:b0:3b4:86ff:ce with SMTP id 11-20020a05600c020b00b003b486ff00cemr3531396wmi.179.1663704524299;
        Tue, 20 Sep 2022 13:08:44 -0700 (PDT)
Received: from [192.168.0.30] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k13-20020a05600c1c8d00b003b476cabf1csm658773wms.26.2022.09.20.13.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 13:08:43 -0700 (PDT)
Message-ID: <86e9a6a2-a6b7-4079-61e6-7683332ff7f3@gmail.com>
Date:   Tue, 20 Sep 2022 21:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] platform/x86: int3472/discrete: Drop a forward
 declaration
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
References: <20220920070101.907596-1-u.kleine-koenig@pengutronix.de>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <20220920070101.907596-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Uwe

On 20/09/2022 08:01, Uwe Kleine-König wrote:
> By swapping the definition of skl_int3472_discrete_remove() and
> skl_int3472_discrete_probe() the forward declaration of the former can
> be dropped. This is a good thing as it removes code duplication.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>


Ah thanks - not sure why I ever did it that way now that you point it out :)


Reviewed-by: Daniel Scally <djrscally@gmail.com>

> ---
> Hello,
>
> I didn't check in detail, but in my experience calling the remove
> function in the error path of the probe function is prone to cleanup
> errors. I didn't spot anything after a quick glance, but let me point
> out this is unstable. E.g. in an error path of
> skl_int3472_register_clock() the function is left with
> int3472->clock.clk pointing to an unregistered clk and int3472->clock.cl
> == NULL. Someone modifying the return function must be well aware of
> that.
>
> Best regards
> Uwe


I take your point - I have to revisit this driver shortly anyway, so 
I'll try to remember to revise that away. Thanks

>
>   drivers/platform/x86/intel/int3472/discrete.c | 34 +++++++++----------
>   1 file changed, 16 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index ed4c9d760757..974a132db651 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -331,7 +331,22 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
>   	return 0;
>   }
>   
> -static int skl_int3472_discrete_remove(struct platform_device *pdev);
> +static int skl_int3472_discrete_remove(struct platform_device *pdev)
> +{
> +	struct int3472_discrete_device *int3472 = platform_get_drvdata(pdev);
> +
> +	gpiod_remove_lookup_table(&int3472->gpios);
> +
> +	if (int3472->clock.cl)
> +		skl_int3472_unregister_clock(int3472);
> +
> +	gpiod_put(int3472->clock.ena_gpio);
> +	gpiod_put(int3472->clock.led_gpio);
> +
> +	skl_int3472_unregister_regulator(int3472);
> +
> +	return 0;
> +}
>   
>   static int skl_int3472_discrete_probe(struct platform_device *pdev)
>   {
> @@ -383,23 +398,6 @@ static int skl_int3472_discrete_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int skl_int3472_discrete_remove(struct platform_device *pdev)
> -{
> -	struct int3472_discrete_device *int3472 = platform_get_drvdata(pdev);
> -
> -	gpiod_remove_lookup_table(&int3472->gpios);
> -
> -	if (int3472->clock.cl)
> -		skl_int3472_unregister_clock(int3472);
> -
> -	gpiod_put(int3472->clock.ena_gpio);
> -	gpiod_put(int3472->clock.led_gpio);
> -
> -	skl_int3472_unregister_regulator(int3472);
> -
> -	return 0;
> -}
> -
>   static const struct acpi_device_id int3472_device_id[] = {
>   	{ "INT3472", 0 },
>   	{ }
>
> base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
