Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110AC25B1DA
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 May 2025 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826175; cv=none; b=bcIw1iy8duze2cVHzhEYHhzUwQIuOF5aGlDIG78m14Q6fyEFghCqTwYyhbKYAsl5D7jwxmEyfRS9FSZ6PQax0zLxfYFRHVAqKdON1H7PlVMHTXl1T2E3d7UHYl92upWPz/D8tfQKFjZs+2Cmu7TuHu0T1TTEc3OuKa15qV6P3gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826175; c=relaxed/simple;
	bh=WbirEHXjdseDtnwCQYFlXfEFqTn6IdIp0wcKY2wQSao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=clo3T9j920lvEMMlnQQv7ebL6On2J/x4U23AS0T9x32+TjZwm3cfOGgWXeEV9p0qdaRDcvepgTnMve6Fcj4Kk4HAIkLGBJsCoJqKi9QYkqHUKNjbAL+RVk1s4XE1Y+SbR9pHDqd3jZaMPAo0Rh09VmCwag7x3l2lkb1zGtEGF5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkGgbOAB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkGgbOAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747826174; x=1779362174;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=WbirEHXjdseDtnwCQYFlXfEFqTn6IdIp0wcKY2wQSao=;
  b=VkGgbOABUUmvxCuAsI0jss0pyHj0cNKIzDjZRkAIVcbHnBATC2k2Etel
   flYaERys6X381/WpeBreUJnlUgYs6CSJcwKWVTvl/OspabO62nJoU7B0V
   HD8ieHT911keMe3O5pVr/eFkax3H0ZQHEnRDWBVHFs1mmZfHZyGBGnvR0
   VdqgB6QvT2JC57dgKsaBZUvkT6pkCU2Qp5M3m72SmFA/6065yHCZu7QX8
   p6y2bPi+2MIA6sCgdDKX4JX+yoJnAcYR2eWhAqQ0HLWjw3y74cno8ShXA
   dtpfFAw2swh936XIWNQgphSwOJbvl1P9vbFJDX9eK5RRknEtLViDRyQJB
   w==;
X-CSE-ConnectionGUID: Dwn8XZQ2Ty+OT0vrb/LAFQ==
X-CSE-MsgGUID: Ix/txl0KSzyBq779KdHv0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52425926"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="52425926"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 04:16:13 -0700
X-CSE-ConnectionGUID: xU+jyFqyRDmdXV5H89ciYw==
X-CSE-MsgGUID: VzbEYjRAQN6U2SXVvdPpYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144013340"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 04:16:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 Jelle van der Waa <jvanderwaa@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250514201054.381320-1-jvanderwaa@redhat.com>
References: <20250514201054.381320-1-jvanderwaa@redhat.com>
Subject: Re: [PATCH v3] platform/x86: ideapad: Expose charge_types
Message-Id: <174782616614.1966.2869615592949298081.b4-ty@linux.intel.com>
Date: Wed, 21 May 2025 14:16:06 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 14 May 2025 22:10:52 +0200, Jelle van der Waa wrote:

> Some Ideapad models support a battery conservation mode which limits the
> battery charge threshold for longer battery longevity. This is currently
> exposed via a custom conservation_mode attribute in sysfs.
> 
> The newly introduced charge_types sysfs attribute is a standardized
> replacement for laptops with a fixed end charge threshold. Setting it to
> `Long Life` would enable battery conservation mode. The standardized
> user space API would allow applications such as UPower to detect laptops
> which support this battery longevity mode and set it.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: ideapad: Expose charge_types
      commit: b2012b38080e2f92d43eca59e8249c174a27527c

--
 i.

