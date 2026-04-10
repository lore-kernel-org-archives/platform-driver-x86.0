Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9183148D2;
	Fri, 10 Apr 2026 15:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835047; cv=none; b=BiKhWZasIQSPww0UPm/pyti0EmY438NLbnwut5a1Jj1VRoO7h3TqyFbelLi5qSkQ4Dr5vwq7yjX22xjGlAGWo/4uPZwkzEL/l0jKcvMip/9Z4tnQdlMSGccvKRmP1TT4Bck24u7hPNTHRFgWvjI+2bKSBFVpjnqrrcqcAFFcq7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835047; c=relaxed/simple;
	bh=+nq9C/USJj+ymP3VFpVP+BMqKM6K5oGUH7eA44kUFlE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MpgNq5MHccyQsKn9CwJ9xEfKszS9CmGTuc9IRoAEiluoakYvyrMc3EdPGC8MH8OTQoPqWV6uKY0/ExC4R8ZcLUz2DsjW3DK4m8VPtQSU4rcp5Etn9uW8FmzYGwVSwXxEqI/EUs8tJtYr+3ygEsseLuJfEWu3ZjNzISb3yIg8kuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Xg39Ge1r; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Xg39Ge1r"
Received: from [192.168.178.25] (i5C75F434.versanet.de [92.117.244.52])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 808CA2FC021C;
	Fri, 10 Apr 2026 17:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1775835036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yDYeog9jO6VkfGMaD8KvyuWH8P9zYbiKokO/1CJekY=;
	b=Xg39Ge1r7ziWNsE7GkBF7MG9TQcGwdDb09XL710xhquk3L35iSjryvrY3+jHN1PHZMW5sW
	DtI3YNTa8SG6zFrp2gNMY3ScIR07PHi4zpzhRL7c4bNOdvY5gtcya3F50yz1gCYF/x1hvY
	u6wmtxLW76kdCElXevZ/cH4kXPZ9x+g=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <3edac714-783a-46dc-8240-4c9062b3c8be@tuxedocomputers.com>
Date: Fri, 10 Apr 2026 17:30:36 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH 4/6] platform/x86: uniwill-laptop: Rework FN lock/super
 key suspend handling
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406193653.7799-1-W_Armin@gmx.de>
 <20260406193653.7799-5-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20260406193653.7799-5-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 06.04.26 um 21:36 schrieb Armin Wolf:
> Currently the supend handling for the FN lock and super key enable

*suspend

Other then this typo lgtm:

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>

> features saves the whole values of the affected registers instead of
> the individual feature state. This duplicates the register access
> logic from the associated sysfs attributes.
>
> Rework the suspend handling to reuse said register access logic and
> only store the individual feature state as a boolean value.
>
> Signed-off-by: Armin Wolf<W_Armin@gmx.de>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 117 ++++++++++++--------
>   1 file changed, 73 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 7c7ea0e76966..4d149b39d94e 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -341,8 +341,8 @@ struct uniwill_data {
>   	struct acpi_battery_hook hook;
>   	unsigned int last_charge_ctrl;
>   	struct mutex battery_lock;	/* Protects the list of currently registered batteries */
> -	unsigned int last_status;
> -	unsigned int last_switch_status;
> +	bool last_fn_lock_state;
> +	bool last_super_key_enable_state;
>   	struct mutex super_key_lock;	/* Protects the toggling of the super key lock state */
>   	struct list_head batteries;
>   	struct mutex led_lock;		/* Protects writes to the lightbar registers */
> @@ -619,11 +619,22 @@ static const struct regmap_config uniwill_ec_config = {
>   	.use_single_write = true,
>   };
>   
> +static int uniwill_write_fn_lock(struct uniwill_data *data, bool status)
> +{
> +	unsigned int value;
> +
> +	if (status)
> +		value = FN_LOCK_STATUS;
> +	else
> +		value = 0;
> +
> +	return regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATUS, value);
> +}
> +
>   static ssize_t fn_lock_store(struct device *dev, struct device_attribute *attr, const char *buf,
>   			     size_t count)
>   {
>   	struct uniwill_data *data = dev_get_drvdata(dev);
> -	unsigned int value;
>   	bool enable;
>   	int ret;
>   
> @@ -631,21 +642,15 @@ static ssize_t fn_lock_store(struct device *dev, struct device_attribute *attr,
>   	if (ret < 0)
>   		return ret;
>   
> -	if (enable)
> -		value = FN_LOCK_STATUS;
> -	else
> -		value = 0;
> -
> -	ret = regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATUS, value);
> +	ret = uniwill_write_fn_lock(data, enable);
>   	if (ret < 0)
>   		return ret;
>   
>   	return count;
>   }
>   
> -static ssize_t fn_lock_show(struct device *dev, struct device_attribute *attr, char *buf)
> +static int uniwill_read_fn_lock(struct uniwill_data *data, bool *status)
>   {
> -	struct uniwill_data *data = dev_get_drvdata(dev);
>   	unsigned int value;
>   	int ret;
>   
> @@ -653,23 +658,31 @@ static ssize_t fn_lock_show(struct device *dev, struct device_attribute *attr, c
>   	if (ret < 0)
>   		return ret;
>   
> -	return sysfs_emit(buf, "%d\n", !!(value & FN_LOCK_STATUS));
> -}
> +	*status = !!(value & FN_LOCK_STATUS);
>   
> -static DEVICE_ATTR_RW(fn_lock);
> +	return 0;
> +}
>   
> -static ssize_t super_key_enable_store(struct device *dev, struct device_attribute *attr,
> -				      const char *buf, size_t count)
> +static ssize_t fn_lock_show(struct device *dev, struct device_attribute *attr, char *buf)
>   {
>   	struct uniwill_data *data = dev_get_drvdata(dev);
> -	unsigned int value;
> -	bool enable;
> +	bool status;
>   	int ret;
>   
> -	ret = kstrtobool(buf, &enable);
> +	ret = uniwill_read_fn_lock(data, &status);
>   	if (ret < 0)
>   		return ret;
>   
> +	return sysfs_emit(buf, "%d\n", status);
> +}
> +
> +static DEVICE_ATTR_RW(fn_lock);
> +
> +static int uniwill_write_super_key_enable(struct uniwill_data *data, bool status)
> +{
> +	unsigned int value;
> +	int ret;
> +
>   	guard(mutex)(&data->super_key_lock);
>   
>   	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> @@ -680,20 +693,33 @@ static ssize_t super_key_enable_store(struct device *dev, struct device_attribut
>   	 * We can only toggle the super key lock, so we return early if the setting
>   	 * is already in the correct state.
>   	 */
> -	if (enable == !(value & SUPER_KEY_LOCK_STATUS))
> -		return count;
> +	if (status == !(value & SUPER_KEY_LOCK_STATUS))
> +		return 0;
> +
> +	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KEY_LOCK,
> +				 TRIGGER_SUPER_KEY_LOCK);
> +}
> +
> +static ssize_t super_key_enable_store(struct device *dev, struct device_attribute *attr,
> +				      const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	bool enable;
> +	int ret;
>   
> -	ret = regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KEY_LOCK,
> -				TRIGGER_SUPER_KEY_LOCK);
> +	ret = kstrtobool(buf, &enable);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_write_super_key_enable(data, enable);
>   	if (ret < 0)
>   		return ret;
>   
>   	return count;
>   }
>   
> -static ssize_t super_key_enable_show(struct device *dev, struct device_attribute *attr, char *buf)
> +static int uniwill_read_super_key_enable(struct uniwill_data *data, bool *status)
>   {
> -	struct uniwill_data *data = dev_get_drvdata(dev);
>   	unsigned int value;
>   	int ret;
>   
> @@ -701,7 +727,22 @@ static ssize_t super_key_enable_show(struct device *dev, struct device_attribute
>   	if (ret < 0)
>   		return ret;
>   
> -	return sysfs_emit(buf, "%d\n", !(value & SUPER_KEY_LOCK_STATUS));
> +	*status = !(value & SUPER_KEY_LOCK_STATUS);
> +
> +	return 0;
> +}
> +
> +static ssize_t super_key_enable_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	bool status;
> +	int ret;
> +
> +	ret = uniwill_read_super_key_enable(data, &status);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", status);
>   }
>   
>   static DEVICE_ATTR_RW(super_key_enable);
> @@ -1715,10 +1756,10 @@ static int uniwill_suspend_fn_lock(struct uniwill_data *data)
>   		return 0;
>   
>   	/*
> -	 * The EC_ADDR_BIOS_OEM is marked as volatile, so we have to restore it
> +	 * EC_ADDR_BIOS_OEM is marked as volatile, so we have to restore it
>   	 * ourselves.
>   	 */
> -	return regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &data->last_status);
> +	return uniwill_read_fn_lock(data, &data->last_fn_lock_state);
>   }
>   
>   static int uniwill_suspend_super_key(struct uniwill_data *data)
> @@ -1727,10 +1768,10 @@ static int uniwill_suspend_super_key(struct uniwill_data *data)
>   		return 0;
>   
>   	/*
> -	 * The EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to restore it
> +	 * EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to restore it
>   	 * ourselves.
>   	 */
> -	return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_switch_status);
> +	return uniwill_read_super_key_enable(data, &data->last_super_key_enable_state);
>   }
>   
>   static int uniwill_suspend_battery(struct uniwill_data *data)
> @@ -1787,27 +1828,15 @@ static int uniwill_resume_fn_lock(struct uniwill_data *data)
>   	if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
>   		return 0;
>   
> -	return regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATUS,
> -				  data->last_status);
> +	return uniwill_write_fn_lock(data, data->last_fn_lock_state);
>   }
>   
>   static int uniwill_resume_super_key(struct uniwill_data *data)
>   {
> -	unsigned int value;
> -	int ret;
> -
>   	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
>   		return 0;
>   
> -	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> -	if (ret < 0)
> -		return ret;
> -
> -	if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) == (value & SUPER_KEY_LOCK_STATUS))
> -		return 0;
> -
> -	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KEY_LOCK,
> -				 TRIGGER_SUPER_KEY_LOCK);
> +	return uniwill_write_super_key_enable(data, data->last_super_key_enable_state);
>   }
>   
>   static int uniwill_resume_battery(struct uniwill_data *data)
