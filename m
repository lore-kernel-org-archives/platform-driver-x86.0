Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9C65221EE;
	Fri, 18 Sep 2026 18:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755934; cv=none; b=dCPokTRUiw6JXOUqe3j6muPUD/DuWxj16IZRcmR2yyLpT2EvpbOZnUjLkh7kSL68zesNnCT0iyK/9lGDMGiT4RMtzv04/dLSJ//sl9j7M4+KFtp+/7TYc/yco1rYb5jTdsuqXTu5GFPCmrq7XFBWX9z+7xfkVSG5mhSCcpm42dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755934; c=relaxed/simple;
	bh=eNa7I3dmMlynaHIPyviqsqXDEeOtWQgDo13w9JU1a0w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pYbnRLzKUV4oat97i+dWmTkCeUbicGM0gX3qx2wNgraq0EBkUz8P5oLtyy3HtXLYDd3+Wwaet+mfa4SOpL4jg4jGqxUDoWlsQQyCPU+f2QVAzMx8DnuJgRJ4/r4AWCiLemNWDtO8j7Z6JyPUqlFyLjE78MbJ3Y9CHkSP8ozRlws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X34TnBm0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X34TnBm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755932; x=1821291932;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=eNa7I3dmMlynaHIPyviqsqXDEeOtWQgDo13w9JU1a0w=;
  b=X34TnBm064hRxecOorQcXNv3z8FurcEcTaPjh7TqPABB58XoN4YjeWh2
   pwWZbd0HgIq8/BJuH7yq5o8mttqNrBDenGoS5Y+1lqI1Bc1Kt4D9WentN
   gt+jQJKYS8NHKYSgO2Tm9swgp+Z+NwiOnic00iUizBT0MdGg/CUcYQ65U
   2/Jq+f7sbswiDuelurLjHQXTUrh7VnE9eELFbzWCCclDpALPV8XK7Wh7g
   h7xeyeSALSFMZNOdjtLloJ2UxyXQl9oUfIEN+OMBOzY0Dtev9/lJk8Ru/
   9iwmRwNWmZT/SyhcacEDMJrRD71vC0cA5wb3xD3YYjEGpagsY8ki+tWDo
   Q==;
X-CSE-ConnectionGUID: w3CGq40IR/uOapMgZNZFfQ==
X-CSE-MsgGUID: llpmKnTiQhyc4febxdS9tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="92790048"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="92790048"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:31 -0700
X-CSE-ConnectionGUID: 7fsqFhylT+OTtKmxCVRRHA==
X-CSE-MsgGUID: 2JWOrgB6R32XiG7zku3ZPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="268252815"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260827155053.2334792-1-dave.hansen@linux.intel.com>
References: <20260827155053.2334792-1-dave.hansen@linux.intel.com>
Subject: Re: [PATCH] platform/x86: int1092: Mark as orphan
Message-Id: <178975592500.29716.14379413806003885137.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:25:25 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 27 Aug 2026 08:50:53 -0700, Dave Hansen wrote:

> The email for Shravan Sudhakar is bouncing. There are no remaining
> maintainers for int1092, so mark it as an orphan.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: int1092: Mark as orphan
      commit: c1a82c9ff5e7432f9046d32f3636ada54019ef98

--
 i.

