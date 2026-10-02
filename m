Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F377C25D53B;
	Fri,  2 Oct 2026 13:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948050; cv=none; b=TG19IQ9SlQKZ34JFbo73FsR8eL78JWRwLoyhxiYvm6ycUxQXIApnXpexmb6W3eilCFdwgpfmpSEqXfPR7YtopID5s8gYimeHNkFLXvTBGk5dQarBbkOzWxnygObcqzQSwqtCeSJCwZbPF/CgTV+PHqEk5WVzCs87c4W9opvAnI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948050; c=relaxed/simple;
	bh=XozVi7WiIXVk8ILyEKPp2DcI9W9ZNiD0XVE5JMem6NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/mybOBVfoRNmWSrlYMGOEdmz+2aTKZVHlAsYemt84ohll8xoGrUUYUxY3KFzGuKvRq1ESz/JZqa+EY0DSESfA9Np2T4JdgqN0Hxk100Mv7cS8aJrWvti1ETiJ5StJDA8UlMlpbTf9KwfmvpkrsG+39ii2ZpeF/1l6i86QYc4zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLd0WgB0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLd0WgB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790948049; x=1822484049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XozVi7WiIXVk8ILyEKPp2DcI9W9ZNiD0XVE5JMem6NQ=;
  b=BLd0WgB0lRZxig0vFbsTFy/npb42wLqU2M+20voTw0MtTkERn+iWoTln
   5yG3iO+TJ7OKzkWT/z+XCaUkyn3ltnXhnsG3LagSfg2yBfpeoOVYX0fNW
   ETz540LsNRoMDa/JssSSQFA39HYRtnjhEQSxzgRHqjv8c4TdLjcJK4YVA
   m5HFYJMaO/PiihqB2ygFCFH1t7ERi2GY1oqJ9y+qsMF4er4J8leSlAauU
   Km+hDECSB22CqJom/EwhIPTihEpuM7XzS66/JsV8NYzaNE7NdWbDHeZ/3
   GMCfPQaOgYA+MFHh2N28mRowZAwsUVgYVXwJ5QQmsblMl8j3SKGzweXTn
   g==;
X-CSE-ConnectionGUID: APL5aOgQTWKgCe5BvdW79g==
X-CSE-MsgGUID: eW/rIsyTQCKm/wG5eMhVNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="102235346"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102235346"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 06:34:08 -0700
X-CSE-ConnectionGUID: DzA1hplFTv6KZfh7NmQ/6Q==
X-CSE-MsgGUID: F4Ubsx5xT4yXEcAgW6pU+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="274340234"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 06:34:04 -0700
Date: Fri, 2 Oct 2026 16:34:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net, v.vitovt@gmail.com, dmanresa@gmail.com
Subject: Re: [PATCH v11 3/9] platform/x86: int3472: tps68470: use unsigned
 int for GPIO lookup loop counters
Message-ID: <ar-yysg-WBq47QQE@ashevche-desk.local>
References: <20260930214321.600863-1-tchatard@gmail.com>
 <20260930214321.600863-4-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930214321.600863-4-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 30, 2026 at 02:43:15PM -0700, Thierry Chatard wrote:
> The GPIO lookup table loops in the probe and remove paths iterate up to
> board_data->n_gpiod_lookups, which is unsigned int. Use unsigned int for
> the loop counters to match and avoid a signed/unsigned comparison.
> 
> No functional change.

> Assisted-by: Claude Code:claude-opus-4-8

Assisted-by: LLM

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


