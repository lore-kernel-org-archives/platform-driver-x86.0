Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081B221257B;
	Tue, 31 Mar 2026 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963211; cv=none; b=QjxBMACTLY0wp+goClwUxiumYgSTDHW8L40oxlgHPZe0srHEACPZ9mWkqM0czLi+yLrd7bBXy3LEXED3hfD4Gvb/e0GoAgqLWIrObxbGcr6W1z66+ka9Ej/dOJUStenUBh6+2b4Lnc1YMQVKlJdIyxbqyQifoQjh38/JW1HQG5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963211; c=relaxed/simple;
	bh=DM4XdESkfPZK1nPH/FGVHvn3k0XB59mVffXj11spqLs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cKrRTls3/g/eGXozJAOTgCGB+Im4CIQjdNKk/xBzhi23FXglbHt7qC23icwV5WbNDcHwWF9gRs3XAdhzluJireGfK9U4CVrCQebN3gFUZqpZNEv0f8JLTrPSBuMePccdo4ub9c/xYiq8aFSN00A/IKuD5b97hyNZKgXP2OefIy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8Q0y0Zq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8Q0y0Zq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774963210; x=1806499210;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DM4XdESkfPZK1nPH/FGVHvn3k0XB59mVffXj11spqLs=;
  b=E8Q0y0ZqAh3kkWj4tyuKl4+ZqnBXaCp8Z1XDiP/oyBhDgQ+ukq/keXzl
   k7MpG5vc5oMFaxUS1xcMZLWLT3O6tOzGJ3GVaMLSJtETfz/7UreJNdN/T
   tAW6J2SeXhVThv0dnItZ1M9kvue1HdeS3UXdheI+/w+Vti+7JIeyJMyQw
   4UqrBmvRLE6v2sBPA/DnJWfT1HsYJ493MMkxIgFbKhJkZxEWrZhftVL0g
   wt916kuCrpai1+r9sFKW1Wgge3yDFDnCWH0cYp5CBlXAWzU/YC1FTIbos
   uN0tLN4qatmrsmWNtPE8b/ei9FLdkvFyJwvlWcRstMHzdV9wUAj5WK+Zc
   Q==;
X-CSE-ConnectionGUID: j0Vp4w2WRAWPCdL6Bz+XcQ==
X-CSE-MsgGUID: vO0NmuvRQx62p+Gn+CNqXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75861974"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75861974"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 06:20:09 -0700
X-CSE-ConnectionGUID: 9pJxq6dHTC+ay3lQHRRjbA==
X-CSE-MsgGUID: UhvLetfsTUCwtJbt3qTS4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="227975321"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 06:20:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 16:20:02 +0300 (EEST)
To: Bani Brata <banibrata2007@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] platform/x86: hp-wmi: Add ACPI PWM fan control for
 HP ENVY 13-bd0xxx
In-Reply-To: <20260329054052.32023-2-banibrata2007@gmail.com>
Message-ID: <4d5fa227-194d-7ba3-216d-1cf00f5cf686@linux.intel.com>
References: <20260329054052.32023-1-banibrata2007@gmail.com> <20260329054052.32023-2-banibrata2007@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 29 Mar 2026, Bani Brata wrote:

> On the HP ENVY x360 Convertible 13-bd0xxx (board 8824), standard WMI
> methods for fan speed control and RPM reporting do not function.
> 
> However, the DSDT exposes ACPI methods (\_SB.PC00.LPCB.EC0.FANG and FANW)
> that allow reading and writing an 8-bit PWM level (0-255) to the EC.
> 
> This patch maps these ACPI methods to standard hwmon `pwm1` and
> `pwm1_enable` nodes, allowing userspace tools to successfully control
> the fan speed.
> 
> Signed-off-by: Bani Brata <banibrata2007@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 155 ++++++++++++++++++++++++++++++-
>  1 file changed, 155 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index XXXXXXX..XXXXXXX 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -48,6 +48,14 @@
>  #define HP_FAN_SPEED_AUTOMATIC	 0x00
>  #define HP_POWER_LIMIT_DEFAULT	 0x00
>  #define HP_POWER_LIMIT_NO_CHANGE 0xFF
> +#define HP_ENVY_8824_ACPI_FANG "\\_SB.PC00.LPCB.EC0.FANG"
> +#define HP_ENVY_8824_ACPI_FANW "\\_SB.PC00.LPCB.EC0.FANW"
> +#define HP_ENVY_8824_FAN_VALUE_ARG 33026ULL
> +#define HP_ENVY_8824_FAN_PRIME_ARG 33030ULL
> +#define HP_ENVY_8824_FAN_PRIME_MANUAL 0xFFULL
> +#define HP_ENVY_8824_FAN_PRIME_AUTO 0x8ULL
> +#define HP_ENVY_8824_PWM_MODE_MANUAL 1
> +#define HP_ENVY_8824_PWM_MODE_AUTO 2
>  
>  #define ACPI_AC_CLASS "ac_adapter"
>  
> @@ -193,6 +201,8 @@ static const struct dmi_system_id hp_wmi_rfkill_dmi_table[] __initconst = {
>  
>  static bool is_victus_s_board;
>  static bool is_envy_x360_8824_board;
> +static DEFINE_MUTEX(hp_envy_x360_8824_fan_lock);
> +static int hp_envy_x360_8824_pwm_mode = HP_ENVY_8824_PWM_MODE_AUTO;
>  
>  static const struct dmi_system_id hp_envy_x360_8824_boards[] __initconst = {
>  	{
> @@ -518,6 +528,120 @@ static int hp_wmi_get_fan_speed_victus_s(int fan)
>  	return ret;
>  }
>  
> +static int hp_envy_x360_8824_acpi_eval(const char *path,
> +				       const unsigned long long *args,
> +				       size_t arg_count,
> +				       unsigned long long *value)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object params[2] = { };
> +	struct acpi_object_list input = { .count = arg_count, .pointer = params };
> +	union acpi_object *obj;
> +	acpi_status status;
> +	size_t i;
> +
> +	for (i = 0; i < arg_count; i++) {
> +		params[i].type = ACPI_TYPE_INTEGER;
> +		params[i].integer.value = args[i];
> +	}
> +
> +	status = acpi_evaluate_object(NULL, (acpi_string)path,
> +				      arg_count ? &input : NULL, &output);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj = output.pointer;

Please move variable declaration here and use __free() so you don't need 
to do manual kfree()s.

> +	if (!obj)
> +		return -ENODATA;
> +
> +	if (obj->type != ACPI_TYPE_INTEGER) {
> +		kfree(obj);
> +		return -EINVAL;
> +	}
> +
> +	*value = obj->integer.value;
> +	kfree(obj);
> +
> +	return 0;
> +}
> +
> +static int hp_envy_x360_8824_get_pwm_locked(void)
> +{
> +	unsigned long long args[] = { HP_ENVY_8824_FAN_VALUE_ARG };
> +	unsigned long long value;
> +	int ret;
> +
> +	ret = hp_envy_x360_8824_acpi_eval(HP_ENVY_8824_ACPI_FANG, args,
> +					 ARRAY_SIZE(args), &value);
> +	if (ret)
> +		return ret;
> +	if (value > U8_MAX)
> +		return -EINVAL;
> +
> +	return value;
> +}
> +
> +static int hp_envy_x360_8824_set_pwm_locked(u8 pwm)
> +{
> +	unsigned long long args[] = {
> +		HP_ENVY_8824_FAN_PRIME_ARG,
> +		HP_ENVY_8824_FAN_PRIME_MANUAL,
> +	};
> +	unsigned long long value;
> +	int ret;
> +
> +	ret = hp_envy_x360_8824_acpi_eval(HP_ENVY_8824_ACPI_FANW, args,
> +					 ARRAY_SIZE(args), &value);
> +	if (ret)
> +		return ret;
> +
> +	args[0] = HP_ENVY_8824_FAN_VALUE_ARG;
> +	args[1] = pwm;
> +	ret = hp_envy_x360_8824_acpi_eval(HP_ENVY_8824_ACPI_FANW, args,
> +					 ARRAY_SIZE(args), &value);
> +	if (ret)
> +		return ret;
> +
> +	hp_envy_x360_8824_pwm_mode = HP_ENVY_8824_PWM_MODE_MANUAL;
> +	return 0;
> +}
> +
> +static int hp_envy_x360_8824_set_auto_locked(void)
> +{
> +	unsigned long long args[] = {
> +		HP_ENVY_8824_FAN_PRIME_ARG,
> +		HP_ENVY_8824_FAN_PRIME_AUTO,
> +	};
> +	unsigned long long value;
> +	int ret;
> +
> +	ret = hp_envy_x360_8824_acpi_eval(HP_ENVY_8824_ACPI_FANW, args,
> +					 ARRAY_SIZE(args), &value);
> +	if (ret)
> +		return ret;
> +
> +	args[0] = HP_ENVY_8824_FAN_VALUE_ARG;
> +	args[1] = HP_ENVY_8824_FAN_PRIME_MANUAL;
> +	ret = hp_envy_x360_8824_acpi_eval(HP_ENVY_8824_ACPI_FANW, args,
> +					 ARRAY_SIZE(args), &value);
> +	if (ret)
> +		return ret;
> +
> +	hp_envy_x360_8824_pwm_mode = HP_ENVY_8824_PWM_MODE_AUTO;
> +	return 0;
> +}
> +
> +static int hp_envy_x360_8824_set_manual_locked(void)
> +{
> +	int pwm;
> +
> +	pwm = hp_envy_x360_8824_get_pwm_locked();
> +	if (pwm < 0)
> +		return pwm;
> +
> +	return hp_envy_x360_8824_set_pwm_locked(pwm);
> +}
> +
>  /*
>   * Calling this hp_wmi_get_fan_count_userdefine_trigger function also enables
>   * and/or maintains the laptop in user defined thermal and fan states, instead
> @@ -2103,6 +2227,12 @@ static void hp_wmi_rfkill_setup(struct platform_device *device)
>  		rfkill_unregister(wifi_rfkill);
>  		rfkill_destroy(wifi_rfkill);
>  	}
> +
> +	if (is_envy_x360_8824_board) {
> +		mutex_lock(&hp_envy_x360_8824_fan_lock);
> +		hp_envy_x360_8824_set_auto_locked();
> +		mutex_unlock(&hp_envy_x360_8824_fan_lock);

Use guard().

> +	}
>  	if (bluetooth_rfkill) {
>  		rfkill_unregister(bluetooth_rfkill);
>  		rfkill_destroy(bluetooth_rfkill);
> @@ -2176,6 +2306,10 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
>  {
>  	switch (type) {
>  	case hwmon_pwm:
> +		if (attr == hwmon_pwm_input)
> +			return is_envy_x360_8824_board ? 0644 : 0;
> +		if (attr == hwmon_pwm_enable)
> +			return is_envy_x360_8824_board ? 0644 : 0;
>  		return 0644;
>  	case hwmon_fan:
>  		if (is_envy_x360_8824_board)
> @@ -2213,6 +2347,25 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  		*val = ret;
>  		return 0;
>  	case hwmon_pwm:
> +		if (is_envy_x360_8824_board) {
> +			mutex_lock(&hp_envy_x360_8824_fan_lock);
> +			if (attr == hwmon_pwm_input) {

Why you need to do this under lock?

Also, use guard() instead of lock/unlock pair.

> +				ret = hp_envy_x360_8824_get_pwm_locked();
> +				if (!ret)
> +					*val = ret;
> +				else if (ret > 0)
> +					*val = ret;

Aren't these same as ret >= 0. However, with guard(), you can reverse the 
logic and return error immediately so I don't think you need other if()s 
at all.

> +				mutex_unlock(&hp_envy_x360_8824_fan_lock);
> +				return ret < 0 ? ret : 0;
> +			}
> +			if (attr == hwmon_pwm_enable) {
> +				*val = hp_envy_x360_8824_pwm_mode;
> +				mutex_unlock(&hp_envy_x360_8824_fan_lock);
> +				return 0;
> +			}
> +			mutex_unlock(&hp_envy_x360_8824_fan_lock);
> +			return -EOPNOTSUPP;
> +		}
>  		switch (hp_wmi_fan_speed_max_get()) {
>  		case 0:
>  			/* 0 is automatic fan, which is 2 for hwmon */
> @@ -2236,8 +2389,40 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  			      u32 attr, int channel, long val)
>  {
> +	int ret;
> +
>  	switch (type) {
>  	case hwmon_pwm:
> +		if (is_envy_x360_8824_board) {
> +			mutex_lock(&hp_envy_x360_8824_fan_lock);
> +			switch (attr) {
> +			case hwmon_pwm_input:
> +				if (val < 0 || val > U8_MAX) {
> +					mutex_unlock(&hp_envy_x360_8824_fan_lock);
> +					return -EINVAL;
> +				}

Here too, isn't it enough to begin the critical section only here?

Again, please use guard() instead.

> +				ret = hp_envy_x360_8824_set_pwm_locked(val);
> +				mutex_unlock(&hp_envy_x360_8824_fan_lock);
> +				return ret;
> +			case hwmon_pwm_enable:
> +				switch (val) {
> +				case HP_ENVY_8824_PWM_MODE_MANUAL:
> +					ret = hp_envy_x360_8824_set_manual_locked();
> +					break;
> +				case HP_ENVY_8824_PWM_MODE_AUTO:
> +					ret = hp_envy_x360_8824_set_auto_locked();
> +					break;
> +				default:
> +					ret = -EINVAL;
> +					break;
> +				}
> +				mutex_unlock(&hp_envy_x360_8824_fan_lock);
> +				return ret;
> +			default:
> +				mutex_unlock(&hp_envy_x360_8824_fan_lock);

This default path doesn't require taking the mutex.

> +				return -EOPNOTSUPP;
> +			}
> +		}
>  		switch (val) {
>  		case 0:
>  			if (is_victus_s_thermal_profile())
> @@ -2262,7 +2447,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  
>  static const struct hwmon_channel_info * const info[] = {
>  	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
> -	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
>  	NULL
>  };
>  
> 

-- 
 i.

