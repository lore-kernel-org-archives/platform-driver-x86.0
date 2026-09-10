Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA6F324B33;
	Thu, 10 Sep 2026 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053481; cv=none; b=PKCyot26+ta+RgFv2uvNKIq0VWGNLXTjMPB5dlvbd2Yc7eWY3gMh+Anp3BhuqGFfDeYoiJbY4ncbN9SOzsZx5m6aTrMWl3eA4D8VwBr4IqEsULw7gjzisSsvA4fdzR1YlTOUYFl9lNWqoQ/K/rsoRylpIZP2RscqY8JGiX9oq0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053481; c=relaxed/simple;
	bh=J75ZCteJVIm8a/tPfkkcMjI2JGpGsse2251EocSEgME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKetmV0h4pjHe6YN83+IWEqwFro4oKuFgR7dEx/VxRyQQ10+lqx/FCcEehAhul1YcMFX2aCqfniMEPdLMehJyLnBqaoMxvlclpDW9vgK9Dvd03vYoWVEbCOHFj+xnfzAqs4vMB9XpRei+4hwkMtiurbwkGYn/efmwngMWHZd94M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aibcJgeu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aibcJgeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789053479; x=1820589479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J75ZCteJVIm8a/tPfkkcMjI2JGpGsse2251EocSEgME=;
  b=aibcJgeumjAsx3c9gNqnU/eCfIdKJrpBViikczzMifBKLL80o97LCLwW
   QJ35EBgi663u4Z3FdvTmpfvoumhkhwD4LjySOUUI/BVIdv2cz03icB/uc
   r8x7sohMNVZkKZHLg2LBOLgtAs6TtXZ/+iw3pnbaTZmy0ykRebOBlzdop
   oxta1YPN5PjwKfd2svMCfFq1NnXIE1yaCjVpWOTPq4mwI4WSVJzdNycv2
   mn8iyTf50x3ucpDY9yUWEw3va754dF0JnkNuytzmV3Sf/fbZv2jk+HpP5
   AI/1dPRLr4qfU3PJRFOOSkGPvForRm4JdByhj/StnVzApF9iYLsXoHQjs
   Q==;
X-CSE-ConnectionGUID: uPvUech+SLWiQTLF/sin3w==
X-CSE-MsgGUID: JX8cih9+Qc6tF0Xvn+HBTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89439962"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89439962"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:17:55 -0700
X-CSE-ConnectionGUID: stbt7667TO+iatgueHGWTQ==
X-CSE-MsgGUID: O7UOUFTDQaC3w8tjCtLJ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="275811456"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:17:53 -0700
Date: Thu, 10 Sep 2026 18:17:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: "D. Manresa" <dmanresa@gmail.com>, Thierry Chatard <tchatard@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: add Dell Latitude 7275 to the resource
 conflict quirk
Message-ID: <aqLKHhzocfkDO_4m@ashevche-desk.local>
References: <20260831160754.9857-2-tchatard@gmail.com>
 <20260908161629.335223-1-dmanresa@gmail.com>
 <aqDkwTkAsvs8Escx@ashevche-desk.local>
 <20260909065104.15817-1-dmanresa@gmail.com>
 <20260909151027.GA2133376@google.com>
 <aqGEuTVpGolbznxN@ashevche-desk.local>
 <20260910094744.GQ2133376@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910094744.GQ2133376@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 10, 2026 at 10:47:44AM +0100, Lee Jones wrote:
> On Wed, 09 Sep 2026, Andy Shevchenko wrote:
> > On Wed, Sep 09, 2026 at 04:10:27PM +0100, Lee Jones wrote:
> > > On Wed, 09 Sep 2026, D. Manresa wrote:
> > > 
> > > > On Wed, 9 Sep 2026, Andy Shevchenko wrote:
> > > > > Do not fold, just add into the series this one as patch 2, for example.
> > > > 
> > > > Fine by me. Thierry, please carry it as patch 2 of v11 with Hans'
> > > > Reviewed-by; no need to change anything else.
> > > 
> > > Why can't I just apply it?
> > 
> > This patch on its own can't be applied as it relies on the one
> > in the other series. You can apply both patches, from that series
> > and this one. No objections from my side.
> 
> What is the hard / build dep.  I can't see it.

Build dep. The patch from Thierry's series introduces quirk table in
intel-lpss-acpi.c (currently none, at least in Linux Next), this one
is made on top, it simply may not be applied even if the other is not there.

-- 
With Best Regards,
Andy Shevchenko


