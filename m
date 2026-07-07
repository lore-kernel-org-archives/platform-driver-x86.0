Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2EC437857
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 17:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783445175; cv=none; b=lqFzfaENfHEYuf+ek6qXFQ764fPX88I3e+pvl02MLF6eG2XDS+zpYzPCIPUkycEweQ59t+jKXn1RumGQOLhk6xvELOO1WtDRD2s0di9rbc2gbzIlgRXXd8lX1H68IPBgFnOYrZqoeyq/BiWfB35+bqRES6CF6dgIo18PZa+yjbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783445175; c=relaxed/simple;
	bh=q8Ft+2xlMCDUKpqS6kimBk4aUGtL+yIo2reoAfaGqxg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vB78IzCS6yIA3esoKV+fImwBfRbj3Il0Jj7HTXi4mDYmJYqiiB63yoOkftgZJDJOkTgHnMHymjWBQWUI4R3lk5nL5b5v4opHpvto1EGz01HyEqZAlnPKFVoIe5H4Mj1fujhrUaRj8oC/RWzcadvO/98SB1pVCBekvZNnm24gyCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHy3nf65; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHy3nf65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783445172; x=1814981172;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=q8Ft+2xlMCDUKpqS6kimBk4aUGtL+yIo2reoAfaGqxg=;
  b=KHy3nf65rxTXemkXPk0ZoSZCkns8Gw7x68H4+F0SyhCm8JM8doZndP+P
   I7mdHgp38332H3p30X2ypkJ49D7ujmhksvgGCItuAGHggz0q64OJd0BjG
   COVlmwwGG88dg1T2gWrRKOGieJtALpI+G+MnxWWDl1uo3WHZXXgG/J+DV
   RsdTlsF7ScwSRv1lLJBxk5SjeYXaRvW+Zbl+qAczEStlrC+PR72bBQzhH
   yc9efUx6mp9uFYhKfr7qMRGhTeuo73UI3vRmNG6yBHv9AbTvG6SOIS6Nb
   RLAiC2CtWytD90TbfaRfopSP5WnZY/m8HGnEIU2d/A+/K8YD3ed1zM6YB
   Q==;
X-CSE-ConnectionGUID: u5+I5ivsQF6/+b5rIZ69Iw==
X-CSE-MsgGUID: gPaYzeQUT5y2oQmCo0EynA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="95616273"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95616273"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:26:12 -0700
X-CSE-ConnectionGUID: d2J/WUiySw+i4tL9VA2eYA==
X-CSE-MsgGUID: brG2ms8GQX+lwlR5WPjZkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="249615547"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:26:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260707122852.2066987-1-Shyam-sundar.S-k@amd.com>
References: <20260707122852.2066987-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2] platform/x86: amd-pmc: Use correct IP block table
 for AMD 1Ah M80H SoC
Message-Id: <178344516626.23800.14755261884100475405.b4-ty@b4>
Date: Tue, 07 Jul 2026 20:26:06 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 07 Jul 2026 17:58:52 +0530, Shyam Sundar S K wrote:

> PMFW reports the S0i3 subsystem accounting per SoC, and the set of IP
> blocks and their bit ordering differ across SoC generations. Family
> 1Ah, Model 80h accounts for a distinct set of 19 IP blocks, which does
> not match the ordering in soc15_ip_blk[].
> 
> Commit 043af31c8d30 ("platform/x86/amd/pmc: Add PMC driver support for
> AMD 1Ah M80H SoC") wired amd_1ah_m80_cpu_info to soc15_ip_blk[], so
> M80H has been reporting incorrect S0i3 accounting via debugfs.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: amd-pmc: Use correct IP block table for AMD 1Ah M80H SoC
      commit: 2726b5758f80a546a4ddeec5019e72035a7fa166

--
 i.

