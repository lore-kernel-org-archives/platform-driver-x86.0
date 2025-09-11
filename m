Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0FD2DE202
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 08:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757580707; cv=none; b=lPKC2LA8i08ymBUnePaXUbIQ1EvPNPsTUE28RwBFxHLP69y2NMCKdq9BdxgueWFt+N7ljekIMHIpkgT9EWGB5Z4k0q0dO/k76jAiSB8XT2mp0yWufFY14lxa1V/wsr6O0Du3/+RwoPur+UVoATCk6CKcng/qaTviJG3eYCuwcYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757580707; c=relaxed/simple;
	bh=UFqMRSGmES9rNeSEYrkmCpLRCGWTGdez3+rKwXW3rrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rcHD/p/piGpAneylI+2XPA0zdqmmQab9uS2TGZFdRFqFQgBF1LMVat1EPZlnwkQfPdV2BRV8Yo5thEJQcnhFSMWvCOO1GuUrv3R/R+0N45JwbyasAiAch3NZsHfeUlQ/6N6Ac8WoxJp35ltfjogKnZeny2IqGXWBf7nGj2736dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O19ppL3e; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O19ppL3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757580707; x=1789116707;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=UFqMRSGmES9rNeSEYrkmCpLRCGWTGdez3+rKwXW3rrE=;
  b=O19ppL3eokOTJ0zosTYyLSEbkOPUXeSqfSwEdn72tvAxEP94fDT15zkm
   M0Ib1MS0YFgl34VIcIcCZZ5Sm2Ngo2Actz9pO5RYN2C8uDbRIiJC/8mwa
   AnrGynPt//Op66EQObgOQsQG4xikgASaQSBAcXps5T63mYfnmcSL1DrEW
   +Hez6OYCMso8wqNXxYvb4Skslx9Zj2LC1d6h3eiqaxuJCrQUfu/lZtHes
   B8Ql4/WWrqdpjhLYKe8vj9gzUbhfE4LGPpSTS3Fh6p32/5ZvUaI6e3krM
   PAatpznt6klF5A5b2tZjf9U0Hdq2OXvrjxMRm/uA/2qh1nlHu1RDWhuEF
   g==;
X-CSE-ConnectionGUID: TVMtBjtBQ/6CClfB2+dxrw==
X-CSE-MsgGUID: SfTzGb98TSiJyYfN41VupQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59599508"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="59599508"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 01:51:46 -0700
X-CSE-ConnectionGUID: K0lWT/oYTH++ulMbj9RdUg==
X-CSE-MsgGUID: tOL6BlLTThGevW++jEgKww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="172926005"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 01:51:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com, 
 mario.limonciello@amd.com, Yijun.Shen@dell.com
In-Reply-To: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
References: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v5 RESEND 0/9] Enhancements to PMF Driver for Improved
 Custom BIOS Input Handling
Message-Id: <175758069520.12104.11266006471249026373.b4-ty@linux.intel.com>
Date: Thu, 11 Sep 2025 11:51:35 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 01 Sep 2025 16:31:31 +0530, Shyam Sundar S K wrote:

> This patch series includes the following changes to the PMF driver:
> 
> - Implement support for modifying PMF PPT and PPT APU thresholds
> - Enable custom BIOS input support for AMD_CPU_ID_PS
> - Add the is_apmf_bios_input_notifications_supported() helper function
> - Correct the handling mechanism for custom BIOS inputs
> - Maintain a record of past custom BIOS inputs
> - Process early custom BIOS inputs
> - Initiate enact() earlier to address the initial custom BIOS input
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/9] platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU thresholds
      commit: f10ea2df9e4d28964e2a02abaf32100953885989
[2/9] platform/x86/amd/pmf: Fix the custom bios input handling mechanism
      commit: d82e3d2dd0ba019ac6cdd81e47bf4c8ac895cfa0
[3/9] platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
      commit: ebc68a3451ce419fe2e7a7d3f06df408fb36399e
[4/9] platform/x86/amd/pmf: Update ta_pmf_action structure member
      commit: 37336ecb06a81e7c4fb3e89dbb04169c0e523069
[5/9] platform/x86/amd/pmf: Add helper to verify BIOS input notifications are enable/disable
      commit: 4389d38080d72a818de2731663d0b5571f66db31
[6/9] platform/x86/amd/pmf: Add custom BIOS input support for AMD_CPU_ID_PS
      commit: 04199ef48ac2c5f0985a54171da47a218c37b00f
[7/9] platform/x86/amd/pmf: Preserve custom BIOS inputs for evaluating the policies
      commit: b21ec88340b7e9dbaac13d9902f1e8166932c277
[8/9] platform/x86/amd/pmf: Call enact function sooner to process early pending requests
      commit: 62214d942d2bebbed1798eef711dd82aa493a616
[9/9] platform/x86/amd/pmf: Add debug logs for pending requests and custom BIOS inputs
      commit: 2ab7713d6e9408587731c186b9a5a208f04a6b33

--
 i.

