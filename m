Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0193C140F
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 18:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178625; cv=none; b=VADBG80WPH6VYdCQ2K4PKLBbGuflkhO+QnrTNsQzAsWxLWBK59q2NEHvbFvs0dZI4xP24tcnDxX1CC2r9Z1zIo1MTakxxWYLlfkBISG9VxpdQFrFMZYmgNryGlE3WzKJufGvJOPKfHqnqXLGcBlU5zrjhz2UzCzpxO/ZIayKIao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178625; c=relaxed/simple;
	bh=7RrrUNqkonEHQIpCYNQURsi/3lbWfjf2A9Akn10q3yA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nIUEAZXwzIlyc0ha1ui+YONsyMLyABLgQXL42U5Dks58EdUKrHUo681BvWsyhGfx8Y7h8CfbQ3AXZpftzGstfOHzooBmPmBi+wlkZqRNuUcvU4dUMFsS+dWyUEtwkyc7b9m2phC5KDSXAVR2vK70eqiVh52QGiC6r/ZcfjIc034=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVyDAb1m; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVyDAb1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785178624; x=1816714624;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=7RrrUNqkonEHQIpCYNQURsi/3lbWfjf2A9Akn10q3yA=;
  b=nVyDAb1m+IM1DCCylUtG3YHWdbanw0jrayVDU2JDveQAOj8zST94N7LK
   dzdSuoAPU6MS0P7Qyv3lllRFcERphxXk3qqOd+F/YwlFVqZKYMMQbh7Pd
   +LcPR/H5uIc+e0tBwi7gIi4WPnETnSNwcYupVIdaWj/PBpmkLyn8fKWL9
   g2oDTPjjwstcOVcwOwDHaU6UAf5H6/GuLiSX7xAUXtGxZ9Q6DG5w8DzYF
   XTuYylXsby9nY9C4k2HPsUAR8ImLDZRA4xXg3PQBZUgqpXip4i2YTm4Vg
   0TN5ktij7Ru3SV920Sm9qV+yh9oABNeOzurNcK18TPOE3Cx+WglT/rYiV
   A==;
X-CSE-ConnectionGUID: i5kzNxR/T3qjtzOqPLzS3w==
X-CSE-MsgGUID: RA5iuFJvSOSwDacTrx8NEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="108549771"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="108549771"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:57:03 -0700
X-CSE-ConnectionGUID: pxUwyK38RnqxyB6PiZ3hWA==
X-CSE-MsgGUID: uIfrhm8sTxuhOhwFzdru3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="256816706"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.226])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:57:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com, 
 mario.limonciello@amd.com
In-Reply-To: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
References: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v3 0/7] platform/x86/amd/pmf: Add 1AH_M80H support and
 accumulator based NPU metrics
Message-Id: <178517861557.16876.100614585681623928.b4-ty@b4>
Date: Mon, 27 Jul 2026 21:56:55 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 23 Jul 2026 16:45:27 +0530, Shyam Sundar S K wrote:

> This series cleans up the PMF-SMU mailbox handling, adds support for the
> AMD 1AH_M80H (Family 1AH Model 80H) platform, and introduces NPU metrics
> retrieval for it based on a firmware managed DRAM metrics table.
> 
> Today the SMU mailbox register offsets are hardcoded in the send path,
> which does not scale to platforms that use a different mailbox layout.
> The first two patches address this: patch 1 moves the offsets into a
> per-SoC struct amd_pmf_smu_regs carried as PCI driver_data, so all
> existing platforms share a single legacy instance and new platforms only
> add a table entry. Patch 2 then adds the 1AH_M80H device/ACPI IDs and its
> extended mailbox, which uses three argument registers to return the
> 64-bit DRAM address and size of the metrics table.
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
[1/7] platform/x86/amd/pmf: Use per-SoC smu_regs struct for SMU mailbox registers
      commit: e860e561926bf75e323d43fe59a9bf25d2ef33a3
[2/7] platform/x86/amd/pmf: Add 1AH_M80H device IDs and extended SMU mailbox registers
      commit: 2f9db5881fb37e5723bd88f939c7bffb8e7789a3
[3/7] platform/x86/amd/pmf: Move metrics code to dedicated file
      commit: 2e34aca48f42ef0d3ff95d79e82268b2eacae486
[4/7] platform/x86/amd/pmf: Add missing newline in dev_err message
      commit: d19eca503861824a6c8f8eea7eabc79e14479f84
[5/7] platform/x86/amd/pmf: Use upper/lower_32_bits() in amd_pmf_set_dram_addr()
      commit: 9f29ec1f46d03a7b633c5d9a668ece059d539d4c
[6/7] platform/x86/amd/pmf: Refactor NPU metrics for platform extensibility
      commit: 17f3e140d09da4d17dadef82ab67547e71215a64
[7/7] platform/x86/amd/pmf: Add 1AH_M80H metrics table and NPU metrics support
      commit: 641b41a7a12537f8898b1e14c62e0d85a8b872c2

--
 i.

