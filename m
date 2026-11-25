Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640872;
	b=W3SPCHimqpLdZH5gHuaD57pIulkcYGtAQYoaCNNjFVc1bgDZy34js+wd8kyDHj4BGY9f
	 q7aI6j4yof26zHqdncYg4LXSusgOsiBnhofdpqHyBmyuAtqkpySwR1BHDSCsPc6NWvnOr
	 f808hCXHYX2jRgpdkxhYZGVwFz5J4PHsdDIyVHvFV1x3lsBtoe8V8lo2HRDIDgGj0AFEo
	 ix8jJPm4uJRU4wOB3w5d5pQs9LHHGmldPTTId2npuoEXB1zwni/VZ+JdNwLesRRzU37wy
	 kz6lrZJfc9bAlTf4WwCk58nbdA1w2ZvYSMVJOfkKpoMEu05Ku5erXXoaEAfe/8MEe6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640872;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=dAyUR+vJs12XrObvo4bBq1nSlMiAfbK7W3e585NoAu8=;
	b=KN20pulxZwsy8Qh3w5SgP3J1+OHg9t0WvfWI71I6c8p8/WuvyoskPqazjjWc7Eyx7qO5
	 BO5xDIDaTbDMRz6ac7tmswlGVR7J7T0xVMJOVCfv8DJmvB4RD6CxMdyeh1cWOQnpF73on
	 BM1i7d4ep1GOW3/4pYmg++21aWfL06ipOV5aJVgPA6p1QogTR+xOygS3reBtkf9bLnBLZ
	 scWfZXT60dw24Qd0F2okr74Ll26evFYsKbqa7XP6PW/tBFTbj4ci2btIQX2DUcrG4ULN7
	 SfBfkdY1p7MbMcHgT/gy3ny+BUaW4j8mun3FhKCSTYb7HYOFzMjQI0d6bkKtauaqDIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jDIhC7Lm;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6888D606A327
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 21:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6888D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jDIhC7Lm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795640871; x=1827176871;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IvL6lvO4VPePIoprbhYHRrJ555DGG0YC7fs4MSOGvus=;
  b=jDIhC7Lm72j67117DOMLJRR3iKGcRMZWH/vcSOtDcjMZBSEALQGhTJu6
   3JruV1J9jycbiuuMnTpYxFX+7dYb4VIFyjoQ00potrYpOfegCegFnGYQQ
   nZcRD3KNvtDVnCEyr5PpKp9dYcFQyUClevqooS9DGm4rDE8yPi3qLBIl/
   62gEIGbvQSMVMWUbJ3tEv24odLM3jofVNmbjOqeX3NtaLXV082y9EXjr4
   VeZTQJeSCgVGQHUpmhG7xxjrZUL+cPRu7oHI5y8iKBCD/dOxGgyxxxQdi
   rimM0x5CVLRxL0dR17cAKgkZ0WY5j2YQARzlPqcw3jimZONO7vmXpDmHQ
   Q==;
X-CSE-ConnectionGUID: o/B0XAbaSLqlKeqhQ7J4aw==
X-CSE-MsgGUID: sgUwKSMASP6eJaXkVM95mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4549269"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4549269"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 13:07:49 -0800
X-CSE-ConnectionGUID: YfWlV+KhSqGZuFBZtpKKOA==
X-CSE-MsgGUID: jbgCyZ/PT++FXLcTQOHD0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11839007"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 12:43:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Nov 2026 22:43:21 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH v4 00/11] platform/x86/amd/pmf: Add 1AH_M80H support
In-Reply-To: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
Message-ID: <6e93f433-6862-fd1b-4e5a-cf7c554b0615@linux.intel.com>
References: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Nov 2026, Shyam Sundar S K wrote:

> This series enables the PMF driver features on the 1AH_M80H platform.
> 
> Patch 1 stops sending the legacy DRAM address commands on 1AH_M80H.
> Patches 2-3 move the static slider handling to per version ops and add
> the 1AH_M80H static slider support as per APMF 2.03.
> Patches 4-5 add per-platform TA ops and the signature size handling for
> RSA4K and alternatively signed policy binaries.
> Patch 6 uses the system state enum in the TA policy action code.
> Patch 7 adds the Smart PC builder support for the new TA.
> Patch 8 remaps the metrics table on resume.
> Patch 9 passes the custom BIOS inputs to the TA on 1AH_M80H.
> Patch 10 shares the TA policy apply code between the TA versions.
> Patch 11 extends the custom BIOS inputs to 20 on 1AH_M80H (APMF 2.03).
> 
> ---
> v4:
>  - Rebase on the latest review-ilpo-next
>  - New patch 2: move the static slider handling to per version sps_ops (Ilpo)
>  - Patch 3: add the 1AH_M80H static slider support as a new set of sps_ops
>  - Patch 11: add apmf_get_custom_policy_ext() and read the SBIOS requests
>    through one helper so that the event handler has a single path (Ilpo)
>  - Pick Mario's Reviewed-by for patch 5

Hi,

Thanks for the update, the ops looked much cleaner but I then checked what 
sashiko had to say and there were things that clearly still have to be 
addressed.

In the min_t() case I don't think you need any type casts but can just 
use min() because the variable and define should have the same signedness. 
Any sensible checker should know the value never exceeds u16 type so the 
cast is not required even after min() has been done.

--
 i.
 
> v3: https://lore.kernel.org/all/20261118143034.3566684-1-Shyam-sundar.S-k@amd.com/
>  - Rebase on the latest review-ilpo-next
>  - Patch 4: also handle policy binaries signed with the alternative
>    signing mechanism
>  - Pick Mario's Reviewed-by for patches 5 and 10
> 
> v2: https://lore.kernel.org/all/20261106164429.30738-1-Shyam-sundar.S-k@amd.com/
>  - Rebase on the latest review-ilpo-next
>  - Pick Mario's Reviewed-by
>  - Use ARRAY_SIZE() and rename the APTS state array to states[] (Ilpo)
>  - Use SZ_256/SZ_512 for the PSP header and signature sizes (Ilpo)
>  - Use max(), sizeof() of the destination, and a single update of the
>    previous sample in amd_pmf_get_smu_info_v2() (Ilpo)
>  - New patch 5: use enum system_state instead of literals (Ilpo)
>  - Keep allocating the metrics buffer on 1AH_M80H and only skip the
>    SET_DRAM_ADDR commands, the existing metrics paths still use it
>  - Keep the power source notifier registration unchanged, skip the
>    1AH_M80H slider update instead when the APTS defaults were not read
>  - Read the v2 TA layout in the util interface on 1AH_M80H
>  - Do not fail resume/restore when the metrics table remap fails
>  - New patch 10: add the custom BIOS inputs 11-20 of APMF 2.03
> 
> v1: https://lore.kernel.org/all/20261011100554.1841309-1-Shyam-sundar.S-k@amd.com/
> 
> Patil Rajesh Reddy (1):
>   platform/x86/amd/pmf: Abstract static slider handling through sps_ops
> 
> Shyam Sundar S K (10):
>   platform/x86/amd/pmf: Skip legacy DRAM address commands on 1AH_M80H
>   platform/x86/amd/pmf: Add 1AH_M80H static slider support
>   platform/x86/amd/pmf: Abstract TA dispatch through ta_ops table
>   platform/x86/amd/pmf: Get policy binary signature size from PSP header
>   platform/x86/amd/pmf: Use enum system_state for the TA system state
>     action
>   platform/x86/amd/pmf: Add Smart PC builder support for 1AH_M80H
>   platform/x86/amd/pmf: Remap metrics table on resume for 1AH_M80H
>   platform/x86/amd/pmf: Add custom BIOS input support for 1AH_M80H
>   platform/x86/amd/pmf: Share TA policy apply code between TA versions
>   platform/x86/amd/pmf: Add extended custom BIOS inputs for 1AH_M80H
> 
>  drivers/platform/x86/amd/pmf/acpi.c    |  32 ++-
>  drivers/platform/x86/amd/pmf/core.c    |  38 ++-
>  drivers/platform/x86/amd/pmf/metrics.c |  16 +-
>  drivers/platform/x86/amd/pmf/pmf.h     | 328 ++++++++++++++++++++++++-
>  drivers/platform/x86/amd/pmf/spc.c     | 210 ++++++++++++++++
>  drivers/platform/x86/amd/pmf/sps.c     | 181 +++++++++++++-
>  drivers/platform/x86/amd/pmf/tee-if.c  | 261 +++++++++++++++++---
>  drivers/platform/x86/amd/pmf/util.c    |  83 +++++--
>  8 files changed, 1057 insertions(+), 92 deletions(-)
> 
> 
> base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
> 

-- 
 i.

