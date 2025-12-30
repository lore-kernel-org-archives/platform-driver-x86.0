Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF96023C4F4
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767104545; cv=none; b=YqTyw0mEwd/kl22RboiZaoNRzQKdTmgSEYEj2K3pEkn2a28vwPoMIc0+OQO1cuxdBzQ3YUJQyWpltN7FqHu3CoFXgX2tOdoiq8hfKjrFTQJUFIH6UgT9cLehw2crl61DzPbaomvfHuhKtWzTY/QF8ZKyeNCn8OkyKoytPd0NUzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767104545; c=relaxed/simple;
	bh=uA33T4lGuFAnWJTaHl/EwkAUdvf5wd2qeI4+VJJDc9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSpBkVvdT2Vbc06fL+zZJqlE4jvSMPsw4T0YYYEd2FZt1Bgz6eTauO5Npk6yHrTAnh/8q0O87sP4H7jVL0R7RJO2kjvYaH2fItd2hir8Ya9rTURoaaQMjZ6LeNnRICHMv0x7v3c+oMWR5EQ1+jfNbaulKqdbLx5SLbovL/eCKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWsA3Ztp; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWsA3Ztp"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-803474aaa8bso3562198b3a.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 06:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104543; x=1767709343; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QzVYwLJvrVW5vqBEcF7BqvBLTRo1+H1vbC6AAlYC+dg=;
        b=BWsA3Ztp7HzZJrpZvkIVUkGAapHLm6DFOcoRP4dMlYxq2KizpE/fORAouZOYDsCDVb
         VFrxfCKj+BkBoGhvJPx2nMluWHRayAVs5HxKqCuXJTGETTosxGH+adYAosVLWHPRRY/0
         rrbwoCO7WNot9vxDiZISUH+bNI2lIUYEdDRNfBjxHPRzZ7GVJzDwCUxtaTWI8FSCHtMD
         Ny3WMzJrE/raGA8yw1YiwyvPVOGrlCoIR8Fmq7D4v9sa8HftpFywoJzSMejc7Fl4/x9Z
         s4rArZ1xjGJ0+lvvnPWaRg7dVRVB40bBvhK6RU2K0ZAINNDLYeDknJi9YlW/YgUG22RX
         FWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104543; x=1767709343;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QzVYwLJvrVW5vqBEcF7BqvBLTRo1+H1vbC6AAlYC+dg=;
        b=cjih5PCI6vggSYk0/4G2AWpI5aqA76TKuFsRU4RaM3G9rfstba/B/9xAtmW1t1diau
         oyJ15GSRX7I7HYD4si9EnPTHFrKT6X0PUOE2vE0qJ0Q9W0tzDYBXgj0A4M1Evbqsai+k
         nJ3v1cpgcQRL9ycv14sft6FxakUIAjuIYOsqmGMeK39uAorRrFzDHPUz7X5vmUbILX30
         6yvqDSaiH/Pw7tGDYpg89RfwCs5Cys3CRXoGktCY+Y1zu1fiyaLhGdKzO9RUasFKRzfM
         Yvh6u6qrvF6DyFuS+Qjq9XLl1vXuzCLJ7sz5150XBm+H9WncQzvrHIzYpI3KmFXBwmtO
         zRaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAzw/H5RyuHM1CledfADS9vLessxOwr98poEWKCbqmf95zzdh1kV+5fbuucjxzlM4GKfF1YOrqfZuIUjBiOwYchtSe@vger.kernel.org
X-Gm-Message-State: AOJu0YzjmE58/o1mj7A4sgx6HmXAhIcEPlpFm4bi1a65Ll0nllZ1g5jk
	mkeiGrrdgB0hp1C9ggphyYccpNP95ALuaeISOX++nvDlQGXkfUfIuWTB
X-Gm-Gg: AY/fxX6HBXJjrm1w9REwZNbjwvn3GO+v70BsRQYOPIVd24AvLOBAJ9Un3RyH1WVFDmV
	BmEmTod2zifBIIKgJqJUrvdkHlp4H2Gf5IVTPAqp4ESKVWCbiLKvhmZvqLIAjxTNvftXFriL/BH
	tXePmlyiFp8mtxU1Aj93ulwTMZaNrIiKEHGNcG2qUsWXcYgBA920yFT8u5gxxvFi+eryIBrYdvr
	VCg9jd070eIf372sgYitCe6NxPepJt/qUPlCYdj2CUMfvVFlcN+4olbvhB0BHZkayXA9GJCjIJQ
	zzMzyL6TrL/uLZCg3fyXNEHku2n5Wk2LSssAeqvnH251eiYu+AEEi4VeKfXxD38lXlzVpbx06iL
	AMI3NA7GOlMAxe1oa5OOh1zLbhQJ3IYnQNBkSNFWFi82lbypyBJFmmraqaHsITXzZ3U/3Ujf/IG
	hi6VjVBqxpUnyuW8dW3Ws=
X-Google-Smtp-Source: AGHT+IEnfTGJLniIeJG00lCnfnYpk61S/D7lfyOjOJkZlMJWgx4512t31YgbHhpGSpH7N/ujXDgZ5A==
X-Received: by 2002:a05:6a00:4791:b0:80f:4667:a94a with SMTP id d2e1a72fcca58-80f4667a98emr1726273b3a.10.1767104543034;
        Tue, 30 Dec 2025 06:22:23 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa32916sm32796530b3a.8.2025.12.30.06.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:22:22 -0800 (PST)
Date: Tue, 30 Dec 2025 19:52:15 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: hansg@kernel.org, linux@roeck-us.net, 
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: hp-wmi: add manual fan control for
 Victus S models
Message-ID: <aVPe3jntoH7EqHcy@archlinux>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com>
 <20251225142310.204831-2-krishna.chomal108@gmail.com>
 <f1b47b8e-d38b-b62e-6102-12edac08d6d7@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1b47b8e-d38b-b62e-6102-12edac08d6d7@linux.intel.com>

On Mon, Dec 29, 2025 at 03:08:16PM +0200, Ilpo Järvinen wrote:
[snip]
>> +
>> +#define RPM_TO_PWM(rpm, ctx) fixp_linear_interpolate(0, 0, \
>> +						(ctx)->max_rpm, U8_MAX, \
>
>+ limits.h
>
>> +						clamp_val((rpm), \
>
>+ minmax.h
>

Added in v2.

>> +						0, (ctx)->max_rpm))
>> +#define PWM_TO_RPM(pwm, ctx) fixp_linear_interpolate(0, 0, \
>> +						U8_MAX, (ctx)->max_rpm, \
>> +						clamp_val((pwm), \
>> +						0, U8_MAX))
>
>These look not needing to be macros at all but could be written as static
>functions which makes typing explicit.

Fixed. I have converted both of them into static inlines.

>> +
>>  /* map output size to the corresponding WMI method id */
>>  static inline int encode_outsize_for_pvsz(int outsize)
>>  {
>> @@ -637,41 +665,55 @@ static int hp_wmi_fan_speed_max_set(int enabled)
>>  	return enabled;
>>  }
>>
>> -static int hp_wmi_fan_speed_reset(void)
>> +static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *ctx, u8 speed)
>>  {
>> -	u8 fan_speed[2] = { HP_FAN_SPEED_AUTOMATIC, HP_FAN_SPEED_AUTOMATIC };
>> +	u8 fan_speed[2];
>>  	int ret;
>>
>> -	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_SET_QUERY, HPWMI_GM,
>> -				   &fan_speed, sizeof(fan_speed), 0);
>> +	if (!ctx)
>> +		return -ENODEV;
>
>Can this be NULL? Is it a bug in the driver/kernel if it is?
>

No, even I think this is redundant check. Removed in v2.

>> -	return ret;
>> -}
>> +	fan_speed[CPU_FAN] = speed;
>> +	fan_speed[GPU_FAN] = speed;
>>
>> -static int hp_wmi_fan_speed_max_reset(void)
>> -{
>> -	int ret;
>> +	/*
>> +	 * GPU fan speed is always a little higher than CPU fan speed, we fetch
>> +	 * this delta value from the fan table during hwmon init.
>> +	 * Exception: Speed is set to HP_FAN_SPEED_AUTOMATIC, to revert to
>> +	 * automatic mode.
>> +	 */
>> +	if (speed != HP_FAN_SPEED_AUTOMATIC)
>> +		fan_speed[GPU_FAN] = clamp_val(speed + ctx->gpu_delta, 0, U8_MAX);
>
>So this only works correctly due to C's integer promotion when doing
>arithmetic on them?
>

Yes, it relies on promotion, but for clarity I have added explicit cast
to unsigned int.

[snip]
>> +static int hp_wmi_fan_speed_max_reset(struct hp_wmi_hwmon_priv *ctx)
>> +{
>> +	int ret;
>>
>> +	ret = hp_wmi_fan_speed_max_set(0);
>>  	if (ret)
>> -		return ret < 0 ? ret : -EINVAL;
>> +		return ret;
>>
>> -	return val;
>> +	/* Disabling max fan speed on Victus s1xxx laptops needs a 2nd step: */
>> +	ret = hp_wmi_fan_speed_reset(ctx);
>> +	return ret;
>
>Return can be done directly on the line with the call.
>

Fixed.

>>  }
>>
>>  static int __init hp_wmi_bios_2008_later(void)
>> @@ -2108,12 +2150,43 @@ static struct platform_driver hp_wmi_driver __refdata = {
>>  	.remove = __exit_p(hp_wmi_bios_remove),
>>  };
>>
>> +static int hp_wmi_hwmon_enforce_ctx(struct hp_wmi_hwmon_priv *ctx)
>
>I don't understand why this function is named as "enforce context".
>Perhaps change function's name to something that better describes what it
>does.
>

I have renamed "enforce_ctx" to "apply_fan_settings" in v2. That seems
like a more descriptive and self-explanatory name.

>> +{
>> +	if (!ctx)
>> +		return -ENODEV;
>> +
>> +	switch (ctx->mode) {
>> +	case PWM_MODE_MAX:
>> +		if (is_victus_s_thermal_profile())
>> +			hp_wmi_get_fan_count_userdefine_trigger();
>> +		return hp_wmi_fan_speed_max_set(1);
>> +	case PWM_MODE_MANUAL:
>> +		if (!is_victus_s_thermal_profile())
>> +			return -EOPNOTSUPP;
>> +		return hp_wmi_fan_speed_set(ctx, PWM_TO_RPM(ctx->pwm, ctx));
>> +	case PWM_MODE_AUTO:
>> +		if (is_victus_s_thermal_profile()) {
>> +			hp_wmi_get_fan_count_userdefine_trigger();
>> +			return hp_wmi_fan_speed_max_reset(ctx);
>> +		} else {
>
>Unnecessary else.
>

Actually, this is needed to store the intermediate ret variable, to
prepare for the keep-alive rescheduling in patch 2/2.

>> +			return hp_wmi_fan_speed_max_set(0);
>> +		}
>> +	default:
>> +		/* shouldn't happen */
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static umode_t hp_wmi_hwmon_is_visible(const void *data,
>>  				       enum hwmon_sensor_types type,
>>  				       u32 attr, int channel)
>>  {
>>  	switch (type) {
>>  	case hwmon_pwm:
>> +		if (attr == hwmon_pwm_input && !is_victus_s_thermal_profile())
>> +			return 0; /* Hide PWM input if not Victus S */
>
>The comment add no information beyond what the code already tells us.
>

Agreed, this is also removed in v2.

[snip]
>>  static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>>  			      u32 attr, int channel, long val)
>>  {
>> +	struct hp_wmi_hwmon_priv *ctx;
>> +	int current_rpm, ret;
>> +
>> +	ctx = dev_get_drvdata(dev);
>> +	if (!ctx)
>
>Don't you register it with a non-NULL drvdata always?
>

Yes this is also redundant. Removed.

[snip]
>>
>> +static int hp_wmi_hwmon_setup_ctx(struct hp_wmi_hwmon_priv *ctx)
>
>I suggest you change "ctx" in the name to something more meaningful.
>

Renamed "ctx" to "priv" as it is more consistent with drvdata.

>> +{
>> +	u8 fan_data[128];
>> +	u8 (*fan_table)[3];
>> +	u8 rows, min_rpm, max_rpm, gpu_delta;
>> +	int ret;
>> +
>> +	/* Default behaviour on hwmon init is automatic mode */
>> +	ctx->mode = PWM_MODE_AUTO;
>> +
>> +	/* Bypass all non-Victus S devices */
>> +	if (!is_victus_s_thermal_profile())
>> +		return 0;
>> +
>> +	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY,
>> +				   HPWMI_GM, &fan_data, 4, sizeof(fan_data));
>
>Does this end up coping from uninitialized fan_data (insize = 4)?
>

Yes, that was a mistake. Fixed in v2 by explicitly initialising
fan_data[] to zeros.

>> +	if (ret != 0)
>
>if (ret)
>

Fixed.

>> +		return ret;
>> +
>> +	rows = fan_data[1];
>> +	if (2 + rows * 3 >= sizeof(fan_data))
>> +		return -EINVAL;
>> +
>> +	fan_table = (u8 (*)[3]) & fan_data[2];
>
>Heh, a cast disguished as a bitwise and (due to misleading spacing).
>
>Can you make a real struct out of this so you could access the members
>properly without these literal offsets and casting madness? You might need
>to use DECLARE_FLEX_ARRAY().
>

Yes that cast does look like a bitwise AND. I was merely trying to satisfy
checkpatch --strict, but it seems like it is best to ignore the warning in
this case. Anyway, I agree that such casting creates unnecessary
complexity. I have added struct victus_s_fan_table to handle this more
gracefully in v2.
