Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164FD4E4304;
	Tue, 29 Sep 2026 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672542; cv=none; b=Kwq7s1/+TqFz4YVlMl7lUJXtLbOC8Jb7LsqwhlsHKpU85rDseJqIGKWvqvqEPNThznKH2UNN38+zuz/C7VuC7JpCH/x6lSYRS2roG/1IxmuwrAGr2HxGF9ozAVLKeDjCSDvh9OqnR9zPivIYxJ6Lkmk1arLtCswBof1g8yYWLxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672542; c=relaxed/simple;
	bh=IuNTPS/pgW79O2tFI9zTWhxQc6oNc4Pi9KFm6spx+is=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aL9pUKgUFsI2KYjRAYeLuk3Tjvqk2EJJELnqyEDdRYUWW0xm9Qb+GQVKtBkU3YkYGsvgHiPOPaeTdTLQkoIen/lB6Fu7rK6F0fE+grvV67xM7R8HovaM3rbz/ulV1Lvrm0hVpu5rmvqMHnN495xJVBKX9yiI22Te51C8+ly7IJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZFgPRPD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZFgPRPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790672535; x=1822208535;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IuNTPS/pgW79O2tFI9zTWhxQc6oNc4Pi9KFm6spx+is=;
  b=TZFgPRPDDcH5Q6NfcaVkE9dn902uF6tjRTyoxCIH4INPZ0UsdjZmLoO2
   vcI7dvWXTCe8bJyzl4FFd5hIRhD8HlBL+coDOxBZI7Bte7MlDnJXF5+uQ
   qkDGiLG/DZk+ihP2Jju7AcdaIsMWCf/hsSBAkyWDcuNNj/+zg/4GoSaXC
   fWcCYTG9a8KB4+KcxXLNT1G9zGMEhS+cp/6PHDEy71eMZIIo0vHrpo97N
   J6Iw4Cyt+olMQSc6OMAFxEYS9Kyye8gejEea2JbUEBPFeKEQoHsJnrvZ2
   VDQrQ1ptRZAdKvqmAIvCwVUZ3BiexyDxkZ455h9nz/h7/oMU2s3I+j9Jb
   g==;
X-CSE-ConnectionGUID: QC36Wf0OR2mPTfXkcoD93w==
X-CSE-MsgGUID: PGHHsMeSQ1u4hz7I3nY8Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="113171398"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="113171398"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 02:02:10 -0700
X-CSE-ConnectionGUID: yPXCpkEJSQufRszkNJwMTQ==
X-CSE-MsgGUID: MgGkyf9RTGuH5XB6II6UUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="313262758"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 02:02:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 29 Sep 2026 12:02:02 +0300 (EEST)
To: Mingyou Chen <qby140326@gmail.com>
cc: W_Armin@gmx.de, foxido@foxido.dev, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, nika@nikableh.moe, 
    platform-driver-x86@vger.kernel.org, vlku.milos.fun@gmail.com, 
    i@rsplwe.com, wolf109909@outlook.com, rahulbheda131313@gmail.com
Subject: Re: [PATCH v5 5/6] platform/x86: bitland-mifs-wmi: Add per-machine
 ops table
In-Reply-To: <20260816100813.300450-6-qby140326@gmail.com>
Message-ID: <17fbfcf4-c235-170b-c0ea-ad48b24e3eb9@linux.intel.com>
References: <20260816100813.300450-1-qby140326@gmail.com> <20260816100813.300450-6-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 16 Aug 2026, Mingyou Chen wrote:

> The MIFS WMI interface is shared by several Bitland ODM laptops which
> differ in the layout of the performance mode values of
> WMI_FN_SYSTEM_PER_MODE and in the capability checks.
> 
> Introduce a machine ops table to support multiple machine families
> without sprinkling model checks over the driver:
> 
> struct bitland_mifs_ops {
>         const char *name;
>         const struct bitland_profile_mode_map *mode_map;
>         int (*check_performance_capability)(
>                 struct bitland_mifs_wmi_data *data);
>         bool has_full_speed;
> };
> 
> The default ops instance keeps the current Bitland behavior, so this
> change is a pure refactor without any functional changes.
> 
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>  drivers/platform/x86/bitland-mifs-wmi.c | 89 +++++++++++++++++++------
>  1 file changed, 67 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index 81dad2b65f4f..17792d8b7c29 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -78,6 +78,46 @@ enum bitland_mifs_power_profile {
>  	WMI_PP_FULL_SPEED	= 3,
>  };
>  
> +struct bitland_mifs_wmi_data;
> +
> +/*
> + * Value layout of WMI_FN_SYSTEM_PER_MODE.
> + */
> +struct bitland_profile_mode_map {
> +	u8 balanced;
> +	u8 performance;
> +	u8 quiet;
> +	u8 full_speed;
> +};
> +
> +static const struct bitland_profile_mode_map bitland_mode_map = {
> +	.balanced	= WMI_PP_BALANCED,
> +	.performance	= WMI_PP_PERFORMANCE,
> +	.quiet		= WMI_PP_QUIET,
> +	.full_speed	= WMI_PP_FULL_SPEED,
> +};

Hi,

This approach seems not generic enough to cover all the variations (see 
the recent submissions).

I suggest you take a look at those patches once they get the next version 
of the generalized framework out and review it to make sure it abstract 
on the correct level so we don't have to immediately broaded the scope.

I'd prefer to get the redmi merge done separately from the generalization 
of the performance profiles. If the merge depends on the generalization 
(my impression is that it does because of the patch 6), we should try to 
finish that first and them do the merge on top of it.


Also, dropping redmi-wmi first and adding support back in a later change 
is not acceptable as it creates a black hole where an unlucky bisect 
could land to.

> +static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data);
> +
> +/*
> + * Machine-specific operations. The MIFS WMI interface is shared by
> + * several Bitland ODM laptops which differ in the layout of the
> + * performance mode values and in the capability checks.
> + */
> +struct bitland_mifs_ops {
> +	const char *name;
> +	const struct bitland_profile_mode_map *mode_map;
> +	int (*check_performance_capability)(struct bitland_mifs_wmi_data *data);
> +	bool has_full_speed;
> +};
> +
> +static const struct bitland_mifs_ops bitland_ops = {
> +	.name = "Bitland",
> +	.mode_map = &bitland_mode_map,
> +	.check_performance_capability = bitland_pp_check_capability,
> +	.has_full_speed = true,
> +};
> +
>  enum bitland_mifs_event_id {
>  	WMI_EVENT_RESERVED_1		= 1,
>  	WMI_EVENT_RESERVED_2		= 2,
> @@ -163,6 +203,7 @@ struct bitland_mifs_wmi_data {
>  	struct input_dev *input_dev;
>  	struct device *hwmon_dev;
>  	struct device *pp_dev;
> +	const struct bitland_mifs_ops *ops;
>  	enum platform_profile_option saved_profile;
>  };
>  
> @@ -193,6 +234,7 @@ static int laptop_profile_get(struct device *dev,
>  			      enum platform_profile_option *profile)
>  {
>  	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	const struct bitland_profile_mode_map *map = data->ops->mode_map;
>  	struct bitland_mifs_input input = {
>  		.reserved1 = 0,
>  		.operation = WMI_METHOD_GET,
> @@ -200,32 +242,29 @@ static int laptop_profile_get(struct device *dev,
>  		.function = WMI_FN_SYSTEM_PER_MODE,
>  	};
>  	struct bitland_mifs_output result;
> +	u8 mode;
>  	int ret;
>  
>  	ret = bitland_mifs_wmi_call(data, &input, &result);
>  	if (ret)
>  		return ret;
>  
> -	switch (result.data[0]) {
> -	case WMI_PP_BALANCED:
> +	mode = result.data[0];
> +	if (mode == map->quiet)
> +		*profile = PLATFORM_PROFILE_LOW_POWER;
> +	else if (mode == map->balanced)
>  		*profile = PLATFORM_PROFILE_BALANCED;
> -		break;
> -	case WMI_PP_PERFORMANCE:
> +	else if (mode == map->performance)
>  		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> -		break;
> -	case WMI_PP_QUIET:
> -		*profile = PLATFORM_PROFILE_LOW_POWER;
> -		break;
> -	case WMI_PP_FULL_SPEED:
> +	else if (mode == map->full_speed)
>  		*profile = PLATFORM_PROFILE_PERFORMANCE;
> -		break;
> -	default:
> +	else
>  		return -EINVAL;
> -	}
> +
>  	return 0;
>  }
>  
> -static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *data)
> +static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data)
>  {
>  	struct bitland_mifs_input input = {
>  		.operation = WMI_METHOD_GET,
> @@ -252,6 +291,7 @@ static int laptop_profile_set(struct device *dev,
>  			      enum platform_profile_option profile)
>  {
>  	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	const struct bitland_profile_mode_map *map = data->ops->mode_map;
>  	struct bitland_mifs_input input = {
>  		.reserved1 = 0,
>  		.operation = WMI_METHOD_SET,
> @@ -259,42 +299,46 @@ static int laptop_profile_set(struct device *dev,
>  		.function = WMI_FN_SYSTEM_PER_MODE,
>  	};
>  	int ret;
> -	u8 val;
> +	u8 mode;
>  
>  	switch (profile) {
>  	case PLATFORM_PROFILE_LOW_POWER:
> -		val = WMI_PP_QUIET;
> +		mode = map->quiet;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
> -		val = WMI_PP_BALANCED;
> +		mode = map->balanced;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> -		ret = bitland_check_performance_capability(data);
> +		ret = data->ops->check_performance_capability(data);
>  		if (ret)
>  			return ret;
> -		val = WMI_PP_PERFORMANCE;
> +		mode = map->performance;
>  		break;
>  	case PLATFORM_PROFILE_PERFORMANCE:
> -		ret = bitland_check_performance_capability(data);
> +		ret = data->ops->check_performance_capability(data);
>  		if (ret)
>  			return ret;
> -		val = WMI_PP_FULL_SPEED;
> +		mode = map->full_speed;
>  		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
>  
> -	input.payload[0] = val;
> +	input.payload[0] = mode;
>  
>  	return bitland_mifs_wmi_call(data, &input, NULL);
>  }
>  
>  static int platform_profile_probe(void *drvdata, unsigned long *choices)
>  {
> +	struct bitland_mifs_wmi_data *data = drvdata;
> +
>  	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
>  	set_bit(PLATFORM_PROFILE_BALANCED, choices);
>  	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> -	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +
> +	if (data->ops->has_full_speed)
> +		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>  
>  	return 0;
>  }
> @@ -717,6 +761,7 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
>  		return -ENOMEM;
>  
>  	drv_data->wdev = wdev;
> +	drv_data->ops = &bitland_ops;
>  
>  	ret = devm_mutex_init(&wdev->dev, &drv_data->lock);
>  	if (ret)
> 


--
 i.

