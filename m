Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6FA29D268;
	Fri, 27 Mar 2026 10:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606102; cv=none; b=vCnk8r9M/aZikYG9qN5bDOJ5NwNMEBE+LeWN84aCUsjj2ddI1tJ7YxSbMCghwQ4Pl/JRHM5GZgM8a9x840kFR5m3v7A/dQjWBrWzDJZf0hEMxOeA7kOAmflWMuqtsH5NIZbSP0eIVzFwQPW12G+AS/hh/0KmG+1Gd8Lf5teoKDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606102; c=relaxed/simple;
	bh=9RmenRAnvanSOfKPYewJ9QiAGZ9lOMiZ2tjIOMjbmRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcNdQyqBLjX8zBjwesAZNl4dFP2hEApWd/hZk4NoK50t4eqHzV2TtBgANoQ5LVRPXyhwiH2hMwMnNpHw0LKFTQ0N5BYDzSOjRgRPEpZbmFk8prbbAETE2S/xQrxjGsFOO/p8VXVNv3Sd8cN9QrBcoIDpsK4+RmE6UmrDDPQSfNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkEWF+YM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkEWF+YM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774606100; x=1806142100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9RmenRAnvanSOfKPYewJ9QiAGZ9lOMiZ2tjIOMjbmRQ=;
  b=fkEWF+YMQFmcgERPg71Ecze0nMUDqgg6iuYRixCXa1nE98wmFkXBL7Lh
   HCQgOFMItublE4+YlpRNNj03oYEnmrp5k7Lxysffz3VsWdfxqrChEjsLT
   shY8CdMCuc5sf9BMF9vTzCjiwZbLVRbe80JEa1JzODb2uiONoKTEkyu21
   1gILHf3lmQaYC3RYC1VvmpA2boLnN71poUm+m/s/Xgs4zQNEdtNN9uDg7
   se9d2xgnWxidTGmR8t4gPUAJvSYkCimUI9cwk6LARgB/WOiylpyIUjwwN
   UvtELKCVpppBxo2QrA4vvcYqp/aWlaz7RW6O5WmeuHKjzNZuyQaxOWS4H
   w==;
X-CSE-ConnectionGUID: feUdjPqwQl6oZD7QZBIO9A==
X-CSE-MsgGUID: Z9mEXEhSS0mI639hy8+YOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85984564"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="85984564"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:08:20 -0700
X-CSE-ConnectionGUID: BFpGbHnKQDWlgbcRdBOPQg==
X-CSE-MsgGUID: EOZe3YzySa2Kfvgt+tJjKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="229357665"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:08:18 -0700
Date: Fri, 27 Mar 2026 12:08:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] platform/x86: int3472: Rename pled to led in LED
 registration code
Message-ID: <acZXD_xT_Yr2MEVR@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327090753.1481453-1-mnencia@kcore.it>
 <20260327090753.1481453-2-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327090753.1481453-2-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 27, 2026 at 10:07:50AM +0100, Marco Nenciarini wrote:
> Rename the privacy LED functions, struct type and member from
> pled/int3472_pled/register_pled to led/int3472_led/register_led to
> prepare for supporting additional LED types (e.g. strobe/IR flood).
> 
> No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


