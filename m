Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750F3412C03;
	Tue, 11 Aug 2026 22:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786486897; cv=none; b=KHjhUUH7ku4bobWiP2TCM0ehI9hlubSVTsuhqI3ycg4OmSZQ0rptFyeawFcXYwUZBbKUMwk4NSbN9KvmR9HJDHB3MlwSihxbxRBkEGBm7KjDsUWZMAoCNO2i6j2ErCT0dny1AhfXkS/BAikaFD2LutO7+3OYNk0oByKDFnvPlp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786486897; c=relaxed/simple;
	bh=Y2yfD49/aM6kbzSsSBp7tXPuDoruAgXRG7SfiX3zaPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e3EPhLhnWDrX8a84bhQiuVvFa3+dBePJPqTYvyYD87TXxJ1E+JnLTUuaLCq9j5MWFo58haOmguv3jVd1iBTrJaSFlWtep68qgpZUnN+pKsHm3KtI/Vf8aGvKY2u/EiVeuticaPeLlkGgdN5KdOhQFUYpgD0sq5t3RQM4K3ScTVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1dcZeBk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1dcZeBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786486896; x=1818022896;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y2yfD49/aM6kbzSsSBp7tXPuDoruAgXRG7SfiX3zaPo=;
  b=f1dcZeBk/zd5yLuOGwYlIXiqEvVEXVhF+JFwobkAMZT0ZzEYSo3OmgLK
   yPLOxtR4hrKgUYZ99fVe9ZhdcEqUMHhzlATXcc7igq2gme3JPU2hq4HKY
   4ODfy0NoTRW5G93Oiwbm157ZQ3HWb2lRVGiyeHOGu/vE4tWCL0OL2ARnz
   e2VvSeLv1QsddUDSemONyu9z4K3RUmogeaDxx7fvncaql23n0p1VHWM9+
   vuuhzZE1Gh6GBOIFE3R/4UPGrRa4nBshp084dgiqZVw7eeVZCQuopIl/X
   KIhGDZpSguZemNJaLBR/noreFhO3b+bfSM8rQFGE/LBFWEYIPAfmweEhO
   Q==;
X-CSE-ConnectionGUID: 5UqhfmbORg6H0RO9Q58uFA==
X-CSE-MsgGUID: GeIDqN8eQwqS5xS8Y2dc7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87041814"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="87041814"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 15:21:36 -0700
X-CSE-ConnectionGUID: x79O3YdrRA+I0hw/9nC4wA==
X-CSE-MsgGUID: 12chfmqGS069gexs9+Mg2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="259189853"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by fmviesa006.fm.intel.com with ESMTP; 11 Aug 2026 15:21:35 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sammiee5311@gmail.com,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/2] platform/x86: ISST: SST-PP failure handling
Date: Tue, 11 Aug 2026 15:21:32 -0700
Message-ID: <20260811222134.3912626-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some optimizations to fail on SST-PP and add sst_instance check
for a package.

This series is dependent on series "platform/x86: ISST: Validate
inputs."

Srinivas Pandruvada (2):
  platform/x86: ISST: Return error during profile addition
  platform/x86: ISST: Add a NULL check for sst_inst[]

 .../x86/intel/speed_select_if/isst_tpmi_core.c       | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
2.55.0

