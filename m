Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEB535771C;
	Thu,  4 Dec 2025 21:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764882363; cv=none; b=s/6sQ6HEbrTYBDezgbgMXtmAL1Srz+spVLLXB8qh3UMJcwUnvP8gqS7SebWOM5PEFaAlK8i57nztMTph3aUGfteMTEXaE2ES7gouCTExU4YPqrBZ9NyAN6NSU98CcWsOHDt8Tepo5VpJrWb2ANvg3i3rvcRWemgh2Aj9136mUTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764882363; c=relaxed/simple;
	bh=+6kipMreVPi4ni9eLDePIADP3zUY0Y8v9oCw6PN6sb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1GGsxNqUvDDWR91st8so7vf46T74i0ajgz3eaKS98KG+wtZCWJTFzQK54CZAI5YZYds8liiOwYrupYO8V0WQXTqG60YVjLXu7vVts2gKeZtfSZOrJmY53V3+XfzFyEV4WhRKnverH8VvfWvUOJDS76Hlvxs9OxkWH6XoeMgFJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=iWE163wr; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="iWE163wr"
Received: from [192.168.42.27] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id EE0CC2FC0093;
	Thu,  4 Dec 2025 22:05:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764882357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbW2GfaSq4PydHaOjHi2z9e6rMJRXGYm4EVbTCWKEmI=;
	b=iWE163wrB2+JinPMqgMKjgt+qjf70KeixRgt6Uqy4t9876nLE8ytMlB4sRTc0mAt65C20l
	SVdawFM5jOjZzlH4DwAbublOlGtAXzT5I2yxBQK30PqF0keY5EbgUlksTopVUY+sRGRNt9
	GTaeIArdLaERMFsJBxAinpZjwt4mnzI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <96753a74-165a-43ff-8a9c-c0f31e6391ef@tuxedocomputers.com>
Date: Thu, 4 Dec 2025 22:05:56 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/uniwill: Implement cTGP setting
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251204135121.435905-1-wse@tuxedocomputers.com>
 <20251204135121.435905-3-wse@tuxedocomputers.com>
 <a3802a6c-e771-4802-b0ba-10e5c8185679@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <a3802a6c-e771-4802-b0ba-10e5c8185679@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 04.12.25 um 17:11 schrieb Armin Wolf:
> Am 04.12.25 um 14:50 schrieb Werner Sembach:
>
>> Uniwill offers user setable cTGP for their EC on devices using NVIDIA 
>> 3000
>> Series and newer GPUs. This patch implements this setting as a sysfs
>> attribute.
>>
>> For one device, the TUXEDO InfinityBook Gen7, the variant with and 
>> without
>> NVIDIA GPU can't be differentiated using only the DMI strings, so the 
>> new
>> probe callback needs to be used to test a bit from the EC memory.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 160 +++++++++++++++++---
>>   1 file changed, 135 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 01192c32608e5..f87f6e9d08234 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -88,6 +88,9 @@
>>     #define EC_ADDR_GPU_TEMP        0x044F
>>   +#define EC_ADDR_SYSTEM_ID        0x0456
>> +#define HAS_GPU                BIT(7)
>
> I think you need to tell regmap that this new register is readable
> by modifying uniwill_readable_reg(), otherwise phxarx1_phxaqf1_probe()
> will always fail.
ack will double check
>
> With that being fixed:
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>
>> +
>>   #define EC_ADDR_MAIN_FAN_RPM_1        0x0464
>>     #define EC_ADDR_MAIN_FAN_RPM_2        0x0465
>> @@ -122,11 +125,11 @@
>>   #define CTGP_DB_DB_ENABLE        BIT(1)
>>   #define CTGP_DB_CTGP_ENABLE        BIT(2)
>>   -#define EC_ADDR_CTGP_OFFSET        0x0744
>> +#define EC_ADDR_CTGP_DB_CTGP_OFFSET    0x0744
>>   -#define EC_ADDR_TPP_OFFSET        0x0745
>> +#define EC_ADDR_CTGP_DB_TPP_OFFSET    0x0745
>>   -#define EC_ADDR_MAX_TGP            0x0746
>> +#define EC_ADDR_CTGP_DB_DB_OFFSET    0x0746
>>     #define EC_ADDR_LIGHTBAR_AC_CTRL    0x0748
>>   #define LIGHTBAR_APP_EXISTS        BIT(0)
>> @@ -317,6 +320,7 @@
>>   #define UNIWILL_FEATURE_LIGHTBAR        BIT(3)
>>   #define UNIWILL_FEATURE_BATTERY            BIT(4)
>>   #define UNIWILL_FEATURE_HWMON            BIT(5)
>> +#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL    BIT(6)
>>     struct uniwill_data {
>>       struct device *dev;
>> @@ -515,6 +519,10 @@ static bool uniwill_writeable_reg(struct device 
>> *dev, unsigned int reg)
>>       case EC_ADDR_LIGHTBAR_BAT_RED:
>>       case EC_ADDR_LIGHTBAR_BAT_GREEN:
>>       case EC_ADDR_LIGHTBAR_BAT_BLUE:
>> +    case EC_ADDR_CTGP_DB_CTRL:
>> +    case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>> +    case EC_ADDR_CTGP_DB_TPP_OFFSET:
>> +    case EC_ADDR_CTGP_DB_DB_OFFSET:
>>           return true;
>>       default:
>>           return false;
>> @@ -548,6 +556,10 @@ static bool uniwill_readable_reg(struct device 
>> *dev, unsigned int reg)
>>       case EC_ADDR_LIGHTBAR_BAT_RED:
>>       case EC_ADDR_LIGHTBAR_BAT_GREEN:
>>       case EC_ADDR_LIGHTBAR_BAT_BLUE:
>> +    case EC_ADDR_CTGP_DB_CTRL:
>> +    case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>> +    case EC_ADDR_CTGP_DB_TPP_OFFSET:
>> +    case EC_ADDR_CTGP_DB_DB_OFFSET:
>>           return true;
>>       default:
>>           return false;
>> @@ -803,6 +815,69 @@ static ssize_t breathing_in_suspend_show(struct 
>> device *dev, struct device_attri
>>     static DEVICE_ATTR_RW(breathing_in_suspend);
>>   +static ssize_t ctgp_offset_store(struct device *dev, struct 
>> device_attribute *attr,
>> +                 const char *buf, size_t count)
>> +{
>> +    struct uniwill_data *data = dev_get_drvdata(dev);
>> +    unsigned int value;
>> +    int ret;
>> +
>> +    ret = kstrtouint(buf, 0, &value);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, 
>> value);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    return count;
>> +}
>> +
>> +static ssize_t ctgp_offset_show(struct device *dev, struct 
>> device_attribute *attr,
>> +                char *buf)
>> +{
>> +    struct uniwill_data *data = dev_get_drvdata(dev);
>> +    unsigned int value;
>> +    int ret;
>> +
>> +    ret = regmap_read(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, 
>> &value);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    return sysfs_emit(buf, "%u\n", value);
>> +}
>> +
>> +static DEVICE_ATTR_RW(ctgp_offset);
>> +
>> +static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
>> +{
>> +    int ret;
>> +
>> +    if (!uniwill_device_supports(data, 
>> UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
>> +                     UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
>> +        return 0;
>> +
>> +    ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, 0);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_TPP_OFFSET, 255);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_DB_OFFSET, 25);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = regmap_update_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
>> +                 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | 
>> CTGP_DB_CTGP_ENABLE,
>> +                 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | 
>> CTGP_DB_CTGP_ENABLE);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    return 0;
>> +}
>> +
>>   static struct attribute *uniwill_attrs[] = {
>>       /* Keyboard-related */
>>       &dev_attr_fn_lock_toggle_enable.attr,
>> @@ -811,6 +886,8 @@ static struct attribute *uniwill_attrs[] = {
>>       /* Lightbar-related */
>>       &dev_attr_rainbow_animation.attr,
>>       &dev_attr_breathing_in_suspend.attr,
>> +    /* Power-management-related */
>> +    &dev_attr_ctgp_offset.attr,
>>       NULL
>>   };
>>   @@ -844,6 +921,12 @@ static umode_t uniwill_attr_is_visible(struct 
>> kobject *kobj, struct attribute *a
>>               return attr->mode;
>>       }
>>   +    if (attr == &dev_attr_ctgp_offset.attr) {
>> +        if (uniwill_device_supports(data, 
>> UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
>> +                        UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
>> +            return attr->mode;
>> +    }
>> +
>>       return 0;
>>   }
>>   @@ -1413,6 +1496,10 @@ static int uniwill_probe(struct 
>> platform_device *pdev)
>>       if (ret < 0)
>>           return ret;
>>   +    ret = uniwill_nvidia_ctgp_init(data);
>> +    if (ret < 0)
>> +        return ret;
>> +
>>       return uniwill_input_init(data);
>>   }
>>   @@ -1557,6 +1644,29 @@ static struct uniwill_device_descriptor 
>> lapkc71f_descriptor __initdata = {
>>               UNIWILL_FEATURE_HWMON
>>   };
>>   +static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
>> +{
>> +    unsigned int value;
>> +    int ret;
>> +
>> +    ret = regmap_read(data->regmap, EC_ADDR_SYSTEM_ID, &value);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (value & HAS_GPU)
>> +        data->features |= UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
>> +
>> +    return 0;
>> +};
>> +
>> +static struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor 
>> __initdata = {
>> +    .probe = phxarx1_phxaqf1_probe
>> +};
>> +
>> +static struct uniwill_device_descriptor tux_featureset_1_descriptor 
>> __initdata = {
>> +    .features = UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL
>> +};
>> +
>>   static struct uniwill_device_descriptor empty_descriptor __initdata 
>> = {};
>>     static const struct dmi_system_id uniwill_dmi_table[] __initconst 
>> = {
>> @@ -1606,7 +1716,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
>> @@ -1614,7 +1724,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &phxarx1_phxaqf1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore 
>> Omnia-Book Pro Gen 7",
>> @@ -1622,7 +1732,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, 
>> "PH6AG01_PH6AQ71_PH6AQI1"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 14/16 Gen8 
>> Intel/Commodore Omnia-Book Pro Gen 8",
>> @@ -1638,7 +1748,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 16 Gen8 Intel",
>> @@ -1646,7 +1756,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
>> @@ -1814,7 +1924,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Polaris 15/17 Gen2 Intel",
>> @@ -1822,7 +1932,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
>> @@ -1830,7 +1940,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
>> @@ -1838,7 +1948,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
>> @@ -1846,7 +1956,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 15 Gen4 Intel",
>> @@ -1854,7 +1964,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Polaris 15/17 Gen5 AMD",
>> @@ -1862,7 +1972,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16 Gen5 AMD",
>> @@ -1870,7 +1980,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION 
>> Gen 5",
>> @@ -1878,7 +1988,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris Slim 15 Gen6 AMD",
>> @@ -1886,7 +1996,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore 
>> ORION Slim 15 Gen6",
>> @@ -1894,7 +2004,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 
>> Gen6",
>> @@ -1902,7 +2012,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 
>> Gen6",
>> @@ -1910,7 +2020,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 
>> Gen6",
>> @@ -1918,7 +2028,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16 Gen7 AMD",
>> @@ -1926,7 +2036,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16 Gen7 Intel",
>> @@ -1934,7 +2044,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Stellaris 16 Gen7 Intel",
>> @@ -1942,7 +2052,7 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>>           },
>> -        .driver_data = &empty_descriptor,
>> +        .driver_data = &tux_featureset_1_descriptor,
>>       },
>>       {
>>           .ident = "TUXEDO Pulse 14 Gen1 AMD",
