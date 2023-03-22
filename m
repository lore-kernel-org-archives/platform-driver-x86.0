Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A220C6FD1C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Mar 2023 17:15:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbjCVRPH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Mar 2023 13:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbjCVRPC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 13:15:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C07061A7
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 10:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679505257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LAnMd310MmA6pNpw5eHkqA00D/dkWZ4sGmY7r/HYNi8=;
        b=UfVdGYdWKGSp1ZkRfHJNiCZPBcDpCmasWkFCBuCmfD92DXbvUgCNSuFGcjGmmuNLg4zNYa
        ScMdmcK1EM7l5eupCLBEVunioFnoxQbXM5cpS9WnQvZdzPikqbAXRhxBRPTNlRiKNwmk7O
        jL3YE841TPOMxsEMNlJaKx2XabzpZcQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-53LNuxbOMZ2-MVLmnMtnFQ-1; Wed, 22 Mar 2023 13:14:15 -0400
X-MC-Unique: 53LNuxbOMZ2-MVLmnMtnFQ-1
Received: by mail-ed1-f72.google.com with SMTP id t26-20020a50d71a000000b005003c5087caso26522305edi.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 10:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505254;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAnMd310MmA6pNpw5eHkqA00D/dkWZ4sGmY7r/HYNi8=;
        b=oKWkhPjg9go3je/y3G3USLbYuLkQL12R1i3IYE9/R5UODTkPvxLt+MbN3zbHDI8xU4
         9zLiX1B3Cjn3XlXroxSc7NIcub+O0kEr6kzcjGEVYjKTGbIRMisY/WtILx/7pkJB5F+J
         Y9Gsn6UW7DX7nz4T5aF3xmhVNXDfCS6aoSwlpSPoEYKa9kbUJcAX2g6NJM2JDTBgzxY9
         7ELCkO6xMgez87T0lJU5TSYRUvoRJb22Due8EE2sgZXqDUC1ioKOjCAZd32+SBwaxbsM
         6CKqyl47Dkd+P98reiPDwA+ucAPF0OPs4QgPhtq8FCrKdCgipY/GdH2UQJ4qVJ6P1m0/
         nshg==
X-Gm-Message-State: AO0yUKVAxO92htbIrPOypiuvpXr3rSdqMowCDntlDxAy0G2LajDcF0tr
        bmEp4JxHVsqsiR/wl7HI9Jb94fwcA29tl3dFSECsfRwdLg4lwbkTIkSkZiermB15IiuBu58k0tQ
        ltWf0gKeoIMe+EcuHmBCSg4fHLH+kyWxJYQ==
X-Received: by 2002:a17:906:3e0f:b0:933:422b:5f5d with SMTP id k15-20020a1709063e0f00b00933422b5f5dmr8707538eji.18.1679505254352;
        Wed, 22 Mar 2023 10:14:14 -0700 (PDT)
X-Google-Smtp-Source: AK7set+U7G/THYaSuIF3qhrxw9o/2Nmh3Q+qTmWOnN6Iuv6VKLPg91lY+B1kfUQxuMMfsxJEhezsvA==
X-Received: by 2002:a17:906:3e0f:b0:933:422b:5f5d with SMTP id k15-20020a1709063e0f00b00933422b5f5dmr8707516eji.18.1679505254094;
        Wed, 22 Mar 2023 10:14:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lt11-20020a170906fa8b00b008e54ac90de1sm7447206ejb.74.2023.03.22.10.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:14:13 -0700 (PDT)
Message-ID: <5841f661-15f8-12d1-ca92-1dce1a7296df@redhat.com>
Date:   Wed, 22 Mar 2023 18:14:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/8] platform/x86: int3472: Add platform data for LEDs
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-2-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322160926.948687-2-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Daniel,

Thank you for your work in this!

On 3/22/23 17:09, Daniel Scally wrote:
> Some of the LEDs that can be provided by the TPS68470 PMIC come with
> various configuration registers that must be set to appropriate values.
> Add a platform data struct so that those data can be defined and
> passed to the tps68470-led platform device.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c |  2 ++
>  drivers/platform/x86/intel/int3472/tps68470.h |  2 ++
>  include/linux/platform_data/tps68470.h        | 11 +++++++++++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index 82ef022f8916..53b0459f278a 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -194,6 +194,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>  		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
>  		cells[2].name = "tps68470-led";
> +		cells[2].platform_data = (void *)board_data->tps68470_led_pdata;
> +		cells[2].pdata_size = sizeof(struct tps68470_led_platform_data);
>  		cells[3].name = "tps68470-gpio";
>  
>  		for (i = 0; i < board_data->n_gpiod_lookups; i++)
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
> index 35915e701593..ce50687db6fb 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.h
> +++ b/drivers/platform/x86/intel/int3472/tps68470.h
> @@ -13,10 +13,12 @@
>  
>  struct gpiod_lookup_table;
>  struct tps68470_regulator_platform_data;
> +struct tps68470_led_platform_data;
>  
>  struct int3472_tps68470_board_data {
>  	const char *dev_name;
>  	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
> +	const struct tps68470_led_platform_data *tps68470_led_pdata;
>  	unsigned int n_gpiod_lookups;
>  	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
>  };


> diff --git a/include/linux/platform_data/tps68470.h b/include/linux/platform_data/tps68470.h
> index e605a2cab07f..5d55ad5c17ed 100644
> --- a/include/linux/platform_data/tps68470.h
> +++ b/include/linux/platform_data/tps68470.h
> @@ -37,4 +37,15 @@ struct tps68470_clk_platform_data {
>  	struct tps68470_clk_consumer consumers[];
>  };
>  
> +struct tps68470_led_platform_data {
> +	u8 iledctl_ctrlb;
> +	u8 wledmaxf;
> +	u8 wledto;
> +	u8 wledc1;
> +	u8 wledc2;
> +	u8 wledctl_mode;
> +	bool wledctl_disled1;
> +	bool wledctl_disled2;
> +};
> +
>  #endif


It seems to me that these include/linux/platform_data/tps68470.h
changes should be squashed to:

[PATCH 2/8] platform/x86: int3472: Init LED registers using platform data

Which BTW has the wrong subsys prefix, it should be named:

[PATCH 2/8] leds: tps68470: Init LED registers using platform data

or even better:

[PATCH 2/8] leds: tps68470: Init WLED registers using platform data


And then squash the rest of this patch into:

[PATCH 3/8] platform/x86: int3472: Add TPS68470 LED Board Data

please and drop this now empty patch from the set.

Regards,

Hans

