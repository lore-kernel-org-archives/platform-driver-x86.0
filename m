Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD30527C162;
	Wed,  4 Mar 2026 21:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772660578; cv=none; b=PezXbKv8VlahLFYCUnVSxeOK8y7CEgb30zPVvpGOKyOFFLAVq8gBIzfesGq5CjsqOxUyQ/CIPBFLRo6G5HqRMYUXk3OWRL+ReLTlHK2ZqE7lnYY/raHJZg4T8cl2qiTYBxiWV8sBY2DxHn4W56dkrxYqdOptQrOdRkdHuaHQ12s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772660578; c=relaxed/simple;
	bh=kfN2jKdKlFHs+Z8qs5ZzGTjlHp1HVeDFqYioR3gJXHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SXJUa4CKDDrX6B7DRP4Cs60FoqdXwmh4aXoCHK9mRzTXO4sV/6X6bO6zYRgtEBDOwpjJ9dh771T6EgAbU0MZ6QDo19UpB5KjhmLmvTI4sGosGM/r28a8yrABtxp51IJgCZTL15EN3o3mwKdaDQebbQbsLjw3sy8vlNNvT7F7qa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpDLAC97; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpDLAC97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772660576; x=1804196576;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kfN2jKdKlFHs+Z8qs5ZzGTjlHp1HVeDFqYioR3gJXHo=;
  b=XpDLAC97RgQg2vYDZdJC9IOT8rZ8lW5pRhLCiMlG2/21J2VYLRHE3Xm8
   7m4+F5w6A6Tt5qOJxIXKI0DEr01ZxDNB7Hhusr/8mdj3eWEEvK7ixQGgq
   YycY/lTvK6cuZPiksryG8RmhTJee8JDfv1wVEQEMh2KNZutPXdAd4CKAf
   sA9csHlBmYm6eURJXTgjTdjq0IaEdPkAZ2++ahXnH0qYZ7KuE/GM0GcHS
   sK5FhKOf5SGd/un3OwsBvCb1Gik/eOEDsea6T53taee9xleHUG/M8AP+X
   tDrJ8P8fAL2RNcajU4JxhInQVvDL9YP5PjbrILuRxLmJYlBwU3Sm85hII
   Q==;
X-CSE-ConnectionGUID: 4xoAZ63uRGmjOdZ4k9L3Tg==
X-CSE-MsgGUID: 2YColWfWT5uTXDRdPy0gjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73434175"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73434175"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 13:42:56 -0800
X-CSE-ConnectionGUID: Gel3blZ7QlyQEeHjCSNGpA==
X-CSE-MsgGUID: igDK7AGdTBq2FvZxihRoig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="222611967"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa003.jf.intel.com with ESMTP; 04 Mar 2026 13:42:56 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86: ISST: Correct locked bit width
Date: Wed,  4 Mar 2026 13:42:55 -0800
Message-ID: <20260304214255.1748163-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SST-PP locked bit width is set to three bits. It should be only one bit.
Use SST_PP_LOCK_WIDTH define instead of SST_PP_LEVEL_WIDTH.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index b8cdaa233ea9..fa1726185d44 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -869,7 +869,7 @@ static int isst_if_get_perf_level(void __user *argp)
 	_read_pp_info("current_level", perf_level.current_level, SST_PP_STATUS_OFFSET,
 		      SST_PP_LEVEL_START, SST_PP_LEVEL_WIDTH, SST_MUL_FACTOR_NONE)
 	_read_pp_info("locked", perf_level.locked, SST_PP_STATUS_OFFSET,
-		      SST_PP_LOCK_START, SST_PP_LEVEL_WIDTH, SST_MUL_FACTOR_NONE)
+		      SST_PP_LOCK_START, SST_PP_LOCK_WIDTH, SST_MUL_FACTOR_NONE)
 	_read_pp_info("feature_state", perf_level.feature_state, SST_PP_STATUS_OFFSET,
 		      SST_PP_FEATURE_STATE_START, SST_PP_FEATURE_STATE_WIDTH, SST_MUL_FACTOR_NONE)
 	perf_level.enabled = !!(power_domain_info->sst_header.cap_mask & BIT(1));
-- 
2.52.0

