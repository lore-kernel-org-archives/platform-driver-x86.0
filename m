Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA033B05A5;
	Thu,  8 Oct 2026 17:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481039; cv=none; b=kBU8LPEEIjOeZJzWLfHCtHlkKZSyt9RfRaniPJwOxfw+wtyi/fGbCUEn2c/LboHY8XBjZURw3dT0qxxpqi99Adgy9XDSAjskLPbIb8H8CQ1dQL7PIjOmgpTsJoK8mdJbibY4MKT6xD3FDvg1+2Gdad9xx+lBfJWNLDo2w5bkaAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481039; c=relaxed/simple;
	bh=l9biZ42ciHgmp6AyO4QD+6TuVAF+G58zBEmMDzvB8LI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XWsjAuPdxNEtjIORfn2zRnSdVMw8jglmSKsZ28xiL2olv0nwxxoSkpJiUmL1uqMjqOsld7CuZ93Ch0L9MDRU8NRc1Q9m1tMjp62m/LLeXHe6APwMrrVxLo3kvGp34AtMQPSr3attazUmyLUUvTxnOpQ0Puut51qPp6krBz/AM+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSRH9aSn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSRH9aSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791481037; x=1823017037;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=l9biZ42ciHgmp6AyO4QD+6TuVAF+G58zBEmMDzvB8LI=;
  b=nSRH9aSnLvQlVsvTwo09Al7cfaEU24AEW/+DCG4+eq/YyPW4zbSn57Xq
   dkwA5HpWzcgmM6H7rZweJAT2I86C2iOB7QK1t7LiNTQWjvGKmKDjG1vXl
   Iaj+ain6MWFE8S7NbvttYV/qkpKEcXNLd9VcpPVYSvQv59wClmwD6xMCe
   qBvhiWEVxErFu2qM/5oQIw4+LTIVReB+hIgIZW2Pj+F0fobExaLEqNlih
   sOse8C3SSU/RhhC0XU2x5zdqIPVwAxUnGlRhIN30QvIFfwsEKmbk+OnSl
   IhKPql8wX21ESUcjMQC1WeIw7wvbBYVDoNRDl2muwvdyZ14NjqCQBXPYe
   g==;
X-CSE-ConnectionGUID: OS1aQFt6Qt2dqbgkuWkYZQ==
X-CSE-MsgGUID: ygrlrAFmQjiGVhI72kZzsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="299251"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="299251"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:37:16 -0700
X-CSE-ConnectionGUID: fTYn7KNoTQC21Js6kQuBcg==
X-CSE-MsgGUID: eDo21s84RFeAUzrd85oFlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="428708"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:37:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, Sanket Goswami <Sanket.Goswami@amd.com>, 
 "Mario Limonciello (AMD)" <superm1@kernel.org>, Rong Zhang <i@rong.moe>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
References: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
Subject: Re: [PATCH 0/5] platform/x86/amd/pmf: Clean up undesirable
 function outlining
Message-Id: <179148102914.29028.5928287984821543239.b4-ty@b4>
Date: Thu, 08 Oct 2026 20:37:09 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 01 Sep 2026 23:02:10 +0800, Rong Zhang wrote:

> The amd-pmf driver is notably bloated due to undesirable function
> outlining and linkage. Simple and dump helper functions as well as
> wrappers should really be static inline functions instead of global ones
> from the very beginning, or else they are prone to the overhead of
> function outlining and linkage, which bloats themselves and their
> callers.
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
[1/5] platform/x86/amd/pmf: Inline !AMD_PMF_DEBUG stub
      commit: b8f7b92fcbd7e5801bbd18a42a9c10ef03e2ec35
[2/5] platform/x86/amd/pmf: Inline simple helper functions of Core Layer
      commit: c78d7b826cfc1642c78f5022b5acbf5ef09d88f9
[3/5] platform/x86/amd/pmf: Inline simple helper function of SPS Layer
      commit: 079cbf13340688ef697252b18bab9533acba3ecb
[4/5] platform/x86/amd/pmf: Inline simple helper function of Smart PC TA interfaces
      commit: ef1e7071c1f2832f3a7001be7f7c04bd872c14ae
[5/5] platform/x86/amd/pmf: Inline wrappers of ap{mf,ts}_if_call_store_buffer()
      commit: b21ebc6638d56f6007aff1fe93c5838dc138a364

--
 i.

