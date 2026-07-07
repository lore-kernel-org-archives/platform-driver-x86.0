Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B83C24B28;
	Tue,  7 Jul 2026 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430385; cv=none; b=uV+tA3bT0yDqfn/ci40eVhmQIVRptbVm4I8R54A7+jD8onFQ/koTPp4TNKJnedG4k3ddaLfFt9Kas31QvANa+SY3YizLoN3tvvOl0usW3bPj0O9mL6OtojEy5OTZEQgUxX/gydkGOPFhBB9haVr//6w0jGxT4aHEygDSzJ10gOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430385; c=relaxed/simple;
	bh=rG8HOhRDpL2Dg8Vgy+MitoBPewi/rMCZdJ9gWzEM/5g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BQHhgzvDxRK2092MZDy+7zdNTXedtSR/y0VHuYv0UcI3qM4HSBxaOFtsEM9gEsQQghnoNMPGpLx2Op1LeEuqEuGPANkSoj4PocUnjp2jVBJGGwxsocq+b0LF4iW5CxVJIVsXXOFRb+Uy9cvKCd6rpmtMkZh/xNuun514KgBLm7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mf4POVpD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mf4POVpD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783430383; x=1814966383;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rG8HOhRDpL2Dg8Vgy+MitoBPewi/rMCZdJ9gWzEM/5g=;
  b=Mf4POVpDuvsW90U+iAhjgB8/hbC/a+L3r3dj+/gZBJQVYfkBjT5GhGy7
   xAKpP+RpOCJ7sXm43B5kubiry5KfH4rl+bH1MXK/3V2oJ/2YNqUbkwv9W
   3ptlzZ8SO06M6oaFINmlgOgRslRuwuJjob3CZnnt+XipWko2bmkBf/jiT
   baSqxB2H5R/IyWY4Xg0BnDDX5xHKGkt0kWYJC2eFEo+oHmrSuYz+H+RDu
   96jkkAv/X/CSuovCgIfHZ2HpRaBYWnzd8fcFSn6SVKryInHXlo45GXRHc
   Cb2Tyv1Jc3z8Sl5B8sB+7DPWhrov8iCFunCR0kFVDaG8zMMNwzAcoYiJQ
   A==;
X-CSE-ConnectionGUID: jtRjW6niTPGH3xpCd4eNqg==
X-CSE-MsgGUID: juxzXI9MTFWNjKz1GT0AZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="87992077"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="87992077"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 06:19:42 -0700
X-CSE-ConnectionGUID: OJ8Cni+cRbaY7M0cBH//2Q==
X-CSE-MsgGUID: c1AYombASXG/XW+hwYfiWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="250638017"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 06:19:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 16:19:37 +0300 (EEST)
To: Yauhen Kharuzhy <jekhor@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] platform: x86-android-tablets: lenovo: Add Yoga
 Book haptics entries
In-Reply-To: <20260611-x86-tablets-yogabook-v3-1-de407672e4df@gmail.com>
Message-ID: <9e6dca23-4608-ae08-6490-81da01e966bf@linux.intel.com>
References: <20260611-x86-tablets-yogabook-v3-0-de407672e4df@gmail.com> <20260611-x86-tablets-yogabook-v3-1-de407672e4df@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 11 Jun 2026, Yauhen Kharuzhy wrote:

> Add drv2604l i2c_board_info for drv2604l haptics drivers present in
> Lenovo Yoga Book YB1-X90 and YB1-X91. Set properties required for device
> initialization and self-calibration.
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> ---
>  drivers/platform/x86/x86-android-tablets/lenovo.c | 94 +++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
> index 8d825e0b4661..81453217fec5 100644
> --- a/drivers/platform/x86/x86-android-tablets/lenovo.c
> +++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
> @@ -10,6 +10,8 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
>  #include <linux/efi.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/gpio/property.h>
> @@ -114,6 +116,32 @@ static const struct software_node lenovo_yb1_x90_hideep_ts_node = {
>  	.properties = lenovo_yb1_x90_hideep_ts_props,
>  };
>  
> +static const struct property_entry lenovo_yb1_x9x_drv2604l_0_props[] = {
> +	PROPERTY_ENTRY_U32("vib-rated-mv", 1500),
> +	PROPERTY_ENTRY_U32("vib-overdrive-mv", 2100),
> +	PROPERTY_ENTRY_U32("mode", 0), /* LRA */
> +	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */

Please align the comments. If there's enough space to add one tab to the 
second line, please add that as well so these comments don't mix with the
code.

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

Ditto.

-- 
 i.

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
> @@ -159,6 +187,24 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
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
> @@ -283,9 +329,57 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
>  	},
>  };
>  
> +#define YB1_X91_DRV2604L_0_DEVICE "i2c-DRV2604:00"
> +#define YB1_X91_DRV2604L_1_DEVICE "i2c-DRV2604:01"
> +
> +static int __init lenovo_yb1_x91_init(struct device *dev)
> +{
> +	int ret = 0;
> +
> +	struct device *drv2604l_0_dev __free(put_device) =
> +		bus_find_device_by_name(&i2c_bus_type, NULL,
> +					YB1_X91_DRV2604L_0_DEVICE);
> +	if (!drv2604l_0_dev) {
> +		pr_err("error: cannot find %s device\n",
> +		       YB1_X91_DRV2604L_0_DEVICE);
> +		return -ENODEV;
> +	}
> +
> +	ret = device_create_managed_software_node(drv2604l_0_dev,
> +						  lenovo_yb1_x9x_drv2604l_0_props,
> +						  NULL);
> +	if (ret) {
> +		pr_err("error: cannot create software node for %s: %d\n",
> +		       YB1_X91_DRV2604L_0_DEVICE, ret);
> +		return ret;
> +	}
> +
> +	struct device *drv2604l_1_dev __free(put_device) =
> +		bus_find_device_by_name(&i2c_bus_type, NULL,
> +					YB1_X91_DRV2604L_1_DEVICE);
> +	if (!drv2604l_1_dev) {
> +		pr_err("error: cannot find %s device\n",
> +		       YB1_X91_DRV2604L_1_DEVICE);
> +		return -ENODEV;
> +	}
> +
> +	ret = device_create_managed_software_node(drv2604l_1_dev,
> +						  lenovo_yb1_x9x_drv2604l_1_props,
> +						  NULL);
> +	if (ret) {
> +		pr_err("error: cannot create software node for %s\n",
> +		       YB1_X91_DRV2604L_1_DEVICE);
> +		return ret;
> +	}
> +
> +	return 0;
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
> 
