Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D1A19CC2A;
	Mon,  6 Jan 2025 17:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736185622; cv=none; b=Ll0dAg/CJZ9q+nkUw+47E2F9LAX+R3GgLn0zEADderckh1uHgf704bw3pWTC+VX8cT+UQKApwz0GFfl7CxcHucWnN16c9Wf+TA45tPIew/xw+vaj8Xjq8/VGTKWwf0eeyS6WdZNLpJBmPLqjktDIZc1zlTRM1+fXvfEBCqCyDzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736185622; c=relaxed/simple;
	bh=wNoTz3//1H6kuvXDNRwHMwL8KF9BlXYy2y6lToeVvcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fBCyBd5L3YUhATCFZHqsnSWOiwia3FQW15cz8AiEYPeEPNR7TryBQeTCEzm1nptxAFvUApkrQJOM/3xy/AYcVd1DerlnXdG1dmFbq7ulaiJdsKp+AXiufdBt5SXo4POpKVinTc6nk5FuHQ3FaYudgfWQfIHNZu0aBefDDQmb6M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KnCsu4LE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KnCsu4LE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736185620; x=1767721620;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wNoTz3//1H6kuvXDNRwHMwL8KF9BlXYy2y6lToeVvcQ=;
  b=KnCsu4LEqUn/mr4VBrgUwfalhbjjUfkzrxhjjTUbzkaPdJ+QpyAa/II2
   hV1vRdegJXLKkF7hK0hD21Fu2ZghtVMtatEKZUxjKHV6DcFXfhQ3LBRZU
   hTt3JrjDlLRLwM0ZJYhOSz+X85jKjjiGTt6kceWX3kBAfFuLDSI31Qo35
   qmUR6SxgCckea+6oujhsyA+rqYfEOZ/ZRElnOkdfq+shhf5hSgygi1kwv
   2FSy0D+JV7gtEqNbKHx27KmSrWOtOjrsLg4ZAYr+LKcZI4sz/EqYy89cP
   THgrYJmxY17aWAJUBhzxQhvDRDfOfaPJqKBygPoJ3RmtPa3jGPDyzHsZX
   w==;
X-CSE-ConnectionGUID: bY880R1qQaauJkYwh9WH0w==
X-CSE-MsgGUID: 6S4Bi9dETCyBadpUR8dZxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36220387"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="36220387"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 09:47:00 -0800
X-CSE-ConnectionGUID: 3qYg8OxFRXWtnmIUEXhCFQ==
X-CSE-MsgGUID: O3HDJKr7Q2K0G33YFox6Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="102698635"
Received: from dnelso2-mobl.amr.corp.intel.com (HELO debox1-desk4.lan) ([10.125.110.113])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 09:46:59 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	david.e.box@intel.com,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xi.pardee@linux.intel.com
Cc: "David E. Box" <david.e.box@linux.intel.com>
Subject: [PATCH] platform/x86/intel/pmc: Fix ioremap of bad address
Date: Mon,  6 Jan 2025 09:46:52 -0800
Message-ID: <20250106174653.1497128-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In pmc_core_ssram_get_pmc(), the physical addresses for hidden SSRAM
devices are retrieved from the MMIO region of the primary SSRAM device. If
additional devices are not present, the address returned is zero.
Currently, the code does not check for this condition, resulting in ioremap
incorrectly attempting to map address 0. Add a check for a zero address and
return 0 if no additional devices are found, as it is not an error for the
device to be absent.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Fixes: a01486dc4bb1 ("platform/x86/intel/pmc: Cleanup SSRAM discovery")
---
 drivers/platform/x86/intel/pmc/core_ssram.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c b/drivers/platform/x86/intel/pmc/core_ssram.c
index 50ebfd586d3f..739569803017 100644
--- a/drivers/platform/x86/intel/pmc/core_ssram.c
+++ b/drivers/platform/x86/intel/pmc/core_ssram.c
@@ -269,8 +269,12 @@ pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, int pmc_idx, u32 offset)
 		/*
 		 * The secondary PMC BARS (which are behind hidden PCI devices)
 		 * are read from fixed offsets in MMIO of the primary PMC BAR.
+		 * If a device is not present, the value will be 0.
 		 */
 		ssram_base = get_base(tmp_ssram, offset);
+		if (!ssram_base)
+			return 0;
+
 		ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
 		if (!ssram)
 			return -ENOMEM;

base-commit: 6b228cfc52a6e9b7149cf51e247076963d6561cd
-- 
2.43.0

