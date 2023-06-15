Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6630EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Jun 2023 12:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244879AbjFOMj5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Jun 2023 08:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244783AbjFOMjk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Jun 2023 08:39:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44771FF9
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jun 2023 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686832736;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8yM6D8AUc9N+Ldej96SWMed4oCEHLB4RH+xHyBtfrzA=;
        b=dThxbjbKO2nUYBw8yONI3D3wKHiyaUIaa3iZVqqWIQUbQWNU+0GEYmOcqWBC9gXMazJqUa
        3kuppxoWQ5HmwO7mXlPo9jsPVvo/V79GX/xFvKUFEWvo3DXQ97fLl/FzcBH82K/7NT4tVp
        rIvn0agdFhNOMaoSFpOncoGksnWijr8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-bUHxNhmkP6-Nmk8BALThVA-1; Thu, 15 Jun 2023 08:38:54 -0400
X-MC-Unique: bUHxNhmkP6-Nmk8BALThVA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4f618172ed6so6016118e87.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jun 2023 05:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686832732; x=1689424732;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8yM6D8AUc9N+Ldej96SWMed4oCEHLB4RH+xHyBtfrzA=;
        b=Eplc9Xk5cpmZi9P61N0qggs5VJjLe+7mqecvS1ZTxdK1BXfiL8kQc2DinTRw9pWav6
         AtND+6huJ3mGvBiKOSBIW7QgPmX3axvgr7HnzEfh4L+YgOeYD3/m2vEAxGRoPv6L/tO3
         RFfIibjeBjhygftQOdKR/ZilyBy1yJLYAO+dCfZrHEfgNLbvMZKVvbROVYH8cEgGH1hb
         t7SVRGKgQye5yOAtwPrQyeg8n3aQ/J238FgkFVGZCenCJRJ8jggdgXP7hbJIaLgmo5wM
         UYoxpQ+Gv0aQ4/Uc/cT4pc8yQzydO0lp2ZRBzidAc4sdWgcTMEtFy8CnYnr2ZBRqCJX9
         OkuA==
X-Gm-Message-State: AC+VfDxVuWcuxewupf1sCKIC7feNXJglXuA/MqBL0MsBStqpIgYCT9m9
        f1nBZZ4j9Zqkn1IY1nUi+YShTLqHrSP67ONMpnLFfZSKDxGpIqD5wy3iAd9T2gf9DQA41XrVJmI
        29jczN6WmAF3QUCrKEAAY89annYN5QvsXsH70Aim9UQ==
X-Received: by 2002:a19:6611:0:b0:4f4:b783:8556 with SMTP id a17-20020a196611000000b004f4b7838556mr8689407lfc.66.1686832732686;
        Thu, 15 Jun 2023 05:38:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uGTwpWuECFkXy/BbpM7EmyXCDXMgcLUCDzrQkNpa4Gv1rRaxYHyr7qb/sUIWOihHi+gklnQ==
X-Received: by 2002:a19:6611:0:b0:4f4:b783:8556 with SMTP id a17-20020a196611000000b004f4b7838556mr8689396lfc.66.1686832732366;
        Thu, 15 Jun 2023 05:38:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e24-20020a170906081800b009786c8249d6sm9511551ejd.175.2023.06.15.05.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 05:38:51 -0700 (PDT)
Message-ID: <db9417e4-b79f-6a7c-40b5-bc23075a86d1@redhat.com>
Date:   Thu, 15 Jun 2023 14:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] platform/x86: int3472: discrete: Log a warning if the
 pin-numbers don't match
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Dan Scally <dan.scally@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20230613110810.240193-1-hdegoede@redhat.com>
 <20230613110810.240193-2-hdegoede@redhat.com>
 <c821a4e0-ff2f-1b8d-a0fa-aadc9c541b6f@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c821a4e0-ff2f-1b8d-a0fa-aadc9c541b6f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/13/23 13:17, Ilpo Järvinen wrote:
> On Tue, 13 Jun 2023, Hans de Goede wrote:
> 
>> The INT3472 discrete code assumes that the ACPI GPIO resources are
>> in the same order as the pin-info _DSM entries.
>>
>> The returned pin-info includes the pin-number in bits 15-8. Add a check
>> that this matches with the ACPI GPIO resource pin-number in case
>> the assumption is not true with some ACPI tables.
>>
>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/intel/int3472/discrete.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index a31964076883..850f306214c7 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -154,8 +154,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>  {
>>  	struct int3472_discrete_device *int3472 = data;
>>  	struct acpi_resource_gpio *agpio;
>> +	u8 active_value, pin, type;
>>  	union acpi_object *obj;
>> -	u8 active_value, type;
>>  	const char *err_msg;
>>  	const char *func;
>>  	u32 polarity;
>> @@ -183,6 +183,12 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>  
>>  	int3472_get_func_and_polarity(type, &func, &polarity);
>>  
>> +	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
>> +	if (pin != agpio->pin_table[0])
>> +		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
>> +			 func, agpio->resource_source.string_ptr, pin,
>> +			 agpio->pin_table[0]);
>> +
>>  	active_value = FIELD_GET(INT3472_GPIO_DSM_SENSOR_ON_VAL, obj->integer.value);
>>  	if (!active_value)
>>  		polarity ^= GPIO_ACTIVE_LOW;
> 
> For both 1 and 2,
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thank you.

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans



