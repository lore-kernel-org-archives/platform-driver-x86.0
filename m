Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B42FFFB8;
	Fri, 13 Feb 2026 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770974399; cv=none; b=TaRAT/EMJWyRQYXjft2ShjChYZ4w/JAbGOQ7zOP+jRVBk8V4B9agtcIwsZR+8atlGGFEQ196VynrNh0lYF7ipYAjGHKVRGSfBwT3mXPUdFn5TG5FTY/rkGKvEJggtZMXYuaewkn/JtMMI7QZlcIQM8NSdhjcCx1j+2cOhEy5I7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770974399; c=relaxed/simple;
	bh=Y2hchohN3cTkmRFpVp0vUZiOMlHytaPcUAUD9bWoJTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzcIR8mhXOXCvl4eWn9826EKGzdR125EYb7SkgYlgbEZZWi0ZOZVmDtAF8D5D+k2tt6APPmI5LKGD97jsOWtaP4JZ/M68PrlY70b7En0EU6wHchx+dEHYvVmjArjjI5lwARhmmesAv1fVC0INa/tRjgoVtnZKl21tDZctEZbWWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdYiSqak; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdYiSqak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770974398; x=1802510398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y2hchohN3cTkmRFpVp0vUZiOMlHytaPcUAUD9bWoJTw=;
  b=BdYiSqaklk2C2Mgk3X5uLX/uSjl+p0j+Qqui172Qur1nsN2drsDHOZVO
   QO0AmozxolvfFtlqyQG2g5YU8Iy7gtvMIKrIYWnm+CxCZrhHsgqBs6T1H
   9R46j7B2teJIk3VUkb/oJ/0T4qJW/hxeLB2u5r5tkIamUejRgo+C9Nwep
   X8asky8mL0pmG6GiEyKyHgKmsdAeukMzmav+gBLQgYeYYzYqJmAXtUCiF
   DpJ+++ez4ZpBQ3pJbQPVVkKQj7SRmCsug3ezhbMUcYr59HpyZpYLXwlI1
   zjNEwSFIMR/ayaUiP+S50UJfqNyHBlKDu9kU1O3GtFuKwl0A7uZZmsilX
   g==;
X-CSE-ConnectionGUID: Z6k7UVYJSRO+RHzktIH5/A==
X-CSE-MsgGUID: NIvndn2NQqm2jTBV67tqvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="82880801"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="82880801"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:19:57 -0800
X-CSE-ConnectionGUID: p3P88L1ZS5+HFI1895hgdA==
X-CSE-MsgGUID: vG/kk29hR5mpf+phcr4XBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="217845055"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.242])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:19:54 -0800
Date: Fri, 13 Feb 2026 11:19:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Peter Tyser <ptyser@xes-inc.com>, Lee Jones <lee@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	brgl@kernel.org
Subject: Re: [PATCH 0/2] platform/x86: meraki-mx100: create and use real
 software node links
Message-ID: <aY7suPDqjQYXKmTc@smile.fi.intel.com>
References: <20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Feb 13, 2026 at 09:25:23AM +0100, Bartosz Golaszewski wrote:
> Meraki-mx100 is one of the GPIOLIB users that abuses the software node
> API by setting up a dummy software node without any logical link to the
> GPIO controller it wants to use and uses the fact that the GPIO core
> matches the controller's label against the swnode's name to make the
> lookup work.
> 
> We want to remove this behavior from GPIOLIB in favor of actual matching
> of firmware nodes but that would break this user. This series creates
> a real software node in the MFD driver and references it from the meraki
> driver.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> This can be done in two patches and stay bisectable as the software
> nodes, despite having the same name, will have different parents so
> there are no kobject issues.
> 
> Merging: this should probably be acked by Hans or Ilpo and go through
> the MFD tree for v7.1.

-- 
With Best Regards,
Andy Shevchenko


