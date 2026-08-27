Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C3C360EFC;
	Thu, 27 Aug 2026 20:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862951; cv=none; b=V9UwlNfZtJ0jGXoWmWU3hIONsDtDRFCVUiFz8fWLCwMDhA9heGilEbiwCS4bEt7Mls7RZPmtChC2eB6xt43roWkXAcBKE0OnFXuj8sma0MOhucPvG3eXr+zPDceiNdRBJj/gpNY4BAniSAHDWdAWDeYCAAt9/WA6NumaCxRyY6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862951; c=relaxed/simple;
	bh=PxQCY1jfbF8EOAuJZqRKxtm3dvxwia6O/a/ZZ9DApj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hi2DDhVFIYUuPYejd8MhLRdpJRZNOOWNyEi4U4t8/Cd0CO59ZCkk2206sXMU+9E0U2UDBdSKxTSwZegRWk2D5jekbuXzL6HE3HVttwcgnKZbxYDlo5VqW4PMaVFPplg4vDmB68uJOPh2aPpKuFRcCj2rZut2NzM6b8xthjOiFRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSa60bDg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSa60bDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787862947; x=1819398947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PxQCY1jfbF8EOAuJZqRKxtm3dvxwia6O/a/ZZ9DApj0=;
  b=hSa60bDgyhYXXLLbHEP8hpiBpuOVkYQ5T59kaN1v4513kGe2g5ejqnZw
   kBwAnDwP0QwOb0ETDCuc+4+byq5ei1ghyogSg+kj+CPF/iCZW1RmwWXTA
   ZOGhnTmcx59vA9yAdGccX/PzDnqdrvK3RLgvFeZyhExV2gq2vPnkzQXOm
   xQQyWlYKhCLm3zpbniALgChbELvppjhYzLBaklzhJ/y/I8Cc+pN7GdBg3
   OM37nQxAlT2UBV+30MYymm9BbgCrP3tNbRuBOKeOX8CZvQOTHJ+FEIjCM
   n+bZas6RlzY7m4UL/4GWW5gmR5fDSE20w31x7O/l3/VRJFdvkUF/ULgbA
   w==;
X-CSE-ConnectionGUID: S9Ye/XdnQdKEyx5OPemQzw==
X-CSE-MsgGUID: gOgd5ppfQTO50Mx46gqWwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88248928"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88248928"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:35:44 -0700
X-CSE-ConnectionGUID: LuCavyYhReqzqLj8SdY7cA==
X-CSE-MsgGUID: N+PM9AHaSem5Dc2Ha0IxcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="273230951"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:35:41 -0700
Date: Thu, 27 Aug 2026 23:35:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v9 3/6] platform/x86: int3472: tps68470: fix clock
 consumer registration for Dell Latitude 5285
Message-ID: <apCfmoIBKLhjexav@ashevche-desk.local>
References: <20260827201611.99825-1-tchatard@gmail.com>
 <20260827201611.99825-4-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827201611.99825-4-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 10:16:08PM +0200, Thierry Chatard wrote:
> The BIOS on the Dell Latitude 5285 leaves GNVS field C0TP at zero.
> With C0TP=0 the ACPI _DEP method on INT3479 (OV5670, front camera)
> resolves to PCI0 instead of the INT3472 (TPS68470 PMIC) device.
> 
> Because for_each_acpi_consumer_dev() walks the _DEP reverse-mapping,
> INT3479 is invisible to it: the clock consumer lookup entry for the
> front camera is never registered with the tps68470-clk driver, and the
> OV5670 sensor driver cannot acquire its MCLK.
> 
> Add optional static clock consumer fields to the board data so probe can
> register the consumers directly, bypassing the broken _DEP traversal.
> Platforms that do not set these fields keep using the existing ACPI
> traversal path unchanged.

Are your patches assisted by AI?

...

>  static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  {
> -	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> +	struct device *dev = &client->dev;

> +	struct acpi_device *adev = ACPI_COMPANION(dev);

Split the assignment at the same time...

>  	const struct int3472_tps68470_board_data *board_data;
>  	struct tps68470_clk_platform_data *clk_pdata;
> +	struct gpiod_lookup_table * const *tables;
>  	struct mfd_cell *cells;
>  	struct regmap *regmap;
>  	int n_consumers;

...and put it here.

>  	if (!adev)
>  		return -ENODEV;

> +	board_data = int3472_tps68470_get_board_data(dev_name(dev));
> +	if (!board_data)
> +		return dev_err_probe(dev, -ENODATA,
> +				     "No board-data found for this model\n");
> +
> +	if (board_data->n_clk_consumers) {
> +		clk_pdata = devm_kzalloc(dev,
> +					 struct_size(clk_pdata, consumers,
> +						     board_data->n_clk_consumers),
> +					 GFP_KERNEL);
> +		if (!clk_pdata)
> +			return -ENOMEM;
> +		clk_pdata->n_consumers = board_data->n_clk_consumers;
> +		for (i = 0; i < board_data->n_clk_consumers; i++)
> +			clk_pdata->consumers[i] = board_data->clk_consumers[i];
> +		n_consumers = board_data->n_clk_consumers;
> +	} else {
> +		n_consumers = skl_int3472_fill_clk_pdata(dev, &clk_pdata);
> +		if (n_consumers < 0)
> +			return n_consumers;
> +	}
> +
> +	cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
> +	if (!cells)
> +		return -ENOMEM;
> +
> +	/*
> +	 * The order of the cells matters here! The clk must be first
> +	 * because the regulator depends on it. The gpios must be last,
> +	 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
> +	 * the clk + regulators must be ready when this happens.
> +	 */
> +	cells[0].name = "tps68470-clk";
> +	cells[0].platform_data = clk_pdata;
> +	cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
> +	cells[1].name = "tps68470-regulator";
> +	cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
> +	cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
> +	cells[2].name = "tps68470-gpio";
> +
> +	tables = board_data->tps68470_gpio_lookup_tables;
> +	for (i = 0; i < board_data->n_gpiod_lookups; i++)
> +		gpiod_add_lookup_table(tables[i]);
> +
> +	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> +				   cells, TPS68470_WIN_MFD_CELL_COUNT,
> +				   NULL, 0, NULL);
> +	kfree(cells);
> +
> +	if (ret) {
> +		for (i = 0; i < board_data->n_gpiod_lookups; i++)
> +			gpiod_remove_lookup_table(tables[i]);
> +	}
> +

...

> +++ b/drivers/platform/x86/intel/int3472/tps68470.h

>  struct gpiod_lookup_table;

+ blank line to separate generic and local groups of forward declarations.

> +struct tps68470_clk_consumer;
>  struct tps68470_regulator_platform_data;

-- 
With Best Regards,
Andy Shevchenko


