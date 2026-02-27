Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA90E3A1D06;
	Fri, 27 Feb 2026 18:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772218099; cv=none; b=tgKHh0LZecJDE7Agm7t1HmGSHPl/+xHk0Y5kDX4iBRzzC54Q5JnX+CR3n5wPE3ZOqKaBXEgsh/g0My9/CJvWji0ZXqyZTIqUHqU9fvuwjUvm0wZka94DyKMz1duxzQ+YpoS0U88L3ZS4bZytPtUKPpNBNXFKfrgD68Xm2Gv8+qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772218099; c=relaxed/simple;
	bh=TtZszQ4IMN11ChuB+7Yv8hUqoRu135gefi49qkXCEBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJPPnAQxHtdXk5q+sHh9vllCzn2EIdcvfTGLSf2unUvck4/0NBNS17Y/r67RXpSfrinAOrwn5lZ0jgJ9Pz3xUwvc1O687vnWvLAjfJft2O9EEWbKK7YwCe2Drpacyxfw4rxuqA9c1myZMO+MU4UxFV1SlR+qmYqw5xSz8c1jj9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=G3inbhGN; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="G3inbhGN"
Received: from [192.168.178.24] (i5C75F712.versanet.de [92.117.247.18])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 745372FC004D;
	Fri, 27 Feb 2026 19:48:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772218093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQ0C/7rCOuT329cladohpccoxsCpR5D3AjlP5sC3s2Q=;
	b=G3inbhGN0yGnpWaSwOIo1ilQCvkjx394Xbx8aEG1GEC43D4zkGGlwZ6Q4brhh6zVpCx0U2
	2Zi+c/aJfbx6SAzc4zskkl65nYBHsPLcYWs0qCtJh89exUpzBuxzTJxJt7iKwcMb7lcvk+
	GygdexpIvW8K34TawrfeWzB8tYIsZTM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <ac3abd10-4036-48e5-95dc-637658acc03a@tuxedocomputers.com>
Date: Fri, 27 Feb 2026 19:48:13 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] platform/x86/uniwill: Implement USB-C power
 priority setting
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226205302.123782-1-wse@tuxedocomputers.com>
 <20260226205302.123782-3-wse@tuxedocomputers.com>
 <3123878e-d791-418f-af3c-29076afd6ddc@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <3123878e-d791-418f-af3c-29076afd6ddc@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 27.02.26 um 10:31 schrieb Armin Wolf:
> Am 26.02.26 um 21:50 schrieb Werner Sembach:
>
>> On some devices Uniwill offers the option to set the USB-C port to
>> prioritise charging or performance. This patch exposes this setting to the
>> userspace via sysfs for all TUXEDO devices supporting it.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 103 ++++++++++++++++++--
>>   1 file changed, 97 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 7ab82cf16f388..a34b1eed74eb2 100644
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
>> @@ -324,6 +324,7 @@
>>   #define UNIWILL_FEATURE_PRIMARY_FAN        BIT(7)
>>   #define UNIWILL_FEATURE_SECONDARY_FAN        BIT(8)
>>   #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL    BIT(9)
>> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY    BIT(10)
>>     struct uniwill_data {
>>       struct device *dev;
>> @@ -343,6 +344,8 @@ struct uniwill_data {
>>       struct mutex input_lock;    /* Protects input sequence during notify */
>>       struct input_dev *input_device;
>>       struct notifier_block nb;
>> +    struct mutex usb_c_power_priority_lock; /* Protects dependent bit write 
>> and state safe */
>> +    unsigned int last_usb_c_power_priority;
>>   };
>>     struct uniwill_battery_entry {
>> @@ -527,6 +530,7 @@ static bool uniwill_writeable_reg(struct device *dev, 
>> unsigned int reg)
>>       case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>       case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>       case EC_ADDR_CTGP_DB_DB_OFFSET:
>> +    case EC_ADDR_USB_C_POWER_PRIORITY:
>>           return true;
>>       default:
>>           return false;
>> @@ -565,6 +569,7 @@ static bool uniwill_readable_reg(struct device *dev, 
>> unsigned int reg)
>>       case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>       case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>       case EC_ADDR_CTGP_DB_DB_OFFSET:
>> +    case EC_ADDR_USB_C_POWER_PRIORITY:
>>           return true;
>>       default:
>>           return false;
>> @@ -587,6 +592,7 @@ static bool uniwill_volatile_reg(struct device *dev, 
>> unsigned int reg)
>>       case EC_ADDR_TRIGGER:
>>       case EC_ADDR_SWITCH_STATUS:
>>       case EC_ADDR_CHARGE_CTRL:
>> +    case EC_ADDR_USB_C_POWER_PRIORITY:
>>           return true;
>>       default:
>>           return false;
>> @@ -883,6 +889,78 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_data 
>> *data)
>>       return 0;
>>   }
>>   +enum usb_c_power_priority_options {
>> +    USB_C_POWER_PRIORITY_OPTIONS_CHARGING = 0,
>> +    USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE,
>> +};
>> +
>> +static const char * const USB_C_POWER_PRIORITY_OPTIONS_TEXT[] = {
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
>> +    unsigned int value;
>> +    int ret;
>> +
>> +    ret = sysfs_match_string(USB_C_POWER_PRIORITY_OPTIONS_TEXT, buf);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    value = USB_C_POWER_PRIORITY_OPTIONS_VALUE[ret];
>> +
>> +    guard(mutex)(&data->usb_c_power_priority_lock);
>> +
>> +    ret = regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
>> +                 USB_C_POWER_PRIORITY, value);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    data->last_usb_c_power_priority = value;
>> +
>> +    return count;
>> +}
>> +
>> +static ssize_t usb_c_power_priority_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buf)
>> +{
>> +    struct uniwill_data *data = dev_get_drvdata(dev);
>> +    unsigned int value;
>> +    ssize_t count = 0;
>> +    int ret;
>> +
>> +    ret = regmap_read(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY, &value);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    value &= USB_C_POWER_PRIORITY;
>> +
>> +    for (int i = 0; i < ARRAY_SIZE(USB_C_POWER_PRIORITY_OPTIONS_VALUE); ++i) {
>> +        if (USB_C_POWER_PRIORITY_OPTIONS_VALUE[i] == value)
>> +            count += sysfs_emit_at(buf, count, "[%s] ",
>> + USB_C_POWER_PRIORITY_OPTIONS_TEXT[i]);
>> +        else
>> +            count += sysfs_emit_at(buf, count, "%s ",
>> + USB_C_POWER_PRIORITY_OPTIONS_TEXT[i]);
>> +    }
>> +    if (count)
>> +        buf[count - 1] = '\n';
>> +
>> +    return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(usb_c_power_priority);
>> +
>>   static struct attribute *uniwill_attrs[] = {
>>       /* Keyboard-related */
>>       &dev_attr_fn_lock.attr,
>> @@ -893,6 +971,7 @@ static struct attribute *uniwill_attrs[] = {
>>       &dev_attr_breathing_in_suspend.attr,
>>       /* Power-management-related */
>>       &dev_attr_ctgp_offset.attr,
>> +    &dev_attr_usb_c_power_priority.attr,
>>       NULL
>>   };
>>   @@ -927,6 +1006,11 @@ static umode_t uniwill_attr_is_visible(struct kobject 
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
>>   @@ -1417,11 +1501,13 @@ static int uniwill_notifier_call(struct 
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
>> +        return notifier_from_errno(regmap_update_bits(data->regmap,
>> +                                  EC_ADDR_OEM_4,
>> +                                  USB_C_POWER_PRIORITY,
>> + data->last_usb_c_power_priority));
>
> You need to lock the associated mutex here before accessing 
> last_usb_c_power_priority. Since this
> is not possible inside a switch statement when using guard(), i suggest that 
> you move this code
> (feature check + register access) into a small helper function.
>
>>       case UNIWILL_OSD_FN_LOCK:
>>           if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
>>               return NOTIFY_DONE;
>> @@ -1515,10 +1601,15 @@ static int uniwill_probe(struct platform_device *pdev)
>>           return PTR_ERR(regmap);
>>         data->regmap = regmap;
>> +
>>       ret = devm_mutex_init(&pdev->dev, &data->super_key_lock);
>>       if (ret < 0)
>>           return ret;
>>   +    ret = devm_mutex_init(&pdev->dev, &data->usb_c_power_priority_lock);
>> +    if (ret < 0)
>> +        return ret;
>
> last_usb_c_power_priority still needs to be initialized with the value of 
> USB_C_POWER_PRIORITY here.
> I suggest that you move all of this (feature check + mutex + init) into a 
> small helper function.
ack
>
> Thanks,
> Armin Wolf
>
>> +
>>       ret = uniwill_ec_init(data);
>>       if (ret < 0)
>>           return ret;
