Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2DB4266A8;
	Thu, 26 Feb 2026 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772121318; cv=none; b=IqY1mHpezLRmkIkB0nNm1LL5MlF/SlcNqEn0qaEXY+/80Zj/u8xdofET1NR48+aU1ymVuDQh+loSEtG74klvIFg+abFl1iUFifKjvEowaDjtM8Z5Ph34Ipwvnt6gjnJ+urw3ceANJKAxkum2yX+QweIQGKgouKkCbt35NCzp9ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772121318; c=relaxed/simple;
	bh=XkW/7y8pyrusX0h8pfAkon1HdB3n89h643xXWGeuoZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ap4Ai2QNYm6akSeOlBAiRw+WstGW4o7imKC4FQGWXYIqLk9pmK6KBa7vuFXAkIfVYVCISkvKwaKsXxmbSj3qFaQ21z/uIVEEtH92rd1Xbm+XXhhCgnrLH3woclddtID72Luh4a+jq7X7lgvswlP3p1wYCjHDoIu3beHBeaqGeo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=qE8nxsGt; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="qE8nxsGt"
Received: from [192.168.178.24] (i5C75F712.versanet.de [92.117.247.18])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 6D29E2FC005F;
	Thu, 26 Feb 2026 16:55:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772121303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIxHyQwmyeQ0bBX88j6Q4Zbk4B+rSIMhsQIn3/fIAz4=;
	b=qE8nxsGt4cEpnhZjjZXOcky1oFiQnKeilrfg+ISB9yfGy3GLxLMWYsGPz1IByB45wEs2Jd
	iwJ6+jU3v+ltNESw7lY4ixefBRld85hd4ZljJH3Qi+2CnU1YTVLF08t/GbSPRgZcefYEJt
	uW2GpTIZR2Q+kn5tLz3AVbjQ0Ukmmsk=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <42df9fcf-2037-41a0-aac7-f255e9e46c82@tuxedocomputers.com>
Date: Thu, 26 Feb 2026 16:55:02 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform/x86/uniwill: Implement USB-C power priority
 setting
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226003408.1623547-1-wse@tuxedocomputers.com>
 <20260226003408.1623547-2-wse@tuxedocomputers.com>
 <fb265a61-df38-472e-b155-c19f4dea2049@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <fb265a61-df38-472e-b155-c19f4dea2049@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 26.02.26 um 02:11 schrieb Armin Wolf:
> Am 26.02.26 um 01:31 schrieb Werner Sembach:
>
>> On some devices Uniwill offers the option to set the USB-C port to
>> prioritise charging or performance. This patch exposes this setting to the
>> userspace via sysfs for all TUXEDO devices supporting it.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 99 +++++++++++++++++++--
>>   1 file changed, 94 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 7ab82cf16f388..4d9657a3b8c10 100644
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
>> @@ -343,6 +344,7 @@ struct uniwill_data {
>>       struct mutex input_lock;    /* Protects input sequence during notify */
>>       struct input_dev *input_device;
>>       struct notifier_block nb;
>> +    unsigned int last_usb_c_power_priority;
>>   };
>>     struct uniwill_battery_entry {
>> @@ -527,6 +529,7 @@ static bool uniwill_writeable_reg(struct device *dev, 
>> unsigned int reg)
>>       case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>       case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>       case EC_ADDR_CTGP_DB_DB_OFFSET:
>> +    case EC_ADDR_USB_C_POWER_PRIORITY:
>>           return true;
>>       default:
>>           return false;
>> @@ -565,6 +568,7 @@ static bool uniwill_readable_reg(struct device *dev, 
>> unsigned int reg)
>>       case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>       case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>       case EC_ADDR_CTGP_DB_DB_OFFSET:
>> +    case EC_ADDR_USB_C_POWER_PRIORITY:
>>           return true;
>>       default:
>>           return false;
>> @@ -587,6 +591,7 @@ static bool uniwill_volatile_reg(struct device *dev, 
>> unsigned int reg)
>>       case EC_ADDR_TRIGGER:
>>       case EC_ADDR_SWITCH_STATUS:
>>       case EC_ADDR_CHARGE_CTRL:
>> +    case EC_ADDR_USB_C_POWER_PRIORITY:
>>           return true;
>>       default:
>>           return false;
>> @@ -883,6 +888,86 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_data 
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
>
> Please put a blank line here.
ack
>
>> +    value = USB_C_POWER_PRIORITY_OPTIONS_VALUE[ret];
>> +
>> +    ret = regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
>> +                 USB_C_POWER_PRIORITY, value);
>> +    if (ret < 0)
>> +        return ret;
>> +
>
> I think you need a mutex here, so concurrent writes to the charging priority
> sysfs attribute are serialized. This mutex would then also protect concurrent
> access to data->last_usb_c_power_priority by the event handler.
ack
>
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
>
> Please just emit 
> USB_C_POWER_PRIORITY_OPTIONS_VALUE[USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE] 
> directly
> when the bit is set, and 
> USB_C_POWER_PRIORITY_OPTIONS_VALUE[USB_C_POWER_PRIORITY_OPTIONS_CHARGING] 
> otherwise.
> This for loop provides no real value.

It does give context on which values are available. It it is otherwise not 
easily deduceable without referring to the documentation.

Also USB_C_POWER_PRIORITY_OPTIONS_VALUE[USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE] 
is BIT(7) which is a kinda random number when expressed as an integer.

>
>> +
>> +    return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(usb_c_power_priority);
>> +
>> +static int usb_c_power_priority_restore(struct uniwill_data *data)
>> +{
>> +    int ret;
>> +
>> +    ret = regmap_update_bits(data->regmap, EC_ADDR_OEM_4, USB_C_POWER_PRIORITY,
>> +                 data->last_usb_c_power_priority);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    return ret;
>
> Please check the feature flag here before performing the register access. You 
> should also
> omit "ret" and instead return the result directly.
ack
>
> Maybe you also need to add the appropriate suspend/resume functions for this?
tuxedo-drivers doesn't have it for this, so it's probably not necessary
>
>> +}
>> +
>>   static struct attribute *uniwill_attrs[] = {
>>       /* Keyboard-related */
>>       &dev_attr_fn_lock.attr,
>> @@ -893,6 +978,7 @@ static struct attribute *uniwill_attrs[] = {
>>       &dev_attr_breathing_in_suspend.attr,
>>       /* Power-management-related */
>>       &dev_attr_ctgp_offset.attr,
>> +    &dev_attr_usb_c_power_priority.attr,
>>       NULL
>>   };
>>   @@ -927,6 +1013,11 @@ static umode_t uniwill_attr_is_visible(struct kobject 
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
>>   @@ -1417,9 +1508,7 @@ static int uniwill_notifier_call(struct 
>> notifier_block *nb, unsigned long action
>>             return NOTIFY_OK;
>>       case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>> -        /* noop for the time being, will change once charging priority
>> -         * gets implemented.
>> -         */
>> +        usb_c_power_priority_restore(data);
>
> Please use notifier_from_errno() here.
ack
>
> Thanks,
> Armin Wolf
>
>>             return NOTIFY_OK;
>>       case UNIWILL_OSD_FN_LOCK:
