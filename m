Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731A13451A9;
	Mon,  4 May 2026 08:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777884900; cv=none; b=BdSwRNy6W8LZNiVjWBw/Jb4aQWYj9wJwU7GbCFOq9nYa/3FDzTaVDvFes3emGu6lqohpWbEOiqvNzfSK/jamLuDFPtmEm67kG8OBxBbQ3AVw3N/Bi8jJJ0J9NQva7vA4qvzNHp8ELO7DdliNZAprBekE6z5eGkSZoQWTq3xf/w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777884900; c=relaxed/simple;
	bh=GjgyGeVmdUKY7l/qJ15PEke3+CAADTv+LBaJSf9Z0JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6EA2yIMACjNlMPfcFFtTATKyAGLZEhUYus1zWp/d5YPw98vzsqdvREMtYdfKwu4jGs8nr6QqxXU8DA7hxhT40TCGcFi4wv2ptmLzPQj6cTG18nuB37ZM73BzA9c7+mjbJ62FXIVuKacuMR4ortI+u7SrGE0KLZrUj/pUGwMhk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=myr+wPEK; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="myr+wPEK"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id E59D42FC004D;
	Mon,  4 May 2026 10:44:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1777884295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hg6RRgBUexx8NAWeHA0dERdMiQKEIFPlZCAlnaJSh0Q=;
	b=myr+wPEKSitny05A72veOZpqtpu9DsrqfDCJYABuK0JrvNAKDGy/TzqTwb8pEJRrhcvDXC
	0GA0kcqtRDdxSze5L4gWtsVqSqgAYBaAlIOxKGPjkhPv+kmf7TeHAa1JW4eGwxcqBJPIgG
	9x82Ddlcygybo1eopIL5ykeOs+lEjOI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <c475d7de-48c8-4fe0-b414-2d32988f52dd@tuxedocomputers.com>
Date: Mon, 4 May 2026 10:44:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] platform/x86: uniwill-laptop: Add support for
 battery charge modes
To: Armin Wolf <W_Armin@gmx.de>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260417050912.5582-1-W_Armin@gmx.de>
 <20260417050912.5582-8-W_Armin@gmx.de>
 <e71bdb43-7fcf-519c-c25f-f59cf1489043@linux.intel.com>
 <6570157d-d431-4275-9e73-d09bb1b344c8@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <6570157d-d431-4275-9e73-d09bb1b344c8@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 30.04.26 um 15:41 schrieb Armin Wolf:
> Am 30.04.26 um 15:22 schrieb Ilpo Järvinen:
>> On Fri, 17 Apr 2026, Armin Wolf wrote:
>>
>>> Many Uniwill-based devices do not supports the already existing
>>> charge limit functionality, but instead support an alternative
>>> interface for controlling the battery charge algorithm.
>>>
>>> Add support for this interface and update the documentation.
>>>
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> ---
>>>   .../admin-guide/laptops/uniwill-laptop.rst    |  19 +-
>>>   drivers/platform/x86/uniwill/uniwill-acpi.c   | 243 ++++++++++++++----
>>>   drivers/platform/x86/uniwill/uniwill-wmi.c    |   5 +-
>>>   3 files changed, 215 insertions(+), 52 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst 
>>> b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>>> index 1f3ca84c7d88..24b41dbab886 100644
>>> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
>>> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>>> @@ -46,11 +46,20 @@ Battery Charging Control
>>>   .. warning:: Some devices do not properly implement the charging threshold 
>>> interface. Forcing
>>>                the driver to enable access to said interface on such devices 
>>> might damage the
>>>                battery [1]_. Because of this the driver will not enable said 
>>> feature even when
>>> -             using the ``force`` module parameter.
>>> -
>>> -The ``uniwill-laptop`` driver supports controlling the battery charge 
>>> limit. This happens over
>>> -the standard ``charge_control_end_threshold`` power supply sysfs attribute. 
>>> All values
>>> -between 1 and 100 percent are supported.
>>> +             using the ``force`` module parameter. The charging profile 
>>> interface will be
>>> +             available instead.
>>> +
>>> +The ``uniwill-laptop`` driver supports controlling the battery charge 
>>> limit. This either happens
>>> +over the standard ``charge_control_end_threshold`` or ``charge_types`` 
>>> power supply sysfs attribute,
>>> +depending on the device. When using the ``charge_control_end_threshold`` 
>>> sysfs attribute, all values
>>> +between 1 and 100 percent are supported. When using the ``charge_types`` 
>>> sysfs attribute, the driver
>>> +supports switching between the ``Standard``, ``Trickle`` and ``Long Life`` 
>>> profiles.
>>> +
>>> +Keep in mind that when using the ``charge_types`` sysfs attribute, the EC 
>>> firmware will hide the
>>> +true charging status of the battery from the operating system, potentially 
>>> misleading users into
>>> +thinking that the charging profile does not work. Checking the 
>>> ``current_now`` sysfs attribute
>>> +tells you the true charging status of the battery even when using the 
>>> ``charge_types`` sysfs
>>> +attribute (0 means that the battery is currently not charging).
>>>     Additionally the driver signals the presence of battery charging issues 
>>> through the standard
>>>   ``health`` power supply sysfs attribute.
>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> index d4abcaf87e39..e11b6c8aeb0d 100644
>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> @@ -254,6 +254,10 @@
>>>     #define EC_ADDR_OEM_4            0x07A6
>>>   #define OVERBOOST_DYN_TEMP_OFF        BIT(1)
>>> +#define CHARGING_PROFILE_MASK        GENMASK(5, 4)
>>> +#define CHARGING_PROFILE_HIGH_CAPACITY    0x00
>>> +#define CHARGING_PROFILE_BALANCED    0x01
>>> +#define CHARGING_PROFILE_STATIONARY    0x02
>>>   #define TOUCHPAD_TOGGLE_OFF        BIT(6)
>>>     #define EC_ADDR_CHARGE_CTRL        0x07B9
>>> @@ -320,13 +324,15 @@
>>>   #define UNIWILL_FEATURE_SUPER_KEY        BIT(1)
>>>   #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE        BIT(2)
>>>   #define UNIWILL_FEATURE_LIGHTBAR        BIT(3)
>>> -#define UNIWILL_FEATURE_BATTERY            BIT(4)
>>> -#define UNIWILL_FEATURE_CPU_TEMP        BIT(5)
>>> -#define UNIWILL_FEATURE_GPU_TEMP        BIT(6)
>>> -#define UNIWILL_FEATURE_PRIMARY_FAN        BIT(7)
>>> -#define UNIWILL_FEATURE_SECONDARY_FAN        BIT(8)
>>> -#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL    BIT(9)
>>> -#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY    BIT(10)
>>> +#define UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT    BIT(4)
>>> +/* Mutually exclusive with the charge limit feature */
>>> +#define UNIWILL_FEATURE_BATTERY_CHARGE_MODES    BIT(5)
>>
>> This feature seems to be only available through force parameter?
>>
>
> Yes, this is expected to change as soon as Tuxedo can verify if their devices 
> support this feature. I tested it on my Tuxedo device, but i do
> not want to split the feature descriptors too much.
Shouldn't require too much testing, will spin up a patch for it.
>
> Thanks,
> Armin Wolf
>
>> -- 
>>   i.
>>
>>> +#define UNIWILL_FEATURE_CPU_TEMP BIT(6)
>>> +#define UNIWILL_FEATURE_GPU_TEMP        BIT(7)
>>> +#define UNIWILL_FEATURE_PRIMARY_FAN        BIT(8)
>>> +#define UNIWILL_FEATURE_SECONDARY_FAN        BIT(9)
>>> +#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL    BIT(10)
>>> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY    BIT(11)
>>>     enum usb_c_power_priority_options {
>>>       USB_C_POWER_PRIORITY_CHARGING = 0,
>>> @@ -339,8 +345,15 @@ struct uniwill_data {
>>>       struct regmap *regmap;
>>>       unsigned int features;
>>>       struct acpi_battery_hook hook;
>>> -    unsigned int last_charge_ctrl;
>>>       struct mutex battery_lock;    /* Protects the list of currently 
>>> registered batteries */
>>> +    union {
>>> +        struct {
>>> +            /* Protects writes to last_charge_type */
>>> +            struct mutex charge_type_lock;
>>> +            enum power_supply_charge_type last_charge_type;
>>> +        };
>>> +        unsigned int last_charge_ctrl;
>>> +    };
>>>       bool last_fn_lock_state;
>>>       bool last_super_key_enable_state;
>>>       bool last_touchpad_toggle_enable_state;
>>> @@ -447,6 +460,12 @@ static inline bool uniwill_device_supports(const struct 
>>> uniwill_data *data,
>>>       return (data->features & features) == features;
>>>   }
>>>   +static inline bool uniwill_device_supports_any(const struct uniwill_data 
>>> *data,
>>> +                           unsigned int features)
>>> +{
>>> +    return data->features & features;
>>> +}
>>> +
>>>   static int uniwill_ec_reg_write(void *context, unsigned int reg, unsigned 
>>> int val)
>>>   {
>>>       union acpi_object params[2] = {
>>> @@ -1421,6 +1440,30 @@ static int uniwill_led_init(struct uniwill_data *data)
>>>                                &init_data);
>>>   }
>>>   +static int uniwill_read_charge_type(struct uniwill_data *data, enum 
>>> power_supply_charge_type *type)
>>> +{
>>> +    unsigned int value;
>>> +    int ret;
>>> +
>>> +    ret = regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    switch (FIELD_GET(CHARGING_PROFILE_MASK, value)) {
>>> +    case CHARGING_PROFILE_HIGH_CAPACITY:
>>> +        *type = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
>>> +        return 0;
>>> +    case CHARGING_PROFILE_BALANCED:
>>> +        *type = POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
>>> +        return 0;
>>> +    case CHARGING_PROFILE_STATIONARY:
>>> +        *type = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
>>> +        return 0;
>>> +    default:
>>> +        return -EPROTO;
>>> +    }
>>> +}
>>> +
>>>   static int uniwill_get_property(struct power_supply *psy, const struct 
>>> power_supply_ext *ext,
>>>                   void *drvdata, enum power_supply_property psp,
>>>                   union power_supply_propval *val)
>>> @@ -1431,6 +1474,16 @@ static int uniwill_get_property(struct power_supply 
>>> *psy, const struct power_sup
>>>       int ret;
>>>         switch (psp) {
>>> +    case POWER_SUPPLY_PROP_CHARGE_TYPES:
>>> +        /*
>>> +         * We need to use the cached value here because the charging mode
>>> +         * reported by the EC might temporarily change when a external power
>>> +         * source has been connected.
>>> +         */
>>> +        mutex_lock(&data->charge_type_lock);
>>> +        val->intval = data->last_charge_type;
>>> +        mutex_unlock(&data->charge_type_lock);
>>> +        return 0;
>>>       case POWER_SUPPLY_PROP_HEALTH:
>>>           ret = power_supply_get_property_direct(psy, 
>>> POWER_SUPPLY_PROP_PRESENT, &prop);
>>>           if (ret < 0)
>>> @@ -1479,13 +1532,52 @@ static int uniwill_get_property(struct power_supply 
>>> *psy, const struct power_sup
>>>       }
>>>   }
>>>   +static int uniwill_write_charge_type(struct uniwill_data *data, enum 
>>> power_supply_charge_type type)
>>> +{
>>> +    unsigned int value;
>>> +
>>> +    switch (type) {
>>> +    case POWER_SUPPLY_CHARGE_TYPE_TRICKLE:
>>> +        value = FIELD_PREP(CHARGING_PROFILE_MASK, 
>>> CHARGING_PROFILE_STATIONARY);
>>> +        break;
>>> +    case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
>>> +        value = FIELD_PREP(CHARGING_PROFILE_MASK, 
>>> CHARGING_PROFILE_HIGH_CAPACITY);
>>> +        break;
>>> +    case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
>>> +        value = FIELD_PREP(CHARGING_PROFILE_MASK, CHARGING_PROFILE_BALANCED);
>>> +        break;
>>> +    default:
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    return regmap_update_bits(data->regmap, EC_ADDR_OEM_4, 
>>> CHARGING_PROFILE_MASK, value);
>>> +}
>>> +
>>> +static int uniwill_restore_charge_type(struct uniwill_data *data)
>>> +{
>>> +    guard(mutex)(&data->charge_type_lock);
>>> +
>>> +    return uniwill_write_charge_type(data, data->last_charge_type);
>>> +}
>>> +
>>>   static int uniwill_set_property(struct power_supply *psy, const struct 
>>> power_supply_ext *ext,
>>>                   void *drvdata, enum power_supply_property psp,
>>>                   const union power_supply_propval *val)
>>>   {
>>>       struct uniwill_data *data = drvdata;
>>> +    int ret;
>>>         switch (psp) {
>>> +    case POWER_SUPPLY_PROP_CHARGE_TYPES:
>>> +        mutex_lock(&data->charge_type_lock);
>>> +
>>> +        ret = uniwill_write_charge_type(data, val->intval);
>>> +        if (ret >= 0)
>>> +            data->last_charge_type = val->intval;
>>> +
>>> +        mutex_unlock(&data->charge_type_lock);
>>> +
>>> +        return ret;
>>>       case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>>>           if (val->intval < 0 || val->intval > 100)
>>>               return -EINVAL;
>>> @@ -1501,21 +1593,41 @@ static int uniwill_property_is_writeable(struct 
>>> power_supply *psy,
>>>                        const struct power_supply_ext *ext, void *drvdata,
>>>                        enum power_supply_property psp)
>>>   {
>>> -    if (psp == POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
>>> +    switch (psp) {
>>> +    case POWER_SUPPLY_PROP_CHARGE_TYPES:
>>> +    case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>>>           return true;
>>> -
>>> -    return false;
>>> +    default:
>>> +        return false;
>>> +    }
>>>   }
>>>   -static const enum power_supply_property uniwill_properties[] = {
>>> +static const enum power_supply_property uniwill_charge_limit_properties[] = {
>>>       POWER_SUPPLY_PROP_HEALTH,
>>>       POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
>>>   };
>>>   -static const struct power_supply_ext uniwill_extension = {
>>> +static const struct power_supply_ext uniwill_charge_limit_extension = {
>>>       .name = DRIVER_NAME,
>>> -    .properties = uniwill_properties,
>>> -    .num_properties = ARRAY_SIZE(uniwill_properties),
>>> +    .properties = uniwill_charge_limit_properties,
>>> +    .num_properties = ARRAY_SIZE(uniwill_charge_limit_properties),
>>> +    .get_property = uniwill_get_property,
>>> +    .set_property = uniwill_set_property,
>>> +    .property_is_writeable = uniwill_property_is_writeable,
>>> +};
>>> +
>>> +static const enum power_supply_property uniwill_charge_modes_properties[] = {
>>> +    POWER_SUPPLY_PROP_CHARGE_TYPES,
>>> +    POWER_SUPPLY_PROP_HEALTH,
>>> +};
>>> +
>>> +static const struct power_supply_ext uniwill_charge_modes_extension = {
>>> +    .name = DRIVER_NAME,
>>> +    .charge_types = BIT(POWER_SUPPLY_CHARGE_TYPE_TRICKLE) |
>>> +            BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
>>> +            BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE),
>>> +    .properties = uniwill_charge_modes_properties,
>>> +    .num_properties = ARRAY_SIZE(uniwill_charge_modes_properties),
>>>       .get_property = uniwill_get_property,
>>>       .set_property = uniwill_set_property,
>>>       .property_is_writeable = uniwill_property_is_writeable,
>>> @@ -1531,7 +1643,13 @@ static int uniwill_add_battery(struct power_supply 
>>> *battery, struct acpi_battery
>>>       if (!entry)
>>>           return -ENOMEM;
>>>   -    ret = power_supply_register_extension(battery, &uniwill_extension, 
>>> data->dev, data);
>>> +    if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
>>> +        ret = power_supply_register_extension(battery, 
>>> &uniwill_charge_limit_extension,
>>> +                              data->dev, data);
>>> +    else
>>> +        ret = power_supply_register_extension(battery, 
>>> &uniwill_charge_modes_extension,
>>> +                              data->dev, data);
>>> +
>>>       if (ret < 0) {
>>>           kfree(entry);
>>>           return ret;
>>> @@ -1560,7 +1678,10 @@ static int uniwill_remove_battery(struct power_supply 
>>> *battery, struct acpi_batt
>>>           }
>>>       }
>>>   -    power_supply_unregister_extension(battery, &uniwill_extension);
>>> +    if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
>>> +        power_supply_unregister_extension(battery, 
>>> &uniwill_charge_limit_extension);
>>> +    else
>>> +        power_supply_unregister_extension(battery, 
>>> &uniwill_charge_modes_extension);
>>>         return 0;
>>>   }
>>> @@ -1570,27 +1691,36 @@ static int uniwill_battery_init(struct uniwill_data 
>>> *data)
>>>       unsigned int value, threshold;
>>>       int ret;
>>>   -    if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
>>> -        return 0;
>>> +    if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT)) {
>>> +        ret = regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &value);
>>> +        if (ret < 0)
>>> +            return ret;
>>>   -    ret = regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &value);
>>> -    if (ret < 0)
>>> -        return ret;
>>> +        /*
>>> +         * The charge control threshold might be initialized with 0 by
>>> +         * the EC to signal that said threshold is uninitialized. We thus
>>> +         * need to replace this value with 100 to signal that we want to
>>> +         * take control of battery charging. For the sake of completeness
>>> +         * we also set the charging threshold to 100 if the EC-provided
>>> +         * value is invalid.
>>> +         */
>>> +        threshold = FIELD_GET(CHARGE_CTRL_MASK, value);
>>> +        if (threshold == 0 || threshold > 100) {
>>> +            FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
>>> +            ret = regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL, value);
>>> +            if (ret < 0)
>>> +                return ret;
>>> +        }
>>> +    } else if (uniwill_device_supports(data, 
>>> UNIWILL_FEATURE_BATTERY_CHARGE_MODES)) {
>>> +        ret = devm_mutex_init(data->dev, &data->charge_type_lock);
>>> +        if (ret < 0)
>>> +            return ret;
>>>   -    /*
>>> -     * The charge control threshold might be initialized with 0 by
>>> -     * the EC to signal that said threshold is uninitialized. We thus
>>> -     * need to replace this value with 100 to signal that we want to
>>> -     * take control of battery charging. For the sake of completeness
>>> -     * we also set the charging threshold to 100 if the EC-provided
>>> -     * value is invalid.
>>> -     */
>>> -    threshold = FIELD_GET(CHARGE_CTRL_MASK, value);
>>> -    if (threshold == 0 || threshold > 100) {
>>> -        FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
>>> -        ret = regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL, value);
>>> +        ret = uniwill_read_charge_type(data, &data->last_charge_type);
>>>           if (ret < 0)
>>>               return ret;
>>> +    } else {
>>> +        return 0;
>>>       }
>>>         ret = devm_mutex_init(data->dev, &data->battery_lock);
>>> @@ -1609,10 +1739,13 @@ static int uniwill_notifier_call(struct 
>>> notifier_block *nb, unsigned long action
>>>   {
>>>       struct uniwill_data *data = container_of(nb, struct uniwill_data, nb);
>>>       struct uniwill_battery_entry *entry;
>>> +    int ret;
>>>         switch (action) {
>>>       case UNIWILL_OSD_BATTERY_ALERT:
>>> -        if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
>>> +        if (!uniwill_device_supports_any(data,
>>> +                         UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>>> + UNIWILL_FEATURE_BATTERY_CHARGE_MODES))
>>>               return NOTIFY_DONE;
>>>             mutex_lock(&data->battery_lock);
>>> @@ -1623,10 +1756,24 @@ static int uniwill_notifier_call(struct 
>>> notifier_block *nb, unsigned long action
>>>             return NOTIFY_OK;
>>>       case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>>> -        if (!uniwill_device_supports(data, 
>>> UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>>> +        if (!uniwill_device_supports_any(data,
>>> +                         UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
>>> + UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>>>               return NOTIFY_DONE;
>>>   -        return notifier_from_errno(usb_c_power_priority_restore(data));
>>> +        if (uniwill_device_supports(data, 
>>> UNIWILL_FEATURE_BATTERY_CHARGE_MODES)) {
>>> +            ret = uniwill_restore_charge_type(data);
>>> +            if (ret < 0)
>>> +                return notifier_from_errno(ret);
>>> +        }
>>> +
>>> +        if (uniwill_device_supports(data, 
>>> UNIWILL_FEATURE_USB_C_POWER_PRIORITY)) {
>>> +            ret = usb_c_power_priority_restore(data);
>>> +            if (ret < 0)
>>> +                return notifier_from_errno(ret);
>>> +        }
>>> +
>>> +        return NOTIFY_OK;
>>>       case UNIWILL_OSD_FN_LOCK:
>>>           if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
>>>               return NOTIFY_DONE;
>>> @@ -1810,7 +1957,7 @@ static int uniwill_suspend_touchpad_toggle(struct 
>>> uniwill_data *data)
>>>     static int uniwill_suspend_battery(struct uniwill_data *data)
>>>   {
>>> -    if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
>>> +    if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
>>>           return 0;
>>>         /*
>>> @@ -1887,11 +2034,15 @@ static int uniwill_resume_touchpad_toggle(struct 
>>> uniwill_data *data)
>>>     static int uniwill_resume_battery(struct uniwill_data *data)
>>>   {
>>> -    if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
>>> -        return 0;
>>>   -    return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, 
>>> CHARGE_CTRL_MASK,
>>> -                  data->last_charge_ctrl);
>>> +    if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_MODES))
>>> +        return uniwill_restore_charge_type(data);
>>> +
>>> +    if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
>>> +        return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, 
>>> CHARGE_CTRL_MASK,
>>> +                      data->last_charge_ctrl);
>>> +
>>> +    return 0;
>>>   }
>>>     static int uniwill_resume_nvidia_ctgp(struct uniwill_data *data)
>>> @@ -1970,7 +2121,7 @@ static struct platform_driver uniwill_driver = {
>>>     static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor 
>>> __initdata = {
>>>       .features = UNIWILL_FEATURE_SUPER_KEY |
>>> -            UNIWILL_FEATURE_BATTERY |
>>> +            UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>>>               UNIWILL_FEATURE_CPU_TEMP |
>>>               UNIWILL_FEATURE_GPU_TEMP |
>>>               UNIWILL_FEATURE_PRIMARY_FAN |
>>> @@ -1981,7 +2132,7 @@ static struct uniwill_device_descriptor 
>>> lapac71h_descriptor __initdata = {
>>>       .features = UNIWILL_FEATURE_FN_LOCK |
>>>               UNIWILL_FEATURE_SUPER_KEY |
>>>               UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>>> -            UNIWILL_FEATURE_BATTERY |
>>> +            UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>>>               UNIWILL_FEATURE_CPU_TEMP |
>>>               UNIWILL_FEATURE_GPU_TEMP |
>>>               UNIWILL_FEATURE_PRIMARY_FAN |
>>> @@ -1993,7 +2144,7 @@ static struct uniwill_device_descriptor 
>>> lapkc71f_descriptor __initdata = {
>>>               UNIWILL_FEATURE_SUPER_KEY |
>>>               UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>>>               UNIWILL_FEATURE_LIGHTBAR |
>>> -            UNIWILL_FEATURE_BATTERY |
>>> +            UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>>>               UNIWILL_FEATURE_CPU_TEMP |
>>>               UNIWILL_FEATURE_GPU_TEMP |
>>>               UNIWILL_FEATURE_PRIMARY_FAN |
>>> @@ -2579,7 +2730,7 @@ static int __init uniwill_init(void)
>>>         if (force) {
>>>           /* Assume that the device supports all features except the charge 
>>> limit */
>>> -        device_descriptor.features = UINT_MAX & ~UNIWILL_FEATURE_BATTERY;
>>> +        device_descriptor.features = UINT_MAX & 
>>> ~UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT;
>>>           pr_warn("Enabling potentially unsupported features\n");
>>>       }
>>>   diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c 
>>> b/drivers/platform/x86/uniwill/uniwill-wmi.c
>>> index 31d9c39f14ab..f1b89bc63df6 100644
>>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.c
>>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
>>> @@ -48,6 +48,7 @@ int devm_uniwill_wmi_register_notifier(struct device *dev, 
>>> struct notifier_block
>>>   static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_object 
>>> *obj)
>>>   {
>>>       u32 value;
>>> +    int ret;
>>>         if (obj->type != ACPI_TYPE_INTEGER)
>>>           return;
>>> @@ -56,7 +57,9 @@ static void uniwill_wmi_notify(struct wmi_device *wdev, 
>>> union acpi_object *obj)
>>>         dev_dbg(&wdev->dev, "Received WMI event %u\n", value);
>>>   - blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NULL);
>>> +    ret = blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NULL);
>>> +    if (notifier_to_errno(ret) < 0)
>>> +        dev_err(&wdev->dev, "Failed to handle event %u\n", value);
>>>   }
>>>     /*
>>>
>>
>
