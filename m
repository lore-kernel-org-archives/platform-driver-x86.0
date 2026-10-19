Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1344C298CA5;
	Mon, 19 Oct 2026 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395174; cv=none; b=VuhORNVzEoaM8on3hLuZMlr2/bpK57xjzULMnOyg//DF0anP5QC+cLcgyEsOlSOgFzQL5dNu2Q39CD1/aH7dzw3EFmcM06KJxuhunZS5NzeDQYRmYlT+oNO/BW9qrCBBI4qjblbPUgXkhc0LdoHPonsk3WfUGLk3fJVBWahhug8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395174; c=relaxed/simple;
	bh=pildru2/mWAQed9pJ1/vXG79hwYsZjwNE7uylGrS6dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WusEfa6volq0y6wDryOnECrIkHrWxhh9++/CG1qxmrFfpWT/QwFNZRKLRDgjVqEcXW5PyM7jZaue3GC3iu5wrJ3+oqxorw/dQeuXH3/kup5fsTY6ewXLvC7zMOg5fUT1ys5Sbi+Yt25TlTrSgkXn6WRG36zACfyjFIrVI5GT6+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXbMZoJ8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXbMZoJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792395173; x=1823931173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pildru2/mWAQed9pJ1/vXG79hwYsZjwNE7uylGrS6dc=;
  b=RXbMZoJ8v9vTVzoG+J6oGxMvnsms5r7Pp3WX0AjMWJoeG8I42NqkZHo3
   hzp/5FmPhAAJwxOGFg+Qg2Uziw1yJ/9VxrQrKRnEB9dx4OC7uo7+DFO6p
   V595EmPujqWInXhwPmiJ5UNcXgpblag2Gu/jn6vj5SPT20Y0ul8NRlJmD
   3qb03mgiUunLCj8SXchvmOOxsnTIRWDRmsjwzAZ0RLH4ALHo5xKIQdHHH
   rnjO8+fzlaFtvSKiNBQALYJTiiYBU1ldh/m2rbmpf0Kgb7T/4wvo1Jzjl
   REzwiaRya45+5c465SG9Uo2oQh69b2B/YamL652/ZKiSU0jDCtJlzC/tO
   A==;
X-CSE-ConnectionGUID: ut2ca40gReOZ/nbYrnr4wA==
X-CSE-MsgGUID: g6s+z7d2QfmyNzo6SxYbPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1056214"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1056214"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 00:32:52 -0700
X-CSE-ConnectionGUID: UZjHW22MRIWAIVokpCfWdw==
X-CSE-MsgGUID: e99lW8vYRkCwJoqML5pyAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2350791"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 00:32:50 -0700
Date: Mon, 19 Oct 2026 10:32:47 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Alexander Patrakov <patrakov@gmail.com>,
	Leif Skunberg <diamondback@cohunt.app>,
	Sahan Nissanka <adee.sahan@gmail.com>, linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/5] platform/x86: int3472: Rename DOVDD GPIO type to AVDD
Message-ID: <atXHn55T3jzcEEHi@ashevche-desk.local>
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
 <20261016141716.130220-3-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016141716.130220-3-johannes.goede@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 16, 2026 at 04:17:13PM +0200, Hans de Goede wrote:
> The window drivers call GPIO type 0x10 AVDD not DOVDD, rename
> the INT3472_GPIO_TYPE_DOVDD define to INT3472_GPIO_TYPE_AVDD to match.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


