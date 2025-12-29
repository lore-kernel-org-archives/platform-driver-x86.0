Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10BF220F49;
	Mon, 29 Dec 2025 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033416; cv=none; b=AsCJBprGpQqiZ0LgaV8Y0f1WlEKM9IJG6sWZOerf7au6KrLV/99a5cLAneqekdB5IKNsj60CRh1ZWBDrsZ6g/OonnLInS6F+y12xNpIrYCN4Ey1Kci/KzbegzU63iQBdYAtObiZnezCAJplQc0szos+uZV/8MMOtBdgz5tBmAqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033416; c=relaxed/simple;
	bh=q0GBygwYbI5zUXyj6QNcghhn1CBbCCSv5rqq7GQJQEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ginbOPBXmzYQexK7A3hFKG9KyfzF9QgcHC72wqiQZJzT8YVk3ukvnKzc46Hg6eslJm+aU/SJ6pvDOHTeJzPLP1vKbayubRBoRX20yw7cKp9mA+jvsOcJyPQOsfswQ0X4ILKaymHHj+lmcTl2+WUGb8bJlLlXId6dt5uLOnzaBMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwBL+xTJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwBL+xTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767033414; x=1798569414;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q0GBygwYbI5zUXyj6QNcghhn1CBbCCSv5rqq7GQJQEw=;
  b=PwBL+xTJPmKZTWmnKR7EHR8BLUQy1QMu5b5dCJVSuIcM8Tx9FoxWWI1v
   zr0l70ZYne67eQFOTgK3oz+n67IJaEDsT1WD3Vn+5jO++CDbtWRvZxLmk
   3o4D8rBJzTfDa9qms/bHl0eMfOVhvNnqgaEqCfZ0cbSfCQMO+Z879NXFL
   HH6QeODwb+WI+WR+YtbfkKdxF9dKGRXdASl11DMcdqTddfhrKSIlO8TOt
   iNjyKwwzqpjud4nYy9NlrpnmkbtIGcm3o9QWaDzJ9HV+HQ9jS6NcsQSvE
   UQcM3MgZTKLuMbw6xlKar62F8tDalz+b6evsf5JCwrUYJvhRaV8bSDKhk
   Q==;
X-CSE-ConnectionGUID: LmOgHM5/QMOZskib3g6rrw==
X-CSE-MsgGUID: VYkxggqVTpCK1//e7CGZHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68613938"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="68613938"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 10:36:54 -0800
X-CSE-ConnectionGUID: +QBzUQvqS++aztqW/qJejw==
X-CSE-MsgGUID: i+zkzwvwSw2vbW4rl93/PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="201905969"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by fmviesa010.fm.intel.com with ESMTP; 29 Dec 2025 10:36:53 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86: ISST: Check for admin capability for write commands
Date: Mon, 29 Dec 2025 10:36:52 -0800
Message-ID: <20251229183652.823308-1-srinivas.pandruvada@linux.intel.com>
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
 .../x86/intel/speed_select_if/isst_tpmi_core.c        | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index 47026bb3e1af..a624e0b2991f 100644
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

