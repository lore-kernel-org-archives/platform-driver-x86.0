Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE37C77B7A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 31 May 2023 15:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbjEaPv1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 31 May 2023 11:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234273AbjEaPvZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 31 May 2023 11:51:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51D893
        for <platform-driver-x86@vger.kernel.org>; Wed, 31 May 2023 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685548233;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K5INEdlttC/E8W3P11z/LYyq4LfEb1uvU85+ddKarIQ=;
        b=GzEKNhtf3bS6h3nDIpXMKA3ZVvMpAClnjzbwlhzYjnWh+OOViRlsRMnT12T7tLZj4Tm/vQ
        hshW1C/mthjmEg72H4WzOl5RGrY7wy0t8RGIhJyrF7twG2MWTML5of7Bx7k22CW7OusIOZ
        mhrlZpEV2PGrSVIUqToBimUOjdHFeio=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-3EzrRgmeOeG2ay1SFhs7eA-1; Wed, 31 May 2023 11:50:31 -0400
X-MC-Unique: 3EzrRgmeOeG2ay1SFhs7eA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-96fd3757bd1so619095666b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 31 May 2023 08:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685548230; x=1688140230;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K5INEdlttC/E8W3P11z/LYyq4LfEb1uvU85+ddKarIQ=;
        b=XZI0I1vLC9fZPC78E5mBOTQlAp3bnlVqOIRsrZn/v2lOH9J/rdbjPasj9KhCdOfYIw
         BskeVxYttMO8xSAHn8tsNYjudjdlLkGOpkld7juKPktdc8hDMc+TaPrTr47wSq69aBiC
         1snHb1O+b3YhKmmizih0otGr1Ie8j4ob4v8VUHUeXTcjimkU30/Iy4k1Cj+gwskn6Scp
         QjFbxv6zfVadwxxDK5olMk2MXCc/rtvd05ZISA8atBb2iZavFPNArothwur3dp6fn3OP
         SmwjDoYWJBEwfZHNQv9HSsUJsLHpZ5T73BTFf//8KNRXaO8RFWrgWKioKxOCekJDGYmH
         FeKQ==
X-Gm-Message-State: AC+VfDwox9zEAwUoc28phi/yNoy8B154I9SAj74BHcks4HkG32Vpahar
        UzpMtzX4rACAE1zEUIXhqK1nCycfMmEs/3i9sod53z8pnhE6rBq6YzeaYxFzhntE+qqMM5fEcaR
        sZidPcisUMhVvGQ0tOHrHrlAyuFbZCilWlA==
X-Received: by 2002:a17:907:7e8d:b0:94f:3980:bf91 with SMTP id qb13-20020a1709077e8d00b0094f3980bf91mr6475788ejc.19.1685548230769;
        Wed, 31 May 2023 08:50:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ76VhJ2vqW2F8QsF0N+F7byel/ft3hvC2JQLya1CrWBFHzOG4PapmKZVIL1OfoUmwcBU84SUw==
X-Received: by 2002:a17:907:7e8d:b0:94f:3980:bf91 with SMTP id qb13-20020a1709077e8d00b0094f3980bf91mr6475776ejc.19.1685548230446;
        Wed, 31 May 2023 08:50:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bl17-20020a170906c25100b0094e4eabb402sm9171689ejb.128.2023.05.31.08.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 08:50:29 -0700 (PDT)
Message-ID: <9ec0d27d-bcee-3902-091a-9349a52a9f5d@redhat.com>
Date:   Wed, 31 May 2023 17:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/x86: int3472: Remap reset GPIO for INT347E
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230311223019.14123-1-dan.scally@ideasonboard.com>
 <a97e6200-bdc3-ce8e-cb9b-498b35510bd7@redhat.com>
In-Reply-To: <a97e6200-bdc3-ce8e-cb9b-498b35510bd7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dan,

On 3/16/23 15:59, Hans de Goede wrote:
> Hi Daniel,
> 
> On 3/11/23 23:30, Daniel Scally wrote:
>> ACPI _HID INT347E represents the OmniVision 7251 camera sensor. The
>> driver for this sensor expects a single pin named "enable", but on
>> some Microsoft Surface platforms the sensor is assigned a single
>> GPIO who's type flag is INT3472_GPIO_TYPE_RESET.
>>
>> Remap the GPIO pin's function from "reset" to "enable". This is done
>> outside of the existing remap table since it is a more widespread
>> discrepancy than that method is designed for. Additionally swap the
>> polarity of the pin to match the driver's expectation.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> 
> I have recently been looking into GPIO mappings on various devices
> using the atomisp2 ISP. These use the same _DSM as the IPU3 but
> then directly on the sensor ACPI device node.
> 
> What I came up with is this (I still need to submit this upstream):
> 
> https://github.com/jwrdegoede/linux-sunxi/commit/e2287979db43d46fa7d354c1bde92eb6219b613d
> 
> One thing which I learned while working on this is that in the value returned by the _DSM
> the byte with mask 0xff00 is the pin-number on the GPIO controller; and (and this is the important bit!) unlike the assumption in the IPU3/INT3472 code the order in which the GPIOs are listed in the "79234640-9e10-4fea-a5c1-b5aa8b19756f" _DSM is *NOT* always the order in which they are listed in the GPIO resources!
> 
> So as you can see in the linked commit I'm finding the GPIO resource to go with the _DSM value by matching the pin-numbers.
> 
> I'm wondering if we need to do the same thing on IPU3 and if this is maybe why we need to do any remapping at all ?
> 
> Can you please check if there is not something like the above going on before we add a remap quirk for this ?

So based on our recent related emails:

https://lore.kernel.org/linux-media/7fc1a3fb-d300-de09-1e0d-606971560fc1@redhat.com/

I have taken another look at this.

The datasheet for the OV7251 is a bit ambiguous it names the pin as
"XSHUTDOWN" but then describes that pin as:

"reset (active low with internal pull down resistor)"

so based on the longer description of the pin I believe it would
be reasonable to patch the driver to try and get a "reset"
con-id GPIO if getting an "enable" con-id pin fails.

IMHO this would be preferably to adding more and more GPIO
remap hacks to the INT3472 code.

Regards,

Hans





> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
>> ---
>>  drivers/platform/x86/intel/int3472/discrete.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index f064da74f50a..2064b3bbe530 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -98,6 +98,9 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
>>  {
>>  	const struct int3472_sensor_config *sensor_config;
>>  	char *path = agpio->resource_source.string_ptr;
>> +	const struct acpi_device_id ov7251_ids[] = {
>> +		{ "INT347E" },
>> +	};
>>  	struct gpiod_lookup *table_entry;
>>  	struct acpi_device *adev;
>>  	acpi_handle handle;
>> @@ -120,6 +123,17 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
>>  		}
>>  	}
>>  
>> +	/*
>> +	 * In addition to the function remap table we need to bulk remap the
>> +	 * "reset" GPIO for the OmniVision 7251 sensor, as the driver for that
>> +	 * expects its only GPIO pin to be called "enable" (and to have the
>> +	 * opposite polarity).
>> +	 */
>> +	if (!strcmp(func, "reset") && !acpi_match_device_ids(int3472->sensor, ov7251_ids)) {
>> +		func = "enable";
>> +		polarity = GPIO_ACTIVE_HIGH;
>> +	}
>> +
>>  	/* Functions mapped to NULL should not be mapped to the sensor */
>>  	if (!func)
>>  		return 0;
> 

