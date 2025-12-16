Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093AC366DCC;
	Tue, 16 Dec 2025 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898899; cv=none; b=p0G5zwIEfj5TzGiEpIKtd+BgNJxfcgV1FNvDvL5TxuWaOUGtsLYkGRDn+jZmSTwU/QfRng1XRnPVKdExLS1k9TnuWNJGxXPOBb41+UWxghpOM07V0/04il/Rx0E4bPoQiN/f3QG8JRBgZsQfASQ9quPV2yz/aRSrqUIy+YhIDrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898899; c=relaxed/simple;
	bh=5Rdwxx2VqWydlJjY+K2sXLYWgSzJ+HA92vDgKJqFcd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7eiRIz4pCrwqT+DHgihRR80xNQHIN7hKKB79Y6Ft3EuCJyc532GLxcTPRWPJgTAywBmc/3mHFmvgLriZo7EGCt47fo///y00HohDwKj3qnIW2nMeK6UvEs/C2n+JfTCX++FW1ZgYdj+RFt9m8NVFgvZMuLEGfVFHNvd0cSU+Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=qBwx7fr5; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="qBwx7fr5"
Received: from [192.168.42.116] (pd9e59190.dip0.t-ipconnect.de [217.229.145.144])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id C6BAC2FC0052;
	Tue, 16 Dec 2025 16:28:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1765898892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5R3mDzV3Ou03TSkso3WntmvYgqalP1NEEh72SBLz+0=;
	b=qBwx7fr5Ob8yzU7SMgFn56eZnofdtToT4A2cCW4zKsNUrEOZBuQcwN3q9AMUnsOkot9yzW
	Dn5FtxuGS77GUzUZmOBsSMft+jVhU5vSN+KmuPtb5cUAcAz2JwHB2hti7dhHy2jK0bIYix
	gU4I8sGFCXhKJtp20EY1SzgvjU2HRkU=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <995e2857-6cc0-4abf-b38a-ac1ed9730c18@tuxedocomputers.com>
Date: Tue, 16 Dec 2025 16:28:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: uniwill-laptop: Introduce device
 descriptor system
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251204135121.435905-1-wse@tuxedocomputers.com>
 <20251204135121.435905-2-wse@tuxedocomputers.com>
 <cfe33020-5faa-c780-6d0a-6a6267070983@linux.intel.com>
 <20c01115-2178-4a92-b600-31f5d3281a35@tuxedocomputers.com>
 <c88ac07a-4add-e647-5bf7-810436c88360@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <c88ac07a-4add-e647-5bf7-810436c88360@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 16.12.25 um 16:20 schrieb Ilpo Järvinen:
> On Tue, 16 Dec 2025, Werner Sembach wrote:
>
>> Am 16.12.25 um 14:40 schrieb Ilpo Järvinen:
>>> On Thu, 4 Dec 2025, Werner Sembach wrote:
>>>
>>>> From: Armin Wolf <W_Armin@gmx.de>
>>>>
>>>> Future additions to the driver will depend on device-specific
>>>> initialization steps. Extend the DMI-based feature detection system
>>>> to include device descriptors. Each descriptor contains a bitmap of
>>>> supported features and a set of callback for performing
>>>> device-specific initialization.
>>>>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>> ---
>>>>    drivers/platform/x86/uniwill/uniwill-acpi.c | 168 +++++++++++++++++---
>>>>    1 file changed, 142 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> index bd7e63dd51810..01192c32608e5 100644
>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> @@ -322,6 +322,7 @@ struct uniwill_data {
>>>>    	struct device *dev;
>>>>    	acpi_handle handle;
>>>>    	struct regmap *regmap;
>>>> +	unsigned int features;
>>>>    	struct acpi_battery_hook hook;
>>>>    	unsigned int last_charge_ctrl;
>>>>    	struct mutex battery_lock;	/* Protects the list of currently
>>>> registered batteries */
>>>> @@ -341,12 +342,21 @@ struct uniwill_battery_entry {
>>>>    	struct power_supply *battery;
>>>>    };
>>>>    +struct uniwill_device_descriptor {
>>>> +	unsigned int features;
>>>> +	/* Executed during driver probing */
>>>> +	int (*probe)(struct uniwill_data *data);
>>>> +};
>>>> +
>>>>    static bool force;
>>>>    module_param_unsafe(force, bool, 0);
>>>>    MODULE_PARM_DESC(force, "Force loading without checking for supported
>>>> devices\n");
>>>>    -/* Feature bitmask since the associated registers are not reliable */
>>>> -static unsigned int supported_features;
>>>> +/*
>>>> + * Contains device specific data like the feature bitmap since
>>>> + * the associated registers are not always reliable.
>>>> + */
>>>> +static struct uniwill_device_descriptor device_descriptor
>>>> __ro_after_init;
>>>>      static const char * const uniwill_temp_labels[] = {
>>>>    	"CPU",
>>>> @@ -411,6 +421,13 @@ static const struct key_entry uniwill_keymap[] = {
>>>>    	{ KE_END }
>>>>    };
>>>>    +static inline bool uniwill_device_supports(struct uniwill_data *data,
>>>> +					   unsigned int features_mask,
>>>> +					   unsigned int features)
>>>> +{
>>>> +	return (data->features & features_mask) == features;
>>>> +}
>>>> +
>>>>    static int uniwill_ec_reg_write(void *context, unsigned int reg,
>>>> unsigned int val)
>>>>    {
>>>>    	union acpi_object params[2] = {
>>>> @@ -799,24 +816,31 @@ static struct attribute *uniwill_attrs[] = {
>>>>      static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct
>>>> attribute *attr, int n)
>>>>    {
>>>> +	struct device *dev = kobj_to_dev(kobj);
>>>> +	struct uniwill_data *data = dev_get_drvdata(dev);
>>>> +
>>>>    	if (attr == &dev_attr_fn_lock_toggle_enable.attr) {
>>>> -		if (supported_features & UNIWILL_FEATURE_FN_LOCK_TOGGLE)
>>>> +		if (uniwill_device_supports(data,
>>>> UNIWILL_FEATURE_FN_LOCK_TOGGLE,
>>>> +					    UNIWILL_FEATURE_FN_LOCK_TOGGLE))
>>>>    			return attr->mode;
>>>>    	}
>>>>      	if (attr == &dev_attr_super_key_toggle_enable.attr) {
>>>> -		if (supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE)
>>>> +		if (uniwill_device_supports(data,
>>>> UNIWILL_FEATURE_SUPER_KEY_TOGGLE,
>>>> +					    UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>>>>    			return attr->mode;
>>>>    	}
>>>>      	if (attr == &dev_attr_touchpad_toggle_enable.attr) {
>>>> -		if (supported_features & UNIWILL_FEATURE_TOUCHPAD_TOGGLE)
>>>> +		if (uniwill_device_supports(data,
>>>> UNIWILL_FEATURE_TOUCHPAD_TOGGLE,
>>>> +					    UNIWILL_FEATURE_TOUCHPAD_TOGGLE))
>>>>    			return attr->mode;
>>>>    	}
>>>>      	if (attr == &dev_attr_rainbow_animation.attr ||
>>>>    	    attr == &dev_attr_breathing_in_suspend.attr) {
>>>> -		if (supported_features & UNIWILL_FEATURE_LIGHTBAR)
>>>> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR,
>>>> +					    UNIWILL_FEATURE_LIGHTBAR))
>>>>    			return attr->mode;
>>>>    	}
>>>>    @@ -944,7 +968,8 @@ static int uniwill_hwmon_init(struct uniwill_data
>>>> *data)
>>>>    {
>>>>    	struct device *hdev;
>>>>    -	if (!(supported_features & UNIWILL_FEATURE_HWMON))
>>>> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_HWMON,
>>>> +				     UNIWILL_FEATURE_HWMON))
>>>>    		return 0;
>>>>      	hdev = devm_hwmon_device_register_with_info(data->dev,
>>>> "uniwill", data,
>>>> @@ -1019,7 +1044,8 @@ static int uniwill_led_init(struct uniwill_data
>>>> *data)
>>>>    	unsigned int value;
>>>>    	int ret;
>>>>    -	if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
>>>> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR,
>>>> +				     UNIWILL_FEATURE_LIGHTBAR))
>>>>    		return 0;
>>>>      	ret = devm_mutex_init(data->dev, &data->led_lock);
>>>> @@ -1232,7 +1258,8 @@ static int uniwill_battery_init(struct uniwill_data
>>>> *data)
>>>>    {
>>>>    	int ret;
>>>>    -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
>>>> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
>>>> +				     UNIWILL_FEATURE_BATTERY))
>>>>    		return 0;
>>>>      	ret = devm_mutex_init(data->dev, &data->battery_lock);
>>>> @@ -1361,6 +1388,19 @@ static int uniwill_probe(struct platform_device
>>>> *pdev)
>>>>    	if (ret < 0)
>>>>    		return ret;
>>>>    +	data->features = device_descriptor.features;
>>>> +
>>>> +	/*
>>>> +	 * Some devices might need to perform some device-specific
>>>> initialization steps
>>>> +	 * before the supported features are initialized. Because of this we
>>>> have to call
>>>> +	 * this callback just after the EC itself was initialized.
>>>> +	 */
>>>> +	if (device_descriptor.probe) {
>>>> +		ret = device_descriptor.probe(data);
>>>> +		if (ret < 0)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>>    	ret = uniwill_battery_init(data);
>>>>    	if (ret < 0)
>>>>    		return ret;
>>>> @@ -1385,7 +1425,8 @@ static void uniwill_shutdown(struct platform_device
>>>> *pdev)
>>>>      static int uniwill_suspend_keyboard(struct uniwill_data *data)
>>>>    {
>>>> -	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>>>> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE,
>>>> +				     UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>>>>    		return 0;
>>>>      	/*
>>>> @@ -1397,7 +1438,8 @@ static int uniwill_suspend_keyboard(struct
>>>> uniwill_data *data)
>>>>      static int uniwill_suspend_battery(struct uniwill_data *data)
>>>>    {
>>>> -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
>>>> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
>>>> +				     UNIWILL_FEATURE_BATTERY))
>>>>    		return 0;
>>>>      	/*
>>>> @@ -1432,7 +1474,8 @@ static int uniwill_resume_keyboard(struct
>>>> uniwill_data *data)
>>>>    	unsigned int value;
>>>>    	int ret;
>>>>    -	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>>>> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE,
>>>> +				     UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>>>>    		return 0;
>>>>      	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS,
>>>> &value);
>>>> @@ -1448,7 +1491,8 @@ static int uniwill_resume_keyboard(struct
>>>> uniwill_data *data)
>>>>      static int uniwill_resume_battery(struct uniwill_data *data)
>>>>    {
>>>> -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
>>>> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
>>>> +				     UNIWILL_FEATURE_BATTERY))
>>>>    		return 0;
>>>>      	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL,
>>>> CHARGE_CTRL_MASK,
>>>> @@ -1496,6 +1540,25 @@ static struct platform_driver uniwill_driver = {
>>>>    	.shutdown = uniwill_shutdown,
>>>>    };
>>>>    +static struct uniwill_device_descriptor lapac71h_descriptor __initdata
>>>> = {
>>>> +	.features = UNIWILL_FEATURE_FN_LOCK_TOGGLE |
>>>> +		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
>>>> +		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>>>> +		    UNIWILL_FEATURE_BATTERY |
>>>> +		    UNIWILL_FEATURE_HWMON
>>>> +};
>>>> +
>>>> +static struct uniwill_device_descriptor lapkc71f_descriptor __initdata =
>>>> {
>>>> +	.features = UNIWILL_FEATURE_FN_LOCK_TOGGLE |
>>>> +		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
>>>> +		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>>>> +		    UNIWILL_FEATURE_LIGHTBAR |
>>>> +		    UNIWILL_FEATURE_BATTERY |
>>>> +		    UNIWILL_FEATURE_HWMON
>>>> +};
>>>> +
>>>> +static struct uniwill_device_descriptor empty_descriptor __initdata = {};
>>>> +
>>>>    static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>>>>    	{
>>>>    		.ident = "XMG FUSION 15",
>>>> @@ -1503,6 +1566,7 @@ static const struct dmi_system_id
>>>> uniwill_dmi_table[] __initconst = {
>>>>    			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>>>>    			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
>>>>    		},
>>>> +		.driver_data = &empty_descriptor,
>>> Hi,
>>>
>>> Is there some advantage of having an "empty descriptor" over just NULL
>>> checking its presence in the code?
>> One less "if"
> That pays no respect to devs who have read those dummy driver_data
> lines. ;-)

Thanks for doing it anyway ^^

v2 of this patch set is already finished, but i'm still waiting for the special 
case ibp gen7 being tested before sending it.

>
>> In the long run (with more features implemented and tested) there probably
>> wont be any device using the empty descriptor, then it can be removed again.
> Fair (so I'm fine with keeping empty_descriptor for now).
>
