Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD1CECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Sep 2022 17:51:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiIIRve (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Sep 2022 13:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbiIIRvd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Sep 2022 13:51:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C7C11CD60
        for <platform-driver-x86@vger.kernel.org>; Fri,  9 Sep 2022 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662745892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zY6222WckzVK2KF9fJBNjhtu9q+nbygI3g+xxUdhLVM=;
        b=INGbY3CLLjJZVm+StuP7y6PUyP3a+dZXwAREwTPjVZIvek71ABTOlcDR0ziCcj3pnr9a6c
        unY3RzVA2nQ9OJFSEsPghyhi6O0nMG86ftEzHxg/6zz267Y/UF0ZeAsXfAqni3jZtDTxLD
        92mFeHUyRIvBP9EonIEaIvNMwPKKecU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-114-pzau0lY7P1urR8b0Ril6Kg-1; Fri, 09 Sep 2022 13:51:30 -0400
X-MC-Unique: pzau0lY7P1urR8b0Ril6Kg-1
Received: by mail-ed1-f71.google.com with SMTP id p4-20020a056402500400b00447e8b6f62bso1782835eda.17
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Sep 2022 10:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zY6222WckzVK2KF9fJBNjhtu9q+nbygI3g+xxUdhLVM=;
        b=OcWHL0LgpiN9rOZAg1r9VY0lDAk0WEL6w1jByX8foic8oJgUHmsjQVrRx6Dg0jh4ZH
         jtMr4c7fRt8/Tvmg4diIliyWfmo4eOSFOjb3bjCihJTucss4csoBO9mJAPc01M9HzbR/
         IrLO4R2FOWmWoQ3YGGrZb0MA8DIEFRh+Wjg2t0Yh0eR2rBMBBIzDbZgzyO4CIuudtrdn
         dpj4PeeAyiBC8F0UimPrqlTZyVvkrSMQojp4KHemuP6BDfUlkp4T8QruHcdMqMBFU7DN
         SSbcLEMzzoU3SeSG3ZTihWkvn9JxKKrn6HrXSX+VCXbFuo6W0ped3BB0poXI9bHkhfRt
         PcBg==
X-Gm-Message-State: ACgBeo3TkqBNWkLNkylhVDFlG4HEnbN4i+LIFQWY1+gS1BDT9DNocMh7
        2H+6OC9GxZvHeyP02iD1aXElO/b+pU74Nd83/a7Y7fkbxA5yStypfl7kL21Uwk44v/fy+KgXN0I
        e0pnewMmWZ6ZURNIYboJe8FX06qvfyb/1KQ==
X-Received: by 2002:aa7:da4f:0:b0:44e:864b:7a3e with SMTP id w15-20020aa7da4f000000b0044e864b7a3emr12733438eds.378.1662745889498;
        Fri, 09 Sep 2022 10:51:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7eSb5jcKQbu3GV5bmpBUvssCQ+gY9FphMHM+nQQDWOsXpBZ57P/7Sl2oKZ6rrontmRGkmA5w==
X-Received: by 2002:aa7:da4f:0:b0:44e:864b:7a3e with SMTP id w15-20020aa7da4f000000b0044e864b7a3emr12733427eds.378.1662745889346;
        Fri, 09 Sep 2022 10:51:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906210200b00715a02874acsm589103ejt.35.2022.09.09.10.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 10:51:28 -0700 (PDT)
Message-ID: <f98cc079-3ded-e8aa-da27-62fd298b79ca@redhat.com>
Date:   Fri, 9 Sep 2022 19:51:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH platform-next 1/1] platform/mellanox: mlxreg-lc: Make
 error handling flow consistent
Content-Language: en-US
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220904141113.49048-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220904141113.49048-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/4/22 16:11, Vadim Pasternak wrote:
> Use 'goto' statement in error flow of mlxreg_lc_event_handler() at all
> places for consistency.
> 
> This follow-up patch implementing comments from
> https://www.spinics.net/lists/platform-driver-x86/msg34587.html
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/mellanox/mlxreg-lc.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
> index 1e071df4c9f5..d47fe22080e6 100644
> --- a/drivers/platform/mellanox/mlxreg-lc.c
> +++ b/drivers/platform/mellanox/mlxreg-lc.c
> @@ -564,10 +564,8 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
>  		 mlxreg_lc->data->slot, mlxreg_lc->state, kind, action);
>  
>  	mutex_lock(&mlxreg_lc->lock);
> -	if (!(mlxreg_lc->state & MLXREG_LC_INITIALIZED)) {
> -		mutex_unlock(&mlxreg_lc->lock);
> -		return 0;
> -	}
> +	if (!(mlxreg_lc->state & MLXREG_LC_INITIALIZED))
> +		goto mlxreg_lc_non_initialzed_exit;
>  
>  	switch (kind) {
>  	case MLXREG_HOTPLUG_LC_SYNCED:
> @@ -594,8 +592,7 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
>  				/* In case line card is configured - enable it. */
>  				if (mlxreg_lc->state & MLXREG_LC_CONFIGURED)
>  					err = mlxreg_lc_enable_disable(mlxreg_lc, 1);
> -				mutex_unlock(&mlxreg_lc->lock);
> -				return err;
> +					goto mlxreg_lc_enable_disable_exit;

The intend of this goto is wrong (one indent level too much).

I have merged this now with the indent fixed up:

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


>  			}
>  			err = mlxreg_lc_create_static_devices(mlxreg_lc, mlxreg_lc->main_devs,
>  							      mlxreg_lc->main_devs_num);
> @@ -627,8 +624,10 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
>  		break;
>  	}
>  
> +mlxreg_lc_enable_disable_exit:
>  mlxreg_lc_power_on_off_fail:
>  mlxreg_lc_create_static_devices_fail:
> +mlxreg_lc_non_initialzed_exit:
>  	mutex_unlock(&mlxreg_lc->lock);
>  
>  	return err;

