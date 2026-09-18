Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA0351EE02;
	Fri, 18 Sep 2026 18:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755877; cv=none; b=Ann6ZSCNsRX9Ozrb2/RvZzQdYHqKIDlHgEcZxlRpOWl+u/FNrYqAkGt2oBxj2NgYkDVDDtVkxNEEo74bwSAKliXqYaQvhsPh2sFFw84BibbjA8Rn6THaXK9FkRDzUrke8gdN0FZN+BXZ7rrcRTLYY1kiIpTBvExiOFhnzwzetIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755877; c=relaxed/simple;
	bh=7dPcj5UUnczYNg8wepPU0myCdaeAGNORlbBDHjag+bA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hOI+sUYtiVoIeR4jit/qZ7yxVilrdulduODI65a0AmmjLsl1LX7J12izO5E/6j3WLziyPi/HH6goTsyLbuPiS8BWZMyIEdz3uOu6VB2YDvUQ2Nn/P5H7qFgHxImuZirhryQ/NwHAaWFSXrh+8tAgHyPMDK2bgRdUqP9vzhbSaTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HuhlbooD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HuhlbooD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755875; x=1821291875;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=7dPcj5UUnczYNg8wepPU0myCdaeAGNORlbBDHjag+bA=;
  b=HuhlbooDMjq4edZFHgPM6eBfhpXB4rz7+DClwP5TL7nxrqhZx4v8qmxT
   +0IDIXqXYWPZ/TOQ20BGgfLesE8Z2cRhTNtbCLF+f0rNDckADNmx4xGKQ
   n0uIXergOE/i3vfXgs5+k+hmV8ucyYM4309r2ETTOvWPsC++ltlW07InM
   Ya3KnzV/Bvw7s4eklWr9k8qLcErYtgrnldSzNdTqmaPAlB0JVseDI9Q1C
   Tbbk2qwyrHoPBGl3xMrhs7gXlwD6/K+2XGn6Ca2WGTS342Yh5/ELONAhU
   bhSEmfJP2LtUs1zMM9UOlUlQvwswiEBxXx2skAG6J6o466IcoNpvHwQ1f
   g==;
X-CSE-ConnectionGUID: ARNljGKkSXeSFtgI8dJ6Gg==
X-CSE-MsgGUID: jzoAuaW8RHq691kAem7rLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100947358"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100947358"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:24:35 -0700
X-CSE-ConnectionGUID: CZm3x/XxQ1my29O0uYQrtg==
X-CSE-MsgGUID: U/bXlhnpRUykb3e/KCbnNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="271860356"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:24:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Suryansh Singh <technosfan14@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260823072407.74512-1-technosfan14@gmail.com>
References: <20260823072407.74512-1-technosfan14@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add OMEN board 8A18 thermal
 profile support
Message-Id: <178975586858.29716.4185622384592340112.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:24:28 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 23 Aug 2026 12:54:07 +0530, Suryansh Singh wrote:

> The HP OMEN 17-ck1000nw (board ID: 8A18) supports the existing
> OMEN thermal profile handling.
> 
> Add the DMI board name to omen_thermal_profile_boards[] so that
> the existing thermal profile support is enabled for this board.
> 
> This enables the existing fan control and platform profile
> handling for 8A18.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Add OMEN board 8A18 thermal profile support
      commit: 6241e07ab561fa017b0eb63f785b98aefcfb2477

--
 i.

