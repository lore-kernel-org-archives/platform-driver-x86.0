Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138023B19AC;
	Mon, 24 Aug 2026 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563332; cv=none; b=WeLPOD/FIhcnSWn/wonXkMkFoAYSU/I4vQHK4ocSBCUg3M/M9kji+HAEZ2LNH0q4BpsAiqXCpkLw4z3GhyqBM2gH8l4zAR5VSIJKLWdA9hIaQQ9K5mSuqt96lPioJawD3rszBCu/CEObpATXLlxSvBbCPC9IARBqP/F/OmAfNxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563332; c=relaxed/simple;
	bh=wmP/P/JIIfDo+n8WgGT1DZp+NSjwaH7/L3MM6bSEKUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5Y5k7+AJ0Prw3W63LYisRlbTkIFX3geDlZPvECt6mj5P65SfZ9DdipUGNIxOdmt/UaNJq0eOr8yBoeNWW4XAxXnleXLuhFQ+S9bp3trCv2nOEcTguAyFt/n5x8c2o5obwit9BrF+v54000Ol0N1Bz+AxMvPwTV2o3bK+nKo9xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7bBrByn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7bBrByn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787563329; x=1819099329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wmP/P/JIIfDo+n8WgGT1DZp+NSjwaH7/L3MM6bSEKUo=;
  b=U7bBrBynW82ypgeXCgVxLuMqaZ+QEIQ9snnJgqwb03lTK/VdAv0MRKne
   TdZKOjMaj/YWF9NVKWvEh5dN7GlEGBIwEqwOUXRxK7w3TzlUNkBOCvV83
   lyqia4q7FfHzEoFFwnjJ3bHA5KIwgW+S2qkHN/DlJSWs3a2RlpVQM8p5c
   1LTyrodYjOXB8B39xqjxNl01qZYtod54EhgCxf+P6hl5YIbDavTY2ue+E
   IFZyz+ZaK2YHsnpfyHFUp4wEiCD+jTDMqxSAjgGqvbMs7Pb/X0ZlLziX0
   fXjxXswFfYmKVuxtp6UOpyvlx+i+BPAfwFON6OiDhIUdj3FroIdrzKQpu
   w==;
X-CSE-ConnectionGUID: hBMtJKOzTZqYPYcD3j5JbA==
X-CSE-MsgGUID: 1fgNr23vTA6f4/Pc4Q0YGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="99362541"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="99362541"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 02:22:04 -0700
X-CSE-ConnectionGUID: Ts8OLIVHTMq8J0nZH6v7Wg==
X-CSE-MsgGUID: giFmQoFwTqya8lXTYXQEzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="296849086"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 02:22:01 -0700
Date: Mon, 24 Aug 2026 12:21:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v7 2/5] platform/x86: int3472: tps68470: fix clock
 consumer registration for Dell Latitude 5285
Message-ID: <aowNNqerHj2iUi_b@ashevche-desk.local>
References: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
 <20260819140107.1329091-1-tchatard@gmail.com>
 <20260819140107.1329091-3-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819140107.1329091-3-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 19, 2026 at 04:01:04PM +0200, Thierry Chatard wrote:
> The BIOS on the Dell Latitude 5285 leaves GNVS field C0TP at zero.
> With C0TP=0 the ACPI _DEP method on INT3479 (OV5670, front camera)
> resolves to PCI0 instead of the INT3472 (TPS68470 PMIC) device.
> 
> Because for_each_acpi_consumer_dev() walks the _DEP reverse-mapping,
> INT3479 is invisible to it: the clock consumer lookup entry for the
> front camera is never registered with the tps68470-clk driver, and
> the OV5670 sensor driver cannot acquire its MCLK.

> Fix this without touching ACPI tables by adding optional static clock
> consumer fields to struct int3472_tps68470_board_data:
> 
>   unsigned int n_clk_consumers;
>   const struct tps68470_clk_consumer *clk_consumers;

No need to repeat what we may read in the code.
Is this message constructed with a help of AI?
The rule of thumb: use AI as a tool, do not blindly
copy'n'paste what it pukes.

> When board data is present and n_clk_consumers is non-zero, probe uses
> the static list instead of for_each_acpi_consumer_dev() to populate
> tps68470-clk platform data.  Platforms that do not set these fields
> continue to use the existing ACPI traversal path unchanged.

...

> +	struct gpiod_lookup_table * const *tables;

Okay, you want the outer pointer to be const, that's probably fine, but in any
case the GPIOLIB modifies the given tables.

>  	int n_consumers;
>  	int device_type;
>  	int ret;
> -	int i;
> +	unsigned int i;

Keep the reversed xmas tree ordering.

...

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

I'm wondering if we can / want to use gpiod_add_lookup_tables().

> +	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +				   cells, TPS68470_WIN_MFD_CELL_COUNT,
> +				   NULL, 0, NULL);
> +	kfree(cells);
> +
> +	if (ret) {
> +		for (i = 0; i < board_data->n_gpiod_lookups; i++)
> +			gpiod_remove_lookup_table(tables[i]);
> +	}

...

>  	const struct int3472_tps68470_board_data *board_data;
> -	int i;
> +	unsigned int i;

This change along with the similar above deserves a separate patch.

-- 
With Best Regards,
Andy Shevchenko


