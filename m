Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCDD1F37DB;
	Wed,  8 Jan 2025 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343242; cv=none; b=kkve4ReiHIVgCllGZGeJHEZvKCz8czekUSGJf8OWrGotQLgz/Dt4q2cMWtiD4L3G92YTJr7R9El9uTrA+MJTzXt05kZLbbF+EpCsi7iSgAjFIk2mnu9VdaGk9DGVRNQa5w9HhaaLZY/AYSTsf0GX9ArpUKQj03t+sZPXhomx2/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343242; c=relaxed/simple;
	bh=dUuAsOeH6NaC9Hlsvt300liiqyPTuyZ+ghssOTdQSI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VP9nj0n73TvP6TwQKK2cI9zN5y4D1TPCWc8JpZtrkYwuVnFGbMvEUyTzsu1cxHx+imB5jqC8u1KwQtNHni+A/afRW9LxUK/MUmdqFjE5XjPwyPsFJn2Ok82fPQar6m0aRWT69zDF0PrUd2xT1qpQngiVEllio8pP3Khte3e1D2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEUt05/d; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEUt05/d"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e4a6b978283so1421478276.0;
        Wed, 08 Jan 2025 05:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736343239; x=1736948039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3OUJMYyBDnaub++yk3junUJ0G6Pjj6Amwh0MUHocdfM=;
        b=XEUt05/dwjNa3ekSoS8BCQNoBE786/87w5rf5n6iZLVg+Q9RJaW8Kv4Cxdmzc7XmWk
         mG2kufoIgg9QEIhMsaQBLh9yXWzfdOmzcj623YvjPKFeBKPQwLNwPcjTjX6zx/eflxbR
         5GuP2xf0Mp11ZVdcBeFJieoqw+vZTLt3td8Psc0WxCd37DQDlZ6Pzn30plkunhxVN/bL
         +KWNzhph0afj2tQIiUz2UAUieyTUYrB82Xf2QFpWOXHBHmWSD+fDQxK8rhSWYFztabvp
         H3nBRZcOJZY+BH10wMfAUnosrdKcYIX6Ec5GfvzYgbq2wKNG2KmrDZruoV7n7PWxbgIo
         2/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736343239; x=1736948039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OUJMYyBDnaub++yk3junUJ0G6Pjj6Amwh0MUHocdfM=;
        b=VWQIco7hcZdEK8DQ16PhblxLmBR3cVWaIGmNxqRWUAhh53tw/eqFLxHNrkndF/7W9p
         vDZxXttt6RNCdCZiP2LZ+0x3tv//JB2aVf1lu2my0NgaSCPsmgCM0oECqKvfcQDvw7D5
         5NsHucUdzmTDQ9b3r8n5nERIxb+2k75QEcVjgT306qJ9c0Ag5LcA0Da2Q3RLVOhgop+o
         iXVQGP1oN/bqfZFG+0hk+m4/8Z5WdNPcN9F15piLN8o6AKJIVVfMqc8Tm3y2viFLI2BH
         M+a/cgsmt26VHDIcfr/qDLXwFIhTwK2LfwHqCVOVFkbSkpgiR8QyntIIToW50lXeWne6
         Ev0w==
X-Forwarded-Encrypted: i=1; AJvYcCUPvDGdHGugCjQNl7Ah5YobZDkAXv5ayhF06FIk3JhpZ1S14Tpp6ljouosgM7H9BadLXp2Ewr1uCYiwJ1w=@vger.kernel.org, AJvYcCWKry/EmpSRlOz2l4mSbOcpPl49w5RyhUdwvxmAF0DjReGjW/IkUsYZ5I7qCQIL5rdJxZXVkSXgBs9pOFtNouP2pA4n8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd+XJr/DiLHJQxsqoB2kT+F4Rzfjzgs/cMnYCHdnqjFZ3AcGh+
	Ba02tsu/XAwp2IFmMN3e7dYZT9BbqAJALePsT/6Bgo+2mO5aNgPz
X-Gm-Gg: ASbGncvJNrKY/ftR3XZ766Qfh11SqvMVSzwrCX42JBg498gtRDZ7Rla146sTk3ICAIL
	cpyX39015W+q1M+4pU3IGnRBF3sB9mTjNU466kDpODXD22+jovspMDFtzDFMoLIWKRO7X4KHR6E
	BHwZlMg+ELWqGXTf7NqPn5E2oPbqSAllNcNzHdeu5Afvv+T6pR44WIvnn9J1yU4cllPjN72ztBq
	5MYOpjm6L0gq678dpIVUqsBz68SOMm1naXSctwxyNldX3sYroIFuw==
X-Google-Smtp-Source: AGHT+IHNapKwcQicYLw0MAmi6+KilM1bWqII4CUqzWjLNPuZA8JlK9Mfuz97qO3+0gLaAubeW6Zk6w==
X-Received: by 2002:a05:690c:601:b0:6ea:8901:dad8 with SMTP id 00721157ae682-6f5302be268mr23914807b3.3.1736343238847;
        Wed, 08 Jan 2025 05:33:58 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e7499b47sm92392857b3.64.2025.01.08.05.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:33:58 -0800 (PST)
Date: Wed, 8 Jan 2025 08:33:55 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 1/5] platform/x86: acer-wmi: use WMI calls for
 platform profile handling
Message-ID: <o2zfwefhuglauai4ecpgefwmzcsxati2bhez3pqtlpxi3zh3on@jbii7uqwwvkg>
References: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
 <20250108-platform_profile-v3-1-ec3658d9be9c@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-platform_profile-v3-1-ec3658d9be9c@gmail.com>

On Wed, Jan 08, 2025 at 02:15:23PM +0530, Hridesh MG wrote:
> Improve the platform profile handling by using WMI calls to fetch the
> current platform profile instead of directly accessing it from the EC.
> This is beneficial because the EC address differs for certain laptops.
> 
> Link: https://lore.kernel.org/platform-driver-x86/d7be714c-3103-42ee-ad15-223a3fe67f80@gmx.de/
> Co-developed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

> ---
>  drivers/platform/x86/acer-wmi.c | 185 ++++++++++++++++++++++++++++------------
>  1 file changed, 129 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index b3043d78a7b38a7b773da5ecd4846ca11e8595f5..97eabb0ec42781a27e6a00ce0df4c8a815c1b817 100644
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
> @@ -115,6 +119,10 @@ enum acer_wmi_predator_v4_sensor_id {
>  	ACER_WMID_SENSOR_GPU_TEMPERATURE	= 0x0A,
>  };
>  
> +enum acer_wmi_gaming_misc_setting {
> +	ACER_WMID_MISC_SETTING_PLATFORM_PROFILE		= 0x000B,
> +};
> +
>  static const struct key_entry acer_wmi_keymap[] __initconst = {
>  	{KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
>  	{KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
> @@ -751,20 +759,12 @@ static bool platform_profile_support;
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
> @@ -1477,6 +1477,45 @@ WMI_gaming_execute_u64(u32 method_id, u64 in, u64 *out)
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
> @@ -1565,6 +1604,48 @@ static void WMID_gaming_set_fan_mode(u8 fan_mode)
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
> @@ -1833,9 +1914,8 @@ acer_predator_v4_platform_profile_get(struct platform_profile_handler *pprof,
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
> @@ -1865,36 +1945,33 @@ static int
>  acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
>  				      enum platform_profile_option profile)
>  {
> -	int tp;
> -	acpi_status status;
> +	int err, tp;
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
> @@ -1931,7 +2008,7 @@ static int acer_platform_profile_setup(struct platform_device *device)
>  
>  		/* Set default non-turbo profile  */
>  		last_non_turbo_profile =
> -			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>  	}
>  	return 0;
>  }
> @@ -1946,12 +2023,10 @@ static int acer_thermal_profile_change(void)
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
> @@ -1962,54 +2037,52 @@ static int acer_thermal_profile_change(void)
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
