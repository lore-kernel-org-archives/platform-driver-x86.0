Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BB54D4889;
	Mon, 19 Oct 2026 10:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407138; cv=none; b=Fdd/EsCtgVasNEGqE0+yA1htacydy6zU7bL0bnFpHwF6DueyVm8AaSItr333n0LvjRav9DjqbY9W2IqQ3D6Og2W+fYrc2GbJ+lv6yWOg1uxS8LXzskdj3pdNfFTY3ivsx8caf3ITKkSHIGEi6rh1ooLgxK7uNa8zFz9KodSLdtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407138; c=relaxed/simple;
	bh=Hxp2++n9jy0Mww15Vrj2nGeoAUS/RjLlS4lkY2wGWIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VP1SXIbp8rT4hkO566REXmW8w4rk2LOYRjkgRNmmizRz3o1fbjPwGyjxMJvlVkq36+P36JKKNDAgqWnbVcr2ZPKWxh9Hyctcmu2hL8/sfc3ht5Znht1GmoUq0uHyGhgKJE0MuQHGOgLJ21KOVULlyvK3xWnrTqKzA5/911V45Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2qkGeEw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2qkGeEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792407136; x=1823943136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hxp2++n9jy0Mww15Vrj2nGeoAUS/RjLlS4lkY2wGWIw=;
  b=i2qkGeEw59Anp5D0oH7C7Rfy9GYv8qWrRiWpc+eEKzky1e+Wg/r3CeyN
   axq+yvU4UNoBsAy+d6OvFQijSP7J8OpnHHWXpM9+JFsg8RAb3GWpWVH2A
   oGj4s424Sd+rh/Rd1FFD4pU93N9oZPG5YuSIbzj5a6SzDrfhYbmbC+rw7
   u+MMDn4Gf9xCvejnj+Zi3UQKdNSVPo2lTA2iBQ/dJUAZc9R2PXVbDcEur
   ZobLdorau0zTcEoXp+VRGdGi2vdLO3mYgGkXofsxTJxBPrpoVO+SlDe/G
   HCrKQR+/TdbyKgj+EBt3QGb2Z0mplTXCHg/FYwPtgxtMV6vUcKubbysyJ
   w==;
X-CSE-ConnectionGUID: dva0R0FhTZqapw7zscF3Nw==
X-CSE-MsgGUID: UofvVRrDSAy7K3drmoUzXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1072084"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1072084"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 03:52:15 -0700
X-CSE-ConnectionGUID: OY4BlSePSSWzDZRAwZP9zQ==
X-CSE-MsgGUID: ZfTqTQe6Qv2XPj9CVwsujA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2396626"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 03:52:12 -0700
Date: Mon, 19 Oct 2026 13:52:09 +0300
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
Subject: Re: [PATCH 4/5] platform/x86: int3472: Rename avdd_second_sensor to
 power_enable_second_sensor
Message-ID: <atX2WURXaHBPVtcO@ashevche-desk.local>
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
 <20261016141716.130220-5-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016141716.130220-5-johannes.goede@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 16, 2026 at 04:17:15PM +0200, Hans de Goede wrote:
> The avdd_second_sensor quirk is for when a GPIO with the power-enable type
> is shared between sensors. Sofar power-enable happened to be mapped to
> a "avdd" regulator. But that is going to change in future patches, rename
> the quirk to better reflect what it actually is for.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


