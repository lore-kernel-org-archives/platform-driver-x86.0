Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FE31DDEA;
	Sat,  4 Jan 2025 17:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736010791; cv=none; b=D8pnrH8dm6+81x2R8G+iYiTW0wTwrf7SDhr/2nyRNQ25zwTap70wrGhaUVXZWvuWODe44/PI3a00NyqiRzFbrcrSvFNSYVzVA5poxJxCfzJI18Zfpgrl/G17oMZnhw7lq/OW46bHGtiYdMXAfgz5OduGAPCxwNw+Srarz/44rkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736010791; c=relaxed/simple;
	bh=FkPK+I/glr4fyIsXtqPFawWAR+uDjlTlGsOVvmw4Ytg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYMQHjl4i5kK9FHKu7Z29tjcNNZMIRzwVYJIOa3ANc+NVvas2RqElNWhD8Lw+hr0SHPJLSC0ESsxD6QbBheOMCvikN5f2XwYCo1yuOHu7uJGyyuK6ECH4lvI3ceomq7kwlufNHXd2bxfergGgD9Z5Ol1HvGaClyJKOFtprW34tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSF07ThS; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSF07ThS"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afdfefc6c1so4158232137.0;
        Sat, 04 Jan 2025 09:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736010788; x=1736615588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7Sko3ej2ng+p5poTS8wM8X7Vnd5e2sTPxeYkuX+A4Q=;
        b=DSF07ThSCB0Z1e6+DaqlMrEHdKxULzek8fHkpClXnnJDzuJOW4tQEokcuQ+qLiXma+
         OPU/8zSmL5aQmP0uAoYw1leAxBT4lRtoX+/wp+hNazS/fHJLkDttqWh6lw4eIXFOQY7s
         NSrIhNAz8TpVg7cvakiIdk/vPXmCs4hJy2/3H9SFG+bsZys6uZjFo7YbxN+jbo9GZYVA
         kG467tlpd+D8np8ZgIhCmrsU4aOEu4M0OaroPoDMr3pnLXfhN9mY5ojGPWrQDPS7BD5v
         p/tsTtnaug3q2oyBaUFB3LbFjgcVWtkILFfd7mYxLZXjlul1M57aH/Xeuea4mXL86gxQ
         7KvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736010788; x=1736615588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7Sko3ej2ng+p5poTS8wM8X7Vnd5e2sTPxeYkuX+A4Q=;
        b=hmesWAMxDRwzRbSuXeI6DvlDi8xxh1/+YXo9kIWf5lCSIgcmfA1wev+mWot6ImtabX
         zECDJE4OiSiE3s5gHpEIovExqLvoR9eyEXY+M7PDgT6TxsPdASSiD2tiJaM5xgAueTzZ
         efXTrXBi9mjbEEZvCDkz6BDyGUOQB3OBbRT98W7tuQkVAeoEWdqXZBT1nLaPkLEAB8GH
         Cgby5UqtFcARbQzEkQ7DUdqnZosEL/LbLPcrD323APcDUAYrlBLZTxAPKd8Lkjpy7K15
         /wmyFlda73rsXqbXgrvc1e0tpEqyWdC2OfWcaDl6myjj9wxNfmM7dMYIV5v6545Cs6xh
         B++A==
X-Forwarded-Encrypted: i=1; AJvYcCVd81mzFFcorAnybD0YBBxFeV8KpnMSrLWtjwJ/271eA4w90cB+ty9QHQ37YikY0NRM9ZsYcLvyCoJaQoHhLpNeTccnQg==@vger.kernel.org, AJvYcCViNd337a+gb9nToY6y3LUUCfU+s+9foUxlHFct62qp41o9FQ4TJ+eOttRsbyUaMXK8HNyUpbKjqMERc3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYfzvhX3WeXWdrY3soGGkvwghtxH04o5VzTPsGiFE0S1uQjoCI
	efEpmOcmCblhwma2VGPCtAYYTuhM0nmfA9SCLRNa31DJAlORQcLY
X-Gm-Gg: ASbGncsgQYto5CYzuDCTEpDlQ2XsfFYnAqvz3vOt40hvbDt3DXnTEZnxRJBuq6MfxCu
	OM/CRKrH07iLALOz2JsNgDrB2q9k6qJcta3gUwYSTNscs5UHGLoyuS+EvbSQdp02I1EIsU6iDNX
	6K/gGSRI+GYqmWeGv6PYpwbS9H9LJLJwMgzNPApOztAFKaYPWsmuIHsd+MtLhNvY9KrsHaQhfjs
	XtJPku23trDM2oIcpSk1WF2FRc9uWlIC4hJtJ3lpDtJn8WIx/Wvag==
X-Google-Smtp-Source: AGHT+IFoPCWCT7Kto+Yy0CRN3ls3SU/CEqOtNjJj6ISMTT3sVCnglyFCu4jElCc6KNR4BOuIYbJ0uA==
X-Received: by 2002:a05:6102:2914:b0:4b2:cbe4:5999 with SMTP id ada2fe7eead31-4b2cc493769mr40508258137.23.1736010788132;
        Sat, 04 Jan 2025 09:13:08 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac4bce7sm6010220241.13.2025.01.04.09.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 09:13:07 -0800 (PST)
Date: Sat, 4 Jan 2025 12:13:04 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 1/3] platform/x86: acer-wmi: use WMI calls for
 platform profile handling
Message-ID: <uizjjmxs44ajzekcndb2qfkuqctvgi3nolmoeg6zdq5lteewxs@ztj5jp6wrakj>
References: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
 <20250104-platform_profile-v2-1-b58164718903@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104-platform_profile-v2-1-b58164718903@gmail.com>

On Sat, Jan 04, 2025 at 08:59:20PM +0530, Hridesh MG wrote:
> Improve the platform profile handling by using WMI calls to fetch the
> current platform profile instead of directly accessing it from the EC.
> This is beneficial because the EC address differs for certain laptops.
> 
> Link: https://lore.kernel.org/platform-driver-x86/d7be714c-3103-42ee-ad15-223a3fe67f80@gmx.de/
> Co-developed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>

Hi Hridesh,

> ---
>  drivers/platform/x86/acer-wmi.c | 189 ++++++++++++++++++++++++++++------------
>  1 file changed, 133 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index b3043d78a7b38a7b773da5ecd4846ca11e8595f5..5370056fb2d03a768162f2f1643ef27dc6deafa8 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -31,6 +31,7 @@
>  #include <acpi/video.h>
>  #include <linux/hwmon.h>
>  #include <linux/units.h>
> +#include <linux/unaligned.h>
>  #include <linux/bitfield.h>
>  
>  MODULE_AUTHOR("Carlos Corbacho");
> @@ -68,8 +69,11 @@ MODULE_LICENSE("GPL");
>  #define ACER_WMID_GET_GAMING_SYS_INFO_METHODID 5
>  #define ACER_WMID_SET_GAMING_FAN_BEHAVIOR 14
>  #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
> +#define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23
>  
> -#define ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET 0x54
> +#define ACER_GAMING_MISC_SETTING_STATUS_MASK GENMASK_ULL(7, 0)
> +#define ACER_GAMING_MISC_SETTING_INDEX_MASK GENMASK_ULL(7, 0)
> +#define ACER_GAMING_MISC_SETTING_VALUE_MASK GENMASK_ULL(15, 8)
>  
>  #define ACER_PREDATOR_V4_RETURN_STATUS_BIT_MASK GENMASK_ULL(7, 0)
>  #define ACER_PREDATOR_V4_SENSOR_INDEX_BIT_MASK GENMASK_ULL(15, 8)
> @@ -115,6 +119,13 @@ enum acer_wmi_predator_v4_sensor_id {
>  	ACER_WMID_SENSOR_GPU_TEMPERATURE	= 0x0A,
>  };
>  
> +enum acer_wmi_gaming_misc_setting {
> +	ACER_WMID_MISC_SETTING_OC_1			= 0x0005,
> +	ACER_WMID_MISC_SETTING_OC_2			= 0x0007,

These OC settings should be added only if you add support for them.

I noticed acer_toggle_turbo() uses these settings. For consistency, I
think it should be refactored to use WMID_gaming_set_misc_setting()
instead of WMID_gaming_set_u64().

> +	ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES	= 0x000A,

This should be added in patch [2/3].

> +	ACER_WMID_MISC_SETTING_PLATFORM_PROFILE		= 0x000B,
> +};
> +
>  static const struct key_entry acer_wmi_keymap[] __initconst = {
>  	{KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
>  	{KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
> @@ -751,20 +762,12 @@ static bool platform_profile_support;
>   */
>  static int last_non_turbo_profile;
>  
> -enum acer_predator_v4_thermal_profile_ec {
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO = 0x04,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO = 0x03,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE = 0x02,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET = 0x01,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED = 0x00,
> -};
> -
> -enum acer_predator_v4_thermal_profile_wmi {
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI = 0x060B,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI = 0x050B,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI = 0x040B,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI = 0x0B,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI = 0x010B,
> +enum acer_predator_v4_thermal_profile {
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET		= 0x00,
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED	= 0x01,
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE	= 0x04,
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO		= 0x05,
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO		= 0x06,
>  };
>  
>  /* Find which quirks are needed for a particular vendor/ model pair */
> @@ -1477,6 +1480,45 @@ WMI_gaming_execute_u64(u32 method_id, u64 in, u64 *out)
>  	return status;
>  }
>  
> +static int WMI_gaming_execute_u32_u64(u32 method_id, u32 in, u64 *out)
> +{
> +	struct acpi_buffer result = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer input = {
> +		.length = sizeof(in),
> +		.pointer = &in,
> +	};
> +	union acpi_object *obj;
> +	acpi_status status;
> +	int ret = 0;
> +
> +	status = wmi_evaluate_method(WMID_GUID4, 0, method_id, &input, &result);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj = result.pointer;
> +	if (obj && out) {
> +		switch (obj->type) {
> +		case ACPI_TYPE_INTEGER:
> +			*out = obj->integer.value;
> +			break;
> +		case ACPI_TYPE_BUFFER:
> +			if (obj->buffer.length < sizeof(*out))
> +				ret = -ENOMSG;
> +			else
> +				*out = get_unaligned_le64(obj->buffer.pointer);
> +
> +			break;
> +		default:
> +			ret = -ENOMSG;
> +			break;
> +		}
> +	}
> +
> +	kfree(obj);
> +
> +	return ret;
> +}
> +
>  static acpi_status WMID_gaming_set_u64(u64 value, u32 cap)
>  {
>  	u32 method_id = 0;
> @@ -1565,6 +1607,48 @@ static void WMID_gaming_set_fan_mode(u8 fan_mode)
>  	WMID_gaming_set_u64(gpu_fan_config2 | gpu_fan_config1 << 16, ACER_CAP_TURBO_FAN);
>  }
>  
> +static int WMID_gaming_set_misc_setting(enum acer_wmi_gaming_misc_setting setting, u8 value)
> +{
> +	acpi_status status;
> +	u64 input = 0;
> +	u64 result;
> +
> +	input |= FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, setting);
> +	input |= FIELD_PREP(ACER_GAMING_MISC_SETTING_VALUE_MASK, value);
> +
> +	status = WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, input, &result);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	/* The return status must be zero for the operation to have succeeded */
> +	if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int WMID_gaming_get_misc_setting(enum acer_wmi_gaming_misc_setting setting, u8 *value)
> +{
> +	u64 input = 0;
> +	u64 result;
> +	int ret;
> +
> +	input |= FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, setting);
> +
> +	ret = WMI_gaming_execute_u32_u64(ACER_WMID_GET_GAMING_MISC_SETTING_METHODID, input,
> +					 &result);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* The return status must be zero for the operation to have succeeded */
> +	if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
> +		return -EIO;
> +
> +	*value = FIELD_GET(ACER_GAMING_MISC_SETTING_VALUE_MASK, result);
> +
> +	return 0;
> +}
> +
>  /*
>   * Generic Device (interface-independent)
>   */
> @@ -1833,9 +1917,8 @@ acer_predator_v4_platform_profile_get(struct platform_profile_handler *pprof,
>  	u8 tp;
>  	int err;
>  
> -	err = ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET, &tp);
> -
> -	if (err < 0)
> +	err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, &tp);
> +	if (err)
>  		return err;
>  
>  	switch (tp) {
> @@ -1865,36 +1948,33 @@ static int
>  acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
>  				      enum platform_profile_option profile)
>  {
> -	int tp;
> -	acpi_status status;
> +	int tp, err;
>  
>  	switch (profile) {
>  	case PLATFORM_PROFILE_PERFORMANCE:
> -		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> +		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> -		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
> +		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
> -		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>  		break;
>  	case PLATFORM_PROFILE_QUIET:
> -		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
> +		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
>  		break;
>  	case PLATFORM_PROFILE_LOW_POWER:
> -		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
> +		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
>  		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
>  
> -	status = WMI_gaming_execute_u64(
> -		ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, NULL);
> -
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> +	err = WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
> +	if (err)
> +		return err;
>  
> -	if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
> +	if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
>  		last_non_turbo_profile = tp;
>  
>  	return 0;
> @@ -1923,6 +2003,7 @@ static int acer_platform_profile_setup(struct platform_device *device)
>  		set_bit(PLATFORM_PROFILE_LOW_POWER,
>  			platform_profile_handler.choices);
>  
> +

Please, drop this extra line.

~ Kurt

>  		err = platform_profile_register(&platform_profile_handler);
>  		if (err)
>  			return err;
> @@ -1931,7 +2012,7 @@ static int acer_platform_profile_setup(struct platform_device *device)
>  
>  		/* Set default non-turbo profile  */
>  		last_non_turbo_profile =
> -			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>  	}
>  	return 0;
>  }
> @@ -1946,12 +2027,10 @@ static int acer_thermal_profile_change(void)
>  		u8 current_tp;
>  		int tp, err;
>  		u64 on_AC;
> -		acpi_status status;
> -
> -		err = ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET,
> -			      &current_tp);
>  
> -		if (err < 0)
> +		err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE,
> +						   &current_tp);
> +		if (err)
>  			return err;
>  
>  		/* Check power source */
> @@ -1962,54 +2041,52 @@ static int acer_thermal_profile_change(void)
>  		switch (current_tp) {
>  		case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
>  			if (!on_AC)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>  			else if (cycle_gaming_thermal_profile)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
> +				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
>  			else
>  				tp = last_non_turbo_profile;
>  			break;
>  		case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
>  			if (!on_AC)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>  			else
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> +				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
>  			break;
>  		case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
>  			if (!on_AC)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
> +				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
>  			else if (cycle_gaming_thermal_profile)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
> +				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
>  			else
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> +				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
>  			break;
>  		case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
>  			if (!on_AC)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>  			else if (cycle_gaming_thermal_profile)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>  			else
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> +				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
>  			break;
>  		case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
>  			if (!on_AC)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>  			else if (cycle_gaming_thermal_profile)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
> +				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
>  			else
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> +				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
>  			break;
>  		default:
>  			return -EOPNOTSUPP;
>  		}
>  
> -		status = WMI_gaming_execute_u64(
> -			ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, NULL);
> -
> -		if (ACPI_FAILURE(status))
> -			return -EIO;
> +		err = WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
> +		if (err)
> +			return err;
>  
>  		/* Store non-turbo profile for turbo mode toggle*/
> -		if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
> +		if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
>  			last_non_turbo_profile = tp;
>  
>  		platform_profile_notify(&platform_profile_handler);
