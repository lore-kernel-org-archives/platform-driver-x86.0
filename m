Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361334D9564;
	Mon,  5 Oct 2026 18:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791224705; cv=none; b=TQ8391u1rhbZzNR3s+KvXFoexGelRSn9ITrtnwD/5yt5cKyiOaIWLU4+LsI7FidQpQ6GMpOHtjMrsZqMosZjly8nOdeofVDxla8kNRXt4yoPCE0/aPiu9zcrDqElGkJgjr8y70dy+WfQod+fMgIkOdGiDYC0PinDzqSJhZROHJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791224705; c=relaxed/simple;
	bh=FNQbdBQnjFVM0/YrVE+Zwfb9a6ORdXA88DXR1XbRXV4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uJ3VYp3XYtYJSNCYYR/wcRoU8iTCEDB8OpHfPygZukTggJWYEKQLZdEvxpDLGpBlIyA6Pjgp8QkQ6gpxo6aH4q4yaLy2bmO+ODfbGAXmXgVe5LGVCxSnL8ypCny0KE2Z9jvUOuNyOgZjgvdx49Kue7WwgeMZ9dBd7KPJn198Wc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWOrg+GF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWOrg+GF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791224704; x=1822760704;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=FNQbdBQnjFVM0/YrVE+Zwfb9a6ORdXA88DXR1XbRXV4=;
  b=LWOrg+GFDNUk8JpIWkzIPQoWa7s3INoBx7208ebw3ykyv8QEjB+RtCy4
   rT7ik+6bIWwXDoT4eznH/vDI3bAaq2i72x6AgQuCza4h1waLaO67zVolD
   CsqxvIyHqUtadBBAmE2GKmgdG+mluz3hYfxlDkiaGYPHt6voBv4ut8ov/
   w3Ljr0ItbpbWdDVjXYvRzcXj88fdPDLhl38D8wgv+JIPcn8B5+meWCOpg
   l+sKs5SyPvxAcKdaVc60xmw6Fa22zrOpLQIJOzaPIlHeOnyDrPzHOrgLD
   dZQX9p+t+KRqO5RZ2ppqwp/2u7Bx+gTPTA/xJpigvXAC3UWN0TRTfM8L6
   Q==;
X-CSE-ConnectionGUID: bX9CviJqQuOeN1H/0sbZSg==
X-CSE-MsgGUID: sWZGQm5+TqO1dGzsbvMrug==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91039178"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91039178"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:03 -0700
X-CSE-ConnectionGUID: 1WaBHyBbSBaQbUdBPJVrnA==
X-CSE-MsgGUID: JbHgK934QIqRSUbwDCXkTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="280628602"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, jlee@suse.com, corentin.chary@gmail.com, 
 luke@ljones.dev, denis.benato@linux.dev, 
 Justin Vargas <justinyvar@gmail.com>
Cc: W_Armin@gmx.de, krishna.chomal108@gmail.com, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260921021720.5976-1-justinyvar@gmail.com>
References: <20260921021720.5976-1-justinyvar@gmail.com>
Subject: Re: [PATCH v2 0/3] platform/x86: Remove unused
 platform_profile_support variables
Message-Id: <179122469490.34664.7385984222940811548.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:24:54 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 20 Sep 2026 22:17:17 -0400, Justin Vargas wrote:

> acer-wmi, asus-wmi and hp-wmi each set a platform_profile_support flag
> once their platform profile handler is registered, but none of them ever
> reads it. Remove all three, one patch per driver.
> 
> Compile tested only, as these are pure dead-code removals.
> 
> v2:
>  - Extend to asus-wmi and hp-wmi, one patch per driver, as requested
>    by Ilpo.
>  - Rebase onto review-ilpo-next.
> v1: https://lore.kernel.org/r/20260902193039.21725-1-justinyvar@gmail.com
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
[1/3] platform/x86: acer-wmi: Remove unused platform_profile_support variable
      commit: e38e2a7ea4d6978a39a087acb5246431d7c4febc
[2/3] platform/x86: asus-wmi: Remove unused platform_profile_support member
      commit: ed73d513f302cfa500c65d05e0dde5c91d5de008
[3/3] platform/x86: hp-wmi: Remove unused platform_profile_support variable
      commit: 69674669e5b12b2c5158d8d46ee704195d2d3461

--
 i.

