Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8350F155757;
	Mon, 23 Feb 2026 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856792; cv=none; b=J/GqWQXPH6QiwPbNy6Ir3b9vtDJojzbGXG1t5d+eLpEpwbp1XMfjwBEHnPpsnhWdzwbxo2fQvQFGsmKgT17EoGcSH+9vzeSMWbzg2NGphMZuJbMzV64969/lVnvyADmPXUxAgCQT1J/T9hFZUSsZJIGR57f0gHLd8an9gTXp0No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856792; c=relaxed/simple;
	bh=THm2YjanHi/NW6jtN3MgnNNVAN3sGyyXJV+hKHS5Zws=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Zy3geaoAQl+lpce9XQMSk6hhaNpJi6FZlHa6lABm71d1tIyMqYwpAanp4RgXZ52ZAcySbLE4RsJjtd8cB+xMVCj1iA+2ExRFVrc8ty5HdHDR7UCPzhuj7s6202r/T2vf1Rud3VnUh5NfUKlXtRqKYwx9+L43v6I1FSuamoQW92A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUVy4hoU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUVy4hoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771856791; x=1803392791;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=THm2YjanHi/NW6jtN3MgnNNVAN3sGyyXJV+hKHS5Zws=;
  b=AUVy4hoUKG0ubHiNnUnjyjbuxnZRWYCqGzvnT7+nHc3yfkxkitoByQre
   a9JNuhmzZn9H3bIYObxJg581Ug+xxsQMaEqFuR9vGne0B2QGl8gIU5ht8
   Pz6OQ8xwYOHyqre8Gf6xyCp3bT7q3XViw8FgE97HHVYOEvZ6OT82BN99U
   eZbXG7mO3tGgyEO8t6rR953fn8MyBbkbFUxJUQfiMCWHWoNObDMnRr1gZ
   4pgVXT/r8IjcYx0epE276AkuucpMxdMs8BjikDsP/rrCGgN23ZYpQ+upk
   kQrnxSPd97Huf5Wumw48hGUts2AROu7JRpVpAbF1l7BKiurZShKN3fz6X
   Q==;
X-CSE-ConnectionGUID: ibbv+YRPQX2hhndI7ib4tQ==
X-CSE-MsgGUID: zAqzpee4T7C0eNM6tA6BbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76714386"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="76714386"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:26:30 -0800
X-CSE-ConnectionGUID: IPRjigWhSr2G/5m9tL9mYA==
X-CSE-MsgGUID: TUezAOJhS4mF30Pcew3qtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="213513516"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:26:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Feb 2026 16:26:25 +0200 (EET)
To: Yauhen Kharuzhy <jekhor@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] platform: x86-android-tablets: lenovo: Add Yoga
 Book haptics entries
In-Reply-To: <20260217233618.1324550-2-jekhor@gmail.com>
Message-ID: <181e4409-7bbf-e207-0c54-1f817c1c35ed@linux.intel.com>
References: <20260217233618.1324550-1-jekhor@gmail.com> <20260217233618.1324550-2-jekhor@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Feb 2026, Yauhen Kharuzhy wrote:

> Add drv2604l i2c_board_info for drv2604l haptics drivers present in
> Lenovo Yoga Book YB1-X90 and YB1-X91. Set properties required for device
> initialization and self-calibration.
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> ---
>  .../platform/x86/x86-android-tablets/lenovo.c | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
> index 8d825e0b4661..926a5e292c4f 100644
> --- a/drivers/platform/x86/x86-android-tablets/lenovo.c
> +++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
> @@ -114,6 +114,32 @@ static const struct software_node lenovo_yb1_x90_hideep_ts_node = {
>  	.properties = lenovo_yb1_x90_hideep_ts_props,
>  };
>  
> +static const struct property_entry lenovo_yb1_x9x_drv2604l_0_props[] = {
> +	PROPERTY_ENTRY_U32("vib-rated-mv", 1500),
> +	PROPERTY_ENTRY_U32("vib-overdrive-mv", 2100),
> +	PROPERTY_ENTRY_U32("mode", 0), /* LRA */
> +	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
> +	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[0], 79, GPIO_ACTIVE_HIGH),
> +	{}
> +};
> +
> +static const struct software_node lenovo_yb1_x9x_drv2604l_0_node = {
> +	.properties = lenovo_yb1_x9x_drv2604l_0_props,
> +};
> +
> +static const struct property_entry lenovo_yb1_x9x_drv2604l_1_props[] = {
> +	PROPERTY_ENTRY_U32("vib-rated-mv", 1500),
> +	PROPERTY_ENTRY_U32("vib-overdrive-mv", 2100),
> +	PROPERTY_ENTRY_U32("mode", 0), /* LRA */
> +	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
> +	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[1], 47, GPIO_ACTIVE_HIGH),
> +	{}
> +};
> +
> +static const struct software_node lenovo_yb1_x9x_drv2604l_1_node = {
> +	.properties = lenovo_yb1_x9x_drv2604l_1_props,
> +};
> +
>  static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
>  	{
>  		/* BQ27542 fuel-gauge */
> @@ -159,6 +185,24 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
>  			.polarity = ACPI_ACTIVE_LOW,
>  			.con_id = "wacom_irq",
>  		},
> +	}, {
> +		/* Keyboard haptics driver */
> +		.board_info = {
> +			.type = "drv2604l",
> +			.addr = 0x5a,
> +			.dev_name = "drv2604l.0",
> +			.swnode = &lenovo_yb1_x9x_drv2604l_0_node,
> +		},
> +		.adapter_path = "\\_SB_.PCI0.I2C1",
> +	}, {
> +		/* Keyboard haptics driver */
> +		.board_info = {
> +			.type = "drv2604l",
> +			.addr = 0x5a,
> +			.dev_name = "drv2604l.1",
> +			.swnode = &lenovo_yb1_x9x_drv2604l_1_node,
> +		},
> +		.adapter_path = "\\_SB_.PCI0.I2C4",
>  	}, {
>  		/* LP8557 Backlight controller */
>  		.board_info = {
> @@ -283,9 +327,61 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
>  	},
>  };
>  
> +#define YB1_X91_DRV2604L_0_DEVICE "i2c-DRV2604:00"
> +#define YB1_X91_DRV2604L_1_DEVICE "i2c-DRV2604:01"
> +
> +static int __init lenovo_yb1_x91_init(struct device *dev)
> +{
> +	struct device *drv2604l_0_dev = NULL, *drv2604l_1_dev = NULL;
> +	int ret = 0;
> +
> +	drv2604l_0_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
> +						 YB1_X91_DRV2604L_0_DEVICE);
> +	if (!drv2604l_0_dev) {
> +		pr_err("error: cannot find %s device\n",
> +		       YB1_X91_DRV2604L_0_DEVICE);
> +		return -ENODEV;
> +	}
> +
> +	ret = device_create_managed_software_node(drv2604l_0_dev,
> +					lenovo_yb1_x9x_drv2604l_0_props, NULL);
> +	if (ret) {
> +		pr_err("error: cannot create software node for %s: %d\n",
> +		       YB1_X91_DRV2604L_0_DEVICE, ret);
> +		goto put_drv2604l_0;
> +	}
> +
> +	drv2604l_1_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
> +						 YB1_X91_DRV2604L_1_DEVICE);
> +	if (!drv2604l_1_dev) {
> +		pr_err("error: cannot find %s device\n",
> +		       YB1_X91_DRV2604L_1_DEVICE);
> +		ret = -ENODEV;
> +		goto put_drv2604l_0;
> +	}
> +
> +	ret = device_create_managed_software_node(drv2604l_1_dev,
> +					lenovo_yb1_x9x_drv2604l_1_props, NULL);
> +	if (ret) {
> +		pr_err("error: cannot create software node for %s\n",
> +		       YB1_X91_DRV2604L_1_DEVICE);
> +		ret = -EINVAL;
> +		goto put_drv2604l_1;
> +	}
> +
> +put_drv2604l_0:
> +	put_device(drv2604l_0_dev);
> +put_drv2604l_1:
> +	put_device(drv2604l_1_dev);

This looks like a case that would benefit from using cleanup.h 
(__free(put_device)).

Remember to declare variables that use __free() mid-function as per the 
usage pattern in documented cleanup.h.

Please also make sure you have all necessary includes for using it (not 
through some obscure indirect include path).

-- 
 i.


> +
> +	return ret;
> +}
> +
>  const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
>  	.i2c_client_info = lenovo_yogabook_x91_i2c_clients,
>  	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x91_i2c_clients),
> +	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
> +	.init = lenovo_yb1_x91_init,
>  };
>  
>  /* Lenovo Yoga Tablet 2 1050F/L's Android factory image has everything hardcoded */
> 
