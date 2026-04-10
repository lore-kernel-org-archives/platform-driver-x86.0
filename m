Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4BF35DD1C;
	Fri, 10 Apr 2026 15:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835363; cv=none; b=iQRNea3Z2vemqW+Rpr+QfM30VovPEuVbtgT4LaABbpjK++2orkOUfLGTPLxswg1+vI46tG0dDmr+SU7ne04oA97p2gsG3i4kkCoTgINUfbh7wXzg8NR4VQnwwdp2o5zV2Qxm5yU/j72FP2kYWbZfbN7MO6PbSrpdh9H3PC9xvkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835363; c=relaxed/simple;
	bh=V5Jy7YKNhJm71xg6qITjfLDgukAwWZgCIpu/9YPGdC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uitgENhl9g3a7GL3DpWM2VX/yYJuCfLtlBiAIanUcAIcgCHtwcR0tEa6jGeu9A17Ei8ipSn43k6n/+QuJLrG8XsSll86mlFZV3gWzShR2nPclTdEqPS5Z3RMnJHDOzfxsY5ED9JLYb2ETpNrzdGsnp1dan5lJjW8w2x5uEYcYf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=DvKvWnUf; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="DvKvWnUf"
Received: from [192.168.178.25] (i5C75F434.versanet.de [92.117.244.52])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 61A5A2FC021B;
	Fri, 10 Apr 2026 17:35:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1775835358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D3uvLO29UL8ug1eh3hngElP+woMJ4E5Wegk+jt8GtVs=;
	b=DvKvWnUf91mIKqM1Oqim/C2mO/teM5LaEha2dfKxaZgunU3NT5OUGto3eGpmyr40G1sjiS
	m1W3MTYdqxI2oJzq/DqKCGqPzyogFpNHAEJDwApE/KBmjrtkwRo02fm0C0Xa2v98z2wZ8w
	6zdjkq1yTf32/RcXjAEj4omIp6VlQ70=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <373b5b5f-f0ce-48b5-9d01-24f00a50bf77@tuxedocomputers.com>
Date: Fri, 10 Apr 2026 17:35:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] platform/x86: uniwill-laptop: Mark EC_ADDR_OEM_4 as
 volatile
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406193653.7799-1-W_Armin@gmx.de>
 <20260406193653.7799-6-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260406193653.7799-6-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 06.04.26 um 21:36 schrieb Armin Wolf:
> It turned out that EC_ADDR_OEM_4 also contains bits with a volatile
> nature. Mark the whole register as volatile to prepare for the usage
> of said bits. This also means that we now have to save/restore the
> touchpad toggle state ourself.
>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
looks good

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 70 ++++++++++++++++++---
>   1 file changed, 60 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 4d149b39d94e..a116e2ec6453 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -343,6 +343,7 @@ struct uniwill_data {
>   	struct mutex battery_lock;	/* Protects the list of currently registered batteries */
>   	bool last_fn_lock_state;
>   	bool last_super_key_enable_state;
> +	bool last_touchpad_toggle_enable_state;
>   	struct mutex super_key_lock;	/* Protects the toggling of the super key lock state */
>   	struct list_head batteries;
>   	struct mutex led_lock;		/* Protects writes to the lightbar registers */
> @@ -598,6 +599,7 @@ static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
>   	case EC_ADDR_PWM_2:
>   	case EC_ADDR_TRIGGER:
>   	case EC_ADDR_SWITCH_STATUS:
> +	case EC_ADDR_OEM_4:
>   	case EC_ADDR_CHARGE_CTRL:
>   	case EC_ADDR_USB_C_POWER_PRIORITY:
>   		return true;
> @@ -747,11 +749,22 @@ static ssize_t super_key_enable_show(struct device *dev, struct device_attribute
>   
>   static DEVICE_ATTR_RW(super_key_enable);
>   
> +static int uniwill_write_touchpad_toggle_enable(struct uniwill_data *data, bool status)
> +{
> +	unsigned int value;
> +
> +	if (status)
> +		value = 0;
> +	else
> +		value = TOUCHPAD_TOGGLE_OFF;
> +
> +	return regmap_update_bits(data->regmap, EC_ADDR_OEM_4, TOUCHPAD_TOGGLE_OFF, value);
> +}
> +
>   static ssize_t touchpad_toggle_enable_store(struct device *dev, struct device_attribute *attr,
>   					    const char *buf, size_t count)
>   {
>   	struct uniwill_data *data = dev_get_drvdata(dev);
> -	unsigned int value;
>   	bool enable;
>   	int ret;
>   
> @@ -759,30 +772,39 @@ static ssize_t touchpad_toggle_enable_store(struct device *dev, struct device_at
>   	if (ret < 0)
>   		return ret;
>   
> -	if (enable)
> -		value = 0;
> -	else
> -		value = TOUCHPAD_TOGGLE_OFF;
> -
> -	ret = regmap_update_bits(data->regmap, EC_ADDR_OEM_4, TOUCHPAD_TOGGLE_OFF, value);
> +	ret = uniwill_write_touchpad_toggle_enable(data, enable);
>   	if (ret < 0)
>   		return ret;
>   
>   	return count;
>   }
>   
> +static int uniwill_read_touchpad_toggle_enable(struct uniwill_data *data, bool *status)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	*status = !(value & TOUCHPAD_TOGGLE_OFF);
> +
> +	return 0;
> +}
> +
>   static ssize_t touchpad_toggle_enable_show(struct device *dev, struct device_attribute *attr,
>   					   char *buf)
>   {
>   	struct uniwill_data *data = dev_get_drvdata(dev);
> -	unsigned int value;
> +	bool status;
>   	int ret;
>   
> -	ret = regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
> +	ret = uniwill_read_touchpad_toggle_enable(data, &status);
>   	if (ret < 0)
>   		return ret;
>   
> -	return sysfs_emit(buf, "%d\n", !(value & TOUCHPAD_TOGGLE_OFF));
> +	return sysfs_emit(buf, "%d\n", status);
>   }
>   
>   static DEVICE_ATTR_RW(touchpad_toggle_enable);
> @@ -1774,6 +1796,18 @@ static int uniwill_suspend_super_key(struct uniwill_data *data)
>   	return uniwill_read_super_key_enable(data, &data->last_super_key_enable_state);
>   }
>   
> +static int uniwill_suspend_touchpad_toggle(struct uniwill_data *data)
> +{
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_TOUCHPAD_TOGGLE))
> +		return 0;
> +
> +	/*
> +	 * EC_ADDR_OEM_4 is marked as volatile, so we have to restore it
> +	 * ourselves.
> +	 */
> +	return uniwill_read_touchpad_toggle_enable(data, &data->last_touchpad_toggle_enable_state);
> +}
> +
>   static int uniwill_suspend_battery(struct uniwill_data *data)
>   {
>   	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
> @@ -1809,6 +1843,10 @@ static int uniwill_suspend(struct device *dev)
>   	if (ret < 0)
>   		return ret;
>   
> +	ret = uniwill_suspend_touchpad_toggle(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	ret = uniwill_suspend_battery(data);
>   	if (ret < 0)
>   		return ret;
> @@ -1839,6 +1877,14 @@ static int uniwill_resume_super_key(struct uniwill_data *data)
>   	return uniwill_write_super_key_enable(data, data->last_super_key_enable_state);
>   }
>   
> +static int uniwill_resume_touchpad_toggle(struct uniwill_data *data)
> +{
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_TOUCHPAD_TOGGLE))
> +		return 0;
> +
> +	return uniwill_write_touchpad_toggle_enable(data, data->last_touchpad_toggle_enable_state);
> +}
> +
>   static int uniwill_resume_battery(struct uniwill_data *data)
>   {
>   	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
> @@ -1884,6 +1930,10 @@ static int uniwill_resume(struct device *dev)
>   	if (ret < 0)
>   		return ret;
>   
> +	ret = uniwill_resume_touchpad_toggle(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	ret = uniwill_resume_battery(data);
>   	if (ret < 0)
>   		return ret;
