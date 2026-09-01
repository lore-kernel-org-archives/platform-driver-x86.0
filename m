Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CC5361959;
	Tue,  1 Sep 2026 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260143; cv=none; b=e8xKQdYiULY1WUjq3NCUu2lH3Gxy79Xd9VcEbKgATIpy0xEABwXjx6vN41bxOX39UUNN6FCnm7trDwSBs2gbNXdxzkJnBr+i9aJ/FIGzJXn9ReCKF1FV5ROCiZ+Bc8oOJUmtzoZXdk60Csz1PF9gRiSDIU7/xRoPHx4RLGVA9jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260143; c=relaxed/simple;
	bh=vuheHId40hHtQGMzyp87Hbe75XRFLmtuO8PVbAfCoAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=detd5KSGg5Xwr6y9QH5WbZt1jcwPk1QQv4AqC6Kk+XKLWkMwo8sDaueccfzNmxZns9kaOY3aOx4SIbJ4rQrp86xsPcRP9QzUbgTIr6aDLN6vImfwiOIYae5acxDJghK5Su2gzpatgw37uEvi5QokLTIgzZ6IaVMcD4xFR6Jx+g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmEINsDd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmEINsDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788260141; x=1819796141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vuheHId40hHtQGMzyp87Hbe75XRFLmtuO8PVbAfCoAU=;
  b=QmEINsDdpgpkwPJlUlCq9YwPLNOIzFXIINvAKQsZw4LZkiZdgpHPxoOy
   1BVqrkR5Ka2sOW0oPZsOxPzXWDk3czjmC6w6x2CGFNsY0ya5/8Iwe9vpG
   dJufThHg8Wwqpg9Joqw37KcG90ncUyTjcp1k5kxp43Re2G7ITMdVIucWI
   RQv6UBItGHb5uhEJxhB/y75HaK5J4wQQmJze8TrCQ3VqvugiHdcnZpLne
   4/keEAyWwDLjNQ6HDvlwr7FwUF5uvt/gHqtka7BxpOTPvnfHHYKUSpAnf
   4UTHGbTlmOd9CJOj03HqnTBj7IQa7xcL1AoEWUgVMwQ5/EYfozcAMIV0f
   Q==;
X-CSE-ConnectionGUID: DWfJAeJrSr+v+9z1KSiZRA==
X-CSE-MsgGUID: GSFT2RWgTCuqyRErishPMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111454907"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="111454907"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 03:55:40 -0700
X-CSE-ConnectionGUID: JoQbhaDZRV+gtekFNw+3RA==
X-CSE-MsgGUID: rTckHSCERgGJdtoLZLQgeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="267275353"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 03:55:38 -0700
Date: Tue, 1 Sep 2026 13:55:35 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v10 3/8] platform/x86: int3472: tps68470: move Windows
 MFD setup below the device-type switch
Message-ID: <apavJ8OOEIv6DC4T@ashevche-desk.local>
References: <20260831160754.9857-1-tchatard@gmail.com>
 <20260831160754.9857-4-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831160754.9857-4-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 06:07:49PM +0200, Thierry Chatard wrote:
> The Windows path looks up the board data, builds the tps68470-clk
> platform data and registers the MFD cells; none of this is needed for the
> ChromeOS path, which registers its own cells. Move that handling out of
> the switch and let the ChromeOS case return directly, so the Windows-only
> work is no longer done for ChromeOS and the function reads top to bottom.
> 
> While moving the code, use a local struct device *dev to shorten the many
> &client->dev references, and return -ENODATA (rather than -ENODEV) when no
> board data matches this machine, to distinguish it from a missing device.

These all have to be split to the separate logical changes.

> No functional change for either path.

...

>  static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  {
> -	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
>  	const struct int3472_tps68470_board_data *board_data;
>  	struct tps68470_clk_platform_data *clk_pdata;
> +	struct acpi_device *adev;
>  	struct mfd_cell *cells;
>  	struct regmap *regmap;
> +	struct device *dev;
>  	int n_consumers;
>  	int device_type;
>  	unsigned int i;
>  	int ret;
>  
> +	dev = &client->dev;

This one is not getting validated, hence it's fine to assign directly above

	struct device *dev = &client->dev;


> +	adev = ACPI_COMPANION(dev);
>  	if (!adev)
>  		return -ENODEV;

...

>  	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
>  	if (IS_ERR(regmap)) {
> -		dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
> +		dev_err(dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
>  		return PTR_ERR(regmap);
>  	}

This should be replaced with return dev_err_probe() in a separate change.

>  	i2c_set_clientdata(client, regmap);
>  
> -	ret = tps68470_chip_init(&client->dev, regmap);
> +	ret = tps68470_chip_init(dev, regmap);
>  	if (ret < 0) {
> -		dev_err(&client->dev, "TPS68470 init error %d\n", ret);
> +		dev_err(dev, "TPS68470 init error %d\n", ret);
>  		return ret;
>  	}

This is as well. And replacing &client->dev by dev should be in a separate
patch.

-- 
With Best Regards,
Andy Shevchenko


