Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16581EB64D7
	for <platform-driver-x86@archiver.kernel.org>; Fri, 16 Jun 2023 17:01:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345989AbjFPRBe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 16 Jun 2023 13:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345991AbjFPRBT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jun 2023 13:01:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1EBB30E4
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jun 2023 10:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686934826;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TMEYPvCeN5cEb2SHQ5Bw9MAoGxPXKSmXqyB2tqhOLgo=;
        b=c7ouNw92DM1gIHeza831b2RHOv9/WKXSorKaFLwkjEDt9jiimtN7kSf1ZdI7/+znbuyIrx
        4Q7GXK+QG/zKkTr78U/XunYD5GsEj6qkwyr+kJ07GIB9CW49FH8iIpPh69tkhVvEnqNZCu
        YMe2hht5rsr0nz3BIOMj6HN7SIjyxmQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-eZyiqKhCOzKnPnPV3WL_gA-1; Fri, 16 Jun 2023 13:00:25 -0400
X-MC-Unique: eZyiqKhCOzKnPnPV3WL_gA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-982b961f2e0so60136566b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jun 2023 10:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686934823; x=1689526823;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TMEYPvCeN5cEb2SHQ5Bw9MAoGxPXKSmXqyB2tqhOLgo=;
        b=K1AMpruEb4mId2Ig5tXQ2Qj9gsyaO8tNC83dmXj7miyIGX0PYd6NcSphe6TBLyLFkZ
         ssy2eFq1u4T9p/wgADsamJwEKZCkhNoaJEBjZ/7YtcyPbomnQo9shQp8jjNBZBPbskpP
         fnMG2eizh4dlR5TYpZ1OF1sxdt5KlZUg/lQMlw14dRfzPyrB+1SXlHxUQvJqnFYViUim
         sqK3gAG/gDcqVQw1hQg7ZtlS2+TpXhCO6CrVbhzjtFfYoacreG73qgWlFWxHwbf4ex08
         iVRnqLu51gMD+lUrVVRtnv4x4Klg51zavIOIGWLUHVkrjcVJR0IQfuEgwcUBqXmcuc55
         O3JQ==
X-Gm-Message-State: AC+VfDwfx8QtDQFWZqUUqnxbxzRBAgKinKqGQcxTS2foomMGQZq/rQQ0
        Yk1CuN97ohtbkmoy6C+YUx1soDxO8jY/zQGEOjYH+BoPZsEfni9TqHDipZ+1utY98sV0k/Y2Qnh
        1wBkz4ugagBo1UESgEZ9HwhMLmrguJLXgJg==
X-Received: by 2002:a17:906:6a28:b0:970:e80:e29a with SMTP id qw40-20020a1709066a2800b009700e80e29amr2560094ejc.68.1686934823116;
        Fri, 16 Jun 2023 10:00:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7O4KgDfwlAADMby8HSo0sQ4nga9BCXYihAhS5cmywqiKx3M6IKO/Z9f05aCxyN2WC/REM9LA==
X-Received: by 2002:a17:906:6a28:b0:970:e80:e29a with SMTP id qw40-20020a1709066a2800b009700e80e29amr2560072ejc.68.1686934822717;
        Fri, 16 Jun 2023 10:00:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id re6-20020a170906d8c600b00982aca1560asm2234743ejb.219.2023.06.16.10.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 10:00:22 -0700 (PDT)
Message-ID: <ce32faae-0913-bc30-6e29-d4d124efba96@redhat.com>
Date:   Fri, 16 Jun 2023 19:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/4] platform/x86: int3472: discrete: Remove
 sensor_config-s
Content-Language: en-US, nl
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20230609204228.74967-1-hdegoede@redhat.com>
 <20230609204228.74967-3-hdegoede@redhat.com>
 <471be538-7d70-5cf3-67ce-28d5a9480b4b@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <471be538-7d70-5cf3-67ce-28d5a9480b4b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dan,

On 6/16/23 14:34, Dan Scally wrote:
> Hi Hans
> 
> On 09/06/2023 21:42, Hans de Goede wrote:
>> Currently the only 2 sensor_config-s both specify "avdd" as supply-id.
>>
>> The INT3472 device is going to be the only supplier of a regulator for
>> the sensor device.
>>
>> So there is no chance of collisions with other regulator suppliers
>> and it is undesirable to need to manually add new entries to
>> int3472_sensor_configs[] for each new sensor module which uses
>> a GPIO regulator.
>>
>> Instead just always use "avdd" as supply-id when registering
>> the GPIO regulator.
>>
>> If necessary for specific sensor drivers then other supply-ids can
>> be added as aliases in the future, adding aliases will be safe
>> since INT3472 will be the only regulator supplier for the sensor.
>>
>> Cc: Hao Yao <hao.yao@intel.com>
>> Cc: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   .../x86/intel/int3472/clk_and_regulator.c     | 38 ++++++++++------
>>   drivers/platform/x86/intel/int3472/common.h   |  7 +--
>>   drivers/platform/x86/intel/int3472/discrete.c | 45 +++----------------
>>   3 files changed, 31 insertions(+), 59 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> index b3a55c618151..30686091300d 100644
>> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> @@ -232,32 +232,42 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
>>       gpiod_put(int3472->clock.ena_gpio);
>>   }
>>   +/*
>> + * The INT3472 device is going to be the only supplier of a regulator for
>> + * the sensor device. But unlike the clk framework the regulator framework
>> + * does not allow matching by consumer-device-name only.
>> + *
>> + * Ideally all sensor drivers would use "avdd" as supply-id. But for drivers
>> + * where this cannot be changed because another supply-id is already used in
>> + * e.g. DeviceTree files an alias for the other supply-id can be added here.
>> + *
>> + * Do not forget to update GPIO_REGULATOR_SUPPLY_MAP_COUNT when changing this.
>> + */
>> +static const char * const skl_int3472_regulator_map_supplies[] = {
>> +    "avdd",
>> +};
>> +
>>   int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>>                      struct acpi_resource_gpio *agpio)
>>   {
>> -    const struct int3472_sensor_config *sensor_config;
>>       char *path = agpio->resource_source.string_ptr;
>> -    struct regulator_consumer_supply supply_map;
>>       struct regulator_init_data init_data = { };
>>       struct regulator_config cfg = { };
>> -    int ret;
>> +    int i, ret;
>>   -    sensor_config = int3472->sensor_config;
>> -    if (IS_ERR(sensor_config)) {
>> -        dev_err(int3472->dev, "No sensor module config\n");
>> -        return PTR_ERR(sensor_config);
>> +    if (ARRAY_SIZE(skl_int3472_regulator_map_supplies) != GPIO_REGULATOR_SUPPLY_MAP_COUNT) {
>> +        dev_err(int3472->dev, "Internal error ARRAY_SIZE(skl_int3472_regulator_map_supplies) != GPIO_REGULATOR_SUPPLY_MAP_COUNT\n");
>> +        return -EINVAL;
> 
> 
> It would be nice to be able to prevent this mismatch somehow so it's never a problem; can we use static_assert() perhaps? Or at least less of a problem, as I gather that gets compiled to a no-op sometimes.

Using static_assert() in the header file indeed seems to be better. I'll prep a v2 with this (and drop the v1 from my review-hans branch).


>>       }
>>   -    if (!sensor_config->supply_map.supply) {
>> -        dev_err(int3472->dev, "No supply name defined\n");
>> -        return -ENODEV;
>> +    for (i = 0; i < ARRAY_SIZE(skl_int3472_regulator_map_supplies); i++) {
>> +        int3472->regulator.supply_map[i].supply = skl_int3472_regulator_map_supplies[i];
>> +        int3472->regulator.supply_map[i].dev_name = int3472->sensor_name;
>>       }
>>         init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
>> -    init_data.num_consumer_supplies = 1;
>> -    supply_map = sensor_config->supply_map;
>> -    supply_map.dev_name = int3472->sensor_name;
>> -    init_data.consumer_supplies = &supply_map;
>> +    init_data.consumer_supplies = int3472->regulator.supply_map;
>> +    init_data.num_consumer_supplies = GPIO_REGULATOR_SUPPLY_MAP_COUNT;
>>         snprintf(int3472->regulator.regulator_name,
>>            sizeof(int3472->regulator.regulator_name), "%s-regulator",
>> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
>> index 735567f374a6..225b067c854d 100644
>> --- a/drivers/platform/x86/intel/int3472/common.h
>> +++ b/drivers/platform/x86/intel/int3472/common.h
>> @@ -28,6 +28,7 @@
>>     #define GPIO_REGULATOR_NAME_LENGTH                21
>>   #define GPIO_REGULATOR_SUPPLY_NAME_LENGTH            9
>> +#define GPIO_REGULATOR_SUPPLY_MAP_COUNT                1
>>     #define INT3472_LED_MAX_NAME_LEN                32
>>   @@ -69,11 +70,6 @@ struct int3472_cldb {
>>       u8 reserved2[17];
>>   };
>>   -struct int3472_sensor_config {
>> -    const char *sensor_module_name;
>> -    struct regulator_consumer_supply supply_map;
>> -};
>> -
>>   struct int3472_discrete_device {
>>       struct acpi_device *adev;
>>       struct device *dev;
>> @@ -83,6 +79,7 @@ struct int3472_discrete_device {
>>       const struct int3472_sensor_config *sensor_config;
>>         struct int3472_gpio_regulator {
>> +        struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT];
>>           char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
>>           char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
>>           struct gpio_desc *gpio;
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index 2ab3c7466986..3b410428cec2 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -34,48 +34,17 @@ static const guid_t cio2_sensor_module_guid =
>>       GUID_INIT(0x822ace8f, 0x2814, 0x4174,
>>             0xa5, 0x6b, 0x5f, 0x02, 0x9f, 0xe0, 0x79, 0xee);
>>   -/*
>> - * Here follows platform specific mapping information that we can pass to
>> - * the functions mapping resources to the sensors. Where the sensors have
>> - * a power enable pin defined in DSDT we need to provide a supply name so
>> - * the sensor drivers can find the regulator. The device name will be derived
>> - * from the sensor's ACPI device within the code.
>> - */
>> -static const struct int3472_sensor_config int3472_sensor_configs[] = {
>> -    /* Lenovo Miix 510-12ISK - OV5648, Rear */
>> -    { "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL) },
>> -    /* Surface Go 1&2 - OV5693, Front */
>> -    { "YHCU", REGULATOR_SUPPLY("avdd", NULL) },
>> -};
>> -
>> -static const struct int3472_sensor_config *
>> -skl_int3472_get_sensor_module_config(struct int3472_discrete_device *int3472)
>> +static void skl_int3472_log_sensor_module_name(struct int3472_discrete_device *int3472)
> 
> 
> I don't really think this is worth logging if we're removing the matching based on it - we can get it from the DSDT anyway if we need to.

The DSDTs on these devices often read this from some memory location
rather then specifying it directly in the DSDT, so the only way to
get this often is to actually call the DSM.

Note this is logged with a dev_dbg, so normally users won't see this,
but I think this may be handy for debugging sometimes.

Regards,

Hans



