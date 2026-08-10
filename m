Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3BE37CD37;
	Mon, 10 Aug 2026 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786353622; cv=none; b=nuh2Ie6gJ/VnIiq6oWJq0XcCbQBXysDEtu3kpdN8W2imkK58K6F6VCnqwjwBOHRY8Jk2BXQAmWPrcB/9ydTh5pJTXdVnrtc0LSC4lwBg2F2ZkuwE6X7dNzSvfzQSmH5YBE19M/99OLksUle4N2WVBdRa1NIuWhrbYpqzBM1+5Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786353622; c=relaxed/simple;
	bh=n+WUIEHhWLIsasYysTZxXIK+mwIYxAbbYwshvy7RiFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqy1d/pC84OAlU1cfegjehynU5Dqq6jJWXf9bF3e4/CLnBSHUW4yN2IlFUF57UCJz0UbhBIVIrB2GLWq/HXgqtGZZYf3Mu0J2V3j5R54rjtFrip12ghCEAWHdED6BNg/2Nuh2LktZ0oezfOYWdb+fT75cYQbaBHIPkSL8KRU3FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q69Qb/Nk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q69Qb/Nk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786353620; x=1817889620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n+WUIEHhWLIsasYysTZxXIK+mwIYxAbbYwshvy7RiFc=;
  b=Q69Qb/NkgWWKqZTm1H+A4PsLTlPnNMgtd83skcPAIEXR0alLH/Lu5V0u
   2Js/7GgnWG1R+RH4vk9V3VVNRw4ABc6i4f7GVfJmHN7vlusqTDqQS9zlu
   ipOUvHbaThLsfGJ4MvqAAV662HT8pbZLM5s6X8Mq99D98bkhe68KR5zdu
   Q9wft0Kq2VHC7UJOERBhQ416DDSZMyIir9DxEGKLiX4o5tYKacSRSu5te
   JnwVkQBNkFuZyZKzb0nKSiquVske3Dc+SalnFix9OGSQR4SrrGdk40pnq
   Joa/mtyA2i6uCrnPGsKuUS3VXJ9LxZsonYb686ZB7Is2TB82nMYx6tBfr
   A==;
X-CSE-ConnectionGUID: gMfT2cTOQh+PCHE7X4A3GA==
X-CSE-MsgGUID: j+8vlnzHRD+s9HMdhtvGaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="87078621"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="87078621"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 02:20:19 -0700
X-CSE-ConnectionGUID: mDmBg7zfQBuOgs9WvRrbig==
X-CSE-MsgGUID: yCZ2mZoJTgGEHyibYtVUrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="267232918"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.127])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 02:20:17 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5F502121197;
	Mon, 10 Aug 2026 12:20:15 +0300 (EEST)
Date: Mon, 10 Aug 2026 12:20:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jakob Berg Jespersen <dev@berg.pm>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tooraj Taraz <tooraj.taraz@yahoo.com>,
	"Joseph V. Lavigne" <jlavig88@gmail.com>
Subject: Re: [PATCH v2] platform/x86: int3472: support the POWER1 GPIO type
Message-ID: <anmXz7JqZyy6xaxI@kekkonen.localdomain>
References: <20260729-sp7plus-int3472-v2-1-cdfaf97ac3ad@berg.pm>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-sp7plus-int3472-v2-1-cdfaf97ac3ad@berg.pm>

Hi Jakob,

On Wed, Jul 29, 2026 at 01:03:46PM +0200, Jakob Berg Jespersen wrote:
> INT3472 can describe a second sensor power rail as a GPIO of type
> POWER1 (0x08), which the driver does not recognise, so the rail is left
> unmapped and never enabled:
> 
>   int3472-discrete INT3472:01: GPIO type 0x08 unknown; the sensor may
>   not work
> 
> On the Microsoft Surface Pro 7+ the rear camera's INT3472 (INT347A,
> ov8865) has such a pin; without it the ov8865 "dvdd" supply resolves to
> a dummy regulator and the sensor never probes.
> 
> Define the POWER0 (0x07) and POWER1 (0x08) GPIO types and map POWER1 to
> a regulator with con_id "dvdd" for all devices, the supply the in-tree
> ov8865 driver already requests. POWER0 is defined but left unmapped, as
> no device that uses it is known.
> 
> Out-of-tree work approached the same rail by exposing it to the sensor
> as a new "pwr1" supply (linux-surface PR #1867 for the Surface Pro 9,
> PR #2201 for the Pro 7+ ov8865); mapping POWER1 to the existing "dvdd"
> keeps the change contained to int3472.
> 
> With this change the Surface Pro 7+ rear camera probes and streams
> reliably.
> 
> Link: https://github.com/linux-surface/linux-surface/pull/1867
> Link: https://github.com/linux-surface/linux-surface/pull/2201
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>

Could you resend v2 (or v3, if there are changes) this and cc linux-media
list as well? (The MAINTAINERS change adding that list isn't merged yet.)

-- 
Regards,

Sakari Ailus
