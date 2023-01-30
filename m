Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF03C54EED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 13:33:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjA3Ndz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 08:33:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbjA3Ndy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 08:33:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2983B2A99E
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 05:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675085589;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tVG9YiScxOy/qQiZU4YwjgvyaJXb9ttCZgSJdq7g1F8=;
        b=QSRg6A/GPNm4/kbw9r5sHI0vUI2TuqKyqgXUjD/A7QIwVbztXzBt2iTqOplv6LFW3W8fsL
        GlmjuF27z/eYK7ErwsrN4p1A2KaL73WXNz0YoPmS2jTgv+JxSVC2lfRBruWEX8h+bnwYZ4
        AroHzqY4Bvt8f7FM2UrGvhuvb192NeE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-TepaPLgVNK6cTvYOdzcOTA-1; Mon, 30 Jan 2023 08:33:08 -0500
X-MC-Unique: TepaPLgVNK6cTvYOdzcOTA-1
Received: by mail-ej1-f72.google.com with SMTP id sa8-20020a170906eda800b0087875c99e6bso6734258ejb.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 05:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tVG9YiScxOy/qQiZU4YwjgvyaJXb9ttCZgSJdq7g1F8=;
        b=YRLlGhnE40mqhBzVrdPUm2Gx84USWXBSaBG8eLWD/l8X7qqGkGuQ9dLvVet+mO0WZm
         d5mVxXX11ML+YohmMY7qpPZtRWb+hBUwA94Op6Jr/XGF20wu1RP9tfNc3ANM/ygsMvSZ
         wbM96Wg83Ey7KM3t0ncjirN9tUrAr4NeySjpgKWdHtkLa2qE9bq8TPlSNcWTAQ63RoXw
         rZAF86uHpiOFi42kBitXV82odLtsZFXRAVTPS/bdizTRviWRjuITMg+vI3aepy1spu4a
         OxGlJ0HO627CHYQ6EII4CDbQLCrNEoc3qau2OMExg3OR3vgQ2KFI6yZqLBamVCJwdKju
         xOIw==
X-Gm-Message-State: AO0yUKUo0v56kjm2e1dCsNIbmKKN5J0cbYKfkRJeQEpdqk2CpTr8fpzs
        g+/P9pJyIksKXmha4hOZTCqucDszcslbTbwMmmX06Ay5h498/g2NWyuLxs8TG9q0Ty60USlDODr
        CH0ZXnVK6+A61XXkMHpfBVwRXZBJcBFbx5g==
X-Received: by 2002:a17:906:84d:b0:889:1480:d908 with SMTP id f13-20020a170906084d00b008891480d908mr3236860ejd.17.1675085586964;
        Mon, 30 Jan 2023 05:33:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9VAD+mEk4CBfOJosxc8/nwOL441j8Z0bs8bI4Xfqcw82WgG2qd3a1LlTKToA7rQICz3UjjKw==
X-Received: by 2002:a17:906:84d:b0:889:1480:d908 with SMTP id f13-20020a170906084d00b008891480d908mr3236850ejd.17.1675085586791;
        Mon, 30 Jan 2023 05:33:06 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id c12-20020a170906340c00b0088aadc18b69sm525861ejb.101.2023.01.30.05.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 05:33:06 -0800 (PST)
Message-ID: <de5f8e3f-f406-7f9f-3112-cf73b42e9dba@redhat.com>
Date:   Mon, 30 Jan 2023 14:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 6/6] platform/x86/amd/pmf: Ensure mutexes are initialized
 before use
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        platform-driver-x86@vger.kernel.org
References: <20230130132554.696025-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230130132554.696025-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

The subject prefix should be [PATCH 1/1], my bad.

On 1/30/23 14:25, Hans de Goede wrote:
> As soon as the first handler or sysfs file is registered
> the mutex may get used.
> 
> Move the initialization to before any handler registration /
> sysfs file creation.
> 
> Likewise move the destruction of the mutex to after all
> the de-initialization is done.
> 
> Fixes: da5ce22df5fe ("platform/x86/amd/pmf: Add support for PMF core layer")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've applied this to the pdx86 fixes branch now:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

and this will be included in my next fixes pull-req to Linus.

Regards,

Hans



> ---
>  drivers/platform/x86/amd/pmf/core.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index c9f7bcef4ac8..da23639071d7 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -385,6 +385,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	if (!dev->regbase)
>  		return -ENOMEM;
>  
> +	mutex_init(&dev->lock);
> +	mutex_init(&dev->update_mutex);
> +
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmf_init_features(dev);
> @@ -394,8 +397,6 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
>  	power_supply_reg_notifier(&dev->pwr_src_notifier);
>  
> -	mutex_init(&dev->lock);
> -	mutex_init(&dev->update_mutex);
>  	dev_info(dev->dev, "registered PMF device successfully\n");
>  
>  	return 0;
> @@ -406,11 +407,11 @@ static int amd_pmf_remove(struct platform_device *pdev)
>  	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
>  
>  	power_supply_unreg_notifier(&dev->pwr_src_notifier);
> -	mutex_destroy(&dev->lock);
> -	mutex_destroy(&dev->update_mutex);
>  	amd_pmf_deinit_features(dev);
>  	apmf_acpi_deinit(dev);
>  	amd_pmf_dbgfs_unregister(dev);
> +	mutex_destroy(&dev->lock);
> +	mutex_destroy(&dev->update_mutex);
>  	kfree(dev->buf);
>  	return 0;
>  }

