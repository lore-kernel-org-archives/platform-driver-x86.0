Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D9B332916;
	Mon,  2 Mar 2026 11:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452366; cv=none; b=qPGOjuBbP7KSJopHpNdCpgwtzWP+yWKcDIa7sgzVU2+owS0j9dbTGyWR681qTRtcUUsCtlLhHtkJ7bfm8Aezan9tpeMDjWrWVqCT2u2GAZ1a2zOJhymbyT+MlyER3O+88jcGL2CQCNrf8jw/xmrSj4gHTPedIJYQrBYHM/i2ziY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452366; c=relaxed/simple;
	bh=7FfBpJE2OxCpbDZMhOQ+eKZWwI6u/upXCCTUdTWg9Gw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EfzXVyvQvuPIFN19eCuEMoVyYhHDyv67Sftv86msA5er9nh9Cxdlg+TZQ4kVO3GHN2nCJ4ad0k0GHhEud+r67fxufcMdvHAxmaokKTTy1cXcEzqXA2KIsmP6O1SeCir/AI/zKK+kg/PBNxxhUDPBp6YJQFNdcQlSt+qMYA1CClY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtzIGLYK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtzIGLYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772452364; x=1803988364;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7FfBpJE2OxCpbDZMhOQ+eKZWwI6u/upXCCTUdTWg9Gw=;
  b=NtzIGLYKUCWPtDhLXLcowlV0C5oxazICtEBssM4MWYo0N0JCTsKku4xt
   JcKR5ZD7v3G465IPvqoAP9/IEKpeQGDIUVg0+kBo+pbqAgsD3FwqPOfnW
   TLe2BHRv0wfsjJkNOk+m1NPr2sSjftJJ64ASHW0a6RzkWYQugH+NpNc9U
   2SNLa6gXxi/WwbfCt+QtXsya0TTasV6VBs4/Vl0oN6S7axvbxEZ+3XnXD
   Kzso+IW0V89jufDw/ykivhA2l2P8GzCdcAi1CHmqRRM6vT2FVGgfwSn9V
   nxxtZilXuks7Bmfu2KeigyOQa1v2phW4L1hIGhhbJSRCmihbf3uHysulb
   g==;
X-CSE-ConnectionGUID: 5lXMHTfvRvKICxEs0FeXOw==
X-CSE-MsgGUID: R5zg5zD4Tp6Mp0G5L4jFXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73642278"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73642278"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 03:52:43 -0800
X-CSE-ConnectionGUID: f3z/v08BRcu0hlEOO4qTcg==
X-CSE-MsgGUID: f3ZgVUT9Qa2MWSFE1JpRzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="222605786"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 03:52:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 2 Mar 2026 13:52:38 +0200 (EET)
To: Yauhen Kharuzhy <jekhor@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] platform: x86-android-tablets: lenovo: Add Yoga
 Book haptics entries
In-Reply-To: <20260302-x86-tablets-yogabook-v2-1-061768d5c9e7@gmail.com>
Message-ID: <33d45e2e-f319-65ae-a05a-279d72411979@linux.intel.com>
References: <20260302-x86-tablets-yogabook-v2-0-061768d5c9e7@gmail.com> <20260302-x86-tablets-yogabook-v2-1-061768d5c9e7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Mar 2026, Yauhen Kharuzhy wrote:

> Add drv2604l i2c_board_info for drv2604l haptics drivers present in
> Lenovo Yoga Book YB1-X90 and YB1-X91. Set properties required for device
> initialization and self-calibration.
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> ---
>  drivers/platform/x86/x86-android-tablets/lenovo.c | 92 +++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
> index 8d825e0b4661..bc10f00da8c6 100644
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
> @@ -283,9 +329,55 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
>  	},
>  };
>  
> +#define YB1_X91_DRV2604L_0_DEVICE "i2c-DRV2604:00"
> +#define YB1_X91_DRV2604L_1_DEVICE "i2c-DRV2604:01"
> +
> +static int __init lenovo_yb1_x91_init(struct device *dev)
> +{
> +	struct device *drv2604l_0_dev __free(put_device) = NULL;
> +	struct device *drv2604l_1_dev __free(put_device) = NULL;
> +	int ret = 0;
> +
> +	drv2604l_0_dev = bus_find_device_by_name(&i2c_bus_type, NULL,

Hi,

Please read the long comment at the beginning of include/linux/cleanup.h
(in particular the part where it talks about those varname = NULL 
constructs).

While the ordering is not a problem here as is, we don't want to use 
patterns that are dangerous in other situations.

-- 
 i.

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
> +		return ret;
> +	}
> +
> +	drv2604l_1_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
> +						 YB1_X91_DRV2604L_1_DEVICE);
> +	if (!drv2604l_1_dev) {
> +		pr_err("error: cannot find %s device\n",
> +		       YB1_X91_DRV2604L_1_DEVICE);
> +		return -ENODEV;
> +	}
> +
> +	ret = device_create_managed_software_node(drv2604l_1_dev,
> +					lenovo_yb1_x9x_drv2604l_1_props, NULL);
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

