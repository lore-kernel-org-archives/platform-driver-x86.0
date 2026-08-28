Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A8F3E3160;
	Fri, 28 Aug 2026 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906748; cv=none; b=tUxDqR7hXdb/AQ79BLZHfGLmsZDn8qZkrAVFqDo/X4TUbYU3NBAvBTlw+A6vQwqECI1jR/YoBIE7/2mKsu4o69XQSXLz80idyWJTfYY68n1dUQOuzn48fx40cP8vsxscEJu9nmWF31H2LDJUM7ga5v6brQzSic2K0lGpOwckbNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906748; c=relaxed/simple;
	bh=qUVXvioBPT+3N5gv5DtEurQcu6f3E2KqPovR+3iduwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNHjoMgNzOmmAlvJvLfIBaZpR4saMlMvjnZTufLHy3imqXmLYYALLioP+MRjvrlNgJjHi3wOIAPwOV/XpPnLDRQfj3nqChxZ/xUdVFLkO6obHU7CxCHzroVhjIE4HE6nmlBMo82atYE9cPffcB/QbO7fao38HWHXwoFJd3AbD/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fk3aI2oT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fk3aI2oT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787906745; x=1819442745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qUVXvioBPT+3N5gv5DtEurQcu6f3E2KqPovR+3iduwQ=;
  b=Fk3aI2oTKlzisfdP1Am5K9VLmGeowdg6fqNqI1uO4e8ZuIzrOsuxH0nH
   E94er0RksOH5B4jz8VIUDTTe1AVys2FaLSsNtv8Ps3XO2fMMdGaa2u5VH
   k0QKhY4XrzBcWvkl7/jmZWRZM+v+IqaHrp0BDGlCQ4TT4S2cXuWOjH43u
   OcnIaezd8Ntci6Bet/XO2OodTrw0aZf+Yo7YJvj33dETJrz9FbRALDmcK
   Aga2SwT+D1ttg9d4FyQTaxXaOPBeqS6No+0tnAoeLPp3InaPVJ768/anx
   AbSYUbyTNKl5xjs/w/c3Cv1brch97rEeYjPE3xUTO+RWCuid63O1nDDDN
   Q==;
X-CSE-ConnectionGUID: pVgS5q9mSGCykJi6nuTU2w==
X-CSE-MsgGUID: sVFm7UWhTluX0mw6I4oUFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88536491"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="88536491"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 01:45:44 -0700
X-CSE-ConnectionGUID: QVp4ObHAQoWXBjoQOwdaqQ==
X-CSE-MsgGUID: 0j8P6AhSRqeb/kGO+Pc3CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="292915508"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 01:45:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4432411F817;
	Fri, 28 Aug 2026 11:45:37 +0300 (EEST)
Date: Fri, 28 Aug 2026 11:45:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net, andriy.shevchenko@intel.com,
	v.vitovt@gmail.com
Subject: Re: [PATCH v9 3/6] platform/x86: int3472: tps68470: fix clock
 consumer registration for Dell Latitude 5285
Message-ID: <apFKsbF8R_zs9sa6@kekkonen.localdomain>
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

Hi Thierry,

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

Can you split this into two: moving parsing the Windows ACPI tables below
the switch, and then adding the clock workaround?

> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 105 ++++++++++--------
>  drivers/platform/x86/intel/int3472/tps68470.h |  10 ++
>  2 files changed, 71 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index 5baed848a..8423c6d20 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -142,9 +142,11 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
>  
>  static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  {
> -	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> +	struct device *dev = &client->dev;
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
>  	const struct int3472_tps68470_board_data *board_data;
>  	struct tps68470_clk_platform_data *clk_pdata;
> +	struct gpiod_lookup_table * const *tables;
>  	struct mfd_cell *cells;
>  	struct regmap *regmap;
>  	int n_consumers;
> @@ -155,10 +157,6 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  	if (!adev)
>  		return -ENODEV;
>  
> -	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
> -	if (n_consumers < 0)
> -		return n_consumers;
> -
>  	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
>  	if (IS_ERR(regmap)) {
>  		dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
> @@ -176,52 +174,71 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  	device_type = skl_int3472_tps68470_calc_type(adev);
>  	switch (device_type) {
>  	case DESIGNED_FOR_WINDOWS:
> -		board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
> -		if (!board_data)
> -			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
> -
> -		cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
> -		if (!cells)
> -			return -ENOMEM;
> -
> -		/*
> -		 * The order of the cells matters here! The clk must be first
> -		 * because the regulator depends on it. The gpios must be last,
> -		 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
> -		 * the clk + regulators must be ready when this happens.
> -		 */
> -		cells[0].name = "tps68470-clk";
> -		cells[0].platform_data = clk_pdata;
> -		cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
> -		cells[1].name = "tps68470-regulator";
> -		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
> -		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
> -		cells[2].name = "tps68470-gpio";
> -
> -		for (i = 0; i < board_data->n_gpiod_lookups; i++)
> -			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
> -
> -		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> -					   cells, TPS68470_WIN_MFD_CELL_COUNT,
> -					   NULL, 0, NULL);
> -		kfree(cells);
> -
> -		if (ret) {
> -			for (i = 0; i < board_data->n_gpiod_lookups; i++)
> -				gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
> -		}
> -
>  		break;
>  	case DESIGNED_FOR_CHROMEOS:
> -		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> -					   tps68470_cros, ARRAY_SIZE(tps68470_cros),
> -					   NULL, 0, NULL);
> -		break;
> +		return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +					    tps68470_cros,
> +					    ARRAY_SIZE(tps68470_cros),
> +					    NULL, 0, NULL);
>  	default:
>  		dev_err(&client->dev, "Failed to add MFD devices\n");
>  		return device_type;
>  	}
>  
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
>  	/*
>  	 * No acpi_dev_clear_dependencies() here, since the acpi_gpiochip_add()
>  	 * for the GPIO cell already does this.
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
> index 35915e701..1d3d67459 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.h
> +++ b/drivers/platform/x86/intel/int3472/tps68470.h
> @@ -12,11 +12,21 @@
>  #define _INTEL_SKL_INT3472_TPS68470_H
>  
>  struct gpiod_lookup_table;
> +struct tps68470_clk_consumer;
>  struct tps68470_regulator_platform_data;
>  
>  struct int3472_tps68470_board_data {
>  	const char *dev_name;
>  	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
> +	/*
> +	 * Static clock consumers.  When n_clk_consumers is non-zero these
> +	 * are used in place of for_each_acpi_consumer_dev() to build the
> +	 * tps68470-clk platform data.  Needed on platforms where a sensor's
> +	 * ACPI _DEP does not list the INT3472 device, causing that sensor
> +	 * to be missed by the ACPI dependency traversal.
> +	 */
> +	unsigned int n_clk_consumers;
> +	const struct tps68470_clk_consumer *clk_consumers;
>  	unsigned int n_gpiod_lookups;
>  	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
>  };

-- 
Regards,

Sakari Ailus
