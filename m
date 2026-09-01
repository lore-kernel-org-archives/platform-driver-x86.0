Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137332D23A6;
	Tue,  1 Sep 2026 11:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261151; cv=none; b=oaiaXCcAoRdBWFaPpM/wBOSN0SIzx0PaRIKq+pKjSGUX5o2eskMeRkc/L2NAzX52NbKPcQnvAcJw3ZYsccaYR5rdSsq4Ue5KlbxsSC0OHRmQrX1B38p6t0FD2AdAzQnHu0rT4FWWS837js7alQGG5eK6xqS4IBf77oyrUNw5r1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261151; c=relaxed/simple;
	bh=9ShKHquv8eoAYGlmbRglX4QlqGLkB6HL55g4WEhmeus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBmhwdDB6wTC+LwXnyLfIQ64MDBiQGQp2FyILbhQD2JzaaYzUvLYR+gg46y482SwfF/xL63qGLFk7/4ttHuJ2JpkfIlYQuAPfLhuNDO13TKlkxZtZXC9pMTO2Nm5eFgqDkpi/IHWZFV0ebFsXCKJPCsnzkU+ceXkdQw5GJllUbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hivZZF36; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hivZZF36"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788261150; x=1819797150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ShKHquv8eoAYGlmbRglX4QlqGLkB6HL55g4WEhmeus=;
  b=hivZZF36JSb8YPVU8lvceWi9YtyjLTtXfDt2PmCuCcSb8/ev5HYdNSYT
   +xh23zjulImeWALVIjsNJ6gMPJdfJNN4Rp6wQQYCYEVuizYhphYBuHnld
   2Ht89IICgT+49hnOSKzl99RH6bQngpWPPCQePXXn3hMGgZcxCAffIml/O
   UrUPXo7HnJn7zGk3s6v45aUHReHC61jUV3qtlSlhZNx9EwPbGh7OG44p+
   I8/Ny0GwQ9JXWrSjAVzgd206iD7pouF9HjbIvTHa8h5iT+jybLIE9GRr1
   Ur1lJsMjTS2PPTmECMNhmpP5GJ2HGs1vPkO3eoCfIwFjLgNhSsA+hRaSp
   w==;
X-CSE-ConnectionGUID: SwmISIKIS1GboqoLbrOP/Q==
X-CSE-MsgGUID: O8ZXgWLKRDOWCYWn2aZMSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="91200167"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="91200167"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:12:29 -0700
X-CSE-ConnectionGUID: 5czP0Nb0RCKKe3kzlRfFww==
X-CSE-MsgGUID: MdabM2JmRgSbMBdbFJ6NQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="272581767"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:12:24 -0700
Date: Tue, 1 Sep 2026 14:12:22 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v10 4/8] platform/x86: int3472: tps68470: add static
 clock consumer support
Message-ID: <apazFgPm4B5B_KdZ@ashevche-desk.local>
References: <20260831160754.9857-1-tchatard@gmail.com>
 <20260831160754.9857-5-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831160754.9857-5-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 06:07:50PM +0200, Thierry Chatard wrote:
> On some platforms a sensor's ACPI _DEP does not list the INT3472 device,
> so for_each_acpi_consumer_dev() misses that sensor and never registers its
> tps68470-clk consumer entry, leaving the sensor without its MCLK.
> 
> Add optional n_clk_consumers/clk_consumers fields to the board data. When
> set, probe builds the tps68470-clk platform data from that static list
> instead of walking the ACPI consumers. Boards that leave the fields unset
> keep using the existing ACPI traversal.

...

> -	n_consumers = skl_int3472_fill_clk_pdata(dev, &clk_pdata);
> -	if (n_consumers < 0)
> -		return n_consumers;
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

Can it be done in a helper, so we will have here something like this:

	if (board_data->n_clk_consumers)
		n_consumers = skl_int3472_fill_static_clk_pdata(dev, &clk_pdata);
	else
		n_consumers = skl_int3472_fill_clk_pdata(dev, &clk_pdata);
	if (n_consumers < 0)
		return n_consumers;

?

-- 
With Best Regards,
Andy Shevchenko


