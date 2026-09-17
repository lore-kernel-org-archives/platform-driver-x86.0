Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85584585989;
	Thu, 17 Sep 2026 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657487; cv=none; b=XjJueW23LawNGjNtokl6zmCkmJXll1wcLUkqcb7WMyMsuvM2yEUXkX+SeJlqkoBsFlhNMMCKHXVwvigQRD0gZ/0USBA6kWCaMEwO631+lcIUG/HAVHPPLgEwaODaCJWB4/dLiUGj9slF2BAnPW+yWG69jpFT6u8076xlwVtYvUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657487; c=relaxed/simple;
	bh=gEqQ7udERlY5WEVQ8KerG8FZgNUI/m67FqyuSdT1Org=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SvaukuiryCZAt+hhT0rSQCQkpfVe3uEwVZnNKDsLvpdv7FTo2PBxXN4W7dFfzOSusg3gXz838+ATrhsOOUqIwugx6EYYI+6OBe2DjYzYbvv2h8t6r2U66kb3cf9sL8u2HaY8GXc4CtJgJ3LZAPni3KiKNqFndQo1LyfW39Usg08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJ7yCHmJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJ7yCHmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789657473; x=1821193473;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=gEqQ7udERlY5WEVQ8KerG8FZgNUI/m67FqyuSdT1Org=;
  b=cJ7yCHmJyR6CG7WTuGLnBCgNzDjHK6pJpJysqMCCQlxNygTUBa7uvOiB
   IJj8MVjpx0mbYBf/2IBJFZPjnFYWYZTkSHa9FafpMPDF1t8rEVrj2vNgs
   Cxe0L7wa8as7iQ8iJxOgzAZ5mofi9L9r3McyOFIGnWQc1FOTWQo3xebUq
   oeACIvlXNWjo9VsPSwsbz7Vlfy4slY+idIrkNDAOct9bhkyATOgbbZ7uV
   p46216jNLfF0RQ3TDDLfsCuPB7culMbTwZmj1dZJFg3cpEBD94eMFsERb
   UigS3LZNOjTAgLKkuMcYrmssgAWu/q/NGON3S32UUA4eB0IkK+707po5K
   Q==;
X-CSE-ConnectionGUID: 0qPWfSieSCeN9+GMdI8Zhw==
X-CSE-MsgGUID: lOnThV5PSAqJw/bIMKGFZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92597518"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92597518"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:04:24 -0700
X-CSE-ConnectionGUID: Rsh6lF3oT3GHCKjXZArINw==
X-CSE-MsgGUID: 6nZrAugRTumnJz+Z8+Nlsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="279078841"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:04:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: David E Box <david.e.box@intel.com>, Hans de Goede <hansg@kernel.org>, 
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260819173804.1184250-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260819173804.1184250-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1] platform/x86/intel/pmc: Add rugged Panther Lake
 support to intel_pmc_core
Message-Id: <178965745740.22350.4851475547797127227.b4-ty@b4>
Date: Thu, 17 Sep 2026 18:04:17 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 19 Aug 2026 10:38:04 -0700, Kuppuswamy Sathyanarayanan wrote:

> Add rugged Panther Lake support to intel_pmc_core driver.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86/intel/pmc: Add rugged Panther Lake support to intel_pmc_core
      commit: 15961651876bbb63547785454e49c8a2e30ae2eb

--
 i.

