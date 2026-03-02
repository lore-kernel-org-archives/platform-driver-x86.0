Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA12C08CF;
	Mon,  2 Mar 2026 18:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772475739; cv=none; b=CebF4RPR2sxc4Y6komOlL8vltP4zWcQnApbqiR5QTca+OcrH1uiarAD3WVzjLWnvgFdHuha42CmGVQjtBtI0W41E1pd2h2Tml56afA0/gPKda+Rc8Lt+z3Vdnytc4+HDjwYu1MumRZdW1XEwZHhi/aDBlT127q2yc4s8xgT/7LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772475739; c=relaxed/simple;
	bh=0LYvmTLOth+EUEM83vtkGb6ATEihTJzcdPzfrW89rA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezyBvssU0UHENJgCdmDWTYFFabDG6TMvPX2CkgsQpd7QF7PhoRy/FNL8EkYkAE+WmtjHPJa1bt/EgWdmfXWbpAR/+be6ke+cWxFjV/l4HyujXxMCRrYn6bZdEz/AGgt0dsuTfo76VhLgxQoD8Kf/eXQ+u+BUQWX38h4dAm7nP7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=UhqlnotR; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="UhqlnotR"
Received: from [192.168.178.24] (i5C75F6B8.versanet.de [92.117.246.184])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 9848D2FC0050;
	Mon,  2 Mar 2026 19:22:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772475727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g5t1qxfZTDGN+H3a3eDKUrgpjHBSNW+ZTaEKXrGQYyw=;
	b=UhqlnotRT60jVJFI+nhznmSUciozWlH8ZMpkTHCJ2C7Bt1CaEN0L+QT+wb6hR15MYdkrAY
	YbBqY1z4OfGLw/ULMcmTACOe4e51XsVE1eCalLqGqfva601STV+x0KHOgIAAW9pWZHEZaq
	UnaeMA5KTFNUctTtBJRbMIN50RjBAn8=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <2f7842c1-492c-4331-b789-7f6d0c71f792@tuxedocomputers.com>
Date: Mon, 2 Mar 2026 19:22:06 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] platform/x86/uniwill: Implement USB-C power
 priority setting
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260227200906.514928-1-wse@tuxedocomputers.com>
 <20260227200906.514928-3-wse@tuxedocomputers.com>
 <1f498e55-c365-4fb5-b06f-e0413774a453@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <1f498e55-c365-4fb5-b06f-e0413774a453@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 01.03.26 um 14:05 schrieb Armin Wolf:
> Am 27.02.26 um 21:07 schrieb Werner Sembach:
>
>> On some devices Uniwill offers the option to set the USB-C port to
>> prioritise charging or performance. This patch exposes this setting to the
>> userspace via sysfs for all TUXEDO devices supporting it.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 147 +++++++++++++++++++-
>>   1 file changed, 140 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 048b265bff374..f92c24d64160b 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -266,8 +266,8 @@
>>   #define BATTERY_CHARGE_FULL_OVER_24H    BIT(3)
>>   #define BATTERY_ERM_STATUS_REACHED    BIT(4)
>>   -#define EC_ADDR_CHARGE_PRIO        0x07CC
>> -#define CHARGING_PERFORMANCE        BIT(7)
>> +#define EC_ADDR_USB_C_POWER_PRIORITY    0x07CC
>> +#define USB_C_POWER_PRIORITY        BIT(7)
>>     /* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
>>   #define EC_ADDR_LIGHTBAR_BAT_CTRL    0x07E2
>> @@ -324,6 +324,12 @@
>>   #define UNIWILL_FEATURE_PRIMARY_FAN        BIT(7)
>>   #define UNIWILL_FEATURE_SECONDARY_FAN        BIT(8)
>>   #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL    BIT(9)
>> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY    BIT(10)
>> +
>> +enum usb_c_power_priority_options {
>> +    USB_C_POWER_PRIORITY_OPTIONS_CHARGING = 0,
>> +    USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE,
>> +};
>>     struct uniwill_data {
>>       struct device *dev;
>> @@ -343,6 +349,8 @@ struct uniwill_data {
>>       struct mutex input_lock;    /* Protects input sequence during notify */
>>       struct input_dev *input_device;
>>       struct notifier_block nb;
>> +    struct mutex usb_c_power_priority_lock; /* Protects dependent bit write 
>> and state safe */
>> +    enum usb_c_power_priority_options last_usb_c_power_priority_option;
>>   };
>>     struct uniwill_battery_entry {
>> @@ -527,6 +535,7 @@ static bool uniwill_writeable_reg(struct device *dev, 
>> unsigned int reg)
>>       case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>       case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>       case EC_ADDR_CTGP_DB_DB_OFFSET:
>> +    case EC_ADDR_USB_C_POWER_PRIORITY:
>>           return true;
>>       default:
>>           return false;
>> @@ -565,6 +574,7 @@ static bool uniwill_readable_reg(struct device *dev, 
>> unsigned int reg)
>>       case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>       case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>       case EC_ADDR_CTGP_DB_DB_OFFSET:
>> +    case EC_ADDR_USB_C_POWER_PRIORITY:
>>           return true;
>>       default:
>>           return false;
>> @@ -587,6 +597,7 @@ static bool uniwill_volatile_reg(struct device *dev, 
>> unsigned int reg)
>>       case EC_ADDR_TRIGGER:
>>       case EC_ADDR_SWITCH_STATUS:
>>       case EC_ADDR_CHARGE_CTRL:
>> +    case EC_ADDR_USB_C_POWER_PRIORITY:
>>           return true;
>>       default:
>>           return false;
>> @@ -883,6 +894,106 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_data 
>> *data)
>>       return 0;
>>   }
>>   +static const char * const USB_C_POWER_PRIORITY_OPTIONS_TEXT[] = {
>> +    [USB_C_POWER_PRIORITY_OPTIONS_CHARGING]        = "charging",
>> +    [USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE]    = "performance",
>> +};
>> +
>> +static const u8 USB_C_POWER_PRIORITY_OPTIONS_VALUE[] = {
>> +    [USB_C_POWER_PRIORITY_OPTIONS_CHARGING]        = 0,
>> +    [USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE]    = USB_C_POWER_PRIORITY,
>> +};
>> +
>> +static ssize_t usb_c_power_priority_store(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      const char *buf, size_t count)
>> +{
>> +    struct uniwill_data *data = dev_get_drvdata(dev);
>> +    enum usb_c_power_priority_options option;
>> +    unsigned int value;
>> +    int ret;
>> +
>> +    option = sysfs_match_string(USB_C_POWER_PRIORITY_OPTIONS_TEXT, buf);
>> +    if (option < 0)
>> +        return option;
>> +
>> +    value = USB_C_POWER_PRIORITY_OPTIONS_VALUE[option];
>> +
>> +    guard(mutex)(&data->usb_c_power_priority_lock);
>> +
>> +    ret = regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
>> +                 USB_C_POWER_PRIORITY, value);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    data->last_usb_c_power_priority_option = option;
>> +
>> +    return count;
>> +}
>> +
>> +static ssize_t usb_c_power_priority_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buf)
>> +{
>> +    struct uniwill_data *data = dev_get_drvdata(dev);
>> +    unsigned int value, i;
>> +    int ret;
>> +
>> +    ret = regmap_read(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY, &value);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    value &= USB_C_POWER_PRIORITY;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(USB_C_POWER_PRIORITY_OPTIONS_VALUE); ++i)
>> +        if (USB_C_POWER_PRIORITY_OPTIONS_VALUE[i] == value)
>> +            return sysfs_emit(buf, "%s\n",
>> +                      USB_C_POWER_PRIORITY_OPTIONS_TEXT[i]);
>> +
>
> Please drop this for-loop and use a if-statement instead:
>
>     if (value & USB_C_POWER_PRIORITY)
>         return sysfs_emit(buf, "%s\n", 
> USB_C_POWER_PRIORITY_OPTIONS_TEXT[USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE]);
>
>     return sysfs_emit(buf, "%s\n", 
> USB_C_POWER_PRIORITY_OPTIONS_TEXT[USB_C_POWER_PRIORITY_OPTIONS_CHARGING]);
>
> Also, i think USB_C_POWER_PRIORITY_OPTIONS_VALUE[] is unnecessary. Using an 
> if-statement would yield more readable
> code than using for-loops in this case.

I can see where the for loop is unnecessary, but 
dropping USB_C_POWER_PRIORITY_OPTIONS_VALUE kinda obfuscates that there are 2 
profiles, i like the clear association with the enum and stuff. the compile will 
be optimizing it out anyway.

>
>> +    /* Since all possible values are valid, this should be unreachable. */
>> +    return -EINVAL;
>> +}
>> +
>> +static DEVICE_ATTR_RW(usb_c_power_priority);
>> +
>> +static int usb_c_power_priority_restore(struct uniwill_data *data)
>> +{
>> +    unsigned int value;
>> +
>> +    value = 
>> USB_C_POWER_PRIORITY_OPTIONS_VALUE[data->last_usb_c_power_priority_option];
>
> You need to take the appropriate mutex here.
ack
>
>> +
>> +    return regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
>> +                  USB_C_POWER_PRIORITY, value);
>> +}
>> +
>> +static int usb_c_power_priority_init(struct uniwill_data *data)
>> +{
>> +    unsigned int value, i;
>> +    int ret;
>> +
>> +    if (!uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>> +        return 0;
>> +
>> +    ret = devm_mutex_init(data->dev, &data->usb_c_power_priority_lock);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = regmap_read(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY, &value);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    value &= USB_C_POWER_PRIORITY;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(USB_C_POWER_PRIORITY_OPTIONS_VALUE); ++i)
>> +        if (USB_C_POWER_PRIORITY_OPTIONS_VALUE[i] == value) {
>> +            data->last_usb_c_power_priority_option = i;
>> +            return 0;
>> +        }
>
> Please drop this for-loop and use an if-statement instead.
ok
>
>> +
>> +    /* Since all possible values are valid, this should be unreachable. */
>> +    return -EINVAL;
>> +}
>> +
>>   static struct attribute *uniwill_attrs[] = {
>>       /* Keyboard-related */
>>       &dev_attr_fn_lock.attr,
>> @@ -893,6 +1004,7 @@ static struct attribute *uniwill_attrs[] = {
>>       &dev_attr_breathing_in_suspend.attr,
>>       /* Power-management-related */
>>       &dev_attr_ctgp_offset.attr,
>> +    &dev_attr_usb_c_power_priority.attr,
>>       NULL
>>   };
>>   @@ -927,6 +1039,11 @@ static umode_t uniwill_attr_is_visible(struct kobject 
>> *kobj, struct attribute *a
>>               return attr->mode;
>>       }
>>   +    if (attr == &dev_attr_usb_c_power_priority.attr) {
>> +        if (uniwill_device_supports(data, 
>> UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>> +            return attr->mode;
>> +    }
>> +
>>       return 0;
>>   }
>>   @@ -1417,11 +1534,10 @@ static int uniwill_notifier_call(struct 
>> notifier_block *nb, unsigned long action
>>             return NOTIFY_OK;
>>       case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>> -        /* noop for the time being, will change once charging priority
>> -         * gets implemented.
>> -         */
>> +        if (!uniwill_device_supports(data, 
>> UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>> +            return NOTIFY_DONE;
>>   -        return NOTIFY_OK;
>> +        return notifier_from_errno(usb_c_power_priority_restore(data));
>>       case UNIWILL_OSD_FN_LOCK:
>>           if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
>>               return NOTIFY_DONE;
>> @@ -1515,10 +1631,15 @@ static int uniwill_probe(struct platform_device *pdev)
>>           return PTR_ERR(regmap);
>>         data->regmap = regmap;
>> +
>>       ret = devm_mutex_init(&pdev->dev, &data->super_key_lock);
>>       if (ret < 0)
>>           return ret;
>>   +    ret = usb_c_power_priority_init(data);
>> +    if (ret < 0)
>> +        return ret;
>> +
>>       ret = uniwill_ec_init(data);
>>       if (ret < 0)
>>           return ret;
>> @@ -1681,6 +1802,14 @@ static int uniwill_resume_nvidia_ctgp(struct 
>> uniwill_data *data)
>>                      CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE);
>>   }
>>   +static int uniwill_resume_usb_c_power_priority(struct uniwill_data *data)
>> +{
>> +    if (!uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>> +        return 0;
>
> I think it would make sense to move the feature check into 
> usb_c_power_priority_restore().
> This way usb_c_power_priority_restore() can be called by both the notifier and 
> the resume
> code directly.

How would i then distinct between returning NOTIFY_DONE and NOTIFY_OK? 
notifier_from_errno only returns NOTIFY_OK.

>
> It would also be very nice if you can include a short changelog with your next 
> patch series.

ack

Best Regerds,

Werner

>
> Thanks,
> Armin Wolf
>
>> +
>> +    return usb_c_power_priority_restore(data);
>> +}
>> +
>>   static int uniwill_resume(struct device *dev)
>>   {
>>       struct uniwill_data *data = dev_get_drvdata(dev);
>> @@ -1704,7 +1833,11 @@ static int uniwill_resume(struct device *dev)
>>       if (ret < 0)
>>           return ret;
>>   -    return uniwill_resume_nvidia_ctgp(data);
>> +    ret = uniwill_resume_nvidia_ctgp(data);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    return uniwill_resume_usb_c_power_priority(data);
>>   }
>>     static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, 
>> uniwill_resume);
