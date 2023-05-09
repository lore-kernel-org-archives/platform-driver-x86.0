Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51A7C77B75
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 09:35:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjEIJfi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 05:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235216AbjEIJfc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 05:35:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1187559D
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 02:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683624797;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3DqN4EpHaajx4zOoEtXzxcBzD7rKTtkuAzpk2BLcTfs=;
        b=GmNZ005giBFuwRHRmv7iaCnwwImfeTLT7iYM/wkImjfOoZhpaMYDIbDfrF73oNuKF3hp/U
        gpovSWHtEKJ2oAoV3w8CMBf3w4QQhQ8pkvXhlUIfXItShkz5/B5FNQGrsJlCeoAbCRdeJE
        ICz+DnAAOtJfrNvEkfJdbDPO3VvGaEo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-FyIa5-74Pkmln3cGcbV2Zg-1; Tue, 09 May 2023 05:33:15 -0400
X-MC-Unique: FyIa5-74Pkmln3cGcbV2Zg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-965e5cfca7cso513129566b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 May 2023 02:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683624794; x=1686216794;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3DqN4EpHaajx4zOoEtXzxcBzD7rKTtkuAzpk2BLcTfs=;
        b=OVf9T70fGAZ5lHFxH09Yd8A8ZR/bCDMqoO9a8vutJkQx7qbLOYA35kfASKterXBBnc
         8WMNBTJLKr404XUEhbODgsVlFWzo14Wioju2NKuk0ch0o1Dgrj4q9aesEC3VrXc+Uuj8
         Sb4Se/ESBxEIb2eENfdR1fAMFv2iHWA0uvyEALEyQ5AAk4RtkoAVPbNjnRfN3HtUIHgA
         W5SdjFDAHZnrmjZ2bWiqFBolIqdjBAqTNE+qX38058HGbwfQL8yBvli1TEYrMLeSKmn5
         OEzbh//HY5CTbQG8uJKR0Wvf77jMq8PML4eyKwWAQCBw239StasCDmy1065AeATM1BwE
         oljg==
X-Gm-Message-State: AC+VfDzkQ4HBzZdZfDH219LFHIiFv5WwIklYaf7X4TVxNcWwNQAf0siU
        Fxx6/iRGDWy15vUMUHjqsugsizrCR8Q7rIo4bCqVgf3r6rUzAm+xyoK1ECXlp0O9k83U1TlAdp+
        8FFjdaai+fEfbUolhWCK1J6fA1T8dFa3Eig==
X-Received: by 2002:a17:907:628c:b0:94f:2a13:4e01 with SMTP id nd12-20020a170907628c00b0094f2a134e01mr10892135ejc.74.1683624794281;
        Tue, 09 May 2023 02:33:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4bR1mc9kftbZTEF4Vk1yebET7PxZAiiRHPHkiGAih8siZMbXeZXy0M2M+VVl0uKLo1PM/hlg==
X-Received: by 2002:a17:907:628c:b0:94f:2a13:4e01 with SMTP id nd12-20020a170907628c00b0094f2a134e01mr10892116ejc.74.1683624793937;
        Tue, 09 May 2023 02:33:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id jz14-20020a17090775ee00b00969cbd5718asm893811ejc.48.2023.05.09.02.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 02:33:13 -0700 (PDT)
Message-ID: <73f63b9c-d9c6-6abc-da2f-cc82ff93c58a@redhat.com>
Date:   Tue, 9 May 2023 11:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] platform/x86: x86-android-tablets: Add support for
 more then 1 gpio_key
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230505205901.42649-1-hdegoede@redhat.com>
 <aa70c911-d4b4-bdd8-66fa-9bcd4e8edcb7@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aa70c911-d4b4-bdd8-66fa-9bcd4e8edcb7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/8/23 09:38, Ilpo Järvinen wrote:
> On Fri, 5 May 2023, Hans de Goede wrote:
> 
>> Modify the gpio_keys support in x86_android_tablet_init() for
>> tablets which have more then 1 key/button which needs to be handled
>> by the gpio_keys driver.
>>
>> This requires copying over the struct gpio_keys_button from
>> the x86_gpio_button struct array to a new gpio_keys_button struct array,
>> as an added benefit this allows marking the per model x86_gpio_button
>> arrays __initconst so that they all can be freed after module init().
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../platform/x86/x86-android-tablets/asus.c   |  4 ++-
>>  .../platform/x86/x86-android-tablets/core.c   | 33 ++++++++++++-------
>>  .../platform/x86/x86-android-tablets/lenovo.c |  6 ++--
>>  .../platform/x86/x86-android-tablets/other.c  |  6 ++--
>>  .../x86-android-tablets/x86-android-tablets.h |  3 +-
>>  5 files changed, 35 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
>> index 2aca91678219..f9c4083be86d 100644
>> --- a/drivers/platform/x86/x86-android-tablets/asus.c
>> +++ b/drivers/platform/x86/x86-android-tablets/asus.c
>> @@ -24,7 +24,7 @@ static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
>>  	},
>>  };
>>  
>> -static struct x86_gpio_button asus_me176c_tf103c_lid = {
>> +static const struct x86_gpio_button asus_me176c_tf103c_lid __initconst = {
>>  	.button = {
>>  		.code = SW_LID,
>>  		.active_low = true,
>> @@ -175,6 +175,7 @@ const struct x86_dev_info asus_me176c_info __initconst = {
>>  	.serdev_info = asus_me176c_serdevs,
>>  	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
>>  	.gpio_button = &asus_me176c_tf103c_lid,
>> +	.gpio_button_count = 1,
>>  	.gpiod_lookup_tables = asus_me176c_gpios,
>>  	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
>>  	.modules = bq24190_modules,
>> @@ -317,6 +318,7 @@ const struct x86_dev_info asus_tf103c_info __initconst = {
>>  	.pdev_info = int3496_pdevs,
>>  	.pdev_count = 1,
>>  	.gpio_button = &asus_me176c_tf103c_lid,
>> +	.gpio_button_count = 1,
>>  	.gpiod_lookup_tables = asus_tf103c_gpios,
>>  	.bat_swnode = &asus_tf103c_battery_node,
>>  	.modules = bq24190_modules,
>> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
>> index 245167674aa2..0c7142f4eccc 100644
>> --- a/drivers/platform/x86/x86-android-tablets/core.c
>> +++ b/drivers/platform/x86/x86-android-tablets/core.c
>> @@ -124,6 +124,7 @@ static int serdev_count;
>>  static struct i2c_client **i2c_clients;
>>  static struct platform_device **pdevs;
>>  static struct serdev_device **serdevs;
>> +static struct gpio_keys_button *buttons;
>>  static struct gpiod_lookup_table * const *gpiod_lookup_tables;
>>  static const struct software_node *bat_swnode;
>>  static void (*exit_handler)(void);
>> @@ -238,6 +239,7 @@ static void x86_android_tablet_cleanup(void)
>>  		platform_device_unregister(pdevs[i]);
>>  
>>  	kfree(pdevs);
>> +	kfree(buttons);
>>  
>>  	for (i = 0; i < i2c_client_count; i++)
>>  		i2c_unregister_device(i2c_clients[i]);
>> @@ -353,22 +355,31 @@ static __init int x86_android_tablet_init(void)
>>  		}
>>  	}
>>  
>> -	if (dev_info->gpio_button) {
>> -		struct gpio_keys_platform_data pdata = {
>> -			.buttons = &dev_info->gpio_button->button,
>> -			.nbuttons = 1,
>> -		};
>> +	if (dev_info->gpio_button_count) {
>> +		struct gpio_keys_platform_data pdata = { };
>>  		struct gpio_desc *gpiod;
>>  
>> -		/* Get GPIO for the gpio-button */
>> -		ret = x86_android_tablet_get_gpiod(dev_info->gpio_button->chip,
>> -						   dev_info->gpio_button->pin, &gpiod);
>> -		if (ret < 0) {
>> +		buttons = kcalloc(dev_info->gpio_button_count, sizeof(*buttons), GFP_KERNEL);
>> +		if (!buttons) {
>>  			x86_android_tablet_cleanup();
>> -			return ret;
>> +			return -ENOMEM;
>> +		}
>> +
>> +		for (i = 0; i < dev_info->gpio_button_count; i++) {
>> +			buttons[i] = dev_info->gpio_button[i].button;
>> +			/* Get GPIO for the gpio-button */
>> +			ret = x86_android_tablet_get_gpiod(dev_info->gpio_button[i].chip,
>> +							   dev_info->gpio_button[i].pin, &gpiod);
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thank you.

> With the note that the comment seems to just spell out what the code does 
> so it feels useless.

That is a valid note. I've dropped the comment while merging this.

I've added this series to my review-hans (soon to be for-next) branch now.

Regards,

Hans



