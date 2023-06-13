Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E813C88CB4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Jun 2023 11:03:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241910AbjFMLDD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Jun 2023 07:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239863AbjFMLDB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2023 07:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2397F10D5
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 04:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686654136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ow+FjqcQ0Uj51qvV8xsI9bQJm+Wxo0EbXiSXPwMbH3c=;
        b=XUtXguFb3mPUpNrFBmCT+4L71SrPh3yKJRgWRpoo+jnWxlz9eFgo7tv97V80OCkO88rgvA
        jy3cdSgOjEyeGgrICkaX3yQD8stlDn5G33UdbD+mo9DsuxaKlmB9NmeDhZ1c1+cuP9ya3y
        H76PuIxT9UuMZzpNfW1X9rs7cfOfHto=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-XJyxGeAOPDqOdz9zbuzTbg-1; Tue, 13 Jun 2023 07:02:11 -0400
X-MC-Unique: XJyxGeAOPDqOdz9zbuzTbg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-514b2ee9af2so4393831a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 04:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686654130; x=1689246130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ow+FjqcQ0Uj51qvV8xsI9bQJm+Wxo0EbXiSXPwMbH3c=;
        b=YeeuXtIxpLZcK/L6a217vjEUljmmBU0rPgmAbnh6vHuXHChdP5q0IiueYlS7ZbXIFM
         tRTVqNvWRBXfJ8vh6jn8I3z5dRFYkSapmScyF6+4MVaDZAFUk5KtbV8ra/mkSAtc5fX6
         l1Gka0hwfDFQta8QlZQ4+4dlbDVvlWJXgKrMUjlG8XplrrJHJ6en+NMakXE9uR6Xa4Xw
         /VZDnWcy46wYpaELtUjrjTk1NjksKOtFJ3SZYQWfthzM1VJzQwiS26DM82beF9ctjxFw
         gDtsSloT81+qpt3/eO9hSnpSl/zd5+cj96vjzdt9GSlNzniI+JQXaXJBj5pipoDv+PFf
         HSbQ==
X-Gm-Message-State: AC+VfDz4qYLY0lZvH3xFOjYZK739RaFY9RBYaOsBnH3kPOXfdGMT5jp3
        l3AnCwI9l2Hh2yWPvMRUcEAjCWkFYAh0ML45UzYwVKwr9XYyI/PjFNilIlf6gr+ovzd7W5mYcut
        YLqTkJZQZ/bbdT/ki3lVNNMxK7Z9111jVkA==
X-Received: by 2002:a05:6402:1106:b0:50d:fba2:7265 with SMTP id u6-20020a056402110600b0050dfba27265mr7220126edv.16.1686654130222;
        Tue, 13 Jun 2023 04:02:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4UNGDecrSFepZZtmpFy1OLT1r8hsa2RWOGU1o2ZL/k4XJbnUHcSo/HzjwXsG0i/E1hPOMsJQ==
X-Received: by 2002:a05:6402:1106:b0:50d:fba2:7265 with SMTP id u6-20020a056402110600b0050dfba27265mr7220110edv.16.1686654129920;
        Tue, 13 Jun 2023 04:02:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a25-20020aa7d919000000b00511aea132b9sm6304622edr.3.2023.06.13.04.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 04:02:09 -0700 (PDT)
Message-ID: <a1549a2b-4fc7-b12d-42af-7ebdb916bac3@redhat.com>
Date:   Tue, 13 Jun 2023 13:02:08 +0200
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
References: <20230612141632.5232-1-hdegoede@redhat.com>
 <20230612141632.5232-2-hdegoede@redhat.com>
 <1b87ee9f-8de8-6923-111d-a9d889451d80@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1b87ee9f-8de8-6923-111d-a9d889451d80@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/13/23 10:10, Ilpo Järvinen wrote:
> On Mon, 12 Jun 2023, Hans de Goede wrote:
> 
>> The INT3472 discrete code assumes that the ACPI GPIO resources are
>> in the same order as the pin-info _DSM entries.
>>
>> The returned pin-info includes the pin-number in bits 15-8. Add a check
>> that this matches with the ACPI GPIO resource pin-number in case
>> the assumption is not true with some ACPI tables.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/intel/int3472/discrete.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index 4ef60883154d..c1132bbbff41 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -149,8 +149,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>  {
>>  	struct int3472_discrete_device *int3472 = data;
>>  	struct acpi_resource_gpio *agpio;
>> +	u8 active_value, pin, type;
>>  	union acpi_object *obj;
>> -	u8 active_value, type;
>>  	const char *err_msg;
>>  	const char *func;
>>  	u32 polarity;
>> @@ -174,10 +174,18 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>  		return 1;
>>  	}
>>  
>> +	/* Bits 7-0 contain the type/function of the pin */
>>  	type = obj->integer.value & 0xff;
>>  
>>  	int3472_get_func_and_polarity(type, &func, &polarity);
>>  
>> +	/* Bits 15-8 contain the pin-number on the GPIO chip */
>> +	pin = (obj->integer.value >> 8) & 0xff;
>> +	if (pin != agpio->pin_table[0])
>> +		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
>> +			 func, agpio->resource_source.string_ptr, pin,
>> +			 agpio->pin_table[0]);
>> +
>>  	/* If bits 31-24 of the _DSM entry are all 0 then the signal is inverted */
>>  	active_value = (obj->integer.value >> 24) & 0xff;
>>  	if (!active_value)
>>
> 
> These changes made me wonder why there aren't defines for the fields? 
> And then FIELD_GET() used to read the field. Most of those comments 
> would be documented by the define name itself.

That is a good idea for v2 I'll add a new 1/2 adding defines + switching
the existing cases to FIELD_GET() and I'll also switch to FIELD_GET()
here for v2.

Regards,

Hans




