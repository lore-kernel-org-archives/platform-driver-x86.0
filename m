Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E33EC001B0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 09:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235100AbjGNJM2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 05:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235596AbjGNJM1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 05:12:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A46EE65
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 02:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689325899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Oz5cA4ed+MdOUIng2fkmEfPGztgFulUShCUaqINIklk=;
        b=bxkDHppasvAVfBuoZob1KUxP4Qdsx9zH+PBKQg+q0uinZFDRcaE0K5qs1+VfIo1SVZm4ee
        WNhEaElLNNWn33dLAdTu9Tq4Rs2vMEfeo1gizn5zkShnO68iTjqyB5qZm0at4xC70SIdWP
        p1VXNZl2Alxh8ai/pEFt29KlV//jlIc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-AleDpt-XP-SXFNcekkxLiQ-1; Fri, 14 Jul 2023 05:11:38 -0400
X-MC-Unique: AleDpt-XP-SXFNcekkxLiQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-993e73a4c4fso102460966b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 02:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689325896; x=1691917896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz5cA4ed+MdOUIng2fkmEfPGztgFulUShCUaqINIklk=;
        b=dKR37jw9Kzje89Mv9Ie0S+c0nWKVRnWzUdRdf6rMrZj7DB9De3x1hWakgUt0TsDMt9
         4dcrEVgztQ2rqdRyDE0eGBBbhZCiOKQgMPrhg41cogSTF0XQgbxhsCdxuR3ZkrEbxHz5
         68QeooM8l4kzI8rtO8Qr4CwV5yIzgx4C4xSHnJjEIdhRClHVfvW4qOhtz7bd9VZjmZvT
         TBPEs1wTEAhLItqYcUi6+fkVXHwOc8hlKhEFp/YhpkshIPlipcBfyy+1OwSa+2emJUja
         BYGYdqhcvNjdx1R3+eWOm33ilx9Qgl0Q8cMe23uHZQti191EB2tToH/VeHyWSa0CpKuU
         MQmA==
X-Gm-Message-State: ABy/qLZ+eWg+LiyQVrQNICDZxdBJZ5+1GdSw14I1PEeTdqu0rW+b+AOS
        sNgQseZgKyP1biDuZpdVn2TDWf9zqERhGUOxUIWRym+t5wVODuOOGed+VrL1vKaNA0n7c5E46IB
        fZAUNnNKLoNRmxXdT90qmT+jO+t3x7qJ7j13yEikFsw==
X-Received: by 2002:a17:906:4a44:b0:98e:2423:708 with SMTP id a4-20020a1709064a4400b0098e24230708mr3493248ejv.62.1689325896699;
        Fri, 14 Jul 2023 02:11:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHMqYUl+RuWwxljNsbDozpchVgTqPg+fuXjqohGDwdpTnC+3uTeqM2UnImpo0TvX00QciY2dQ==
X-Received: by 2002:a17:906:4a44:b0:98e:2423:708 with SMTP id a4-20020a1709064a4400b0098e24230708mr3493242ejv.62.1689325896391;
        Fri, 14 Jul 2023 02:11:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906261a00b00992f8110a2bsm5155451ejc.150.2023.07.14.02.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 02:11:35 -0700 (PDT)
Message-ID: <afd71be9-273d-820d-c53e-dfea5cd09b70@redhat.com>
Date:   Fri, 14 Jul 2023 11:11:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Archos
 101 Cesium Educ tablet
To:     "tomlohave@gmail.com" <tomlohave@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20230707141425.21473-1-tomlohave@gmail.com>
 <e1c30d28-97d3-3f4c-d870-08cf5922f417@redhat.com>
 <7b07070a-0889-79f9-0be0-ffc9bd81fd72@gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <7b07070a-0889-79f9-0be0-ffc9bd81fd72@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/14/23 09:53, tomlohave@gmail.com wrote:
> Le 11/07/2023 à 12:14, Hans de Goede a écrit :
> Hi,
>> Hi,
>>
>> On 7/7/23 16:14, Thomas GENTY wrote:
>>> Add info for the Archos 101 Cesium Educ tablet
>>> It was tested using gslx680_ts_acpi module
>>> PR at https://github.com/onitake/gsl-firmware/pull/210 for the firmware
>>>
>>> Signed-off-by: Thomas GENTY <tomlohave@gmail.com>
>> Thank you for your patch, I've applied this patch to my fixes
>> branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes
>>
>> Note it will show up in my fixes branch once I've pushed my
>> local branch there, which might take a while.
>>
>> I will include this patch in my next fixes pull-req to Linus
>> for the current kernel development cycle.
>>
>> Note I do wonder if this tablet can benefit from then following change on top when used with the kernel's builtin silead driver:
> 
> It can,

Good.

> I will submit a new patch with this enable and correct the previous one. it seems I have inverted all axes

I have already send out this one to Linus and it already is in Linus' master branch:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/platform/x86/touchscreen_dmi.c

So please make the new patch a follow-up patch. I'll make sure that the follow-up
also gets sends to Linus before 6.5 gets released.

Regards,

Hans



>> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
>> index a5b687eed8f3..5f9ce4960861 100644
>> --- a/drivers/platform/x86/touchscreen_dmi.c
>> +++ b/drivers/platform/x86/touchscreen_dmi.c
>> @@ -32,6 +32,7 @@ static const struct property_entry archos_101_cesium_educ_props[] = {
>>       PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
>>       PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
>>       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
>> +    PROPERTY_ENTRY_BOOL("silead,home-button"),
>>       PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-archos-101-cesium-educ.fw"),
>>       { }
>>   };
>>
>> I expect this will make the windows logo beneath the touchscreen send meta/super key events when pressed (you can check this with e.g. evtest).
>>
>> Can you please give this a go ?
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> ---
>>>   drivers/platform/x86/touchscreen_dmi.c | 22 ++++++++++++++++++++++
>>>   1 file changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
>>> index 68e66b60445c..a5b687eed8f3 100644
>>> --- a/drivers/platform/x86/touchscreen_dmi.c
>>> +++ b/drivers/platform/x86/touchscreen_dmi.c
>>> @@ -26,6 +26,21 @@ struct ts_dmi_data {
>>>     /* NOTE: Please keep all entries sorted alphabetically */
>>>   +static const struct property_entry archos_101_cesium_educ_props[] = {
>>> +    PROPERTY_ENTRY_U32("touchscreen-size-x", 1280),
>>> +    PROPERTY_ENTRY_U32("touchscreen-size-y", 1850),
>>> +    PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
>>> +    PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
>>> +    PROPERTY_ENTRY_U32("silead,max-fingers", 10),
>>> +    PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-archos-101-cesium-educ.fw"),
>>> +    { }
>>> +};
>>> +
>>> +static const struct ts_dmi_data archos_101_cesium_educ_data = {
>>> +    .acpi_name      = "MSSL1680:00",
>>> +    .properties     = archos_101_cesium_educ_props,
>>> +};
>>> +
>>>   static const struct property_entry chuwi_hi8_props[] = {
>>>       PROPERTY_ENTRY_U32("touchscreen-size-x", 1665),
>>>       PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
>>> @@ -1047,6 +1062,13 @@ static const struct ts_dmi_data vinga_twizzle_j116_data = {
>>>     /* NOTE: Please keep this table sorted alphabetically */
>>>   const struct dmi_system_id touchscreen_dmi_table[] = {
>>> +    {
>>> +        /* Archos 101 Cesium Educ */
>>> +        .driver_data = (void *)&archos_101_cesium_educ_data,
>>> +        .matches = {
>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "ARCHOS 101 Cesium Educ"),
>>> +        },
>>> +    },
>>>       {
>>>           /* Chuwi Hi8 */
>>>           .driver_data = (void *)&chuwi_hi8_data,
> 
> 

