Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4315344D6BD;
	Thu, 26 Feb 2026 20:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772136903; cv=none; b=sXR2a7e96AK/26AOGCUvmg1ofzwuGDEV22Prv/c9XgepqfAcTLjkKmqvyoQz/DsMtXUVaI3SZGSWBrjJdVMWH+Urq8skkA5Q8W2El2W2e41HvvMppFPqlCe7xyLUilpTJLSSyxys0aydmlaq1+9BDTQrguQXxdnKuNlUTn6tNFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772136903; c=relaxed/simple;
	bh=C+WUldlQUWym/qv1FWougfuMTAVfzgDS9ERrJqxX6as=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHysbjDTUX4ajiHpFihXvB0XiGpy9uRUlK1OdtYGpHTSIYZjUyPM9LPQ0fjWHbwqhe/qXjsz/+mVWGA9HbZQe9yIlFtwl8WSHLF1SSMd0JxL9CSWUbaEiHOfl4fDJ4aCwTutA5dmjPnWa3ysqmBcQfLCwz5OkCoy2XwkPPIOOOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Bnl45rhg; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Bnl45rhg"
Received: from [192.168.178.24] (i5C75F712.versanet.de [92.117.247.18])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 9F1AC2FC0048;
	Thu, 26 Feb 2026 21:14:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772136897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJGHG2Spj21rYTy2CiT1C4bJLUWNeAaQDQAH3FuGWcA=;
	b=Bnl45rhgjjC4MpI1MjaWckLdwwfLJlf00n7cjPPhXs5l7PxaTHMhj8Bo0nAwj503rnb20n
	YbwwEMmREUaHmvvZ5qHuBz3mrVpAdxQ3L3MIA+9BWDGhpTrzW+094VTDzvfeG3v7QPRSxq
	KgeqQmIMLhGq4IP81as7JChPNViBTRM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <904ff180-f0f9-4c7d-9ace-d82b663af33c@tuxedocomputers.com>
Date: Thu, 26 Feb 2026 21:14:56 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] platform/x86/uniwill: Apply features across all
 TUXEDO devices
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226003408.1623547-1-wse@tuxedocomputers.com>
 <20260226003408.1623547-3-wse@tuxedocomputers.com>
 <9830782e-e050-4a77-a35e-3a92fdb255a0@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <9830782e-e050-4a77-a35e-3a92fdb255a0@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 26.02.26 um 02:15 schrieb Armin Wolf:
> Am 26.02.26 um 01:31 schrieb Werner Sembach:
>
>> Uses the more fine granular and/or new feature defines to enable more
>> features across the TUXEDO device lineup.
>>
>> Also adds features defines that where already present, but not tested until
>> now.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 214 ++++++++++++++------
>>   1 file changed, 156 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 4d9657a3b8c10..88a323241c612 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -110,6 +110,8 @@
>>   #define EC_ADDR_BAT_CYCLE_COUNT_2    0x04A7
>>     #define EC_ADDR_PROJECT_ID        0x0740
>> +#define PROJECT_ID_PH4TRX1        0x12
>> +#define PROJECT_ID_PH6TRX1        0x15
>>     #define EC_ADDR_AP_OEM            0x0741
>>   #define    ENABLE_MANUAL_CTRL        BIT(0)
>> @@ -1819,6 +1821,15 @@ static struct platform_driver uniwill_driver = {
>>       .shutdown = uniwill_shutdown,
>>   };
>>   +static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor 
>> __initdata = {
>> +    .features = UNIWILL_FEATURE_SUPER_KEY |
>> +            UNIWILL_FEATURE_BATTERY |
>> +            UNIWILL_FEATURE_CPU_TEMP |
>> +            UNIWILL_FEATURE_GPU_TEMP |
>> +            UNIWILL_FEATURE_PRIMARY_FAN |
>> +            UNIWILL_FEATURE_SECONDARY_FAN,
>> +};
>> +
>>   static struct uniwill_device_descriptor lapac71h_descriptor __initdata = {
>>       .features = UNIWILL_FEATURE_FN_LOCK |
>>               UNIWILL_FEATURE_SUPER_KEY |
>> @@ -1842,6 +1853,85 @@ static struct uniwill_device_descriptor 
>> lapkc71f_descriptor __initdata = {
>>               UNIWILL_FEATURE_SECONDARY_FAN,
>>   };
>>   +/*
>> + * The featuresets below reflect somewhat chronological changes:
>> + * 1 -> 2: UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL is added to the EC firmware.
>> + * 2 -> 3: UNIWILL_FEATURE_USB_C_POWER_PRIORITY is removed from the EC 
>> firmware.
>> + * Some devices might divert from this timeline.
>> + */
>> +
>> +static struct uniwill_device_descriptor tux_featureset_1_descriptor 
>> __initdata = {
>> +    .features = UNIWILL_FEATURE_FN_LOCK |
>> +            UNIWILL_FEATURE_SUPER_KEY |
>> +            UNIWILL_FEATURE_CPU_TEMP |
>> +            UNIWILL_FEATURE_PRIMARY_FAN |
>> +            UNIWILL_FEATURE_SECONDARY_FAN |
>> +            UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
>> +};
>> +
>> +static struct uniwill_device_descriptor tux_featureset_1_nvidia_descriptor 
>> __initdata = {
>> +    .features = UNIWILL_FEATURE_FN_LOCK |
>> +            UNIWILL_FEATURE_SUPER_KEY |
>> +            UNIWILL_FEATURE_CPU_TEMP |
>> +            UNIWILL_FEATURE_GPU_TEMP |
>> +            UNIWILL_FEATURE_PRIMARY_FAN |
>> +            UNIWILL_FEATURE_SECONDARY_FAN |
>> +            UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
>> +};
>> +
>> +static struct uniwill_device_descriptor tux_featureset_2_nvidia_descriptor 
>> __initdata = {
>> +    .features = UNIWILL_FEATURE_FN_LOCK |
>> +            UNIWILL_FEATURE_SUPER_KEY |
>> +            UNIWILL_FEATURE_CPU_TEMP |
>> +            UNIWILL_FEATURE_GPU_TEMP |
>> +            UNIWILL_FEATURE_PRIMARY_FAN |
>> +            UNIWILL_FEATURE_SECONDARY_FAN |
>> +            UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
>> +            UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
>> +};
>> +
>> +static struct uniwill_device_descriptor tux_featureset_3_descriptor 
>> __initdata = {
>> +    .features = UNIWILL_FEATURE_FN_LOCK |
>> +            UNIWILL_FEATURE_SUPER_KEY |
>> +            UNIWILL_FEATURE_CPU_TEMP |
>> +            UNIWILL_FEATURE_PRIMARY_FAN |
>> +            UNIWILL_FEATURE_SECONDARY_FAN,
>> +};
>> +
>> +static struct uniwill_device_descriptor tux_featureset_3_nvidia_descriptor 
>> __initdata = {
>> +    .features = UNIWILL_FEATURE_FN_LOCK |
>> +            UNIWILL_FEATURE_SUPER_KEY |
>> +            UNIWILL_FEATURE_CPU_TEMP |
>> +            UNIWILL_FEATURE_GPU_TEMP |
>> +            UNIWILL_FEATURE_PRIMARY_FAN |
>> +            UNIWILL_FEATURE_SECONDARY_FAN |
>> +            UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
>> +};
>> +
>> +static int phxtxx1_probe(struct uniwill_data *data)
>> +{
>> +    unsigned int value;
>> +    int ret;
>> +
>> +    ret = regmap_read(data->regmap, EC_ADDR_PROJECT_ID, &value);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (value == PROJECT_ID_PH4TRX1 || value == PROJECT_ID_PH6TRX1)
>> +        data->features |= UNIWILL_FEATURE_SECONDARY_FAN;
>> +
>> +    return 0;
>> +};
>> +
>> +static struct uniwill_device_descriptor phxtxx1_descriptor __initdata = {
>> +    .features = UNIWILL_FEATURE_FN_LOCK |
>> +            UNIWILL_FEATURE_SUPER_KEY |
>> +            UNIWILL_FEATURE_CPU_TEMP |
>> +            UNIWILL_FEATURE_PRIMARY_FAN |
>> +            UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
>> +    .probe = phxtxx1_probe,
>> +};
>> +
>>   static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
>>   {
>>       unsigned int value;
>> @@ -1852,37 +1942,45 @@ static int phxarx1_phxaqf1_probe(struct uniwill_data 
>> *data)
>>           return ret;
>>         if (value & HAS_GPU)
>> -        data->features |= UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
>> +        data->features |= UNIWILL_FEATURE_GPU_TEMP |
>> +                  UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
>>         return 0;
>>   };
>>     static struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor 
>> __initdata = {
>> +    .features = UNIWILL_FEATURE_FN_LOCK |
>> +            UNIWILL_FEATURE_SUPER_KEY |
>> +            UNIWILL_FEATURE_CPU_TEMP |
>> +            UNIWILL_FEATURE_PRIMARY_FAN |
>> +            UNIWILL_FEATURE_SECONDARY_FAN |
>> +            UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
>>       .probe = phxarx1_phxaqf1_probe,
>>   };
>>   -static struct uniwill_device_descriptor tux_featureset_1_descriptor 
>> __initdata = {
>> -    .features = UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
>> +static struct uniwill_device_descriptor pf5pu1g_descriptor __initdata = {
>> +    .features = UNIWILL_FEATURE_FN_LOCK |
>> +            UNIWILL_FEATURE_SUPER_KEY |
>> +            UNIWILL_FEATURE_CPU_TEMP |
>> +            UNIWILL_FEATURE_PRIMARY_FAN,
>>   };
>>   -static struct uniwill_device_descriptor empty_descriptor __initdata = {};
>> -
>>   static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>>       {
>> -        .ident = "XMG FUSION 15",
>> +        .ident = "XMG FUSION 15 (L19)",
>>           .matches = {
>> -            DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>> +            DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &lapqc71a_lapqc71b_descriptor,
>>       },
>>       {
>> -        .ident = "XMG FUSION 15",
>> +        .ident = "XMG FUSION 15 (L19)",
>>           .matches = {
>> -            DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>> +            DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &lapqc71a_lapqc71b_descriptor,
>>       },
>
> Was choosing "TUXEDO" as the DMI_SYS_VENDOR a mistake made when adding said 
> entries?
> If yes then please fix them with a separate commit and add the appropriate Fixes:
> tag so this commit can be picked by the stable kernels.

More the other way around was a mistake. Thing is the first XMG Fusion was sold 
both by XMG and TUXEDO afaik. It was a cooperation back in the day getting some 
attention to linux for Windows gamers or so. That's why this one XMG device is 
officially supported by us.

TBH I don't know if the seller was reflected in the DMI strings, at least the 
one test device i have at hand has TUXEDO as the system vendor.

If one can confirm that the other string set exists also he*she can then just 
add it I guess?

>
> Other than that:
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>
>>       {
>>           .ident = "Intel NUC x15",
>> @@ -1906,7 +2004,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &phxtxx1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 14 Gen6 Intel",
>> @@ -1914,7 +2012,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_2_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
>> @@ -1930,7 +2028,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_2_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore 
>> Omnia-Book Pro Gen 8",
>> @@ -1938,7 +2036,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore 
>> Omnia-Book Pro Gen 8",
>> @@ -1946,7 +2044,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_2_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 16 Gen8 Intel",
>> @@ -1954,7 +2052,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_2_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
>> @@ -1962,7 +2060,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_3_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore 
>> Omnia-Book 15 Gen9",
>> @@ -1970,7 +2068,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_3_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
>> @@ -1978,7 +2076,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_3_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
>> @@ -1986,7 +2084,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_3_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 15 Gen10 Intel",
>> @@ -1994,7 +2092,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_3_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Max 15 Gen10 AMD",
>> @@ -2002,7 +2100,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
>> @@ -2010,7 +2108,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
>> @@ -2018,7 +2116,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Max 15 Gen10 Intel",
>> @@ -2026,7 +2124,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Max 16 Gen10 Intel",
>> @@ -2034,7 +2132,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Polaris 15 Gen1 AMD",
>> @@ -2042,7 +2140,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Polaris 15 Gen1 AMD",
>> @@ -2050,7 +2148,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Polaris 17 Gen1 AMD",
>> @@ -2058,7 +2156,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Polaris 17 Gen1 AMD",
>> @@ -2066,7 +2164,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Polaris 15 Gen1 Intel",
>> @@ -2074,7 +2172,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Polaris 15 Gen1 Intel",
>> @@ -2082,7 +2180,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Polaris 17 Gen1 Intel",
>> @@ -2090,7 +2188,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Polaris 17 Gen1 Intel",
>> @@ -2098,7 +2196,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Trinity 15 Intel Gen1",
>> @@ -2106,7 +2204,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Trinity 17 Intel Gen1",
>> @@ -2114,7 +2212,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Polaris 15/17 Gen2 AMD",
>> @@ -2122,7 +2220,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_2_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Polaris 15/17 Gen2 Intel",
>> @@ -2130,7 +2228,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_2_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
>> @@ -2138,7 +2236,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_2_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
>> @@ -2146,7 +2244,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_2_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
>> @@ -2154,7 +2252,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 15 Gen4 Intel",
>> @@ -2162,7 +2260,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Polaris 15/17 Gen5 AMD",
>> @@ -2170,7 +2268,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_2_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16 Gen5 AMD",
>> @@ -2178,7 +2276,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5",
>> @@ -2186,7 +2284,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris Slim 15 Gen6 AMD",
>> @@ -2194,7 +2292,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim 
>> 15 Gen6",
>> @@ -2202,7 +2300,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
>> @@ -2210,7 +2308,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
>> @@ -2218,7 +2316,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
>> @@ -2226,7 +2324,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16 Gen7 AMD",
>> @@ -2234,7 +2332,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16 Gen7 Intel",
>> @@ -2242,7 +2340,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16 Gen7 Intel",
>> @@ -2250,7 +2348,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>>           },
>> -        .driver_data = &tux_featureset_1_descriptor,
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Book BA15 Gen10 AMD",
>> @@ -2258,7 +2356,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5PU1G"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &pf5pu1g_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Pulse 14 Gen1 AMD",
>> @@ -2266,7 +2364,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Pulse 15 Gen1 AMD",
>> @@ -2274,7 +2372,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Pulse 15 Gen2 AMD",
>> @@ -2282,7 +2380,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>> __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       { }
>>   };
