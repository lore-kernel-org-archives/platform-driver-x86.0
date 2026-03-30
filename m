Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF583A1D14;
	Mon, 30 Mar 2026 09:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863385; cv=none; b=hzZM5hgqm2lI5n5H+oeHSS7h5vzylOyEA+eNjWObgco83x2TgHqsKUsYaUAM21AVtwaJGfUBvsXiamONhK1WfvWMIJo7MkfWGnly8nOrEDlpkC0XPRb+ekr8zr38/Bisvg+X5YzBQBCKz5GVFoJn42ZdWp6uHwThW+g53DQ1MTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863385; c=relaxed/simple;
	bh=24KzWfQGha6Cnv/TWDvZdXFSSa7rfg4J/xCmbd99Ot8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCLDrxHRfDoKRTUJlPfVtkNPzy1B5pw8RT9yKqF9VUmT2HtZqvJZJkChpX1wjo9AhrY8edg8mYgQSIdDp25MLUixI19M3rKiqiBDmACBfu7ISLtPYy9qeUjGtEyTRZofyHMFgFDc5z2Mw/J7e8HPJ8HxFZLcplUPJTxk/IkpZWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvVCE0d7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvVCE0d7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774863384; x=1806399384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=24KzWfQGha6Cnv/TWDvZdXFSSa7rfg4J/xCmbd99Ot8=;
  b=EvVCE0d7zfcViXU8odW3v299X8WvG5wUxBRTQVp2Iwd1/9QBFR1jZnFb
   h0PuESfi9mH7S5DTyJNgfTwQbHK7Pkl+zo3zJPLxESE+4JKPzLiAFvsCA
   a8wdjIo3X8UBqsgk2nuUgX5GzfdNq9al7KQ1dSPHhBB8oPbze+dj3A0Pw
   s4q/QMm+qaOWgSXfbJyA5UTA8m7wBClfpgy+a79wvbybgjWOkNV0Xv6l8
   hAo0eXC3tWd2rQb5WlSQLB4YhIsExxmDoL54qOLJNgfZD9FOLz3jcP/Xq
   UorArzjZ9HPpeRsFi7T5yraXIA+zOulK3qKvBG55cPlcvJr5gy6o5aDWv
   g==;
X-CSE-ConnectionGUID: g/cG89MxR7CgfHZ/CNpA/w==
X-CSE-MsgGUID: Lz/5hQfkTlWsf2UGIlTtTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="98462434"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="98462434"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:36:23 -0700
X-CSE-ConnectionGUID: h8+VzLKSS9aXN63jHTpV+g==
X-CSE-MsgGUID: clhzSkNdT0e5AKm66ugR/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="230064328"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:36:22 -0700
Date: Mon, 30 Mar 2026 12:36:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe)
Message-ID: <acpEE7Mop3hegvSX@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327181031.1489365-1-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327181031.1489365-1-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 27, 2026 at 07:10:27PM +0100, Marco Nenciarini wrote:
> Add support for INT3472 GPIO type 0x02 which controls an IR strobe LED
> used for face authentication on some laptops (e.g. Dell Pro Max 16
> Premium). Without this, the kernel logs "GPIO type 0x02 unknown; the
> sensor may not work" and IR sensors paired with a strobe LED cannot
> function.
> 
> The series first refactors the existing LED code (patches 1-3), then
> adds the new strobe LED type with multi-LED support (patch 4).

Thanks for the update! I have given mostly cosmetic change requests, but
the main one is to rename local variable in the first patch pled --> led.

-- 
With Best Regards,
Andy Shevchenko


