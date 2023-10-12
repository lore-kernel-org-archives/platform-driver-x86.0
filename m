Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24500CDB46E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Oct 2023 12:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343875AbjJLMbO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Oct 2023 08:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347216AbjJLMbN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Oct 2023 08:31:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC88C6
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Oct 2023 05:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697113826;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B/L1QqxL2zw+fKJFgSXRuXKGTK17rRpN2f/Rbsmu6oM=;
        b=LOQbRl05aHr6EMN6mqKZGiRbNjq4jiWfXVpQCiLBcGkjnt0vZbLkHEAt8dJxLNuSfxpS+z
        5bSnmg9z6Q3513UfXNp8tJQcUHW5+80wYSu09CSW5od1cSea5R/j2O9/BKJkENAT2Fiu1e
        zor29YwlqmCOEZAb+nYBoJ9aU7RkTrA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-0V2AXWMCNveEuZjhHq4uXA-1; Thu, 12 Oct 2023 08:30:25 -0400
X-MC-Unique: 0V2AXWMCNveEuZjhHq4uXA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9bd86510329so70210166b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Oct 2023 05:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697113824; x=1697718624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/L1QqxL2zw+fKJFgSXRuXKGTK17rRpN2f/Rbsmu6oM=;
        b=YP4WC56x4a8T29pWasy/hs033lasHyrLUeUHH94ilOYfNQSZQWYqZUG5JHpjR/EJxt
         Tcojnxb5QbKq0HUt0eH8kSzMNSYh2vni3vJB0rAD+uomXFHOpczSDv+xnVb9cFiYueOV
         EnK0/XnV+qqTY5EJUHa0Rw2RjBBoZx906iPY4Jy30fsp5QzLPos8O7jekbA3FQA2c0G2
         unpqyOPBYDwmkVv5HI7kvbCgI5q4+ynt/gNimxyb7fWdrZw99dH5JjknhnJQLD2hhq+q
         QrKBAv+i+YGvlF/j+I/tWiMPIUGcRhPw3D278VhUEzoHTWetIjowGf3SaseJsC+CmPLf
         YXbw==
X-Gm-Message-State: AOJu0YxeyY9jyB9M3UGFLxMVw4U0ZydmqjPlKV9GVKLe5R5dYDHVK0cI
        lR8ITsowK+cpBSfU18nrGkBNF0U93tnNuRrCvSLZc2//RSm1yN0iMwxt6qjWBUoEEy17Qd+jyA1
        TSB/T70TwOJzy0IoVNUilrF8n6pO1bE6N8A==
X-Received: by 2002:a17:906:cc5a:b0:9ae:59c9:b831 with SMTP id mm26-20020a170906cc5a00b009ae59c9b831mr21648677ejb.49.1697113824181;
        Thu, 12 Oct 2023 05:30:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsVW6r0vayhK1t5+6SDIiG3MAEamj7D+5obne7YzZNv16j1kTkQ9K6WjNgMazCPAZsj9SDPQ==
X-Received: by 2002:a17:906:cc5a:b0:9ae:59c9:b831 with SMTP id mm26-20020a170906cc5a00b009ae59c9b831mr21648662ejb.49.1697113823791;
        Thu, 12 Oct 2023 05:30:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ko18-20020a170907987200b0099275c59bc9sm11090787ejc.33.2023.10.12.05.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:30:22 -0700 (PDT)
Message-ID: <31d94daf-9d82-f7df-3174-62cae165c218@redhat.com>
Date:   Thu, 12 Oct 2023 14:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/5] platform/x86: msi-ec: Register a platform driver
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Nikita Kravets <teackot@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
References: <20231010172037.611063-3-teackot@gmail.com>
 <20231010172037.611063-5-teackot@gmail.com>
 <24cc4f6c-f94a-6d66-2476-da317c5b63a4@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <24cc4f6c-f94a-6d66-2476-da317c5b63a4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/11/23 15:00, Ilpo Järvinen wrote:
> On Tue, 10 Oct 2023, Nikita Kravets wrote:
> 
>> Register a platform driver for the future features.
>>
>> Cc: Aakash Singh <mail@singhaakash.dev>
>> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
>> Signed-off-by: Nikita Kravets <teackot@gmail.com>
>> ---
>>  drivers/platform/x86/msi-ec.c | 44 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
>> index f26a3121092f..12c559c9eac4 100644
>> --- a/drivers/platform/x86/msi-ec.c
>> +++ b/drivers/platform/x86/msi-ec.c
>> @@ -818,6 +818,30 @@ static struct acpi_battery_hook battery_hook = {
>>  	.name = MSI_EC_DRIVER_NAME,
>>  };
>>  
>> +/*
>> + * Sysfs platform driver
>> + */
>> +
>> +static int msi_platform_probe(struct platform_device *pdev)
>> +{
>> +	return 0;
>> +}
>> +
>> +static int msi_platform_remove(struct platform_device *pdev)
>> +{
>> +	return 0;
>> +}
> 
> No need to provide empty .probe() or .remove().
> 
>> +static struct platform_device *msi_platform_device;
>> +
>> +static struct platform_driver msi_platform_driver = {
>> +	.driver = {
>> +		.name = MSI_EC_DRIVER_NAME,
>> +	},
>> +	.probe = msi_platform_probe,
>> +	.remove = msi_platform_remove,
>> +};
>> +
>>  /*
>>   * Module load/unload
>>   */
>> @@ -878,6 +902,23 @@ static int __init msi_ec_init(void)
>>  	if (result < 0)
>>  		return result;
>>  
>> +	result = platform_driver_register(&msi_platform_driver);
>> +	if (result < 0)
>> +		return result;
>> +
>> +	msi_platform_device = platform_device_alloc(MSI_EC_DRIVER_NAME, -1);
>> +	if (msi_platform_device == NULL) {
>> +		platform_driver_unregister(&msi_platform_driver);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	result = platform_device_add(msi_platform_device);
>> +	if (result < 0) {
>> +		platform_device_del(msi_platform_device);
>> +		platform_driver_unregister(&msi_platform_driver);
>> +		return result;
> 
> Instead of duplicating error handling, make a proper rollback with goto 
> and labels, or better yet, use the cleanup.h if you know how it works.

Actually it would be better for a driver like this to use
platform_create_bundle(), see e.g. the last couple of lines
from:

drivers/platform/x86/x86-android-tablets/core.c

This will do both the platform_device registration as well
as the driver registration in one go avoiding the need
for rollback on error and it will also allow probe()
and all functions only used by probe() to be marked
as __init so that they can be free-ed from memory
once msi_ec_init() has completed running.

Regards,

Hans




> 
>> +	}
>> +
>>  	battery_hook_register(&battery_hook);
>>  	return 0;
>>  }
>> @@ -885,6 +926,9 @@ static int __init msi_ec_init(void)
>>  static void __exit msi_ec_exit(void)
>>  {
>>  	battery_hook_unregister(&battery_hook);
>> +
>> +	platform_driver_unregister(&msi_platform_driver);
>> +	platform_device_del(msi_platform_device);
>>  }
>>  
>>  MODULE_LICENSE("GPL");
>>
> 

