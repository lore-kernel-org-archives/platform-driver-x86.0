Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93D6944E;
	Tue, 31 Dec 2024 17:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735667332; cv=none; b=Vd4B18cXMCQFcEje74IkJTLdA+XSmVIbZ+wZhyvbgAEPtWpcmb7stVTKrERYLUinD1moZ7dgi8Hq1ZJrJhykrrwExs+lx1MwOxHqT+JA6TJ0wHCZTHIObXAPwuwk/iQYjVFf8DaqFVLlNrQHJTePhZ9uVz1Oi8ftbpsBEImYaag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735667332; c=relaxed/simple;
	bh=dJHPbqrbltKId396g4yMl7m4LmeBuTEl8Uag4ifAWNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqLsaXFm7kwZjVnyV/1ZSqd6fZ/9Zns/1fvZ4WF7u/CRIZvL/vOqx0FPf+BxSGzdazC3MkxX0B6i3vAVdJK4wU1B5IVVQoW6vaOEPqbVCf3wCSr/KbY2N5KoBGPJndpmbOILB73c/Q2MLHocctbokm9h2l5WT3dliI9+qU56JYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dohk/3mo; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dohk/3mo"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5160f1870f3so3175420e0c.0;
        Tue, 31 Dec 2024 09:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735667330; x=1736272130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wlBqNszYpdKELwaC0Vv79YHlvoHzuw/yZIGsVomRwmY=;
        b=dohk/3mohFTusAvmWMkRm2DlBx9HQWjQwJy8ihSq3TU//FXhUA5E4z/70hQ30D0skQ
         78o+YstufVM1o6YiAj+CHrQhFG7e9RAtJihD1DGc+Fa1GYmS3nkTfurxyCq7BifI+My+
         cFVnu96Nzj+LTPgnglZ150PvBJ6Swv+vb7sFmpulNKxV8lv5m8iwrQGz8MnIQeweh9WL
         zCVO1ONXLd+yrzC1YKMgSfxiOEEThnlZ+yo8xwL+kSdGuGvfP1ncf5tTGL8sSc861VUW
         dPfuZbIBnzC+3NQfbmrcQ9jyAhQMVSiNqv1RtxAznnILaFKIyGRGwAh6iC248hXR1sOh
         wZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735667330; x=1736272130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlBqNszYpdKELwaC0Vv79YHlvoHzuw/yZIGsVomRwmY=;
        b=E4pr+9QXU6lgv4g2bxTvDlGTOVa89sP712roYzwutEnTz5eto0iqPl9tQ3Sx2wXtCV
         xlLXrwphi0DG0JuJIf8sRURoxHu5GU9BV/yasLvg5Ong24QP6CRgEaM4OghA3pRCI/RD
         b3pQmip/BfLutd8ctM/vJ01KWTwEva5K1h5P5U5zeFfAhcQEMju2xFGqrRLrnjHPgJZf
         Z0pwGNn01MoRKY22kPc+y8//ulYwkXfY5nVutDhE+iYGZJBqi/900Q+fsoazB6bsUAm4
         kBRFwXWpLnZ1trle/EAbWmZDLT87CYUakIRHQMp8R0ur3t9VaqhuKDYaIq8Pf2qwdGjc
         Jo/g==
X-Forwarded-Encrypted: i=1; AJvYcCVMYfit2lwXmbGZAqQ/x8RGzGVu5D1od5AROFejZEHWUPDhm3AjaUXKrfuk3u+9+RJ27tQMuoQHfJBsvqk=@vger.kernel.org, AJvYcCX01VbSbsnlcHh/IjrpntcW4HGp6qY0FVJv4sh1x0CIaLdgEEzaRi+DIeRIm18IGYrv9Pxvz384Ns7yD8S7izLFRvThQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz+JIiGx+QLcwE9qBSyHEk8Iw79ERouyrzsO+/ZgOflH9brrMG
	+by/gcbn8nCdbL8GY1I3k8N6AVnW77nm49cCmSsy3V3k01VCKxqrrjwB7w==
X-Gm-Gg: ASbGncuUqF0NzEQaulY4x8aYiGvssxfXIcJxtdUj8GbIee2OxOK311ZgW9ej8JsjfBp
	Q3ogVtCOd/tLSxcjv+jStHmCcbNKBPodkM01qv5ny27ApGBMcnBQMYU732F2hzndBrhQE5UVAa4
	MbcB4oy+Cl8iwyO2Z0KOeEBtM1Qm5uZ9cl8/tA6h2Te/OQ5FB9I6rSa0rzOF4kD4Zda2eEKOzjE
	1BUoGCa9Uu3DAfxbPwbhygNPw32v50lHUjgv7DttNIqA6o9VlmCcQ==
X-Google-Smtp-Source: AGHT+IHJPC8KogOlb+Om8LeTAZOMasV1SdX76eto6r9UwmheCDWALjdIYhngjCfcTdwxj731ukQrMw==
X-Received: by 2002:a1f:4e45:0:b0:51b:8949:c97d with SMTP id 71dfb90a1353d-51b8949c9eemr20257674e0c.8.1735667329527;
        Tue, 31 Dec 2024 09:48:49 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68be78dbsm2649514e0c.23.2024.12.31.09.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 09:48:48 -0800 (PST)
Date: Tue, 31 Dec 2024 12:48:45 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] platform/x86: acer-wmi: improve platform profile handling
Message-ID: <nginerpifu7tkjsg2ffl3qkexttiqcgbmexpijmatv5frras5j@cv5vec5ekisi>
References: <20241231140442.10076-1-hridesh699@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231140442.10076-1-hridesh699@gmail.com>

On Tue, Dec 31, 2024 at 07:34:41PM +0530, Hridesh MG wrote:
> Two improvements to the platform profile handling for laptops using
> the Acer Predator interface -
> 
> 1) Use WMI calls to fetch the current platform profile instead of
>    directly accessing it from the EC since the EC address differs for
>    certain laptops.
> 2) Use the supported profiles bitmap to dynamically set
>    platform_profile_choices.
> 
> Link: https://lore.kernel.org/platform-driver-x86/d7be714c-3103-42ee-ad15-223a3fe67f80@gmx.de/
> Co-developed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> ---
> This patch has been tested on an acer nitro AN515-58 laptop, it would be
> good if someone with a predator laptop could also test it
> ---
>  drivers/platform/x86/acer-wmi.c | 220 ++++++++++++++++++++++----------
>  1 file changed, 154 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index b3043d78a7b3..37f629b6e3d3 100644
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
> +	ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES	= 0x000A,
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
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO = 0x06,
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO = 0x05,
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE = 0x04,
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED = 0x01,
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET = 0x00,

I forgot to say, these should also be aligned.

~ Kurt

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
> @@ -1904,6 +1984,7 @@ static int acer_platform_profile_setup(struct platform_device *device)
>  {
>  	if (quirks->predator_v4) {
>  		int err;
> +		u8 supported_profiles;
>  
>  		platform_profile_handler.name = "acer-wmi";
>  		platform_profile_handler.dev = &device->dev;
> @@ -1912,16 +1993,27 @@ static int acer_platform_profile_setup(struct platform_device *device)
>  		platform_profile_handler.profile_set =
>  			acer_predator_v4_platform_profile_set;
>  
> -		set_bit(PLATFORM_PROFILE_PERFORMANCE,
> -			platform_profile_handler.choices);
> -		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> -			platform_profile_handler.choices);
> -		set_bit(PLATFORM_PROFILE_BALANCED,
> -			platform_profile_handler.choices);
> -		set_bit(PLATFORM_PROFILE_QUIET,
> -			platform_profile_handler.choices);
> -		set_bit(PLATFORM_PROFILE_LOW_POWER,
> -			platform_profile_handler.choices);
> +		err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES,
> +						   &supported_profiles);
> +		if (err)
> +			return err;
> +
> +		if (supported_profiles & 1 << 0)
> +			set_bit(PLATFORM_PROFILE_QUIET,
> +				platform_profile_handler.choices);
> +		if (supported_profiles & 1 << 1)
> +			set_bit(PLATFORM_PROFILE_BALANCED,
> +				platform_profile_handler.choices);
> +		if (supported_profiles & 1 << 4)
> +			set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> +				platform_profile_handler.choices);
> +		if (supported_profiles & 1 << 5)
> +			set_bit(PLATFORM_PROFILE_PERFORMANCE,
> +				platform_profile_handler.choices);
> +		if (supported_profiles & 1 << 6)
> +			set_bit(PLATFORM_PROFILE_LOW_POWER,
> +				platform_profile_handler.choices);
> +
>  
>  		err = platform_profile_register(&platform_profile_handler);
>  		if (err)
> @@ -1931,7 +2023,7 @@ static int acer_platform_profile_setup(struct platform_device *device)
>  
>  		/* Set default non-turbo profile  */
>  		last_non_turbo_profile =
> -			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>  	}
>  	return 0;
>  }
> @@ -1946,12 +2038,10 @@ static int acer_thermal_profile_change(void)
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
> @@ -1962,54 +2052,52 @@ static int acer_thermal_profile_change(void)
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
