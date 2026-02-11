Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E45417D2;
	Wed, 11 Feb 2026 00:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770768980; cv=none; b=tO1mBwn/dapBhC/vCl+ktRK0Kvf7hJemGMa7xg1XDvgt1TVQqTqajE08e9c7vwqDqI3GRoGbkScxtBo4zonxOWbWXEmCdY+RjjMY4+PPb0d6vEQhxLMZfRdd6MT7sSzzHIcanVtQOsvlyb/MRWqSt3jr0d5sPVG9tDU2ZN9NL/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770768980; c=relaxed/simple;
	bh=y44yhVcVfzRIJD3UCoZE4Anbm39Gx9T2jcR+6QS+MtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7j96XmRN78tNbF8+MdW3LgICxuh+cDMn05+ZBuNs7jLmt1EhK1gdDx3ouvUgDqUvw78CCCqBwQLOrTSHBP8evSpdUwZdOK0EVGMX+SnDF6GCMNUjZgnDNbQ2SKLh/L9TMNEzcS6jzyYFnzNp3rvqEaYoEaTNBVKGGGjsXvKrTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=uPJgtgkb; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="uPJgtgkb"
Received: from [192.168.178.24] (i5C75F6C0.versanet.de [92.117.246.192])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 0D6DA2FC006C;
	Wed, 11 Feb 2026 01:16:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1770768969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bYfF3iirvlBNMssXAQuldhrW98qkd3h9CcNuCyRADB0=;
	b=uPJgtgkb1uyS2GdBJh1F+vvjCyx0gYQuX7LD8Fpy1Nv6TixpvNRWurdsWIJxp2qbhJWrel
	T9UjVY4maRTUUfpYinXPoUnEYssbOLS9gwEvX/Tx9NJ/GpPuv3T0g1DJ3qn9HEp7Vj6/rL
	dyecLR434q0nXvy5voIInqRwQuXA5wY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <b9abe4fc-198f-45c6-9b7b-732d3c53983f@tuxedocomputers.com>
Date: Wed, 11 Feb 2026 01:16:08 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] platform/x86: uniwill-laptop: Rename FN lock and
 super key lock attrs
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210232946.302936-1-W_Armin@gmx.de>
 <20260210232946.302936-2-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260210232946.302936-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Am 11.02.26 um 00:29 schrieb Armin Wolf:
> It turns out that both sysfs attributes actually directly control
> the FN lock status/super key enable status, rather than the
> triggering of the associated events. This behavior was first observed
> on a Tuxedo notebook and was belived to be a hardware quirk.
> However, it seems that i simply misunderstood the manual of the
> OEM software for Intel NUC devices. The correct behavior is:
>
> - fn_lock_toggle_enable enables/disables FN lock mode
> - super_key_toggle_enable enables/disables the super key
>
> Rename both sysfs attributes to avoid confusing users.
>
> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../ABI/testing/sysfs-driver-uniwill-laptop   | 10 ++--
>   drivers/platform/x86/uniwill/uniwill-acpi.c   | 46 +++++++++----------
>   2 files changed, 27 insertions(+), 29 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> index eaeb659793d2..2df70792968f 100644
> --- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> @@ -1,4 +1,4 @@
> -What:		/sys/bus/platform/devices/INOU0000:XX/fn_lock_toggle_enable
> +What:		/sys/bus/platform/devices/INOU0000:XX/fn_lock
>   Date:		November 2025
>   KernelVersion:	6.19
>   Contact:	Armin Wolf <W_Armin@gmx.de>
> @@ -8,15 +8,15 @@ Description:
>   
>   		Reading this file returns the current enable status of the FN lock functionality.
>   
> -What:		/sys/bus/platform/devices/INOU0000:XX/super_key_toggle_enable
> +What:		/sys/bus/platform/devices/INOU0000:XX/super_key_enable
>   Date:		November 2025
>   KernelVersion:	6.19
>   Contact:	Armin Wolf <W_Armin@gmx.de>
>   Description:
> -                Allows userspace applications to enable/disable the super key functionality
> -                of the integrated keyboard by writing "1"/"0" into this file.
> +		Allows userspace applications to enable/disable the super key of the integrated
> +		keyboard by writing "1"/"0" into this file.
>   
> -		Reading this file returns the current enable status of the super key functionality.
> +		Reading this file returns the current enable status of the super key.
>   
>   What:		/sys/bus/platform/devices/INOU0000:XX/touchpad_toggle_enable
>   Date:		November 2025
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 3c9af441d133..856d5e38e045 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -314,8 +314,8 @@
>   #define LED_CHANNELS		3
>   #define LED_MAX_BRIGHTNESS	200
>   
> -#define UNIWILL_FEATURE_FN_LOCK_TOGGLE		BIT(0)
> -#define UNIWILL_FEATURE_SUPER_KEY_TOGGLE	BIT(1)
> +#define UNIWILL_FEATURE_FN_LOCK			BIT(0)
> +#define UNIWILL_FEATURE_SUPER_KEY		BIT(1)
>   #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE		BIT(2)
>   #define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
>   #define UNIWILL_FEATURE_BATTERY			BIT(4)

Maybe also rename UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE and 
UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE

Best regards,

Werner

> @@ -600,8 +600,8 @@ static const struct regmap_config uniwill_ec_config = {
>   	.use_single_write = true,
>   };
>   
> -static ssize_t fn_lock_toggle_enable_store(struct device *dev, struct device_attribute *attr,
> -					   const char *buf, size_t count)
> +static ssize_t fn_lock_store(struct device *dev, struct device_attribute *attr, const char *buf,
> +			     size_t count)
>   {
>   	struct uniwill_data *data = dev_get_drvdata(dev);
>   	unsigned int value;
> @@ -624,8 +624,7 @@ static ssize_t fn_lock_toggle_enable_store(struct device *dev, struct device_att
>   	return count;
>   }
>   
> -static ssize_t fn_lock_toggle_enable_show(struct device *dev, struct device_attribute *attr,
> -					  char *buf)
> +static ssize_t fn_lock_show(struct device *dev, struct device_attribute *attr, char *buf)
>   {
>   	struct uniwill_data *data = dev_get_drvdata(dev);
>   	unsigned int value;
> @@ -638,10 +637,10 @@ static ssize_t fn_lock_toggle_enable_show(struct device *dev, struct device_attr
>   	return sysfs_emit(buf, "%d\n", !!(value & FN_LOCK_STATUS));
>   }
>   
> -static DEVICE_ATTR_RW(fn_lock_toggle_enable);
> +static DEVICE_ATTR_RW(fn_lock);
>   
> -static ssize_t super_key_toggle_enable_store(struct device *dev, struct device_attribute *attr,
> -					     const char *buf, size_t count)
> +static ssize_t super_key_enable_store(struct device *dev, struct device_attribute *attr,
> +				      const char *buf, size_t count)
>   {
>   	struct uniwill_data *data = dev_get_drvdata(dev);
>   	unsigned int value;
> @@ -673,8 +672,7 @@ static ssize_t super_key_toggle_enable_store(struct device *dev, struct device_a
>   	return count;
>   }
>   
> -static ssize_t super_key_toggle_enable_show(struct device *dev, struct device_attribute *attr,
> -					    char *buf)
> +static ssize_t super_key_enable_show(struct device *dev, struct device_attribute *attr, char *buf)
>   {
>   	struct uniwill_data *data = dev_get_drvdata(dev);
>   	unsigned int value;
> @@ -687,7 +685,7 @@ static ssize_t super_key_toggle_enable_show(struct device *dev, struct device_at
>   	return sysfs_emit(buf, "%d\n", !(value & SUPER_KEY_LOCK_STATUS));
>   }
>   
> -static DEVICE_ATTR_RW(super_key_toggle_enable);
> +static DEVICE_ATTR_RW(super_key_enable);
>   
>   static ssize_t touchpad_toggle_enable_store(struct device *dev, struct device_attribute *attr,
>   					    const char *buf, size_t count)
> @@ -881,8 +879,8 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
>   
>   static struct attribute *uniwill_attrs[] = {
>   	/* Keyboard-related */
> -	&dev_attr_fn_lock_toggle_enable.attr,
> -	&dev_attr_super_key_toggle_enable.attr,
> +	&dev_attr_fn_lock.attr,
> +	&dev_attr_super_key_enable.attr,
>   	&dev_attr_touchpad_toggle_enable.attr,
>   	/* Lightbar-related */
>   	&dev_attr_rainbow_animation.attr,
> @@ -897,13 +895,13 @@ static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attribute *a
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct uniwill_data *data = dev_get_drvdata(dev);
>   
> -	if (attr == &dev_attr_fn_lock_toggle_enable.attr) {
> -		if (uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK_TOGGLE))
> +	if (attr == &dev_attr_fn_lock.attr) {
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
>   			return attr->mode;
>   	}
>   
> -	if (attr == &dev_attr_super_key_toggle_enable.attr) {
> -		if (uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +	if (attr == &dev_attr_super_key_enable.attr) {
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
>   			return attr->mode;
>   	}
>   
> @@ -1505,7 +1503,7 @@ static void uniwill_shutdown(struct platform_device *pdev)
>   
>   static int uniwill_suspend_keyboard(struct uniwill_data *data)
>   {
> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
>   		return 0;
>   
>   	/*
> @@ -1565,7 +1563,7 @@ static int uniwill_resume_keyboard(struct uniwill_data *data)
>   	unsigned int value;
>   	int ret;
>   
> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
>   		return 0;
>   
>   	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> @@ -1643,16 +1641,16 @@ static struct platform_driver uniwill_driver = {
>   };
>   
>   static struct uniwill_device_descriptor lapac71h_descriptor __initdata = {
> -	.features = UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> -		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> +	.features = UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
>   		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>   		    UNIWILL_FEATURE_BATTERY |
>   		    UNIWILL_FEATURE_HWMON,
>   };
>   
>   static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
> -	.features = UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> -		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> +	.features = UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
>   		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>   		    UNIWILL_FEATURE_LIGHTBAR |
>   		    UNIWILL_FEATURE_BATTERY |
