Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B874546D540;
	Tue, 18 Aug 2026 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060053; cv=none; b=aJ4iXZ8rzkqpGqThgGqFKytaUy+5X/pJDIdDdgUHDjLUFztN8lAm/3dK1hbOmJOldyq0OmDm+CW3/NbcT6mZUvxbCbInrfQi3fxt7YTq7zu64ISztMbtgtF6xB6TB0WMJ/k6FHf5t/FYXcKXAczb8jVorxfM9q2I08xMONzbtiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060053; c=relaxed/simple;
	bh=02S1G6x7cw0DmIhUWAUkdICbDNedmRqLld04qKbrMzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDAAWj58seCjXqIPo3IwiXZIBM5lnz172dPDSHsd88D+pifhpMqaAvfU3ST/wSFp7QsMkvRmQXNCbvPqPQ1l/y/R1lJR0P23cBWSaZo8T160qR61hhpzhtt8w3kk4YjPcZf1PFQzXSl5re2nU9LJ56q89eJrjKBtCr0rLMs+U/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdYLAWO+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdYLAWO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787060052; x=1818596052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=02S1G6x7cw0DmIhUWAUkdICbDNedmRqLld04qKbrMzY=;
  b=fdYLAWO+LFZKQrLYZB8+KjowOAnzJD+tgbjsOgEZdj/1Gg60HmomDzh1
   G8hnnBn608ID/87iycvz9VaqJcc7JLLava7EBKyngwSX+U1hy//VfTlbi
   4Hi5SSlKnn7IBNAqbJzu/YS8fDZZb4T8LmdnthQ/TK2TP2D4wpuqkSxAj
   6CQXUbbHciaXfp/6hZafWS6nbzPlx5bCv9YLYZpn/8VIiabeS4nnWvS/9
   vca/2pppxn+ZB9sgsVxe46ZHkwZg3OMwatEAouil3deOH4mcLJBYYrEmI
   Y99V4ZfN1YMzIxLD+vY5dhx6Mq7pGqhQJ2Kg9EhspTqJtx6L8E79FxsjS
   g==;
X-CSE-ConnectionGUID: mg7pR2EPTliK+jsOFL+Xug==
X-CSE-MsgGUID: b2UNotaeSpqgXFcHjvfBoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="99072734"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="99072734"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:34:11 -0700
X-CSE-ConnectionGUID: 9g0WB0FFQvWUu2YnncIeqw==
X-CSE-MsgGUID: /Bii0DnQRyWzH/NJ83zrSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="259030754"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:34:08 -0700
Date: Tue, 18 Aug 2026 16:34:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use bool for
 str_supported() parameter
Message-ID: <aoRfTdHh6MJqe5hL@ashevche-desk.local>
References: <20260806131549.235170-2-thorsten.blum@linux.dev>
 <58e1e888-b13b-a77f-363a-8e8a9a1f9c4a@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58e1e888-b13b-a77f-363a-8e8a9a1f9c4a@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 18, 2026 at 04:25:21PM +0300, Ilpo Järvinen wrote:
> On Thu, 6 Aug 2026, Thorsten Blum wrote:
> 
> > Make str_supported() take a bool, define it inline, and return string
> > literals directly. Use a single inline definition for both debug and
> > non-debug builds.

> > +static inline const char * __init str_supported(bool is_supported)
> > +{
> > +	return is_supported ? "supported" : "not supported";
> > +}
> 
> This certainly looks something that should be in linux/string_choices.h. 
> I'm pretty surprised it isn't already there actually.
> 
> Not sure about how to name it though, str_supported_not_supported() a bit 
> repetitive. Andy?

Is it part of ABI? Otherwise I would rather see str_supported_unsupported().

-- 
With Best Regards,
Andy Shevchenko


