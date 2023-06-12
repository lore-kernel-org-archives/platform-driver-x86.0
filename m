Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17716C7EE2F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Jun 2023 15:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237822AbjFLP2H (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Jun 2023 11:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237962AbjFLP16 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jun 2023 11:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B2C510FC
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686583623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cfoQQmpZd2pD7NddXOEPsMIKE6x/nJCnI887oIwONRI=;
        b=aNG96pnlHE3uhTYCkT+JHQFyuMgeBRzSK4RapywsHR0eqfPyL0PFOegL2O/GePbznbzpzU
        cfn5eqYg1qkiHvkvVTWggdm7ICFGHe4PEgPdWBwOPrHhwIr6bP7oKILRMPPtCeekbGN4zX
        Ij6TTu7cI1sLh9DHEkPhD5Pt8kLFHiY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-sGf99n-VNxCyhA-_MqQ5oQ-1; Mon, 12 Jun 2023 11:27:00 -0400
X-MC-Unique: sGf99n-VNxCyhA-_MqQ5oQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-978876e43a7so529316966b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 08:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686583619; x=1689175619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfoQQmpZd2pD7NddXOEPsMIKE6x/nJCnI887oIwONRI=;
        b=AEbbdoWNMZgy4yARc3XxL0HKBFeNi/vrZDjt2rrzh99qKsSgBDD5R5Qc0TTUqamVmc
         5DaxRowyUoApq3eGYX124Tub7G4RZ2sgsisFZQH0j8np1NoiNTkniTytZWHQ0PXj3jIg
         /qnerg62MD8ApR0k3+mM22hsC8uuqr05PRGVJQNXrU8IlFwPEEeNnIRqrA6ZCsGdwqMr
         b93Dn9TNRLZ1e+385j5n8kY0XRw8WhW1SHYzK678agEhIjZWbRlpCdYnhgUDtAfcU6Yy
         u/t2KtBWjZ0QESEatq7+O8HSS/GOs1Q5XeRugjSHwX+a08vOTEWBk8Mii5xus18ZsPD5
         zVhw==
X-Gm-Message-State: AC+VfDyf35eRPthhwpwyaIrihwHRp4E6q9eBsaV26WHr4YzgqpV7fDR9
        HM9lXvbBrFEjKn81eFwbjIFG5LEs7N+IbdJFGMxaq1cJmiuw0uJoAYEUudTRhk3/50bsuINiuMX
        0CGgr6yenu9+T3n5EoWGH8b75WpevLPyPPA==
X-Received: by 2002:a17:907:94ca:b0:973:ad8f:ef9b with SMTP id dn10-20020a17090794ca00b00973ad8fef9bmr9845497ejc.5.1686583619606;
        Mon, 12 Jun 2023 08:26:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6vZQx0TL72aGk4qd5khG84RVRxjiFhjfylvHRCVTDEWmk7Mlc82TxriYQ7l5/EFGW1uZtDQQ==
X-Received: by 2002:a17:907:94ca:b0:973:ad8f:ef9b with SMTP id dn10-20020a17090794ca00b00973ad8fef9bmr9845480ejc.5.1686583619359;
        Mon, 12 Jun 2023 08:26:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s19-20020a170906455300b00978993e0d21sm5335908ejq.78.2023.06.12.08.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 08:26:58 -0700 (PDT)
Message-ID: <b20a54d0-2c3d-0b78-723d-78801f55cc08@redhat.com>
Date:   Mon, 12 Jun 2023 17:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] platform/x86: int3472: discrete: Log a warning if the
 pin-numbers don't match
Content-Language: en-US, nl
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20230612141632.5232-1-hdegoede@redhat.com>
 <20230612141632.5232-2-hdegoede@redhat.com>
 <be624721-b150-010d-f78d-1815db65bb8f@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <be624721-b150-010d-f78d-1815db65bb8f@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/12/23 16:20, Dan Scally wrote:
> Hi Hans
> 
> On 12/06/2023 15:16, Hans de Goede wrote:
>> The INT3472 discrete code assumes that the ACPI GPIO resources are
>> in the same order as the pin-info _DSM entries.
>>
>> The returned pin-info includes the pin-number in bits 15-8. Add a check
>> that this matches with the ACPI GPIO resource pin-number in case
>> the assumption is not true with some ACPI tables.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> 
> That seems like a good idea to me:
> 
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Thanks. Did you also see my:
"[PATCH 0/4] platform/x86: int3472: discrete: Regulator rework / Lenovo Miix 510 support"

series ? It would be great if I can get your input on that.

Personally I'm not entirely happy with patch 3/4 there,
but I don't really see any other way of solving
the issue on the mix 510 that 3/4 fixes.

Regards,

Hans


> 
>> ---
>>   drivers/platform/x86/intel/int3472/discrete.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index 4ef60883154d..c1132bbbff41 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -149,8 +149,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>   {
>>       struct int3472_discrete_device *int3472 = data;
>>       struct acpi_resource_gpio *agpio;
>> +    u8 active_value, pin, type;
>>       union acpi_object *obj;
>> -    u8 active_value, type;
>>       const char *err_msg;
>>       const char *func;
>>       u32 polarity;
>> @@ -174,10 +174,18 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>           return 1;
>>       }
>>   +    /* Bits 7-0 contain the type/function of the pin */
>>       type = obj->integer.value & 0xff;
>>         int3472_get_func_and_polarity(type, &func, &polarity);
>>   +    /* Bits 15-8 contain the pin-number on the GPIO chip */
>> +    pin = (obj->integer.value >> 8) & 0xff;
>> +    if (pin != agpio->pin_table[0])
>> +        dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
>> +             func, agpio->resource_source.string_ptr, pin,
>> +             agpio->pin_table[0]);
>> +
>>       /* If bits 31-24 of the _DSM entry are all 0 then the signal is inverted */
>>       active_value = (obj->integer.value >> 24) & 0xff;
>>       if (!active_value)
> 

