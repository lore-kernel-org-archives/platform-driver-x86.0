Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3E82E7F17;
	Wed, 19 Nov 2025 15:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566500; cv=none; b=OvpyjW57S1+NAv1MQdrscEu6Ec/sEu5PGiec7ZAvvFOrJZ+IvAowv20rOc+VhCCF6Oxr5ZxbtuDd2SBCuF8JCdgrT9K0Lu9Jfgyc0McAHAhNznKBHYTV0iczo2YLtUkyNclPrYwCi1XL+G4j7YkeXKlH0SLKdmSvSgZ9PS9k8hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566500; c=relaxed/simple;
	bh=Di6oQn1dDPmAtCGcLKCCJh5f+vZ7t4vuU2oMeCMNb5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BisSLMXh7QbOm56DS2uW/6DKuZzxgo1ocis58Ddy7yHhP8QsPpfopUInSpCLyFw93/fWnrZ9uEU2Ia4rCnQH1GpCiJe04jjfkR20NoLmEsIjUMMdj5mGRFT4/No24gh66PXdrz3HNwzTbos8ldMkexX+gftst94iWIYi8S6UJ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=VyMdaqVS; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="VyMdaqVS"
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id A561D2FC0071;
	Wed, 19 Nov 2025 16:34:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763566487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lLhqkujwPpfOTqvH+4skkXArCZt76TNWOiEbL/v9Kt8=;
	b=VyMdaqVSIqdHCLRyAQOCGQimXI1y5YQ+v8AuObVwYxbePDnJZhwoVHc4xyTiQeJMAwdICj
	GqZN9Hm4a3Dhp6oJPLY4O57yqsz1YI1u7RqMwptfNUTysPeUxLbqO8rvIohrORRvuvr0My
	IVkL6+R36jxLewZoHbxHnrIOzDjIOzw=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <24109992-05ae-4da1-9a34-26838ffc71c7@tuxedocomputers.com>
Date: Wed, 19 Nov 2025 16:34:46 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] platform/x86/uniwill: Implement cTGP setting
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <20251117132530.32460-4-wse@tuxedocomputers.com>
 <9c5205e8-d3f2-4dbd-8863-5347bb5e77c9@gmx.de>
 <9a4ff777-f786-4d59-8c36-c7b6eab9e3d1@tuxedocomputers.com>
 <811e260b-7805-4ec6-8bf3-1b6a73af891a@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <811e260b-7805-4ec6-8bf3-1b6a73af891a@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 18.11.25 um 14:29 schrieb Armin Wolf:
> Am 18.11.25 um 13:58 schrieb Werner Sembach:
>
>>
>> Am 18.11.25 um 12:12 schrieb Armin Wolf:
>>> Am 17.11.25 um 14:24 schrieb Werner Sembach:
>>>
>>>> Uniwill offers user setable cTGP for their EC on devices using NVIDIA 3000
>>>> Series and newer GPUs. This patch implements this setting as a sysfs
>>>> attribute.
>>>>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>> ---
>>>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 110 +++++++++++++++++++-
>>>>   1 file changed, 107 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> index 0cb86a701b2e1..de3417d9d1ac0 100644
>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> @@ -122,11 +122,11 @@
>>>>   #define CTGP_DB_DB_ENABLE        BIT(1)
>>>>   #define CTGP_DB_CTGP_ENABLE        BIT(2)
>>>>   -#define EC_ADDR_CTGP_OFFSET        0x0744
>>>> +#define EC_ADDR_CTGP_DB_CTGP_OFFSET    0x0744
>>>>   -#define EC_ADDR_TPP_OFFSET        0x0745
>>>> +#define EC_ADDR_CTGP_DB_TPP_OFFSET    0x0745
>>>>   -#define EC_ADDR_MAX_TGP            0x0746
>>>> +#define EC_ADDR_CTGP_DB_DB_OFFSET    0x0746
>>>>     #define EC_ADDR_LIGHTBAR_AC_CTRL    0x0748
>>>>   #define LIGHTBAR_APP_EXISTS        BIT(0)
>>>> @@ -317,6 +317,7 @@
>>>>   #define UNIWILL_FEATURE_LIGHTBAR        BIT(3)
>>>>   #define UNIWILL_FEATURE_BATTERY            BIT(4)
>>>>   #define UNIWILL_FEATURE_HWMON            BIT(5)
>>>> +#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL    BIT(6)
>>>>     struct uniwill_data {
>>>>       struct device *dev;
>>>> @@ -498,6 +499,10 @@ static bool uniwill_writeable_reg(struct device *dev, 
>>>> unsigned int reg)
>>>>       case EC_ADDR_LIGHTBAR_BAT_RED:
>>>>       case EC_ADDR_LIGHTBAR_BAT_GREEN:
>>>>       case EC_ADDR_LIGHTBAR_BAT_BLUE:
>>>> +    case EC_ADDR_CTGP_DB_CTRL:
>>>> +    case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>>> +    case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>>> +    case EC_ADDR_CTGP_DB_DB_OFFSET:
>>>>           return true;
>>>>       default:
>>>>           return false;
>>>> @@ -531,6 +536,10 @@ static bool uniwill_readable_reg(struct device *dev, 
>>>> unsigned int reg)
>>>>       case EC_ADDR_LIGHTBAR_BAT_RED:
>>>>       case EC_ADDR_LIGHTBAR_BAT_GREEN:
>>>>       case EC_ADDR_LIGHTBAR_BAT_BLUE:
>>>> +    case EC_ADDR_CTGP_DB_CTRL:
>>>> +    case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>>> +    case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>>> +    case EC_ADDR_CTGP_DB_DB_OFFSET:
>>>>           return true;
>>>>       default:
>>>>           return false;
>>>> @@ -786,6 +795,68 @@ static ssize_t breathing_in_suspend_show(struct device 
>>>> *dev, struct device_attri
>>>>     static DEVICE_ATTR_RW(breathing_in_suspend);
>>>>   +static ssize_t ctgp_offset_store(struct device *dev, struct 
>>>> device_attribute *attr,
>>>> +                 const char *buf, size_t count)
>>>> +{
>>>> +    struct uniwill_data *data = dev_get_drvdata(dev);
>>>> +    unsigned int value;
>>>> +    int ret;
>>>> +
>>>> +    ret = kstrtouint(buf, 0, &value);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, value);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    return count;
>>>> +}
>>>> +
>>>> +static ssize_t ctgp_offset_show(struct device *dev, struct 
>>>> device_attribute *attr,
>>>> +                char *buf)
>>>> +{
>>>> +    struct uniwill_data *data = dev_get_drvdata(dev);
>>>> +    unsigned int value;
>>>> +    int ret;
>>>> +
>>>> +    ret = regmap_read(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, &value);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    return sysfs_emit(buf, "%u\n", value);
>>>> +}
>>>> +
>>>> +DEVICE_ATTR_RW(ctgp_offset);
>>>> +
>>>> +static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    if (!(supported_features & UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
>>>> +        return 0;
>>>> +
>>>> +    ret = regmap_update_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
>>>> +                 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | 
>>>> CTGP_DB_CTGP_ENABLE,
>>>> +                 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | 
>>>> CTGP_DB_CTGP_ENABLE);
>>>
>>> I think we should initialize the power limits before enabling them, otherwise
>>> the relevant registers might still contain invalid data.
>> from boot they are all just 0, but ofc i can shuffle things around
>
> Please do, i prefer to play it safe here as we are dealing with power limits.
>
>>>
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, 0);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_TPP_OFFSET, 255);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_DB_OFFSET, 25);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>
>>> Are those values the maximum values supported by the platform? If yes then
>>> we should enforce them for sysfs writes.
>>>
>>> Also, why is only cTGP accessible from user space?
>>
>> Because that is the only one that should be settable by the user according to 
>> NVIDIA, the rest should be set by the ODM.
>>
>> EC_ADDR_CTGP_DB_TPP_OFFSET max value is just max u8 and would be another way 
>> to cap cpu + gpu power but there are already other ways to do that (e.g. the 
>> power profiles) so i don't see a value in capping them here in any way.
>>
>> EC_ADDR_CTGP_DB_DB_OFFSET max value 25 is just the maximum value for dynamic 
>> boost defined by NVIDIA, bigger values are just being ignored (behave the 
>> same as having set 25): again the same story: devices that don't support 25 W 
>> dynamic boost are already capped elsewhere so i don't see value in capping it 
>> here.
>>
>> EC_ADDR_CTGP_DB_CTGP_OFFSET is the only one intented to be set by the user, 
>> problem: the max value is different from device to device, and i only know 
>> how to probe it using nvidia smi from userspace. Good news: nothing bad 
>> happens when you set a higher value (same as for dynamic boost)
>>
> I see, do you know the max. value for cTGP for the devices you added in patch 
> 1? The intel notebooks use a similar
> setup, but they limit the max. value of cTGP depending on the GPU module.
>
> I think that extending uniwill_data to contain a upper limit for cTGP would be 
> nice for usability. We can use a default
> value (U8_MAX) for devices where the upper limit is unknown. For devices where 
> the limit is known, userspace application
> can use the limit for showing it in the UI. Additionally i am planning to 
> integrate cTGP into the platform profile, as it
> is done on Intel machines. For this i will add the ability to define cTGP 
> values for each platform profile, with the
> max value being used for the upcoming max-power platform profile (also called 
> "benchmark mode" on intel platforms).

cTGP is a little bit complicated

cTGP can be set between a Base TGP and a Max TGP (what you see here in the 
driver is actually only the offset from the base TGP).

The Dynamic Boost setting here give the max width of the dynamic boost windows, 
however this is still affected by the max TGP.

Say cTGP is 100W Max TGP is 115W and Dynamic Boost setting is 25W -> The Dynamic 
Boost window is actually just 15W because it can't go over Max TGP.

Now setting the cTGP to 80W, the Dynamic Boost window becomes 25W and the GPU 
will never clock above 105W.

What does this mean? Setting cTGP between 80W and 90W actually changes the 
overall power consumption, while setting it between 90W and 115W does not, it 
just reduces the drivers automatic power allocation window in favor of the gpu. 
-> At a certain point more cTGP does not bring more performance, it actually can 
hurt performance for CPU heavy tasks.

In addition: Most Uniwill devies don't even have a window between Base TGP and 
Max TGP that is bigger then the allowed Dynamic Boost window. -> There is no 
power saving in setting cTGP on most Uniwill devices and the "more performance" 
window of cTGP has a witdh of 0.

And all Uniwill devices that i have seen have the GPU locked at a Watt level 
below the Base TGP level on Battery. -> There is no battery saving in setting 
cTGP on all Uniwill devices

>
> To put it short please add an additional sysfs attribute (maybe called 
> ctgp_offset_max?) add just return U8_MAX for now.
> We can then add the individual limits for each device later if desired.
I don't think a placeholder sysfs attribute that is not used by anything is 
sensefull. I would wait with including it until it is actually used.
>
> Thanks,
> Armin Wolf
On a different note, leaving the one device out that needs the qurik callback, 
the patch should allready be usefull and ready?
>
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static struct attribute *uniwill_attrs[] = {
>>>>       /* Keyboard-related */
>>>>       &dev_attr_fn_lock_toggle_enable.attr,
>>>> @@ -794,6 +865,8 @@ static struct attribute *uniwill_attrs[] = {
>>>>       /* Lightbar-related */
>>>>       &dev_attr_rainbow_animation.attr,
>>>>       &dev_attr_breathing_in_suspend.attr,
>>>> +    /* Power-management-related */
>>>> +    &dev_attr_ctgp_offset.attr,
>>>>       NULL
>>>>   };
>>>>   @@ -820,6 +893,11 @@ static umode_t uniwill_attr_is_visible(struct 
>>>> kobject *kobj, struct attribute *a
>>>>               return attr->mode;
>>>>       }
>>>>   +    if (attr == &dev_attr_ctgp_offset.attr) {
>>>> +        if (supported_features & UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL)
>>>> +            return attr->mode;
>>>> +    }
>>>> +
>>>>       return 0;
>>>>   }
>>>>   @@ -1371,6 +1449,10 @@ static int uniwill_probe(struct platform_device 
>>>> *pdev)
>>>>       if (ret < 0)
>>>>           return ret;
>>>>   +    ret = uniwill_nvidia_ctgp_init(data);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>>       return uniwill_input_init(data);
>>>>   }
>>>>   @@ -1547,6 +1629,7 @@ static const struct dmi_system_id 
>>>> uniwill_dmi_table[] __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
>>>> @@ -1554,6 +1637,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore 
>>>> Omnia-Book Pro Gen 7",
>>>> @@ -1561,6 +1645,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore 
>>>> Omnia-Book Pro Gen 8",
>>>> @@ -1575,6 +1660,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO InfinityBook Pro 16 Gen8 Intel",
>>>> @@ -1582,6 +1668,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
>>>> @@ -1694,6 +1781,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Polaris 15/17 Gen2 Intel",
>>>> @@ -1701,6 +1789,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
>>>> @@ -1708,6 +1797,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
>>>> @@ -1715,6 +1805,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
>>>> @@ -1722,6 +1813,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris 15 Gen4 Intel",
>>>> @@ -1729,6 +1821,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Polaris 15/17 Gen5 AMD",
>>>> @@ -1736,6 +1829,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris 16 Gen5 AMD",
>>>> @@ -1743,6 +1837,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5",
>>>> @@ -1750,6 +1845,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris Slim 15 Gen6 AMD",
>>>> @@ -1757,6 +1853,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION 
>>>> Slim 15 Gen6",
>>>> @@ -1764,6 +1861,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
>>>> @@ -1771,6 +1869,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
>>>> @@ -1778,6 +1877,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
>>>> @@ -1785,6 +1885,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris 16 Gen7 AMD",
>>>> @@ -1792,6 +1893,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris 16 Gen7 Intel",
>>>> @@ -1799,6 +1901,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Stellaris 16 Gen7 Intel",
>>>> @@ -1806,6 +1909,7 @@ static const struct dmi_system_id uniwill_dmi_table[] 
>>>> __initconst = {
>>>>               DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>               DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>>>>           },
>>>> +        .driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>       },
>>>>       {
>>>>           .ident = "TUXEDO Pulse 14 Gen1 AMD",
>>
