Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657B02F531B;
	Mon, 12 Oct 2026 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810180; cv=none; b=RV9DMfyyBuF/IHfFU0R712jHz5FetoCRTXuge+6VKMDQS//F2w3VtuZTGKHNVMHukptHVTdOw5Vpi+bb9eF9ryeb5Kpzes3eSd+UZEgM2LLWHpghNeZTCOtNU9Lr4Z5I+VYLpL2wM0DF/xhcVgBwK3JGDrhr+zDkv5toaDZxClM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810180; c=relaxed/simple;
	bh=gl7MgchN7a30cQeDjRJtWOfzFqIGAorDzCcADSPCZGU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Oym9XD+dswLSsbVqdjva4kCPqKjXmVcoDv4VOQQo1NstBx77SAyV7I7gpQR6JxtqmgtPQLe5a5hfSuEMC81tjKt/T1b3bEhmQ52L+1rBrpWPJIPOKfbtNewdAQlS1p6tdNcJcT5RP/5F7S9jPCMENx+11puGPcEXPmqRgEmQrdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRSe+r6o; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRSe+r6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791810177; x=1823346177;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gl7MgchN7a30cQeDjRJtWOfzFqIGAorDzCcADSPCZGU=;
  b=YRSe+r6oNNVSIvnNcb7YEd3peMxLJjV5oxEED5pLKSoJsgZCv55r3t5B
   rTZ/dkwKj9yEuVyeK5+yhSLvYOGfoh1eadIp84P3dfpE45rXZhdFIEyY1
   gC+Crgv4XEP6NN/7tQmMIQgmqzB+uKuindcmktMJQhobjlzLyV8e8DERi
   TrfCjbQ+5rxABR3979eP3G1d6soEc6YPJnyyYtqU0j5W6SdOS99eG7Ojq
   1ZwIFSZXUTdUuw0mFYfhu8oRK9/7D5S/NXRFcyI2aeasx2Bf9Q0Fy6uem
   fL9P/ug5gTUlpVlDXsNTNRda5AF0+SYszIsk9jxcjfzcb32r2AoOtj01W
   g==;
X-CSE-ConnectionGUID: O1zms5j4TDCT6yfftbPWlw==
X-CSE-MsgGUID: m/d3wPmTTuS+uYiqC3M9vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="522894"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="522894"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 06:02:56 -0700
X-CSE-ConnectionGUID: Uzp+3NRQS+yYnvhXJZ2d1A==
X-CSE-MsgGUID: xPkiRlDRRoes5z581jP1cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1217333"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 06:02:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Oct 2026 16:02:46 +0300 (EEST)
To: Mingyou Chen <qby140326@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, 
    Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>, 
    platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
    Armin Wolf <W_Armin@gmx.de>, LKML <linux-kernel@vger.kernel.org>, 
    Chris Taraszka <chris@miget.com>, 
    Matias Civadda <matias.civadda2342001@gmail.com>, 
    =?ISO-2022-JP?Q?=1B$B9b=1B=28J_=1B$B=3DSJ8=1B=28J?= <btx342@gmail.com>, 
    powerfullz <wleizc7319@gmail.com>, 
    =?GB2312?B?y+8g0/7D+g==?= <wolf109909@outlook.com>, 
    =?ISO-8859-15?Q?Milo=A8_Vlku?= <vlku.milos.fun@gmail.com>, 
    Rsplwe <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>, 
    Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>
Subject: Re: [PATCH v11 5/6] platform/x86: bitland-mifs-wmi: Add quirks
 table
In-Reply-To: <20261012100532.19612-6-qby140326@gmail.com>
Message-ID: <5f682ecd-6674-739a-14ab-372c191b220f@linux.intel.com>
References: <20261012100532.19612-1-qby140326@gmail.com> <20261012100532.19612-6-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Oct 2026, Mingyou Chen wrote:

> The MIFS WMI interface is shared by several Bitland ODM laptops which
> differ in the layout of the performance mode values of
> WMI_FN_SYSTEM_PER_MODE and in the capability checks.
> 
> Introduce a quirks table to support multiple machine families without
> sprinkling model checks over the driver.
> 
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>  drivers/platform/x86/bitland-mifs-wmi.c | 178 ++++++++++++++++--------
>  1 file changed, 121 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index 93a519b96189..d61382ad4a0b 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -12,6 +12,7 @@
>  #include <linux/bits.h>
>  #include <linux/container_of.h>
>  #include <linux/dev_printk.h>
> +#include <linux/dmi.h>
>  #include <linux/device.h>
>  #include <linux/device/devres.h>
>  #include <linux/err.h>
> @@ -84,6 +85,41 @@ enum bitland_mifs_power_profile {
>  	WMI_PP_FULL_SPEED	= 3,
>  };
>  
> +struct bitland_mifs_wmi_data;
> +
> +struct bitland_profile_entry {
> +	enum platform_profile_option profile;
> +	u8 wmi_val;
> +	bool no_set;
> +};
> +
> +struct bitland_mifs_quirks {
> +	const struct bitland_profile_entry *profile_entries;
> +	size_t num_profile_entries;
> +
> +	bool return_code_at_end;
> +	bool skip_ac_type_check;
> +
> +	/* Accept return value 0 on SET wmi functions */
> +	bool accept_zero_function;
> +};
> +
> +static const struct bitland_profile_entry default_profile_entries[] = {
> +	{ PLATFORM_PROFILE_LOW_POWER,            WMI_PP_QUIET },
> +	{ PLATFORM_PROFILE_BALANCED,             WMI_PP_BALANCED },
> +	{ PLATFORM_PROFILE_BALANCED_PERFORMANCE, WMI_PP_PERFORMANCE },
> +	{ PLATFORM_PROFILE_PERFORMANCE,          WMI_PP_FULL_SPEED },
> +};
> +
> +static const struct bitland_mifs_quirks default_quirks = {
> +	.profile_entries = default_profile_entries,
> +	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
> +};
> +
> +static const struct dmi_system_id bitland_mifs_dmi_table[] = {
> +	{}
> +};
> +
>  enum bitland_mifs_event_id {
>  	WMI_EVENT_SWITCHVIDEOMODE	= 1,
>  	WMI_EVENT_SELECTIVE_SCREENSHOT	= 2,
> @@ -131,12 +167,24 @@ struct bitland_mifs_input {
>  	u8 payload[28];
>  } __packed;
>  
> -struct bitland_mifs_output {
> +struct bitland_mifs_output_head_rc {
>  	__le16 return_code;
>  	__le16 function;
>  	u8 data[28];
>  } __packed;
>  
> +struct bitland_mifs_output_tail_rc {
> +	__le16 function;
> +	u8 data[28];
> +	__le16 return_code;
> +} __packed;
> +
> +union bitland_mifs_output_buf {
> +	struct bitland_mifs_output_head_rc head;
> +	struct bitland_mifs_output_tail_rc tail;
> +	u8 raw[32];
> +};
> +
>  struct bitland_mifs_event {
>  	u8 event_type;
>  	u8 event_id;
> @@ -166,27 +214,41 @@ struct bitland_mifs_wmi_data {
>  	struct input_dev *input_dev;
>  	struct device *hwmon_dev;
>  	struct device *pp_dev;
> +	const struct bitland_mifs_quirks *quirks;
>  	enum platform_profile_option saved_profile;
>  };
>  
>  static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
>  				 const struct bitland_mifs_input *input,
> -				 struct bitland_mifs_output *output)
> +				 struct bitland_mifs_output_head_rc *output)
>  {
>  	struct wmi_buffer in_buf = { .length = sizeof(*input), .data = (void *)input };
>  	struct wmi_buffer out_buf = { 0 };
> +	const u8 *payload_data;
> +	__le16 return_code;
> +	__le16 function;
>  	int ret;
>  
>  	guard(mutex)(&data->lock);
>  
>  	ret = wmidev_invoke_method(data->wdev, 0, 1, &in_buf, &out_buf,
> -				   sizeof(struct bitland_mifs_output));
> +				   sizeof(union bitland_mifs_output_buf));
>  	if (ret)
>  		return ret;
>  
> -	struct bitland_mifs_output *result __free(kfree) = out_buf.data;
> +	union bitland_mifs_output_buf *result __free(kfree) = out_buf.data;
>  
> -	switch (le16_to_cpu(result->return_code)) {
> +	if (data->quirks->return_code_at_end) {
> +		return_code = result->tail.return_code;
> +		function = result->tail.function;
> +		payload_data = result->tail.data;
> +	} else {
> +		return_code = result->head.return_code;
> +		function = result->head.function;
> +		payload_data = result->head.data;
> +	}
> +
> +	switch (le16_to_cpu(return_code)) {
>  	case WMI_RETURN_CODE_SUCCESS:
>  		break;
>  	case WMI_RETURN_CODE_UNKNOWN_FUNCTION:
> @@ -195,11 +257,16 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
>  		return -EIO;
>  	}
>  
> -	if (result->function != input->function)
> -		return -ENOMSG;
> +	if (function != input->function) {
> +		if (!(data->quirks->accept_zero_function && function == 0))
> +			return -ENOMSG;
> +	}
>  
> -	if (output)
> +	if (output) {
> +		output->return_code = return_code;
> +		output->function = function;
>  		memcpy(output, result, sizeof(*output));

sashiko mentions you're overwriting the just assigned values.

It's probably worth taking a look at the other comments from sashiko as 
well.

> +	}
>  
>  	return 0;
>  }
> @@ -208,45 +275,41 @@ static int laptop_profile_get(struct device *dev,
>  			      enum platform_profile_option *profile)
>  {
>  	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	const struct bitland_mifs_quirks *quirks = data->quirks;
>  	struct bitland_mifs_input input = {
>  		.operation = cpu_to_le16(WMI_METHOD_GET),
>  		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
>  	};
> -	struct bitland_mifs_output result;
> +	struct bitland_mifs_output_head_rc result;
> +	size_t i;
>  	int ret;
>  
>  	ret = bitland_mifs_wmi_call(data, &input, &result);
>  	if (ret)
>  		return ret;
>  
> -	switch (result.data[0]) {
> -	case WMI_PP_BALANCED:
> -		*profile = PLATFORM_PROFILE_BALANCED;
> -		break;
> -	case WMI_PP_PERFORMANCE:
> -		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> -		break;
> -	case WMI_PP_QUIET:
> -		*profile = PLATFORM_PROFILE_LOW_POWER;
> -		break;
> -	case WMI_PP_FULL_SPEED:
> -		*profile = PLATFORM_PROFILE_PERFORMANCE;
> -		break;
> -	default:
> -		return -EINVAL;
> +	for (i = 0; i < quirks->num_profile_entries; i++) {
> +		if (quirks->profile_entries[i].wmi_val == result.data[0]) {
> +			*profile = quirks->profile_entries[i].profile;
> +			return 0;
> +		}
>  	}
> -	return 0;
> +
> +	return -EINVAL;
>  }
>  
> -static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *data)
> +static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data)
>  {
>  	struct bitland_mifs_input input = {
>  		.operation = cpu_to_le16(WMI_METHOD_GET),
>  		.function = cpu_to_le16(WMI_FN_SYSTEM_AC_TYPE),
>  	};
> -	struct bitland_mifs_output output;
> +	struct bitland_mifs_output_head_rc output;
>  	int ret;
>  
> +	if (data->quirks->skip_ac_type_check)
> +		return power_supply_is_system_supplied() > 0 ? 0 : -EOPNOTSUPP;
> +
>  	/* Full-speed/performance mode requires DC power (not USB-C) */
>  	if (!power_supply_is_system_supplied())
>  		return -EOPNOTSUPP;
> @@ -269,47 +332,42 @@ static int laptop_profile_set(struct device *dev,
>  			      enum platform_profile_option profile)
>  {
>  	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	const struct bitland_mifs_quirks *quirks = data->quirks;
>  	struct bitland_mifs_input input = {
>  		.operation = cpu_to_le16(WMI_METHOD_SET),
>  		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
>  	};
> +	size_t i;
>  	int ret;
> -	u8 val;
>  
> -	switch (profile) {
> -	case PLATFORM_PROFILE_LOW_POWER:
> -		val = WMI_PP_QUIET;
> -		break;
> -	case PLATFORM_PROFILE_BALANCED:
> -		val = WMI_PP_BALANCED;
> -		break;
> -	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> -		ret = bitland_check_performance_capability(data);
> -		if (ret)
> -			return ret;
> -		val = WMI_PP_PERFORMANCE;
> -		break;
> -	case PLATFORM_PROFILE_PERFORMANCE:
> -		ret = bitland_check_performance_capability(data);
> +	if (profile == PLATFORM_PROFILE_PERFORMANCE ||
> +	    profile == PLATFORM_PROFILE_BALANCED_PERFORMANCE) {
> +		ret = bitland_pp_check_capability(data);
>  		if (ret)
>  			return ret;
> -		val = WMI_PP_FULL_SPEED;
> -		break;
> -	default:
> -		return -EOPNOTSUPP;
>  	}
>  
> -	input.payload[0] = val;
> +	for (i = 0; i < quirks->num_profile_entries; i++) {
> +		if (quirks->profile_entries[i].profile == profile &&
> +		    !quirks->profile_entries[i].no_set) {
> +			input.payload[0] = quirks->profile_entries[i].wmi_val;
> +			return bitland_mifs_wmi_call(data, &input, NULL);
> +		}
> +	}
>  
> -	return bitland_mifs_wmi_call(data, &input, NULL);
> +	return -EOPNOTSUPP;
>  }
>  
>  static int platform_profile_probe(void *drvdata, unsigned long *choices)
>  {
> -	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> -	set_bit(PLATFORM_PROFILE_BALANCED, choices);
> -	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> -	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +	struct bitland_mifs_wmi_data *data = drvdata;
> +	const struct bitland_mifs_quirks *quirks = data->quirks;
> +	size_t i;
> +
> +	for (i = 0; i < quirks->num_profile_entries; i++) {
> +		if (!quirks->profile_entries[i].no_set)
> +			set_bit(quirks->profile_entries[i].profile, choices);
> +	}
>  
>  	return 0;
>  }
> @@ -366,7 +424,7 @@ static int laptop_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  	struct bitland_mifs_input input = {
>  		.operation = cpu_to_le16(WMI_METHOD_GET),
>  	};
> -	struct bitland_mifs_output res;
> +	struct bitland_mifs_output_head_rc res;
>  	int ret;
>  
>  	switch (type) {
> @@ -455,7 +513,7 @@ static enum led_brightness laptop_kbd_led_get(struct led_classdev *led_cdev)
>  		.operation = cpu_to_le16(WMI_METHOD_GET),
>  		.function = cpu_to_le16(WMI_FN_RGB_KB_BRIGHTNESS),
>  	};
> -	struct bitland_mifs_output res;
> +	struct bitland_mifs_output_head_rc res;
>  	int ret;
>  
>  	ret = bitland_mifs_wmi_call(data, &input, &res);
> @@ -480,7 +538,7 @@ static ssize_t gpu_mode_show(struct device *dev, struct device_attribute *attr,
>  		.operation = cpu_to_le16(WMI_METHOD_GET),
>  		.function = cpu_to_le16(WMI_FN_GPU_MODE),
>  	};
> -	struct bitland_mifs_output res;
> +	struct bitland_mifs_output_head_rc res;
>  	u8 mode_val;
>  	int ret;
>  
> @@ -534,7 +592,7 @@ static ssize_t kb_mode_show(struct device *dev, struct device_attribute *attr,
>  		.operation = cpu_to_le16(WMI_METHOD_GET),
>  		.function = cpu_to_le16(WMI_FN_RGB_KB_MODE),
>  	};
> -	struct bitland_mifs_output res;
> +	struct bitland_mifs_output_head_rc res;
>  	u8 mode_val;
>  	int ret;
>  
> @@ -718,6 +776,7 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
>  		.default_label = ":" LED_FUNCTION_KBD_BACKLIGHT,
>  		.devname_mandatory = true,
>  	};
> +	const struct dmi_system_id *dmi_id;
>  	int ret;
>  
>  	drv_data = devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
> @@ -732,6 +791,11 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
>  
>  	dev_set_drvdata(&wdev->dev, drv_data);
>  
> +	drv_data->quirks = &default_quirks;
> +	dmi_id = dmi_first_match(bitland_mifs_dmi_table);
> +	if (dmi_id)
> +		drv_data->quirks = dmi_id->driver_data;
> +
>  	if (dev_type == BITLAND_WMI_EVENT) {
>  		/* Register input device for hotkeys */
>  		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
> 

-- 
 i.

