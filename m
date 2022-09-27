Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6890C54EE9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Sep 2022 13:12:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbiI0NMA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbiI0NLp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 09:11:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A321893A2
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 06:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664284296;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dmr66zewbsconN/H0CCB6TmyxMe3cjviByPKyA7o+Oo=;
        b=C9mHjkrni1060nSFl7x+Nrd+nj7klOa5AjK6GjNCp8wtrDWzs1YAKP0srkflVFPcVOJTws
        lCdldYRgp5NzICvYZuct3ESwzIHqEiJ4Xm0D3A1o07tssFAswJyszBoxzrwfac6447vXdu
        jlowe+J43ybsS4TdQU7pcURPmqK2YFs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-371-WHqZp4PuNLe5FS79NeMSnw-1; Tue, 27 Sep 2022 09:11:34 -0400
X-MC-Unique: WHqZp4PuNLe5FS79NeMSnw-1
Received: by mail-ej1-f72.google.com with SMTP id dt13-20020a170907728d00b007825956d979so3843279ejc.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 06:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dmr66zewbsconN/H0CCB6TmyxMe3cjviByPKyA7o+Oo=;
        b=NuMgA2RDNAGlB+FGHiIvZwIupyC5hgRTNWv2/sVguP07FN0mvkhiruG20XJcn6tc1C
         OBBxHIrpLs1/4c/ElJfWvNPi4PCclh/hWacNW9z9frnax0fioTqSvOlBGuk9urUg+pIz
         gFpujkHemT4HYJ/CcyXQswtEGMdE7Ni4Szj/TUm9zeomKmVY0hRHZAJjDRsoShshEPk8
         IBnb9r66DMZ39Q2ssbEas950Kj3dn38ovluFa0JaGxDTqLBOmdG1wIh1C2vS+Ot5AGXk
         cYxkpSqJ2fxLYd5KdPIuL51xub99iWH7HDTlUtiEWxbnSWquJUk/N6GxHHVFHRKjWA2G
         +aAQ==
X-Gm-Message-State: ACrzQf15+QqVQ0Fj2fjjAzNetpKRXi9XN3BT/QJJgHXe+6DtVPl/hrys
        QNU/8YjkXyrdkeYwC6tGeVdo+JJv1I+sP1BjkAwbKSjB9YJcyaF+HvL2YI0TB2oWvypeJ76MNLA
        /Ic5zu6RlGWhM6pgcdPkbbeoIwnMRZowAkw==
X-Received: by 2002:a17:906:8442:b0:77c:6b3d:bec2 with SMTP id e2-20020a170906844200b0077c6b3dbec2mr22637583ejy.224.1664284293557;
        Tue, 27 Sep 2022 06:11:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72D5NDJCKj5KM+50HeYHeSmWXcsGYFEJkQAESvwUR8ZBQsfKR1JWbp3vXv0Y/7itDcJKDXRg==
X-Received: by 2002:a17:906:8442:b0:77c:6b3d:bec2 with SMTP id e2-20020a170906844200b0077c6b3dbec2mr22637570ejy.224.1664284293348;
        Tue, 27 Sep 2022 06:11:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id e11-20020a170906080b00b0073c8d4c9f38sm815010ejd.177.2022.09.27.06.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 06:11:32 -0700 (PDT)
Message-ID: <fce0e69b-97c9-174c-b9d2-6812a5fa56e9@redhat.com>
Date:   Tue, 27 Sep 2022 15:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] platform/x86: compal-laptop: Get rid of a few forward
 declarations
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
References: <20220923094759.87804-1-u.kleine-koenig@pengutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220923094759.87804-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/23/22 11:47, Uwe Kleine-König wrote:
> Declarations for static symbols are useless repetition (unless there are
> cyclic dependencies).
> 
> By changing the order of a few symbols two forward declarations can be
> dropped.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

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
>  drivers/platform/x86/compal-laptop.c | 151 +++++++++++++--------------
>  1 file changed, 74 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
> index 0942f50bd793..72e1523edd31 100644
> --- a/drivers/platform/x86/compal-laptop.c
> +++ b/drivers/platform/x86/compal-laptop.c
> @@ -721,16 +721,6 @@ static struct attribute *compal_hwmon_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(compal_hwmon);
>  
> -static int compal_probe(struct platform_device *);
> -static int compal_remove(struct platform_device *);
> -static struct platform_driver compal_driver = {
> -	.driver = {
> -		.name = DRIVER_NAME,
> -	},
> -	.probe	= compal_probe,
> -	.remove	= compal_remove,
> -};
> -
>  static enum power_supply_property compal_bat_properties[] = {
>  	POWER_SUPPLY_PROP_STATUS,
>  	POWER_SUPPLY_PROP_HEALTH,
> @@ -965,6 +955,80 @@ static int setup_rfkill(void)
>  	return ret;
>  }
>  
> +static int compal_probe(struct platform_device *pdev)
> +{
> +	int err;
> +	struct compal_data *data;
> +	struct device *hwmon_dev;
> +	struct power_supply_config psy_cfg = {};
> +
> +	if (!extra_features)
> +		return 0;
> +
> +	/* Fan control */
> +	data = devm_kzalloc(&pdev->dev, sizeof(struct compal_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	initialize_fan_control_data(data);
> +
> +	err = sysfs_create_group(&pdev->dev.kobj, &compal_platform_attr_group);
> +	if (err)
> +		return err;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
> +							   "compal", data,
> +							   compal_hwmon_groups);
> +	if (IS_ERR(hwmon_dev)) {
> +		err = PTR_ERR(hwmon_dev);
> +		goto remove;
> +	}
> +
> +	/* Power supply */
> +	initialize_power_supply_data(data);
> +	psy_cfg.drv_data = data;
> +	data->psy = power_supply_register(&compal_device->dev, &psy_bat_desc,
> +					  &psy_cfg);
> +	if (IS_ERR(data->psy)) {
> +		err = PTR_ERR(data->psy);
> +		goto remove;
> +	}
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	return 0;
> +
> +remove:
> +	sysfs_remove_group(&pdev->dev.kobj, &compal_platform_attr_group);
> +	return err;
> +}
> +
> +static int compal_remove(struct platform_device *pdev)
> +{
> +	struct compal_data *data;
> +
> +	if (!extra_features)
> +		return 0;
> +
> +	pr_info("Unloading: resetting fan control to motherboard\n");
> +	pwm_disable_control();
> +
> +	data = platform_get_drvdata(pdev);
> +	power_supply_unregister(data->psy);
> +
> +	sysfs_remove_group(&pdev->dev.kobj, &compal_platform_attr_group);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver compal_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +	},
> +	.probe	= compal_probe,
> +	.remove	= compal_remove,
> +};
> +
>  static int __init compal_init(void)
>  {
>  	int ret;
> @@ -1028,54 +1092,6 @@ static int __init compal_init(void)
>  	return ret;
>  }
>  
> -static int compal_probe(struct platform_device *pdev)
> -{
> -	int err;
> -	struct compal_data *data;
> -	struct device *hwmon_dev;
> -	struct power_supply_config psy_cfg = {};
> -
> -	if (!extra_features)
> -		return 0;
> -
> -	/* Fan control */
> -	data = devm_kzalloc(&pdev->dev, sizeof(struct compal_data), GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> -
> -	initialize_fan_control_data(data);
> -
> -	err = sysfs_create_group(&pdev->dev.kobj, &compal_platform_attr_group);
> -	if (err)
> -		return err;
> -
> -	hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
> -							   "compal", data,
> -							   compal_hwmon_groups);
> -	if (IS_ERR(hwmon_dev)) {
> -		err = PTR_ERR(hwmon_dev);
> -		goto remove;
> -	}
> -
> -	/* Power supply */
> -	initialize_power_supply_data(data);
> -	psy_cfg.drv_data = data;
> -	data->psy = power_supply_register(&compal_device->dev, &psy_bat_desc,
> -					  &psy_cfg);
> -	if (IS_ERR(data->psy)) {
> -		err = PTR_ERR(data->psy);
> -		goto remove;
> -	}
> -
> -	platform_set_drvdata(pdev, data);
> -
> -	return 0;
> -
> -remove:
> -	sysfs_remove_group(&pdev->dev.kobj, &compal_platform_attr_group);
> -	return err;
> -}
> -
>  static void __exit compal_cleanup(void)
>  {
>  	platform_device_unregister(compal_device);
> @@ -1089,25 +1105,6 @@ static void __exit compal_cleanup(void)
>  	pr_info("Driver unloaded\n");
>  }
>  
> -static int compal_remove(struct platform_device *pdev)
> -{
> -	struct compal_data *data;
> -
> -	if (!extra_features)
> -		return 0;
> -
> -	pr_info("Unloading: resetting fan control to motherboard\n");
> -	pwm_disable_control();
> -
> -	data = platform_get_drvdata(pdev);
> -	power_supply_unregister(data->psy);
> -
> -	sysfs_remove_group(&pdev->dev.kobj, &compal_platform_attr_group);
> -
> -	return 0;
> -}
> -
> -
>  module_init(compal_init);
>  module_exit(compal_cleanup);
>  
> 
> base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868

