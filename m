Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB44C433DB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 15:31:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4731E61984
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 15:31:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbhCWPbH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Mar 2021 11:31:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28666 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232856AbhCWPan (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Mar 2021 11:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616513442;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mI4j93acBJMaU92luMwJ8A/vW8tMhXdBZehGGarChYg=;
        b=VaRr5gD4cM57Emptgbc7BQhaENMZDK+kzZ3om2KB5RBz98I0WfJk+qaPqaE/B9Axq7MJHo
        7Kuki4DxHrr6MhdsLLl5JWXurmfynOgtpxIkOQJxl7Dgoyx8ZZIjh6kPKJ5upmvHD9ZTsx
        aFCXxpeiEHNUGFSaNcIVVMHoZZ8MiUs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-SFdGug_-NKqnsNt2YeBOEQ-1; Tue, 23 Mar 2021 11:30:41 -0400
X-MC-Unique: SFdGug_-NKqnsNt2YeBOEQ-1
Received: by mail-ej1-f72.google.com with SMTP id jo6so1223694ejb.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Mar 2021 08:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mI4j93acBJMaU92luMwJ8A/vW8tMhXdBZehGGarChYg=;
        b=GL2Id54qKlHEo8JbOGrMESzr5snAgES2BkYihshSLOBvPhKGM9/kqkN15xCEky8+57
         Yus7h2TV0njwYN+O8ZWXLejn7ZFutb802sEXQeicvOROioIl5v6MfkvD4PqlGJm9WuRf
         Rj1VizcEAgbqN4nfzmBhMbLOh1cJWH3HdWHwhxrOeLGtImKmaWyH11vPHof47+JiNHyD
         CncpuM1KXoxeGl7GxpksRmd75JK4TQwJYnsjfbIXPtWuQuUj3dZK+TebcBNd2KTvDJlE
         5jrkcuKYb5b6udwJWQ3zoQz2E6v8VXrzS27VEMy2dFEInIAs1awSNKMkC8bG3jltpWAh
         0S+A==
X-Gm-Message-State: AOAM531RFv6TQejb9uHH9kZhBvV0KTXtCJEQHNz7X5h6md4wHKRg1cH6
        SBWcOSdrVcmaXm8u1B3CqKolqeq3r8C5QWPHaE3n3316kcqANaXcvYspXU6kx9Ht+EeWd9ob/5s
        Rka9TJdYB11TUlt+xJHQZPnEgMyR7rQfKfQKK8HWd/mZh+8PFJ3WOkPj27GKEmtTcoKBBWWKfbk
        utikGwkkeTfQ==
X-Received: by 2002:a17:906:6817:: with SMTP id k23mr5384342ejr.6.1616513439616;
        Tue, 23 Mar 2021 08:30:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLTd3xGEvqnp8NukP1Ys+6tcbX8ilsbm1CDNkpaQntGtKzFSRPpY87fLUqnUTbo8U/LYL87g==
X-Received: by 2002:a17:906:6817:: with SMTP id k23mr5384324ejr.6.1616513439441;
        Tue, 23 Mar 2021 08:30:39 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q20sm11251156ejs.41.2021.03.23.08.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 08:30:38 -0700 (PDT)
Subject: Re: [PATCH v3 5/8] platform/x86: gpd pocket fan: Clean-up by using
 managed work init
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <cover.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
 <aa25a6781ba016772b045cd6e630da8c559a665d.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3109f58a-91e4-09bd-d953-f43a4242c194@redhat.com>
Date:   Tue, 23 Mar 2021 16:30:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <aa25a6781ba016772b045cd6e630da8c559a665d.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

HI,

On 3/23/21 2:57 PM, Matti Vaittinen wrote:
> Few drivers implement remove call-back only for ensuring a delayed
> work gets cancelled prior driver removal. Clean-up these by switching
> to use devm_delayed_work_autocancel() instead.
> 
> This change is compile-tested only. All testing is appreciated.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
> Changelog from RFCv2:
>  - RFC dropped. No functional changes.
> 
>  drivers/platform/x86/gpd-pocket-fan.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
> index 5b516e4c2bfb..7a20f68ae206 100644
> --- a/drivers/platform/x86/gpd-pocket-fan.c
> +++ b/drivers/platform/x86/gpd-pocket-fan.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
> @@ -124,7 +125,7 @@ static void gpd_pocket_fan_force_update(struct gpd_pocket_fan_data *fan)
>  static int gpd_pocket_fan_probe(struct platform_device *pdev)
>  {
>  	struct gpd_pocket_fan_data *fan;
> -	int i;
> +	int i, ret;
>  
>  	for (i = 0; i < ARRAY_SIZE(temp_limits); i++) {
>  		if (temp_limits[i] < 20000 || temp_limits[i] > 90000) {
> @@ -152,7 +153,10 @@ static int gpd_pocket_fan_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	fan->dev = &pdev->dev;
> -	INIT_DELAYED_WORK(&fan->work, gpd_pocket_fan_worker);
> +	ret = devm_delayed_work_autocancel(&pdev->dev, &fan->work,
> +					   gpd_pocket_fan_worker);
> +	if (ret)
> +		return ret;
>  
>  	/* Note this returns a "weak" reference which we don't need to free */
>  	fan->dts0 = thermal_zone_get_zone_by_name("soc_dts0");
> @@ -177,14 +181,6 @@ static int gpd_pocket_fan_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int gpd_pocket_fan_remove(struct platform_device *pdev)
> -{
> -	struct gpd_pocket_fan_data *fan = platform_get_drvdata(pdev);
> -
> -	cancel_delayed_work_sync(&fan->work);
> -	return 0;
> -}
> -
>  #ifdef CONFIG_PM_SLEEP
>  static int gpd_pocket_fan_suspend(struct device *dev)
>  {
> @@ -215,7 +211,6 @@ MODULE_DEVICE_TABLE(acpi, gpd_pocket_fan_acpi_match);
>  
>  static struct platform_driver gpd_pocket_fan_driver = {
>  	.probe	= gpd_pocket_fan_probe,
> -	.remove	= gpd_pocket_fan_remove,
>  	.driver	= {
>  		.name			= "gpd_pocket_fan",
>  		.acpi_match_table	= gpd_pocket_fan_acpi_match,
> 

