Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70741DEF7;
	Fri,  4 Sep 2026 07:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505617; cv=none; b=U2zEDYUk/oqSgKf6v2CgzTw0IOTAYOo23R6whShnv5/2S+j4EYQpYnQNFbc//Aw3M7DFKF0nU5sK+ae/jV94R5xw9tkyM9N22WSHqEU7Lz5i43lI1Z0mqGsXUjN3R7xUtY9DwOUIgrQ6EcTyIyUZ512Q+lyisAi/tO7DnS83b24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505617; c=relaxed/simple;
	bh=EaeVbwWB+11rer8DBIzyPlEWxA9AtDAX2D30oZR0UkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bw7mzCzOsuGo5aCBeUcrFeL9KuANcARLVjvG9jKejTJJWfEwUEd4mP9Pe8XXqLHpfAECfn5pOHjiuyUjse8Cl8XEBgqIjibQ058eOCLs69oEB+yEf4R/xUNTJd9wmhKj1x99d3jXjR8iAdR5mFrJsphkCvSPZOVwZZOtO/kikFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=co1GI9Zt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="co1GI9Zt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788505615; x=1820041615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EaeVbwWB+11rer8DBIzyPlEWxA9AtDAX2D30oZR0UkU=;
  b=co1GI9ZtoDyY5wOc8l8VX03YlmaVtrzET6utGQRy1QG02k+sOQEHwGMJ
   B3di775rRIVUnfDl3fijMS0ONO5N3VXK02SVAeb3JwPx9Zclw/NHf6/PV
   Qvd1U5G3/xH+0jVCJyB09GEn3Hgpl9FTFo4PXyNC0aFTC0lCEwZT4PSiv
   lBvSzaXIZDur9AMZj9/fseGRuik7OB7Ry5WXMgt8gstYTckEIJNmAa5+V
   k1bJfed1tCpE7xC2P7jxKKu67CkuFxYD90QXRtP4X5oQU+KcURPsL0J3/
   O53sbIR7JEB0utilpjJIfar69tRJuaA184Jy3JswsqtXxgJq6I0YicZre
   g==;
X-CSE-ConnectionGUID: ZcLifH8qRcKutWlCVA/pJw==
X-CSE-MsgGUID: 6cOwyhMaQjC9a9LG+a4FNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88883156"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88883156"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:06:54 -0700
X-CSE-ConnectionGUID: yAqpIa/2QQiVR5506gXIgA==
X-CSE-MsgGUID: vRIYyBU0S0KG7Lzm78tlBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="270497199"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.250])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:06:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D20EE121BD3;
	Fri, 04 Sep 2026 10:06:49 +0300 (EEST)
Date: Fri, 4 Sep 2026 10:06:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org,
	hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net, v.vitovt@gmail.com
Subject: Re: [PATCH v10 4/8] platform/x86: int3472: tps68470: add static
 clock consumer support
Message-ID: <appuCVrBGcwfTXeX@kekkonen.localdomain>
References: <20260831160754.9857-1-tchatard@gmail.com>
 <20260831160754.9857-5-tchatard@gmail.com>
 <apazFgPm4B5B_KdZ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apazFgPm4B5B_KdZ@ashevche-desk.local>

On Tue, Sep 01, 2026 at 02:12:22PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 31, 2026 at 06:07:50PM +0200, Thierry Chatard wrote:
> > On some platforms a sensor's ACPI _DEP does not list the INT3472 device,
> > so for_each_acpi_consumer_dev() misses that sensor and never registers its
> > tps68470-clk consumer entry, leaving the sensor without its MCLK.
> > 
> > Add optional n_clk_consumers/clk_consumers fields to the board data. When
> > set, probe builds the tps68470-clk platform data from that static list
> > instead of walking the ACPI consumers. Boards that leave the fields unset
> > keep using the existing ACPI traversal.
> 
> ...
> 
> > -	n_consumers = skl_int3472_fill_clk_pdata(dev, &clk_pdata);
> > -	if (n_consumers < 0)
> > -		return n_consumers;
> > +	if (board_data->n_clk_consumers) {
> > +		clk_pdata = devm_kzalloc(dev,
> > +					 struct_size(clk_pdata, consumers,
> > +						     board_data->n_clk_consumers),
> > +					 GFP_KERNEL);
> > +		if (!clk_pdata)
> > +			return -ENOMEM;
> > +		clk_pdata->n_consumers = board_data->n_clk_consumers;
> > +		for (i = 0; i < board_data->n_clk_consumers; i++)
> > +			clk_pdata->consumers[i] = board_data->clk_consumers[i];
> > +		n_consumers = board_data->n_clk_consumers;
> > +	} else {
> > +		n_consumers = skl_int3472_fill_clk_pdata(dev, &clk_pdata);
> > +		if (n_consumers < 0)
> > +			return n_consumers;
> > +	}
> 
> Can it be done in a helper, so we will have here something like this:

Please don't; it's better as-is.

> 
> 	if (board_data->n_clk_consumers)
> 		n_consumers = skl_int3472_fill_static_clk_pdata(dev, &clk_pdata);
> 	else
> 		n_consumers = skl_int3472_fill_clk_pdata(dev, &clk_pdata);
> 	if (n_consumers < 0)
> 		return n_consumers;
> 
> ?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Sakari Ailus
