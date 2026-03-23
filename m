Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A250025CC40;
	Mon, 23 Mar 2026 15:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280207; cv=none; b=n6sgeqMLwNN/xKee5Lfppc73vLMq2cE049fDfTUqpgLU97/eoaWszJzsJGStnaYkUDwjTiZhicGvRwkihR52a9lQEykKRMMddFm2eM30Fryljo/ZtkfH77qBiO/yM0Mxj3Y24WU4QczHfXmtHaJERwfi85rDodeOPNkPwq+kWgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280207; c=relaxed/simple;
	bh=uewp9v3/iCCyFlR6V+tJL+S/rV0rImHzlZjQdHwJz38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sg3Fmz3+kOFs0eTZdrGxEoaK3A806c0xTOSNO576gOceCq8XLpYwg7f6Cd7sKiyaBIbPs2gw4jyJgCGJHkGGxzPsP3ZuxHWakeFJ2Wn4/kKFmZGPXUte7lRXXqqtProKAA/MmZvuByvokVoMwAnyWZD4bcfSWQXTlLyNgqHz0dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DR5Bqswx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DR5Bqswx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774280206; x=1805816206;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uewp9v3/iCCyFlR6V+tJL+S/rV0rImHzlZjQdHwJz38=;
  b=DR5Bqswx5uhsFZ3QIkb3AxYKUpsHEV2M3y44SznnG1T+jbUuM1U3U3Cf
   0r9lydueMl78oJAPy0BmRpVsgah8+xCvlxGrxONQjTcsdVfcV9yygNhdS
   cMmF+oBgdSLJW5ycvZjDzprC8XLl9eYHC0SagwMKXetbkSJwDp8nhXE47
   rKMrMfJskiJn5j3+C9mUi8NnsJqT6IGSyhUMYCnTACGv9vIiLoaf4rVKA
   PtU64gUDs8a7ubkj4Ne+AG1cb1B8lvZD1bsX2/vVnimwC82wspQ78Bkap
   5sWVlhvYmW4ztCH7c6SioiuxpvEzcUl91QrucYP5J3jleeCDfA98iFnOl
   g==;
X-CSE-ConnectionGUID: /czk/Gb3Sbqa7GBAQgYA5w==
X-CSE-MsgGUID: yv0oX/CNSqyWAkbULkqtkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79190013"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="79190013"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 08:36:45 -0700
X-CSE-ConnectionGUID: Crw6s1wKQhOTfCJ5+Ut18A==
X-CSE-MsgGUID: /wEisOUQQ1q5VjJYnATIug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228987290"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa005.jf.intel.com with ESMTP; 23 Mar 2026 08:36:45 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] platform/x86: ISST: Correct locked bit width
Date: Mon, 23 Mar 2026 08:36:35 -0700
Message-ID: <20260323153635.3263828-1-srinivas.pandruvada@linux.intel.com>
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

Fixes: ea009e4769fa ("platform/x86: ISST: Add SST-PP support via TPMI")
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: stable@vger.kernel.org
---
Changes:
v2:
	No code or description change. Only Fixes and Cc-stable tag are added.

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

