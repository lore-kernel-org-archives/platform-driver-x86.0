Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236F3C04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbiG1SoR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbiG1SoR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:44:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 02DE975385
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659033855;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RRZHe2jm74tCxTvXVy+d4PtoBrPT+spkcg+w1LWLnFw=;
        b=G7owC2d7mCMav0dR02zqQdZRzLcINZSx2ybFwDj1ZagIsLSjKiizVXWO/T/1fdMP6gwTBt
        4kxMbxmfOsdlQ9VqgIAxfbbISw1uIpBCoeDHcK3zMOg1VIBC68smi+u1gt8MTalP+L0mMb
        nIgXLYQ8flNJY4RJApiT+GXUO3Uq8Uw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-TtBICuM_OEifAENLFl91BA-1; Thu, 28 Jul 2022 14:44:13 -0400
X-MC-Unique: TtBICuM_OEifAENLFl91BA-1
Received: by mail-ed1-f72.google.com with SMTP id e6-20020a056402190600b0043bde36ab23so1624939edz.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RRZHe2jm74tCxTvXVy+d4PtoBrPT+spkcg+w1LWLnFw=;
        b=ewaGr0WM2dhARtECwFUF8MLCPtx3QthUkDfOJ3M3/4C19tB4ECogMqZ6l92iw9mqJ1
         e5rOOnn6EYM9FVjMIeiB/rtSEhb0pqhpZinGbpVTVkvGuAgRUVbQoDBH7nTaDIC7Ieid
         6GLZxdNZBM4C63JyK0083u+0Dq9R02Ub297bfqvz9uqrN0o/ee8p7fca6NnyHfhUWdgh
         NJJnJ60/xWmuc2SpkIuJJlU6mp+BVhNqd4SU2dGzC5xE4EbvTo4HtAbFyE0O77hTo7Dv
         /SFHPkTJWDKLQ7pHDp4rG7ACPNE598bVCTzpcY32VSRlQ9YdLsviV0JnrGrWrJvA/6Rk
         ZfSA==
X-Gm-Message-State: AJIora9R/2+yR05sknqAF125exO1b2rnNkT8tWuSbL01qkHWdTo22cD8
        qAQi5NV3QkXyqDs6i+f/ME5J8wHx50oMn5tDWhQ1c+J10c28r9dUN2sI+6CpKT3MqcA5JBPjc/h
        5Ch6LI+VH7KrqVq+nofdA+SRjBFL2yT0U+g==
X-Received: by 2002:a05:6402:2b88:b0:43a:6c58:6c64 with SMTP id fj8-20020a0564022b8800b0043a6c586c64mr295464edb.348.1659033852280;
        Thu, 28 Jul 2022 11:44:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s9RMVVKhW21uMO6PpbJ32c2rkAN7fB4QdYJEowZysKSO2NYlMp4rUXhlD2WJvp3pUUqsijCw==
X-Received: by 2002:a05:6402:2b88:b0:43a:6c58:6c64 with SMTP id fj8-20020a0564022b8800b0043a6c586c64mr295424edb.348.1659033851784;
        Thu, 28 Jul 2022 11:44:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id q3-20020a170906a08300b00706242d297fsm668692ejy.212.2022.07.28.11.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 11:44:11 -0700 (PDT)
Message-ID: <8ab8ccf5-22ed-dc68-4f83-fd6726b0ace5@redhat.com>
Date:   Thu, 28 Jul 2022 20:44:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH platform 1/1] platform/mellanox: mlxreg-lc: Fix error flow
 and extend verbosity
Content-Language: en-US
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220719153540.61304-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220719153540.61304-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/19/22 17:35, Vadim Pasternak wrote:
> Fix error flow:
> - Clean-up client object in case of probing failure.
> - Prevent running remove routine in case of probing failure.
>   Probing and removing are invoked by hotplug events raised upon line
>   card insertion and removing. If probing procedure failed all data is
>   cleared and there is nothing to do in remove routine.
> 
> Fixes: 62f9529b8d5c ("platform/mellanox: mlxreg-lc: Add initial support for Nvidia line card devices")
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

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
>  drivers/platform/mellanox/mlxreg-lc.c | 82 ++++++++++++++++++++-------
>  1 file changed, 63 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
> index c897a2f15840..55834ccb4ac7 100644
> --- a/drivers/platform/mellanox/mlxreg-lc.c
> +++ b/drivers/platform/mellanox/mlxreg-lc.c
> @@ -716,8 +716,12 @@ mlxreg_lc_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
>  	switch (regval) {
>  	case MLXREG_LC_SN4800_C16:
>  		err = mlxreg_lc_sn4800_c16_config_init(mlxreg_lc, regmap, data);
> -		if (err)
> +		if (err) {
> +			dev_err(dev, "Failed to config client %s at bus %d at addr 0x%02x\n",
> +				data->hpdev.brdinfo->type, data->hpdev.nr,
> +				data->hpdev.brdinfo->addr);
>  			return err;
> +		}
>  		break;
>  	default:
>  		return -ENODEV;
> @@ -730,8 +734,11 @@ mlxreg_lc_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
>  	mlxreg_lc->mux = platform_device_register_resndata(dev, "i2c-mux-mlxcpld", data->hpdev.nr,
>  							   NULL, 0, mlxreg_lc->mux_data,
>  							   sizeof(*mlxreg_lc->mux_data));
> -	if (IS_ERR(mlxreg_lc->mux))
> +	if (IS_ERR(mlxreg_lc->mux)) {
> +		dev_err(dev, "Failed to create mux infra for client %s at bus %d at addr 0x%02x\n",
> +			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
>  		return PTR_ERR(mlxreg_lc->mux);
> +	}
>  
>  	/* Register IO access driver. */
>  	if (mlxreg_lc->io_data) {
> @@ -740,6 +747,9 @@ mlxreg_lc_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
>  		platform_device_register_resndata(dev, "mlxreg-io", data->hpdev.nr, NULL, 0,
>  						  mlxreg_lc->io_data, sizeof(*mlxreg_lc->io_data));
>  		if (IS_ERR(mlxreg_lc->io_regs)) {
> +			dev_err(dev, "Failed to create regio for client %s at bus %d at addr 0x%02x\n",
> +				data->hpdev.brdinfo->type, data->hpdev.nr,
> +				data->hpdev.brdinfo->addr);
>  			err = PTR_ERR(mlxreg_lc->io_regs);
>  			goto fail_register_io;
>  		}
> @@ -753,6 +763,9 @@ mlxreg_lc_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
>  						  mlxreg_lc->led_data,
>  						  sizeof(*mlxreg_lc->led_data));
>  		if (IS_ERR(mlxreg_lc->led)) {
> +			dev_err(dev, "Failed to create LED objects for client %s at bus %d at addr 0x%02x\n",
> +				data->hpdev.brdinfo->type, data->hpdev.nr,
> +				data->hpdev.brdinfo->addr);
>  			err = PTR_ERR(mlxreg_lc->led);
>  			goto fail_register_led;
>  		}
> @@ -809,7 +822,8 @@ static int mlxreg_lc_probe(struct platform_device *pdev)
>  	if (!data->hpdev.adapter) {
>  		dev_err(&pdev->dev, "Failed to get adapter for bus %d\n",
>  			data->hpdev.nr);
> -		return -EFAULT;
> +		err = -EFAULT;
> +		goto i2c_get_adapter_fail;
>  	}
>  
>  	/* Create device at the top of line card I2C tree.*/
> @@ -818,32 +832,40 @@ static int mlxreg_lc_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->hpdev.client)) {
>  		dev_err(&pdev->dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
>  			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
> -
> -		i2c_put_adapter(data->hpdev.adapter);
> -		data->hpdev.adapter = NULL;
> -		return PTR_ERR(data->hpdev.client);
> +		err = PTR_ERR(data->hpdev.client);
> +		goto i2c_new_device_fail;
>  	}
>  
>  	regmap = devm_regmap_init_i2c(data->hpdev.client,
>  				      &mlxreg_lc_regmap_conf);
>  	if (IS_ERR(regmap)) {
> +		dev_err(&pdev->dev, "Failed to create regmap for client %s at bus %d at addr 0x%02x\n",
> +			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
>  		err = PTR_ERR(regmap);
> -		goto mlxreg_lc_probe_fail;
> +		goto devm_regmap_init_i2c_fail;
>  	}
>  
>  	/* Set default registers. */
>  	for (i = 0; i < mlxreg_lc_regmap_conf.num_reg_defaults; i++) {
>  		err = regmap_write(regmap, mlxreg_lc_regmap_default[i].reg,
>  				   mlxreg_lc_regmap_default[i].def);
> -		if (err)
> -			goto mlxreg_lc_probe_fail;
> +		if (err) {
> +			dev_err(&pdev->dev, "Failed to set default regmap %d for client %s at bus %d at addr 0x%02x\n",
> +				i, data->hpdev.brdinfo->type, data->hpdev.nr,
> +				data->hpdev.brdinfo->addr);
> +			goto regmap_write_fail;
> +		}
>  	}
>  
>  	/* Sync registers with hardware. */
>  	regcache_mark_dirty(regmap);
>  	err = regcache_sync(regmap);
> -	if (err)
> -		goto mlxreg_lc_probe_fail;
> +	if (err) {
> +		dev_err(&pdev->dev, "Failed to sync regmap for client %s at bus %d at addr 0x%02x\n",
> +			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
> +		err = PTR_ERR(regmap);
> +		goto regcache_sync_fail;
> +	}
>  
>  	par_pdata = data->hpdev.brdinfo->platform_data;
>  	mlxreg_lc->par_regmap = par_pdata->regmap;
> @@ -854,12 +876,27 @@ static int mlxreg_lc_probe(struct platform_device *pdev)
>  	/* Configure line card. */
>  	err = mlxreg_lc_config_init(mlxreg_lc, regmap, data);
>  	if (err)
> -		goto mlxreg_lc_probe_fail;
> +		goto mlxreg_lc_config_init_fail;
>  
>  	return err;
>  
> -mlxreg_lc_probe_fail:
> +mlxreg_lc_config_init_fail:
> +regcache_sync_fail:
> +regmap_write_fail:
> +devm_regmap_init_i2c_fail:
> +	if (data->hpdev.client) {
> +		i2c_unregister_device(data->hpdev.client);
> +		data->hpdev.client = NULL;
> +	}
> +i2c_new_device_fail:
>  	i2c_put_adapter(data->hpdev.adapter);
> +	data->hpdev.adapter = NULL;
> +i2c_get_adapter_fail:
> +	/* Clear event notification callback and handle. */
> +	if (data->notifier) {
> +		data->notifier->user_handler = NULL;
> +		data->notifier->handle = NULL;
> +	}
>  	return err;
>  }
>  
> @@ -868,11 +905,18 @@ static int mlxreg_lc_remove(struct platform_device *pdev)
>  	struct mlxreg_core_data *data = dev_get_platdata(&pdev->dev);
>  	struct mlxreg_lc *mlxreg_lc = platform_get_drvdata(pdev);
>  
> -	/* Clear event notification callback. */
> -	if (data->notifier) {
> -		data->notifier->user_handler = NULL;
> -		data->notifier->handle = NULL;
> -	}
> +	/*
> +	 * Probing and removing are invoked by hotplug events raised upon line card insertion and
> +	 * removing. If probing procedure fails all data is cleared. However, hotplug event still
> +	 * will be raised on line card removing and activate removing procedure. In this case there
> +	 * is nothing to remove.
> +	 */
> +	if (!data->notifier || !data->notifier->handle)
> +		return 0;
> +
> +	/* Clear event notification callback and handle. */
> +	data->notifier->user_handler = NULL;
> +	data->notifier->handle = NULL;
>  
>  	/* Destroy static I2C device feeding by main power. */
>  	mlxreg_lc_destroy_static_devices(mlxreg_lc, mlxreg_lc->main_devs,

