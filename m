Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E3C3E7172;
	Thu,  2 Apr 2026 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134805; cv=none; b=ujVRwAhUKjzrgGWe46IkXtDrg6C3s1dHzHf9Bgg979PWeUcrq0mg9vNbVM0qMhKSRNPt5ioSp8alj1B5Vp+Nwpf2ikEBu4eB0+tEv80Lp4OOpiUdNC4wsUGLhwnO+8Txc9sOHSexw0Y4V5SOpPgu5hAICvLQacjHNmjq0bBTjAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134805; c=relaxed/simple;
	bh=KU6sRPEnkM8KgXOsYjyG6cOuZppp4Z3MQtu/wXnLv/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIxIaTaGrDYCOtqbfiFkTMhoD/TJR/mP3CP28bZz7ORJVvWDiqdd/XCJ6fNoro0a3x18HWlVvB+1ksd1rkaF6an65htAy/m44PDKJQfqs1FQXchbHLuK1UgvICBZhX3ych8IXllavb8lWLVnxzfNZhnWgF4i77JHaBX7guDJJxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TK7UTu2K; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TK7UTu2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775134795; x=1806670795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KU6sRPEnkM8KgXOsYjyG6cOuZppp4Z3MQtu/wXnLv/U=;
  b=TK7UTu2KaV0mgvGDDeCRGvJrD5EJREW27REFEbckuBFfmAm1g3d+xDpx
   F2NltYtNYt8GhpH29ZeqhHFgvRQnjtKJrN44uEEilqQgrsclGWXepfe6i
   4XrDFJrRUQvdOkLBvJQz38yF1J6RZD4jAR8FpMRx4SCDA+Io3KHAafEVG
   SrX345c0uYocq4r1f6zRxHizxxasPczapohzC0DrSkqPOn6QkkZIb5gY9
   v+2A2y4qRbNEHoiRcxdUA4aQj8JMMuibbCOrF603dYiXoLpMQwNgDVLqO
   LGgugPEoooghnxgzOimVKsKDA+CfJFpHGtqJMNC/mc1JYkKVwU4L20c+V
   g==;
X-CSE-ConnectionGUID: BeMiL1oxQhalQtxPV4teJg==
X-CSE-MsgGUID: uT21nPiVT7CdKHyj/Od/Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76378497"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="76378497"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 05:59:55 -0700
X-CSE-ConnectionGUID: 8/cHqTRMQ6ukR0Xt+EIaLw==
X-CSE-MsgGUID: DGRLBst+QD+2OwNDg/mJBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="225966530"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 05:59:53 -0700
Date: Thu, 2 Apr 2026 15:59:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/4] platform/x86: int3472: Add support for GPIO type
 0x02 (IR flood LED)
Message-ID: <ac5oRqLY1pNtIbLu@ashevche-desk.local>
References: <20260401203638.1601661-1-mnencia@kcore.it>
 <20260401203638.1601661-5-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401203638.1601661-5-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Apr 01, 2026 at 10:36:38PM +0200, Marco Nenciarini wrote:
> Add support for GPIO type 0x02, which controls an IR flood LED used
> for face authentication on some laptops (e.g. Dell Pro Max 16 Premium).
> 
> Without this patch, the kernel logs "GPIO type 0x02 unknown; the sensor
> may not work" and IR sensors paired with a flood LED cannot function.
> 
> The flood LED is registered through the LED subsystem like the existing
> privacy LED, including a lookup entry to allow future consumer drivers
> to find and control it via led_get().
> 
> To support multiple LEDs per INT3472 device, convert the single led
> struct member to an array with a counter.

Started looking really nice, thanks for the work done!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


