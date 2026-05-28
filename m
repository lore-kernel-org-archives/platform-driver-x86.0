Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE35318BB5;
	Thu, 28 May 2026 20:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780001141; cv=none; b=e/5G6T+ZY/YL/C+elyTNqWB9T3kjcQpWTaTaVrSh77N0Ux13XKQZxFsA1UjrnBQ24TAexGwDqXx10iEtb3EH0G6JhVHXprSPBnQdEulSDfkDGIBXIEjnnWHWZzRqaKseVo+2HLBsx1YiXCmCZSDGd9oGv5/5zVaHr3vd0WnzNBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780001141; c=relaxed/simple;
	bh=AVTRQnr9nQkiaXAXTp3FzwWwl1Ecbt2usWUCFCbMvEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQBN/KQkcAMu/KpDptvS+xoBJQk3xbOQVV5JbhhC+yBWbXrDfxivCytD9+zq9mIgv/YA7mo6m8LoSCB+D1MWhSO6PHXrhYXw3A1TLZVNbS2o/7prZz6jX6f06+FuUGs7G3b1grUjkUVKTQqnyE6o6x+geRooYZvBd8T4TUp9s70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5mG0MC/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5mG0MC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780001140; x=1811537140;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AVTRQnr9nQkiaXAXTp3FzwWwl1Ecbt2usWUCFCbMvEA=;
  b=G5mG0MC/zEde92vcs8JcMPwD9sThLokj8bwg00+0cuFZxRg6wOmBRA+b
   2Duz8g3Vk5UzF4gP7DVHbUSxXZyu/M2okqBJTIyyqa5K4iI80xGEyRPZf
   pKvE8KktnwQrVymEI0HYVwq6fiKJIsoUvh7vU4m6xkITUt3gcFe+HEwyF
   T8OjR35HORfbSfXZSkstuIYYm0xzHp1B5GyS7lg8DVoc3CLfOx9ZcBavY
   /98DtNoG36/oymMfGKLoZgbk0cWDznfWV7lo5flsPgM8cpl8cwAYUX12O
   ZXkl/VkhQxymO4T8eFAm4I9ieSPjC37oG4lUlLv4vuwCBN516IJ7QmtFQ
   g==;
X-CSE-ConnectionGUID: BgT2Ul+9Rc2lA/TlAZTEHA==
X-CSE-MsgGUID: Hy2nTr55QxionA0PZGFCsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="84742026"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="84742026"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 13:45:39 -0700
X-CSE-ConnectionGUID: HrMjI+bqQG25qItNBkwzCg==
X-CSE-MsgGUID: cdfgnizHQXiiue+tUgbnsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="272984531"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa002.jf.intel.com with ESMTP; 28 May 2026 13:45:39 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: ISST: Restore SST-PP control to all domains
Date: Thu, 28 May 2026 13:45:21 -0700
Message-ID: <20260528204521.3531456-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Pandruvada <srinivas.pandruvada@intel.com>

The SST-PP control offset is only restored to power domain 0 after
resume. During suspend, control values are read and stored for all
power domains.

Use pd_info->sst_base instead of power_domain_info->sst_base, which
only points to power domain 0 base address.

Fixes: dc7901b5a156 ("platform/x86: ISST: Store and restore all domains data")
Reported-by: Yi Lai <yi1.lai@intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: stable@vger.kernel.org
---
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index b804cb753f94..24334ae70d82 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -1804,7 +1804,7 @@ void tpmi_sst_dev_resume(struct auxiliary_device *auxdev)
 		if (!(pd_info->sst_header.cap_mask & SST_PP_CAP_PP_ENABLE))
 			continue;
 
-		writeq(pd_info->saved_pp_control, power_domain_info->sst_base +
+		writeq(pd_info->saved_pp_control, pd_info->sst_base +
 		       pd_info->sst_header.pp_offset + SST_PP_CONTROL_OFFSET);
 	}
 }
-- 
2.54.0

