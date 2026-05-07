Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813FF3FE35F;
	Thu,  7 May 2026 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163948; cv=none; b=TS+JZ3CZCkXEEWcW0moNAaGlBo3pHpiLeewfmDnQGCqV6jkXrxcWX0r1cIlpH+aD6S7MFAls0UNR2RTl+xsNnrerm4ZSPTv2y0yj1CqFhXkyL5r6ZIzGxKXQQgYEjlk7Zxq0XTCeLLVF0XyfzAWUXaE3iobRry8kH2tlazRyENY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163948; c=relaxed/simple;
	bh=hG7M6SFR8uJ/bqN/lv2JR75EAXjKQxaDinip30TjReY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q+47+wWj+mOa4I3JGEZ5r3RWr69nIx+lW1hccxhhoLkKF04mnvqBLikKIaIO+I+d0saSlzVHwrCMmQoljH/e+IAZrK29cAKMB0eNiXZIu3toa9d7uLytCfLmQeuW7bn6m/eb1S7YhilgU3jZnkQt1osejf7kciuy0zC8dd06H04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8Dzj8Nz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8Dzj8Nz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778163945; x=1809699945;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=hG7M6SFR8uJ/bqN/lv2JR75EAXjKQxaDinip30TjReY=;
  b=A8Dzj8Nz4HWnzXT1cXWmhQe9JiKGeZatjHyXHP/XEiRg8OFv1YmQD4sB
   jF8b0elo/RW3SZFfLWFNzrJIaSsnpJcd+GZOGL8juL+1HPi0hrDHFzDVA
   uVdjMD3mjArBJOcA9fkLKiFuJzOlcbN39WGKq0hhXoe86WGcrJxQybfFY
   sa5WK4xkwXYttp1cjss+3QF/zvOdfCAAz9zpfsAnxJvBDZ8bm37YDWv7M
   9IzOLidUy9qSUWYFI/pR5ZXbLAUgXPSW3vDpk/KQ0wRvoqSMCCYMiXaNz
   wY5rEvjQ/lNdpkKfilQuRFScIUmVlq+cF6helRu5aO3NVxriIR6aWliWi
   w==;
X-CSE-ConnectionGUID: pkOoP1fJTOOJ/+IdsirYpA==
X-CSE-MsgGUID: cv2YyA1iSeaQlrHXjnLyNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90574439"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="90574439"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 07:25:45 -0700
X-CSE-ConnectionGUID: xkJf4pRzS9iYWG2vE955WA==
X-CSE-MsgGUID: ChmDzrcbS2ybCuIXSNQYxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="232122307"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.116])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 07:25:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260430151103.1549733-1-srinivas.pandruvada@linux.intel.com>
References: <20260430151103.1549733-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2 0/3] platform/x86: intel: TPMI/PLR PCI unbind issue
Message-Id: <177816393864.9113.5263877316441132793.b4-ty@linux.intel.com>
Date: Thu, 07 May 2026 17:25:38 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 30 Apr 2026 08:11:00 -0700, Srinivas Pandruvada wrote:

> When VSEC PCI device is unbound from PCI driver interface, PLR driver
> causes fault. This needs notifier support for proper cleanup.
> 
> First two patches are required for the fix in the patch 3/3. Hence they
> also have Fixes and Cc:stable tag.
> 
> Srinivas Pandruvada (3):
>   platform/x86: intel: Move debugfs register before creating devices
>   platform/x86: intel: Add notifiers support
>   platform/x86/intel/tpmi/plr: Prevent fault during unbind
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86: intel: Move debugfs register before creating devices
      commit: ad3bff944c0f4f2e913298a9664391af32f87491
[2/3] platform/x86: intel: Add notifiers support
      commit: 57c347a2e2473bfb5c1f1132a3209c55efbe640b
[3/3] platform/x86/intel/tpmi/plr: Prevent fault during unbind
      commit: 14473e8c4e97d51eff9b2f384ae696f7a32f182b

--
 i.

