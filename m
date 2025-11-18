Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8A925D53C;
	Tue, 18 Nov 2025 13:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763473229; cv=none; b=PgtdUdjowyS5i8dGNuplLWUC7NPPP7n54D1W6ko6YXKigr49iyiAEVwACnStoOi0La8tPgkc9BcI+BTreSHsPYaAh36dVBt63J4fGHBWV33kkzXID/y/dWZIXY4zXlNf7uJrFbhG4G3MYpv6+0XWdf5mT5UKBkPi/cifUazuBPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763473229; c=relaxed/simple;
	bh=yv6TTRI4Is+xeiuBOEZAlxwwwNbSEUHbOjaPAZ/qdIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PP/vrWMwpZm61EjytJOFsdP2GMgJ/SZ+9AQsdPs5M2fLp0YVb4UpIUxOWx5kjgtnoW6Ad8SBNugLCoG4FHE1BGzDFTvyBFHW8aFJVGUipf3Bw/0oQHkhkibfHXrJjioPzLvsYKIB4qnV2Q/DBdcEWNFgPhkbdLwj5/ot0MmiP9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=iUTtv/N7; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="iUTtv/N7"
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 317362FC0057;
	Tue, 18 Nov 2025 14:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763473223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R4C9u3e9A2gUYCaYy6Dg+2GkTxi+3QousFsQZZnapxA=;
	b=iUTtv/N7VO+4nmj3aWXqasPeQZDCqo3sGrQ0za31fDEiT3X6g6Zy3Eb3/2c8fXsnAkMWqc
	bIKyGKvo5ec9zMDjl37A5yIZuD+JQOFiy2DSvz/Wx91GhPDNue56Se5IZQrzK1z9x3vm80
	PN1g1G56Ne72+VyUG2zqJoh/2NutG8g=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <e97e450f-62bd-497f-a636-788b0be1c54c@tuxedocomputers.com>
Date: Tue, 18 Nov 2025 14:40:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] platform/x86/uniwill: Make uniwill_dmi_table
 accessible in probe
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <20251117132530.32460-5-wse@tuxedocomputers.com>
 <627e6759-3062-42b1-aaa0-3fe4dbcdf680@gmx.de>
 <dc086fb7-073d-4368-a122-ec4d7cb0da3f@tuxedocomputers.com>
 <318ee1e8-c1b2-4253-8a63-657652bc64fc@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <318ee1e8-c1b2-4253-8a63-657652bc64fc@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 18.11.25 um 14:35 schrieb Armin Wolf:
> Am 18.11.25 um 14:01 schrieb Werner Sembach:
>
>>
>> Am 18.11.25 um 12:16 schrieb Armin Wolf:
>>> Am 17.11.25 um 14:24 schrieb Werner Sembach:
>>>
>>>> Move uniwill_dmi_table up and remove __intconst to make it also accessible
>>>> in the probe function.
>>>
>>> NAK, i expect the DMI table to become very large in the future, so not 
>>> marking it
>>> as __initconst will waste a sizeable amount of memory.
>>>
>>> Luckily i am also currently working on extending the DMI table to contain 
>>> additional
>>> configuration data like power limits and callbacks for device-specific 
>>> initialization.
>>>
>>> I can share the patch with you if you want. It would allow us to discard the 
>>> DMI table
>>> after module initialization while still allowing for device-specific 
>>> initialization
>>> callbacks.
>> this callback needs a way to probe for presence of a Nvidia card e.g. by 
>> reading the ec
>
> The patch i am talking about allows DMI table entries to provide a "device 
> descriptor" that
> basically is a struct consisting of vendor-specific data and a callback that 
> is executed by
> the platform driver when probing the EC. This would allow you to read the 
> special register.
> Said device descriptor will replace the supported_features variable.
Sounds like it would work for my usecase
>
> I will send you the patch tomorrow.
Thx
>
> Thanks,
> Armin Wolf
>
>>> Thanks,
>>> Armin Wolf
>>>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>> ---
>>>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 344 ++++++++++----------
>>>>   1 file changed, 172 insertions(+), 172 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> index de3417d9d1ac0..9412783698685 100644
>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> @@ -1405,178 +1405,7 @@ static int uniwill_ec_init(struct uniwill_data *data)
>>>>       return devm_add_action_or_reset(data->dev, 
>>>> uniwill_disable_manual_control, data);
>>>>   }
>>>>   -static int uniwill_probe(struct platform_device *pdev)
>>>> -{
>>>> -    struct uniwill_data *data;
>>>> -    struct regmap *regmap;
>>>> -    acpi_handle handle;
>>>> -    int ret;
>>>> -
>>>> -    handle = ACPI_HANDLE(&pdev->dev);
>>>> -    if (!handle)
>>>> -        return -ENODEV;
>>>> -
>>>> -    data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>>>> -    if (!data)
>>>> -        return -ENOMEM;
>>>> -
>>>> -    data->dev = &pdev->dev;
>>>> -    data->handle = handle;
>>>> -    platform_set_drvdata(pdev, data);
>>>> -
>>>> -    regmap = devm_regmap_init(&pdev->dev, &uniwill_ec_bus, data, 
>>>> &uniwill_ec_config);
>>>> -    if (IS_ERR(regmap))
>>>> -        return PTR_ERR(regmap);
>>>> -
>>>> -    data->regmap = regmap;
>>>> -    ret = devm_mutex_init(&pdev->dev, &data->super_key_lock);
>>>> -    if (ret < 0)
>>>> -        return ret;
>>>> -
>>>> -    ret = uniwill_ec_init(data);
>>>> -    if (ret < 0)
>>>> -        return ret;
>>>> -
>>>> -    ret = uniwill_battery_init(data);
>>>> -    if (ret < 0)
>>>> -        return ret;
>>>> -
>>>> -    ret = uniwill_led_init(data);
>>>> -    if (ret < 0)
>>>> -        return ret;
>>>> -
>>>> -    ret = uniwill_hwmon_init(data);
>>>> -    if (ret < 0)
>>>> -        return ret;
>>>> -
>>>> -    ret = uniwill_nvidia_ctgp_init(data);
>>>> -    if (ret < 0)
>>>> -        return ret;
>>>> -
>>>> -    return uniwill_input_init(data);
>>>> -}
>>>> -
>>>> -static void uniwill_shutdown(struct platform_device *pdev)
>>>> -{
>>>> -    struct uniwill_data *data = platform_get_drvdata(pdev);
>>>> -
>>>> -    regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
>>>> -}
>>>> -
>>>> -static int uniwill_suspend_keyboard(struct uniwill_data *data)
>>>> -{
>>>> -    if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>>>> -        return 0;
>>>> -
>>>> -    /*
>>>> -     * The EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to 
>>>> restore it
>>>> -     * ourselves.
>>>> -     */
>>>> -    return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, 
>>>> &data->last_switch_status);
>>>> -}
>>>> -
>>>> -static int uniwill_suspend_battery(struct uniwill_data *data)
>>>> -{
>>>> -    if (!(supported_features & UNIWILL_FEATURE_BATTERY))
>>>> -        return 0;
>>>> -
>>>> -    /*
>>>> -     * Save the current charge limit in order to restore it during resume.
>>>> -     * We cannot use the regmap code for that since this register needs to
>>>> -     * be declared as volatile due to CHARGE_CTRL_REACHED.
>>>> -     */
>>>> -    return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, 
>>>> &data->last_charge_ctrl);
>>>> -}
>>>> -
>>>> -static int uniwill_suspend(struct device *dev)
>>>> -{
>>>> -    struct uniwill_data *data = dev_get_drvdata(dev);
>>>> -    int ret;
>>>> -
>>>> -    ret = uniwill_suspend_keyboard(data);
>>>> -    if (ret < 0)
>>>> -        return ret;
>>>> -
>>>> -    ret = uniwill_suspend_battery(data);
>>>> -    if (ret < 0)
>>>> -        return ret;
>>>> -
>>>> -    regcache_cache_only(data->regmap, true);
>>>> -    regcache_mark_dirty(data->regmap);
>>>> -
>>>> -    return 0;
>>>> -}
>>>> -
>>>> -static int uniwill_resume_keyboard(struct uniwill_data *data)
>>>> -{
>>>> -    unsigned int value;
>>>> -    int ret;
>>>> -
>>>> -    if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>>>> -        return 0;
>>>> -
>>>> -    ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
>>>> -    if (ret < 0)
>>>> -        return ret;
>>>> -
>>>> -    if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) == (value & 
>>>> SUPER_KEY_LOCK_STATUS))
>>>> -        return 0;
>>>> -
>>>> -    return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, 
>>>> TRIGGER_SUPER_KEY_LOCK,
>>>> -                 TRIGGER_SUPER_KEY_LOCK);
>>>> -}
>>>> -
>>>> -static int uniwill_resume_battery(struct uniwill_data *data)
>>>> -{
>>>> -    if (!(supported_features & UNIWILL_FEATURE_BATTERY))
>>>> -        return 0;
>>>> -
>>>> -    return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, 
>>>> CHARGE_CTRL_MASK,
>>>> -                  data->last_charge_ctrl);
>>>> -}
>>>> -
>>>> -static int uniwill_resume(struct device *dev)
>>>> -{
>>>> -    struct uniwill_data *data = dev_get_drvdata(dev);
>>>> -    int ret;
>>>> -
>>>> -    regcache_cache_only(data->regmap, false);
>>>> -
>>>> -    ret = regcache_sync(data->regmap);
>>>> -    if (ret < 0)
>>>> -        return ret;
>>>> -
>>>> -    ret = uniwill_resume_keyboard(data);
>>>> -    if (ret < 0)
>>>> -        return ret;
>>>> -
>>>> -    return uniwill_resume_battery(data);
>>>> -}
>>>> -
>>>> -static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, 
>>>> uniwill_resume);
>>>> -
>>>> -/*
>>>> - * We only use the DMI table for auoloading because the ACPI device itself
>>>> - * does not guarantee that the underlying EC implementation is supported.
>>>> - */
>>>> -static const struct acpi_device_id uniwill_id_table[] = {
>>>> -    { "INOU0000" },
>>>> -    { },
>>>> -};
>>>> -
>>>> -static struct platform_driver uniwill_driver = {
>>>> -    .driver = {
>>>> -        .name = DRIVER_NAME,
>>>> -        .dev_groups = uniwill_groups,
>>>> -        .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>>>> -        .acpi_match_table = uniwill_id_table,
>>>> -        .pm = pm_sleep_ptr(&uniwill_pm_ops),
>>>> -    },
>>>> -    .probe = uniwill_probe,
>>>> -    .shutdown = uniwill_shutdown,
>>>> -};
>>>> -
>>>> -static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>>>> +static const struct dmi_system_id uniwill_dmi_table[] = {
>>>>       {
>>>>           .ident = "XMG FUSION 15",
>>>>           .matches = {
>>>> @@ -1936,6 +1765,177 @@ static const struct dmi_system_id 
>>>> uniwill_dmi_table[] __initconst = {
>>>>   };
>>>>   MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
>>>>   +static int uniwill_probe(struct platform_device *pdev)
>>>> +{
>>>> +    struct uniwill_data *data;
>>>> +    struct regmap *regmap;
>>>> +    acpi_handle handle;
>>>> +    int ret;
>>>> +
>>>> +    handle = ACPI_HANDLE(&pdev->dev);
>>>> +    if (!handle)
>>>> +        return -ENODEV;
>>>> +
>>>> +    data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>>>> +    if (!data)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    data->dev = &pdev->dev;
>>>> +    data->handle = handle;
>>>> +    platform_set_drvdata(pdev, data);
>>>> +
>>>> +    regmap = devm_regmap_init(&pdev->dev, &uniwill_ec_bus, data, 
>>>> &uniwill_ec_config);
>>>> +    if (IS_ERR(regmap))
>>>> +        return PTR_ERR(regmap);
>>>> +
>>>> +    data->regmap = regmap;
>>>> +    ret = devm_mutex_init(&pdev->dev, &data->super_key_lock);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    ret = uniwill_ec_init(data);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    ret = uniwill_battery_init(data);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    ret = uniwill_led_init(data);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    ret = uniwill_hwmon_init(data);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    ret = uniwill_nvidia_ctgp_init(data);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    return uniwill_input_init(data);
>>>> +}
>>>> +
>>>> +static void uniwill_shutdown(struct platform_device *pdev)
>>>> +{
>>>> +    struct uniwill_data *data = platform_get_drvdata(pdev);
>>>> +
>>>> +    regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
>>>> +}
>>>> +
>>>> +static int uniwill_suspend_keyboard(struct uniwill_data *data)
>>>> +{
>>>> +    if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>>>> +        return 0;
>>>> +
>>>> +    /*
>>>> +     * The EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to 
>>>> restore it
>>>> +     * ourselves.
>>>> +     */
>>>> +    return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, 
>>>> &data->last_switch_status);
>>>> +}
>>>> +
>>>> +static int uniwill_suspend_battery(struct uniwill_data *data)
>>>> +{
>>>> +    if (!(supported_features & UNIWILL_FEATURE_BATTERY))
>>>> +        return 0;
>>>> +
>>>> +    /*
>>>> +     * Save the current charge limit in order to restore it during resume.
>>>> +     * We cannot use the regmap code for that since this register needs to
>>>> +     * be declared as volatile due to CHARGE_CTRL_REACHED.
>>>> +     */
>>>> +    return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, 
>>>> &data->last_charge_ctrl);
>>>> +}
>>>> +
>>>> +static int uniwill_suspend(struct device *dev)
>>>> +{
>>>> +    struct uniwill_data *data = dev_get_drvdata(dev);
>>>> +    int ret;
>>>> +
>>>> +    ret = uniwill_suspend_keyboard(data);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    ret = uniwill_suspend_battery(data);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    regcache_cache_only(data->regmap, true);
>>>> +    regcache_mark_dirty(data->regmap);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int uniwill_resume_keyboard(struct uniwill_data *data)
>>>> +{
>>>> +    unsigned int value;
>>>> +    int ret;
>>>> +
>>>> +    if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>>>> +        return 0;
>>>> +
>>>> +    ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) == (value & 
>>>> SUPER_KEY_LOCK_STATUS))
>>>> +        return 0;
>>>> +
>>>> +    return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, 
>>>> TRIGGER_SUPER_KEY_LOCK,
>>>> +                 TRIGGER_SUPER_KEY_LOCK);
>>>> +}
>>>> +
>>>> +static int uniwill_resume_battery(struct uniwill_data *data)
>>>> +{
>>>> +    if (!(supported_features & UNIWILL_FEATURE_BATTERY))
>>>> +        return 0;
>>>> +
>>>> +    return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, 
>>>> CHARGE_CTRL_MASK,
>>>> +                  data->last_charge_ctrl);
>>>> +}
>>>> +
>>>> +static int uniwill_resume(struct device *dev)
>>>> +{
>>>> +    struct uniwill_data *data = dev_get_drvdata(dev);
>>>> +    int ret;
>>>> +
>>>> +    regcache_cache_only(data->regmap, false);
>>>> +
>>>> +    ret = regcache_sync(data->regmap);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    ret = uniwill_resume_keyboard(data);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    return uniwill_resume_battery(data);
>>>> +}
>>>> +
>>>> +static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, 
>>>> uniwill_resume);
>>>> +
>>>> +/*
>>>> + * We only use the DMI table for auoloading because the ACPI device itself
>>>> + * does not guarantee that the underlying EC implementation is supported.
>>>> + */
>>>> +static const struct acpi_device_id uniwill_id_table[] = {
>>>> +    { "INOU0000" },
>>>> +    { },
>>>> +};
>>>> +
>>>> +static struct platform_driver uniwill_driver = {
>>>> +    .driver = {
>>>> +        .name = DRIVER_NAME,
>>>> +        .dev_groups = uniwill_groups,
>>>> +        .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>>>> +        .acpi_match_table = uniwill_id_table,
>>>> +        .pm = pm_sleep_ptr(&uniwill_pm_ops),
>>>> +    },
>>>> +    .probe = uniwill_probe,
>>>> +    .shutdown = uniwill_shutdown,
>>>> +};
>>>> +
>>>>   static int __init uniwill_init(void)
>>>>   {
>>>>       const struct dmi_system_id *id;
>>
