Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F233B6C10;
	Thu,  9 Apr 2026 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742079; cv=none; b=Yat3oWKbHxuyRtpZXB6ZRcytUauJsl++uxOn334uxrKLwTiZisczq6J+cZzLm55QXnL7cUkgy8wcVGGhcgfODGlf5TmmpYNrkjVInCCk8WKC9SLY99VYIEmp3wPPcfSGatqlIVC6f0jaan3KwMqsGDdLzT6cda6E+OtQQWHtJTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742079; c=relaxed/simple;
	bh=RrLq7Inzj3teQAEShz320yoogxq5pWDWAxSs0udhq6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RvDCkx7niGJSBf3AtkJT1R1qseFJ0SX6reyecsOQkzbJlln8xxFvaq1WHir+MyGpVeRmW6iDaqk85ltNr5Q0/cdluj9anSHKwrOsQXUyATqUr53ghogO8beRNLV9jsYk1potIbt7CcEXudgPPx1uToYZoR2k2iTUhnO+FcHVZVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGmgFO4h; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGmgFO4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775742075; x=1807278075;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=RrLq7Inzj3teQAEShz320yoogxq5pWDWAxSs0udhq6o=;
  b=iGmgFO4hmMQphTl19Wt4V7Zn/77DwoKQa6eDc2alethi5efH3g5uSgUA
   KUz/9FwlbTv3r7gEMb9i/5RZccbritlYm1xKj1/3nNBmGx0eoyhTJQ208
   JMibxk7rq+dTkwYkEeiYAIUFSMZ9TRZuCMJCeATrvezYCr98cGF7BqheN
   gfbVRGpb9oykGfM+Hg6yYCKtGj3B/xtCaTupF/abHt6Om95e0Y09lHAnq
   B895w3OwtSH9dJRrH/Cw1XDsdfPMIR7YBc9CfR9vYE6oBCx7kwxBinRp4
   33I0G+VXVsuBLTmTyQOU4M1ux1aRMpo1Z9fXmOO5xT4uOqRogAJRneIQ6
   Q==;
X-CSE-ConnectionGUID: 4q4zcQkHSeatwP+wnIV9pw==
X-CSE-MsgGUID: SIqsPRO0SaeLDDzi30egBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76708207"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76708207"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:41:14 -0700
X-CSE-ConnectionGUID: RiKooekiQKOTMPup64qKcQ==
X-CSE-MsgGUID: uMtiRjdITGq+pg19uHD6MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="233756819"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.197])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:41:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>, 
 Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Hans de Goede <hansg@kernel.org>, Andrew Morton <akpm@osdl.org>, 
 Abhay Salunke <Abhay_Salunke@dell.com>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
In-Reply-To: <20260403134240.604837-1-pchelkin@ispras.ru>
References: <20260403134240.604837-1-pchelkin@ispras.ru>
Subject: Re: [PATCH] platform/x86: dell_rbu: avoid uninit value usage in
 packet_size_write()
Message-Id: <177574206416.8529.6187254162233086549.b4-ty@linux.intel.com>
Date: Thu, 09 Apr 2026 16:41:04 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 03 Apr 2026 16:42:39 +0300, Fedor Pchelkin wrote:

> Ensure the temp value has been properly parsed from the user-provided
> buffer and initialized to be used in later operations.  While at it,
> prefer a convenient kstrtoul() helper.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace static
> analysis tool.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: dell_rbu: avoid uninit value usage in packet_size_write()
      commit: f8fd138c2363c0e2d3235c32bfb4fb5c6474e4ae

--
 i.

