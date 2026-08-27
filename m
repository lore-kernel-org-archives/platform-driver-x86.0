Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C339288D0;
	Thu, 27 Aug 2026 07:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815360; cv=none; b=uKr91wnmoagZTkR/civHRBt3CnsYz3DJ+qdEer75jtFPpkWlve1yWxS3Q6a3KuMyXZdp1JBOTDO8EdKBXRnirKFsCX+woETJDDirJ5cx+Dumdfk4RjuKvwv2hubc7EDgqEG2Tf8R+IYXKiy9lNktlNiftRYLp2PaoJA5GUvK4aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815360; c=relaxed/simple;
	bh=SchUiK5UxNXgGih7NLneMEdg11C6J2/te/xBmZadsLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCj2Ac2migeelrVklq58ck9b2pD1bDe0zCavYCzoMGFslsXtBG6ItSke/krxvP16hxQoLnx2rK1tcD56FhLDlzrTOI+TzApF4GOwbNAe3ImeLXaDBEl4tfXjG45ialaPmn4mAOF34r/mwhulnt4G1sbrgR3RdiCg0e71OQN6szE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACi3s07d; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACi3s07d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787815359; x=1819351359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SchUiK5UxNXgGih7NLneMEdg11C6J2/te/xBmZadsLo=;
  b=ACi3s07d36k/cRjRNvpF7f+CTAHvh6h0Zu68o0JmLdaHkyJnuyMqwsHE
   ua5ph1bF7CZnkoALFrNC5nNAG4Y5lB8tvoG3BEbUZMLbIXprwy60XW0Mv
   CzuAsDyfeyw88lvcxODcgVuOszlrw6RLoTiSzlFdAa8zkzPlJUBVeHs3j
   cqbCeGqOlBtevWhjmSJ/ge9y3cV5TGq38Bto8JtmzBiy2PETHvbnDQXtL
   Lms3xg/eowpNJPDERb71APi/xu5owC0HYE0FJeGK+cqVZ/LntAyXEHO2Z
   ZL2fTGoqFYfc3XWscnk2Toe2lHgqqdtjKFWFH3zGYNNcPLOnCBVHbzNCi
   Q==;
X-CSE-ConnectionGUID: tXHGZUNsR42n5ChNIOqaTA==
X-CSE-MsgGUID: LJ3VRcsrSsWixDxJ5113Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="90818465"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="90818465"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 00:22:39 -0700
X-CSE-ConnectionGUID: Sz7drhf1SkGcHIoJTq5Hrg==
X-CSE-MsgGUID: xKKtfuCkTtGjo0BrqblDDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="291308742"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 00:22:35 -0700
Date: Thu, 27 Aug 2026 10:22:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v8 3/6] platform/x86: int3472: tps68470: fix clock
 consumer registration for Dell Latitude 5285
Message-ID: <ao_luVlibcdvcfQT@ashevche-desk.local>
References: <20260826112452.13539-1-tchatard@gmail.com>
 <20260826112452.13539-4-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826112452.13539-4-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 26, 2026 at 01:24:48PM +0200, Thierry Chatard wrote:
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

...

>  	struct mfd_cell *cells;
>  	struct regmap *regmap;
>  	int n_consumers;
>  	int device_type;
> -	int ret;
>  	unsigned int i;
> +	int ret;

Yep, this is leftover which needs to be folded into the previous patch.

...

> +	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
> +	if (!board_data)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "No board-data found for this model\n");

Define

	struct device *dev = &client->dev;

at the top and make these lines better looking

	board_data = int3472_tps68470_get_board_data(dev_name(dev));
	if (!board_data)
		return dev_err_probe(dev, -ENODATA, "No board-data found for this model\n");

(note that switching to -ENODATA helps to distinguish the case).


...

> +	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +				   cells, TPS68470_WIN_MFD_CELL_COUNT,
> +				   NULL, 0, NULL);

> +	kfree(cells);

Looks like we can switch to use __free() at some point.

> +	if (ret) {
> +		for (i = 0; i < board_data->n_gpiod_lookups; i++)
> +			gpiod_remove_lookup_table(tables[i]);
> +	}


-- 
With Best Regards,
Andy Shevchenko


