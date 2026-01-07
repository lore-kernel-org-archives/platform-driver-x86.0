Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006AC20468E;
	Wed,  7 Jan 2026 06:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767766055; cv=none; b=h4ty56i+zlfOgRH6IRgu6fDCdkHBskJ8jMBVqYVktS1mAMlzJ5LbZkGwW/JP5Z0OqcFIAudUEWNXzzTbfApOGXUsgKzJizI9mXNESP6Mlmj68PsDGR1z20BxrqR4mQTBVZawOtey+UQDB4Htu0kz1Z3LCPYVM9/iE+PeJ9/vf7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767766055; c=relaxed/simple;
	bh=NO9Gvz8FSLVa0p2shZC7kmmQ9qj/aH5C0DbnhqQ0w/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UcUE/w7GmWF1zeLsnHDKWMKh7H5NTsUMPnNOHN8aaS2Wo1z8MVfnIXCaawE0B6HrjGSC5pOWPGJVZ8ftYSYW1+LGWSG7upHQaIyIqTifpEAODYw2V7ypYkkPkJLIlnS8/GwGqnoHKdg+PLv+RbqY0Kzf6+B4T85ExwROqSs0IrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejCBFQlt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejCBFQlt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767766054; x=1799302054;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NO9Gvz8FSLVa0p2shZC7kmmQ9qj/aH5C0DbnhqQ0w/0=;
  b=ejCBFQlts0nOu5JjlJA3+WWRY4++7l2kHBapRNbuQSIPCRBmelYsuNqS
   n5cnAFtOUZfe/TnzFjwiPT1Cj3DZbt/dWOI4sOTgjZEN6PWHPJ9dc8u8A
   94QVJdCqRVyRcHCqTfUkqTF7aD35n3yTGW4A8knUGcnS1sGZqDF61H3Xh
   D2wz/bZSLjDsrxFptT7fSO46xG/MSVzmkFNAA13L7q2qxFZxBypas4CKy
   EEOjS97/cnYI3lHRtnPKCy476wB6qp9u8ym5jIfspptY31ks7+p9Wrk/S
   Dp22D19X6WiK01ih5O/vVustlgnoJAdKYopXbGoQR+VWuymkWQ4dKtRqp
   g==;
X-CSE-ConnectionGUID: 8SKsXeYRQfixN6qgPxZyLQ==
X-CSE-MsgGUID: U0mZcj9QQ2aPjbemvg4AVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69180839"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="69180839"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 22:07:32 -0800
X-CSE-ConnectionGUID: 5RTM+dcdQhe4sZbQHU1rmg==
X-CSE-MsgGUID: O5LqSg+lQ6WPWkqUbcC/1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="203104123"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jan 2026 22:07:32 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2] platform/x86: ISST: Check for admin capability for write commands
Date: Tue,  6 Jan 2026 22:07:29 -0800
Message-ID: <20260107060729.1634420-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some SST deployments, administrators want to allow reading SST
capabilities for non-root users. This can be achieved by changing file
permissions for "/dev/isst_interface", but they still want to prevent
any changes to the SST configuration by non-root users.

This capability was available before for non-TPMI SST. Extend the same
capability for TPMI SST by adding a check for CAP_SYS_ADMIN for all
write commands.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
This patch is dependent on series "
[PATCH v2 0/2] platform/x86: ISST: Fix for write lock and suspend/resume"

v2:
- No change, added dependency info above.

 .../x86/intel/speed_select_if/isst_tpmi_core.c        | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index 13b11c3a2ec4..f71d7df03f35 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -612,7 +612,7 @@ static long isst_if_core_power_state(void __user *argp)
 		return -EINVAL;
 
 	if (core_power.get_set) {
-		if (power_domain_info->write_blocked)
+		if (power_domain_info->write_blocked || !capable(CAP_SYS_ADMIN))
 			return -EPERM;
 
 		_write_cp_info("cp_enable", core_power.enable, SST_CP_CONTROL_OFFSET,
@@ -659,7 +659,7 @@ static long isst_if_clos_param(void __user *argp)
 		return -EINVAL;
 
 	if (clos_param.get_set) {
-		if (power_domain_info->write_blocked)
+		if (power_domain_info->write_blocked || !capable(CAP_SYS_ADMIN))
 			return -EPERM;
 
 		_write_cp_info("clos.min_freq", clos_param.min_freq_mhz,
@@ -751,7 +751,8 @@ static long isst_if_clos_assoc(void __user *argp)
 
 		power_domain_info = &sst_inst->power_domain_info[part][punit_id];
 
-		if (assoc_cmds.get_set && power_domain_info->write_blocked)
+		if (assoc_cmds.get_set && (power_domain_info->write_blocked ||
+					   !capable(CAP_SYS_ADMIN)))
 			return -EPERM;
 
 		offset = SST_CLOS_ASSOC_0_OFFSET +
@@ -928,7 +929,7 @@ static int isst_if_set_perf_level(void __user *argp)
 	if (!power_domain_info)
 		return -EINVAL;
 
-	if (power_domain_info->write_blocked)
+	if (power_domain_info->write_blocked || !capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
 	if (!(power_domain_info->pp_header.allowed_level_mask & BIT(perf_level.level)))
@@ -988,7 +989,7 @@ static int isst_if_set_perf_feature(void __user *argp)
 	if (!power_domain_info)
 		return -EINVAL;
 
-	if (power_domain_info->write_blocked)
+	if (power_domain_info->write_blocked || !capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
 	_write_pp_info("perf_feature", perf_feature.feature, SST_PP_CONTROL_OFFSET,
-- 
2.52.0

