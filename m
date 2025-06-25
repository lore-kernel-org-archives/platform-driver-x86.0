Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDCA223704
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jun 2025 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856634; cv=none; b=srwaik7h6blmksfBYS9y5Keq5yLUk42u+gTUXhhvyOsBkH7rp5eePnwBOdqXqyI4mZZylBNDuJNB7A6X59H3GFRiVnB9rYpJYx42Xph1i+CusjvIXd6RLVJrL8ex8jhNPu4pacjaUKmRajGU7kZE0wxlahvg1PhExsBmy55aUHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856634; c=relaxed/simple;
	bh=Ioq9KydK2Wke02GU6EjaRqKyvBP11Mtp7oXj1BiAleM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BZR5FUKCUoSqHy7O+h3kyuYUgxpHMiEyyVHfxMwmcFoa8GLpW/gBwVlV/dZk2Ysqr2fnKEC04iuI2c4euw9Q6+gwRvVPzEiZNaWu1IsLDZdEX9Yy2M4bm5hI+ltcr3kpzQb/He/F4AS6xYTGJopLhlqaKvwwJHIpyMCI3w3OeII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXScnPan; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXScnPan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750856633; x=1782392633;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Ioq9KydK2Wke02GU6EjaRqKyvBP11Mtp7oXj1BiAleM=;
  b=nXScnPanBL3hiydz+yxXEpRZGDpeTqHA9q+nEZbmA/JCsUuktQWxqjGV
   Zaw2rZrW8hkMWYZaBl12ORDxj3aSvDTQbXmtrxsQ2m14HPRPUGbqu3Hu1
   b2WL2NSxCh9yRJO7L7MRXAdDxk6I8Ok5Okw0YYsLLy8TSRfOKITyzTLYz
   xPnaC9AaIfkdht+xBjlLolOBOMPJL9BtZ8wQR+953InD5DNtSL+fo8M7G
   YxMrPWfoJFqHPUJbFXSAo0RYQsDbCtFnQli78LYcB5KoLnTIMBhTvROGU
   4pZ5PE3ZrZPRLoOpuRmRo/zd1bJShaSlR3Vz/1/Bu412yxyqGAgNb14xb
   Q==;
X-CSE-ConnectionGUID: vCmxgNxoS5iEYdTJ9oW4iQ==
X-CSE-MsgGUID: 9DYl3i6CTZKYs6K/OeMjnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64185321"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="64185321"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:03:53 -0700
X-CSE-ConnectionGUID: AlH/AfJ0QsyNNjjC+zzoAA==
X-CSE-MsgGUID: MzbhRkfgSGuWBaKzslNP2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="151633902"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:03:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: vadimp@nvidia.com, shravankr@nvidia.com, davthompson@nvidia.com, 
 Hans de Goede <hansg@kernel.org>, Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20250619060502.3594350-1-alok.a.tiwari@oracle.com>
References: <20250619060502.3594350-1-alok.a.tiwari@oracle.com>
Subject: Re: [PATCH] platform/mellanox: mlxbf-pmc: Fix duplicate event ID
 for CACHE_DATA1
Message-Id: <175085662675.8098.10072798447065686218.b4-ty@linux.intel.com>
Date: Wed, 25 Jun 2025 16:03:46 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 18 Jun 2025 23:05:00 -0700, Alok Tiwari wrote:

> same ID (103) was assigned to both GDC_BANK0_G_RSE_PIPE_CACHE_DATA0
> and GDC_BANK0_G_RSE_PIPE_CACHE_DATA1. This could lead to incorrect
> event mapping.
> Updated the ID to 104 to ensure uniqueness.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/mellanox: mlxbf-pmc: Fix duplicate event ID for CACHE_DATA1
      commit: 173bbec6693f3f3f00dac144f3aa0cd62fb60d33

--
 i.

