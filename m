Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A33C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Nov 2022 10:57:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiK1K5T (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Nov 2022 05:57:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiK1K5S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Nov 2022 05:57:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A056175BF
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Nov 2022 02:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669632987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nk3OrspnVFzJiR0DKBogoVbxeD1WBIfwWUFGrVsa388=;
        b=Rx2r5DIllcoMXP9RpENLkp+MVeby21aPQwFddVFkUEwSGWFEHxvQ9IRIncu655u0O559Ll
        sEbNOjfN8BzZWnTJJTbovD+IQrKsGv+oOXeVAA2bi08UGEEYvxRMf44XJiEqHbmImjXBSB
        jQrn22lqNqq95Y87s/BpH4//u5lylzg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-wyEAZ-b0NrqBqLQ_G1CyyA-1; Mon, 28 Nov 2022 05:56:25 -0500
X-MC-Unique: wyEAZ-b0NrqBqLQ_G1CyyA-1
Received: by mail-ej1-f69.google.com with SMTP id xc12-20020a170907074c00b007416699ea14so4104618ejb.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Nov 2022 02:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nk3OrspnVFzJiR0DKBogoVbxeD1WBIfwWUFGrVsa388=;
        b=gTbdDJ1wwvZmawg+urvFTUQ/2iKVgS5yaPqh6EZDdXYIOQY7YRfo1kGHkCvXMRE+k8
         J3HkcmWkuY2cvBAGSUJ39KrYoXpqHGSmtsXY3RB3UoGUqPkWdvn0guB4fr4ItnbNtZQ9
         zjp5H2PqnTvYCinMG9IxCkhBFzAHE9vubXZ1nJhPDZIrLkt2FooUrwPUDklcvbYmCQRO
         X89I+WZYb6BC+jFiumpDJD8nQAM0vIZSY+zSZ+TYaNAFR4GNhgcxSbiQsMsjTPHMKRI6
         yUokuadUUt3wu+tFCIZGJ3zvHvwyVIuiI4IAH6GpTx1tIi1DPU8Bmv68H4oFgOpXk+zM
         /ATA==
X-Gm-Message-State: ANoB5pnLdgFkPJYLIoswAE3MWCioSpQTLM8+B9yRYJ/FeoFFwezz7s0X
        VDhpdisqJwQ4M9+3fr7wQpMPzuCj6mSLYPXkZBJFuH8m8TStlLJjOXjYyK3E/0Qy0Lir+MxsaP6
        5nzoYp/i0pJa2L1s6DPOMxNLuXJepwzo1Nw==
X-Received: by 2002:a17:906:448d:b0:7ae:37aa:6bf with SMTP id y13-20020a170906448d00b007ae37aa06bfmr42231550ejo.481.1669632984747;
        Mon, 28 Nov 2022 02:56:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5q4Ls5Gy0uVir883nkBNCYLQ2g4Oj+TCkygSsPY1cD7dpzVtQcllrlCXYoWul/osoPAM3Law==
X-Received: by 2002:a17:906:448d:b0:7ae:37aa:6bf with SMTP id y13-20020a170906448d00b007ae37aa06bfmr42231523ejo.481.1669632984567;
        Mon, 28 Nov 2022 02:56:24 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id d2-20020a1709063ce200b0077f324979absm4795205ejh.67.2022.11.28.02.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 02:56:24 -0800 (PST)
Message-ID: <30d0f7ab-a5a7-d18e-4dcf-49a59032867e@redhat.com>
Date:   Mon, 28 Nov 2022 11:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/3] platform/x86: int3472/discrete: Refactor GPIO to
 sensor mapping
Content-Language: en-US
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <20221124200007.390901-2-hdegoede@redhat.com>
 <6ee3d17c-3481-b33f-682d-ac4a1e03061c@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6ee3d17c-3481-b33f-682d-ac4a1e03061c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/25/22 17:00, Dan Scally wrote:
> Hi Hans
> 
> On 24/11/2022 20:00, Hans de Goede wrote:
>> Make the GPIO to sensor mapping more generic and fold the
>> INT3472_GPIO_TYPE_RESET and INT3472_GPIO_TYPE_POWERDOWN cases into
>> a single generic case.
>>
>> This is a preparation patch for further GPIO mapping changes.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
> 
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> 
> Tested-by: Daniel Scally <dan.scally@ideasonboard.com>

Thank you.

Note I have made some (not insignificant) changes to this patch for the v2
series which I'm working on, so I have decided to not add these tags
because of the changes.

Regards,

Hans



> 
>>   drivers/platform/x86/intel/int3472/discrete.c | 31 ++++++++++++++-----
>>   1 file changed, 23 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index 974a132db651..bc6c62f3f3bf 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -184,6 +184,24 @@ static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
>>       return 0;
>>   }
>>   +static const char *int3472_dsm_type_to_func(u8 type)
>> +{
>> +    switch (type) {
>> +    case INT3472_GPIO_TYPE_RESET:
>> +        return "reset";
>> +    case INT3472_GPIO_TYPE_POWERDOWN:
>> +        return "powerdown";
>> +    case INT3472_GPIO_TYPE_CLK_ENABLE:
>> +        return "clken";
>> +    case INT3472_GPIO_TYPE_PRIVACY_LED:
>> +        return "pled";
>> +    case INT3472_GPIO_TYPE_POWER_ENABLE:
>> +        return "power-enable";
>> +    }
>> +
>> +    return "unknown";
>> +}
>> +
>>   /**
>>    * skl_int3472_handle_gpio_resources: Map PMIC resources to consuming sensor
>>    * @ares: A pointer to a &struct acpi_resource
>> @@ -223,6 +241,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>       struct acpi_resource_gpio *agpio;
>>       union acpi_object *obj;
>>       const char *err_msg;
>> +    const char *func;
>>       int ret;
>>       u8 type;
>>   @@ -246,19 +265,15 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>         type = obj->integer.value & 0xff;
>>   +    func = int3472_dsm_type_to_func(type);
>> +
>>       switch (type) {
>>       case INT3472_GPIO_TYPE_RESET:
>> -        ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, "reset",
>> -                             GPIO_ACTIVE_LOW);
>> -        if (ret)
>> -            err_msg = "Failed to map reset pin to sensor\n";
>> -
>> -        break;
>>       case INT3472_GPIO_TYPE_POWERDOWN:
>> -        ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, "powerdown",
>> +        ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func,
>>                                GPIO_ACTIVE_LOW);
>>           if (ret)
>> -            err_msg = "Failed to map powerdown pin to sensor\n";
>> +            err_msg = "Failed to map GPIO pin to sensor\n";
>>             break;
>>       case INT3472_GPIO_TYPE_CLK_ENABLE:
> 

