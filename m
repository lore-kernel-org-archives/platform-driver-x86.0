Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACC6EB64DA
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 08:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234752AbjGNICK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 04:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234685AbjGNIBs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 04:01:48 -0400
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB44D4490
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 00:59:15 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so15698295e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 00:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689321208; x=1691913208;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VnzLIXQJ6Fo+rbQEX9HKoCFsy1VRjWhsX6exBoFYgOU=;
        b=oBWcuCu0N1x7g7UYV8zWQBI3AJWskeLAOWA4wxFHjre3ub1oDJn9melhXNFL+NUm5D
         UJPadUkNeyCNF2NpgbapixfWGXyb0jSkMyHH1emZPmiFUG8DEn3ErTVuHeqwd2do0Unh
         G2JUDEFjZw4mpXqDQTWXQvvclBU41aC/+j2z0tQ6dudH4loemRA3RtCGZekzOxz2ziQ+
         wIoTakEtW60X9dXRgFeWOBc2XNNKlpl9k5ldj78dnDavlQUkADPllAupcNYToeUYUBgn
         i0kQx23fWiUkldjWAVxVov/8HQzsRzGeNvWOwh3dTL+0Z6k6qao4Vn4SJmt+9HFhhHvu
         60cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689321208; x=1691913208;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnzLIXQJ6Fo+rbQEX9HKoCFsy1VRjWhsX6exBoFYgOU=;
        b=T+TY9Ooe3TFpdFLHjEhRhRo8SHkjYui/5Amv34x1CUhQt/3a+VmfO8yFec1oyL86JJ
         JpV/TtNqAZAJuLI1QknUFa8KG69qIV9Rlt6R3V07kQlYLA/xiCzNYG02RDmlMst/l6Fq
         DGAdbG5pyfzpRupg/w0WU/0ZoJCG2jc2l/IjO8KzTLCmM6MYEfn4ZNwWm5Dnex0AkSuX
         9X/V0lVddNgUt7/Lfvamm/d4zOdFGapxi1TsngyMByJt4U2DuLjYzbCrRdpw/AC506ru
         FGOihgKRItMF8sQR+MMiRDUPHLDO+uSC1tgZcOrp+u5zYqVVnCg0L4x8rZ6PXVDd4jgz
         m9zg==
X-Gm-Message-State: ABy/qLYIGAYVtfqpoBgjyIaJNs2OTZdyvQ/ISBj8YCx5Hcom2MyiVon7
        WDc+kgpsCE0bwy+STsDveWcBYH2VToWWdg==
X-Google-Smtp-Source: APBJJlHw9DHKZyBgiF94IfzwpwqUfZP1EiZlR9zB46XlBfMSWd5O9eNHhkzVffv8XjEAmiyygYI+aw==
X-Received: by 2002:a1c:4b13:0:b0:3f9:ba2:5d19 with SMTP id y19-20020a1c4b13000000b003f90ba25d19mr3445197wma.33.1689321207328;
        Fri, 14 Jul 2023 00:53:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:a9f:60f0:5d0b:d730:cb58:674c? ([2a01:e0a:a9f:60f0:5d0b:d730:cb58:674c])
        by smtp.gmail.com with ESMTPSA id r2-20020a056000014200b00315a57f1128sm9338802wrx.115.2023.07.14.00.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 00:53:26 -0700 (PDT)
Message-ID: <7b07070a-0889-79f9-0be0-ffc9bd81fd72@gmail.com>
Date:   Fri, 14 Jul 2023 09:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Archos
 101 Cesium Educ tablet
To:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
References: <20230707141425.21473-1-tomlohave@gmail.com>
 <e1c30d28-97d3-3f4c-d870-08cf5922f417@redhat.com>
Content-Language: fr
From:   "tomlohave@gmail.com" <tomlohave@gmail.com>
In-Reply-To: <e1c30d28-97d3-3f4c-d870-08cf5922f417@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Le 11/07/2023 à 12:14, Hans de Goede a écrit :
Hi,
> Hi,
>
> On 7/7/23 16:14, Thomas GENTY wrote:
>> Add info for the Archos 101 Cesium Educ tablet
>> It was tested using gslx680_ts_acpi module
>> PR at https://github.com/onitake/gsl-firmware/pull/210 for the firmware
>>
>> Signed-off-by: Thomas GENTY <tomlohave@gmail.com>
> Thank you for your patch, I've applied this patch to my fixes
> branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes
>
> Note it will show up in my fixes branch once I've pushed my
> local branch there, which might take a while.
>
> I will include this patch in my next fixes pull-req to Linus
> for the current kernel development cycle.
>
> Note I do wonder if this tablet can benefit from then following change on top when used with the kernel's builtin silead driver:

It can,

I will submit a new patch with this enable and correct the previous one. 
it seems I have inverted all axes

Regards,

Tom

>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index a5b687eed8f3..5f9ce4960861 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -32,6 +32,7 @@ static const struct property_entry archos_101_cesium_educ_props[] = {
>   	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
>   	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
>   	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
>   	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-archos-101-cesium-educ.fw"),
>   	{ }
>   };
>
> I expect this will make the windows logo beneath the touchscreen send meta/super key events when pressed (you can check this with e.g. evtest).
>
> Can you please give this a go ?
>
> Regards,
>
> Hans
>
>
>
>
>> ---
>>   drivers/platform/x86/touchscreen_dmi.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
>> index 68e66b60445c..a5b687eed8f3 100644
>> --- a/drivers/platform/x86/touchscreen_dmi.c
>> +++ b/drivers/platform/x86/touchscreen_dmi.c
>> @@ -26,6 +26,21 @@ struct ts_dmi_data {
>>   
>>   /* NOTE: Please keep all entries sorted alphabetically */
>>   
>> +static const struct property_entry archos_101_cesium_educ_props[] = {
>> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1280),
>> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1850),
>> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
>> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
>> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
>> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-archos-101-cesium-educ.fw"),
>> +	{ }
>> +};
>> +
>> +static const struct ts_dmi_data archos_101_cesium_educ_data = {
>> +	.acpi_name      = "MSSL1680:00",
>> +	.properties     = archos_101_cesium_educ_props,
>> +};
>> +
>>   static const struct property_entry chuwi_hi8_props[] = {
>>   	PROPERTY_ENTRY_U32("touchscreen-size-x", 1665),
>>   	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
>> @@ -1047,6 +1062,13 @@ static const struct ts_dmi_data vinga_twizzle_j116_data = {
>>   
>>   /* NOTE: Please keep this table sorted alphabetically */
>>   const struct dmi_system_id touchscreen_dmi_table[] = {
>> +	{
>> +		/* Archos 101 Cesium Educ */
>> +		.driver_data = (void *)&archos_101_cesium_educ_data,
>> +		.matches = {
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "ARCHOS 101 Cesium Educ"),
>> +		},
>> +	},
>>   	{
>>   		/* Chuwi Hi8 */
>>   		.driver_data = (void *)&chuwi_hi8_data,


