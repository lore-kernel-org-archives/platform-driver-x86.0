Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6886ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Sep 2022 12:48:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233048AbiIAMsl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Sep 2022 08:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232987AbiIAMsk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Sep 2022 08:48:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB7611169
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Sep 2022 05:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662036513;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jBmbuaOhhXgRkQYGy2MYrWPlvTGZeB6QqJI1Z1s4SrI=;
        b=f6zAocOzeILKSHSwgPxM67tl3sbWIYNEu1+COBdgXuMgo8GgPHXrcIDuJAUuKlX+ZmWo/Y
        /UBR492AXRwem0LYY9nQ77ZdC2+Lurg2OlgoHsOsnCW+WLJefhBywSQQRlyicjBamd90TA
        ArJHiYlrrX3XZFCJyun2TTgifilVYNU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-294-srX24bFiNU2aI1DtxbyO9w-1; Thu, 01 Sep 2022 08:48:32 -0400
X-MC-Unique: srX24bFiNU2aI1DtxbyO9w-1
Received: by mail-ed1-f72.google.com with SMTP id q32-20020a05640224a000b004462f105fa9so11550012eda.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Sep 2022 05:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=jBmbuaOhhXgRkQYGy2MYrWPlvTGZeB6QqJI1Z1s4SrI=;
        b=VO/YeshIuLOUDpmShaq3u3MtitjRCX+Wsjbj+0UcsP4/KjKoaq7i+OJaD5f5BzmXFr
         hW8jVue22FqQdGom3+opSgn1EP7Rule6MKuS4Vo+LqNLHR05PGoLuN+ZrmGEKI0qxOHu
         kvS7Q71hqaUlrk41BDqa1CtKUOtdK/9pCNQ9+WH/+/9OmsiGOOaMfpz6CKLfI5Bq5SLK
         e3V3WYsi2LrrbSnYFolKyzqtMsxohJ7KjO1TFb19655r7jVgT3g5sFxvpC9TOx430dAZ
         mk3evf9jinwXF8MmqdPlYlBIfbNbYVzoGT0XCZre+CeZfH5coOHCGYZ2/Qgg51J8rLeu
         6zeA==
X-Gm-Message-State: ACgBeo1UYc+Jab9AdlJFbox8IBvAUAy3eYS3+z1WB9aosTYLEk88C2Lk
        mnDtaWlfxnaPHyL/2swegpjfAtMwamEvgLdzdAT5ZlVhA9iQ/zTGYrLSSj6ncmphKBvQlrJ9AFL
        CNv23PKsFf+tIo3CU3kGqBjjukB4zXlk4fQ==
X-Received: by 2002:a17:907:2d92:b0:731:3310:418d with SMTP id gt18-20020a1709072d9200b007313310418dmr23472338ejc.379.1662036510862;
        Thu, 01 Sep 2022 05:48:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5S1Wp1ZlGpO984mB6y2bbNw6k/B1k/vhSGHf+6tDVNHYEq0M78yjWNbliiVvD4kbZRThx23g==
X-Received: by 2002:a17:907:2d92:b0:731:3310:418d with SMTP id gt18-20020a1709072d9200b007313310418dmr23472323ejc.379.1662036510597;
        Thu, 01 Sep 2022 05:48:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id q20-20020a170906b29400b0074b4e77ccc6sm201882ejz.151.2022.09.01.05.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 05:48:30 -0700 (PDT)
Message-ID: <82c807cf-41ae-1860-2dce-57f9c22379d9@redhat.com>
Date:   Thu, 1 Sep 2022 14:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH platform 2/4] platform/mellanox: mlxreg-lc: Fix locking
 issue
Content-Language: en-US
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     dan.carpenter@oracle.comq, platform-driver-x86@vger.kernel.org
References: <20220823201937.46855-1-vadimp@nvidia.com>
 <20220823201937.46855-3-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220823201937.46855-3-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/23/22 22:19, Vadim Pasternak wrote:
> Fix locking issues:
> - mlxreg_lc_state_update() takes a lock when set or clear
>   "MLXREG_LC_POWERED".
> - All the devices can be deleted before MLXREG_LC_POWERED flag is cleared.
> 
> To fix it:
> - Add lock() / unlock() at the beginning / end of
>   mlxreg_lc_event_handler() and remove locking from
>   mlxreg_lc_power_on_off() and mlxreg_lc_enable_disable()
> - Add locked version of mlxreg_lc_state_update() -
>   mlxreg_lc_state_update_locked() for using outside
>   mlxreg_lc_event_handler().
> 
> (2) Remove redundant NULL check for of if 'data->notifier'.
> 
> Fixes: 62f9529b8d5c87b ("platform/mellanox: mlxreg-lc: Add initial support for Nvidia line card devices")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/mellanox/mlxreg-lc.c | 37 ++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
> index 9a1bfcd24317..e578c7bc060b 100644
> --- a/drivers/platform/mellanox/mlxreg-lc.c
> +++ b/drivers/platform/mellanox/mlxreg-lc.c
> @@ -460,8 +460,6 @@ static int mlxreg_lc_power_on_off(struct mlxreg_lc *mlxreg_lc, u8 action)
>  	u32 regval;
>  	int err;
>  
> -	mutex_lock(&mlxreg_lc->lock);
> -
>  	err = regmap_read(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_pwr, &regval);
>  	if (err)
>  		goto regmap_read_fail;
> @@ -474,7 +472,6 @@ static int mlxreg_lc_power_on_off(struct mlxreg_lc *mlxreg_lc, u8 action)
>  	err = regmap_write(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_pwr, regval);
>  
>  regmap_read_fail:
> -	mutex_unlock(&mlxreg_lc->lock);
>  	return err;
>  }
>  
> @@ -491,8 +488,6 @@ static int mlxreg_lc_enable_disable(struct mlxreg_lc *mlxreg_lc, bool action)
>  	 * line card which is already has been enabled. Disabling does not affect the disabled line
>  	 * card.
>  	 */
> -	mutex_lock(&mlxreg_lc->lock);
> -
>  	err = regmap_read(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_ena, &regval);
>  	if (err)
>  		goto regmap_read_fail;
> @@ -505,7 +500,6 @@ static int mlxreg_lc_enable_disable(struct mlxreg_lc *mlxreg_lc, bool action)
>  	err = regmap_write(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_ena, regval);
>  
>  regmap_read_fail:
> -	mutex_unlock(&mlxreg_lc->lock);
>  	return err;
>  }
>  
> @@ -537,6 +531,15 @@ mlxreg_lc_sn4800_c16_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
>  
>  static void
>  mlxreg_lc_state_update(struct mlxreg_lc *mlxreg_lc, enum mlxreg_lc_state state, u8 action)
> +{
> +	if (action)
> +		mlxreg_lc->state |= state;
> +	else
> +		mlxreg_lc->state &= ~state;
> +}
> +
> +static void
> +mlxreg_lc_state_update_locked(struct mlxreg_lc *mlxreg_lc, enum mlxreg_lc_state state, u8 action)
>  {
>  	mutex_lock(&mlxreg_lc->lock);
>  
> @@ -560,8 +563,11 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
>  	dev_info(mlxreg_lc->dev, "linecard#%d state %d event kind %d action %d\n",
>  		 mlxreg_lc->data->slot, mlxreg_lc->state, kind, action);
>  
> -	if (!(mlxreg_lc->state & MLXREG_LC_INITIALIZED))
> +	mutex_lock(&mlxreg_lc->lock);
> +	if (!(mlxreg_lc->state & MLXREG_LC_INITIALIZED)) {
> +		mutex_unlock(&mlxreg_lc->lock);

So here you are unlocking before return.

>  		return 0;
> +	}
>  
>  	switch (kind) {
>  	case MLXREG_HOTPLUG_LC_SYNCED:
> @@ -574,7 +580,7 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
>  		if (!(mlxreg_lc->state & MLXREG_LC_POWERED) && action) {
>  			err = mlxreg_lc_power_on_off(mlxreg_lc, 1);
>  			if (err)
> -				return err;
> +				goto mlxreg_lc_power_on_off_fail;

Yet here you use a goto (better IMHO).

>  		}
>  		/* In case line card is configured - enable it. */
>  		if (mlxreg_lc->state & MLXREG_LC_CONFIGURED && action)
> @@ -588,12 +594,13 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
>  				/* In case line card is configured - enable it. */
>  				if (mlxreg_lc->state & MLXREG_LC_CONFIGURED)
>  					err = mlxreg_lc_enable_disable(mlxreg_lc, 1);
> +				mutex_unlock(&mlxreg_lc->lock);

and here is another unlocking before return.

>  				return err;
>  			}
>  			err = mlxreg_lc_create_static_devices(mlxreg_lc, mlxreg_lc->main_devs,
>  							      mlxreg_lc->main_devs_num);
>  			if (err)
> -				return err;
> +				goto mlxreg_lc_create_static_devices_fail;

and here is an other goto.

This is not very consistent. Can you please switch to goto-s everywhere?
Preferable with just a simply single "out" label?

I always prefer the goto-s here so that the function has a single
entry + exit point and we can easily see that the lock + unlock
is balanced since there is only 1 of each.

Regards,

Hans




>  
>  			/* In case line card is already in ready state - enable it. */
>  			if (mlxreg_lc->state & MLXREG_LC_CONFIGURED)
> @@ -620,6 +627,10 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
>  		break;
>  	}
>  
> +mlxreg_lc_power_on_off_fail:
> +mlxreg_lc_create_static_devices_fail:
> +	mutex_unlock(&mlxreg_lc->lock);
> +
>  	return err;
>  }
>  
> @@ -665,7 +676,7 @@ static int mlxreg_lc_completion_notify(void *handle, struct i2c_adapter *parent,
>  		if (err)
>  			goto mlxreg_lc_create_static_devices_failed;
>  
> -		mlxreg_lc_state_update(mlxreg_lc, MLXREG_LC_POWERED, 1);
> +		mlxreg_lc_state_update_locked(mlxreg_lc, MLXREG_LC_POWERED, 1);
>  	}
>  
>  	/* Verify if line card is synchronized. */
> @@ -676,7 +687,7 @@ static int mlxreg_lc_completion_notify(void *handle, struct i2c_adapter *parent,
>  	/* Power on line card if necessary. */
>  	if (regval & mlxreg_lc->data->mask) {
>  		mlxreg_lc->state |= MLXREG_LC_SYNCED;
> -		mlxreg_lc_state_update(mlxreg_lc, MLXREG_LC_SYNCED, 1);
> +		mlxreg_lc_state_update_locked(mlxreg_lc, MLXREG_LC_SYNCED, 1);
>  		if (mlxreg_lc->state & ~MLXREG_LC_POWERED) {
>  			err = mlxreg_lc_power_on_off(mlxreg_lc, 1);
>  			if (err)
> @@ -684,7 +695,7 @@ static int mlxreg_lc_completion_notify(void *handle, struct i2c_adapter *parent,
>  		}
>  	}
>  
> -	mlxreg_lc_state_update(mlxreg_lc, MLXREG_LC_INITIALIZED, 1);
> +	mlxreg_lc_state_update_locked(mlxreg_lc, MLXREG_LC_INITIALIZED, 1);
>  
>  	return 0;
>  
> @@ -904,6 +915,8 @@ static int mlxreg_lc_remove(struct platform_device *pdev)
>  	struct mlxreg_core_data *data = dev_get_platdata(&pdev->dev);
>  	struct mlxreg_lc *mlxreg_lc = platform_get_drvdata(pdev);
>  
> +	mlxreg_lc_state_update_locked(mlxreg_lc, MLXREG_LC_INITIALIZED, 0);
> +
>  	/*
>  	 * Probing and removing are invoked by hotplug events raised upon line card insertion and
>  	 * removing. If probing procedure fails all data is cleared. However, hotplug event still

