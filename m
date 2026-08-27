Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47EE37DEAB;
	Thu, 27 Aug 2026 20:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862749; cv=none; b=rLJYooBu5rr+zak86tL+ET5RAbZ8tn++NC3A3n8ejDcmOh4airsE+NpWoaATJvTKwDcsuKiO1TJoUlvHwCFeUu7XXFh5OWc/yoZ48KWZg8DAVEdwTT9JVqhR0OC4feUQf2obPfoo/tXlxNiZvzEXG/Bjo2cnzd6JLUUyAm68Bzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862749; c=relaxed/simple;
	bh=7Sj8lMmGcAd5DxlyEe4JSUdrAc2PhCi4KnDdgFgM8CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WI4+OyE+6zSlsDVNxU8Fh06aCaLAtVIvhBqrqtuTmkNTa0C5G2WAkV6L66PViNz2OppdP3dLinH63+rbbBagaaonHe9JvhCPZ6Wd4Vw32zjhD4ifjmxQ7ahdSTJ/N4j5PtO42/xVkIh5V7czdbcOinWEsPhgcq8ppctI8INVW4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZM9gMg3C; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZM9gMg3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787862745; x=1819398745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Sj8lMmGcAd5DxlyEe4JSUdrAc2PhCi4KnDdgFgM8CI=;
  b=ZM9gMg3ChJnSATgW86B0YlKk+jaAhEoIfj8AY8fnE1q1bEqIiacK+y9/
   v55NhaFsEBhU9mMAzTmnW4GLbYz9sWBZ7yY0h9fa/KwK53KoQIKqCpln1
   twSBppRgq7b/Hl1FjfJdG13/mz9LSyVlBtTVfoUAVDfrTFeg+Fmjp8N2N
   teFHHlZDmby1Vms4DiY9S1BFDKszrEEa0YDD3ObDrTVEDoeQgPsWInOtp
   P8um2J8/3R5fwtUNjSrEOFqCifC7rhlaydqqGUa1jRcuJk8OVGlEJBGE0
   zNwUrrVUKmg7nvlGRalCJyB8H21GvB2pbbcGb9t8H4UK0jQjTunqIscYZ
   A==;
X-CSE-ConnectionGUID: 30drY98mQNO6fIFL8hvV3Q==
X-CSE-MsgGUID: fng9Z0QbSOGa1c36qUI9Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99040561"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="99040561"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:32:20 -0700
X-CSE-ConnectionGUID: tAwiDc0+QT2RI9ERGRpuVQ==
X-CSE-MsgGUID: Tb4IkCtKSn+0Bdbkf9M+gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="263680387"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:32:17 -0700
Date: Thu, 27 Aug 2026 23:32:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v9 2/6] platform/x86: int3472: tps68470: use unsigned int
 for GPIO lookup loop counters
Message-ID: <apCez6MBK9K5R_M_@ashevche-desk.local>
References: <20260827201611.99825-1-tchatard@gmail.com>
 <20260827201611.99825-3-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827201611.99825-3-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 10:16:07PM +0200, Thierry Chatard wrote:
> The GPIO lookup table loops in the probe and remove paths iterate up to
> board_data->n_gpiod_lookups, which is unsigned int. Use unsigned int for
> the loop counters to match and avoid a signed/unsigned comparison.
> 
> No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


