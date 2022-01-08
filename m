Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B1AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  8 Jan 2022 15:58:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiAHP62 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 8 Jan 2022 10:58:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56213 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229521AbiAHP62 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 8 Jan 2022 10:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641657508;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5EjZCDBduRxxst5J8s6bnwtY//WLS1P1xb/JxpybY8k=;
        b=fGGXH4KEN/TTe+F+pXbuAMXZlGi29CCqrS2VjjbzWsR9ykEkaU2w2wjN7gAAf0r5x9slW+
        +YJG1xHdQWggmCsBQxJTi/lOrZSM2bH5MXKW/TxeJqqkGqMhrFXa5Crs+nSn+peXGX+73U
        R6zSr5pUesCUxs7Mz2qLbmjBZL0SHzo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-TmQ4zkIkMl25DEHpBhTrTw-1; Sat, 08 Jan 2022 10:58:26 -0500
X-MC-Unique: TmQ4zkIkMl25DEHpBhTrTw-1
Received: by mail-ed1-f70.google.com with SMTP id m8-20020a056402510800b003f9d22c4d48so6929314edd.21
        for <platform-driver-x86@vger.kernel.org>; Sat, 08 Jan 2022 07:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5EjZCDBduRxxst5J8s6bnwtY//WLS1P1xb/JxpybY8k=;
        b=THGHurJHI/gKwL8sOzgv8/xhtIRwCSL+0RqIV3cjYg3qcrzH3p0fFn02DqfiH+zc9f
         QlmLYTx7tl280KgX1N2j0mSnSbuS+Fycwor6hynnRR2DWhB/AtLHfUSphj2Obz/bsVZC
         3mXvzebPwA7tv7LMN2S+XdAVZN8UGf6HW7dpsM0meNeioJeUqhpC7180aAv17f1M/spo
         cb54YHyi1YVKC6/HjYCC5Y5bUDZZmNTNH2IrijwZPfXGyMEyomfRXr/cNt/n+jsBk5kS
         /AfZSD5iq85jae80h7ALAy9+MIcDlZHB6gvKooCl6AGAQOdIzsc2Ghff7r/xI4HzrklR
         8sKA==
X-Gm-Message-State: AOAM5339RGwbjY4n8allzdMPm38UyE0X14kFXK9PIEEJvk2T0++PFMRj
        uF1aXNDlJoEUNv8+Se16QY86wB7SBAmYhfasOCzvHQu34W0BgwlXPiFfGsZYfhA9+umkjjehCcU
        uOIhy+T66+souZQX5nBFpdnYwu2TjymATWg==
X-Received: by 2002:aa7:d411:: with SMTP id z17mr66124134edq.214.1641657505452;
        Sat, 08 Jan 2022 07:58:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyKejDwZ25SXOgzrbDPnmZb/hE2f/oF9iyl3u74URVJjFWs2Z2EAJPI1Bl878ftdhmJeEy6Q==
X-Received: by 2002:aa7:d411:: with SMTP id z17mr66124125edq.214.1641657505288;
        Sat, 08 Jan 2022 07:58:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id t20sm857616edv.81.2022.01.08.07.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jan 2022 07:58:25 -0800 (PST)
Message-ID: <4e15b971-0a97-af6d-0a1d-d76b696697e1@redhat.com>
Date:   Sat, 8 Jan 2022 16:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Fix GPIO lookup leak
 on error-exit
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220108154947.136593-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220108154947.136593-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/8/22 16:49, Hans de Goede wrote:
> Fix leaking the registered gpiod_lookup tables when the kcalloc() for the
> i2c_clients array fails.
> 
> Fixes: ef2ac11493e2 ("platform/x86: x86-android-tablets: Add support for registering GPIO lookup tables")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/x86-android-tablets.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
> index d39da5fca6c5..3ba63ad91b28 100644
> --- a/drivers/platform/x86/x86-android-tablets.c
> +++ b/drivers/platform/x86/x86-android-tablets.c
> @@ -815,8 +815,10 @@ static __init int x86_android_tablet_init(void)
>  		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
>  
>  	i2c_clients = kcalloc(dev_info->i2c_client_count, sizeof(*i2c_clients), GFP_KERNEL);
> -	if (!i2c_clients)
> +	if (!i2c_clients) {
> +		x86_android_tablet_cleanup();
>  		return -ENOMEM;
> +	}
>  
>  	i2c_client_count = dev_info->i2c_client_count;
>  	for (i = 0; i < i2c_client_count; i++) {
> 

