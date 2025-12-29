Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E742F332ECF;
	Mon, 29 Dec 2025 18:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033366; cv=none; b=EGMhrZdZ14XPTgVFH8AsiapiGamHvMpw0AI5zE7YKdhAMC+bMjB5HGfNLz+oLqam11xQxcXYUn6tELWRuyIGisxCLcm7rEzgRiLgohxtu+xNJlqCPaOOYUn4lzMxNgLNDXSh1huBN8JzOFx6Ip+Nsqz5/7MHUxruS5Fw9XD31RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033366; c=relaxed/simple;
	bh=1r71bdM4B7tlUEwpo+glNlcnDgxVr7ySd6faVG2Zu5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YxNkYdOXy24xxqXiJIIxMslLYbKgtAt4ICV7ESsKpU1YPG1ZxL+k3oGdUo+Vr8kFMvag87WuE9/0aUayfUwsBd/C4tiqazxvloC4WWiX/WvnKfDqeeuGXsPkL1pJlIZNjONqydmt7gbujhtqbNGI0fPIaT5BktDw+1kB3MXm3g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9TQ4hVE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9TQ4hVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767033365; x=1798569365;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1r71bdM4B7tlUEwpo+glNlcnDgxVr7ySd6faVG2Zu5g=;
  b=L9TQ4hVEdtT5kyKGaeTa/s3rXxzQfM/hBWGd7igSeCx0KbF6vKox/7GG
   6Yp3RpW2FVmR27l4461y5FPvfHvEgjv9o4HtnV+ZlOK0FTvCrarSwYGvN
   i8W+5Lxvh8VcuQoQkahIFR6XnnJg42DMq5XK+KccgU7or9Rvk1DY9iAzl
   ZY9C+3Pqbul7VBYsK7gX+u4/WJOG7gZl0ghvKy23DxveuzKMowTcWK9Fp
   scK/LTMxHd6U9R1hCG1SfCeIATEC60wNLZ3A6AuSgkwIbSnCLDzs4bMxO
   5NBGS37KAP/wgLFAQ50b94GlBgDD2XsBFAI22keKPUHJtPhj4lB1oJgav
   w==;
X-CSE-ConnectionGUID: icliobe0SEu7WHENGItRIA==
X-CSE-MsgGUID: hcTpKRHWQweohi5V7O89rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80009872"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="80009872"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 10:36:04 -0800
X-CSE-ConnectionGUID: Ru8ODarcRKydzmqeZtrSOg==
X-CSE-MsgGUID: wmlLMxVfQ12uET59Pqg1SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="200197430"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa010.jf.intel.com with ESMTP; 29 Dec 2025 10:36:04 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86: ISST: Optimize suspend/resume callbacks
Date: Mon, 29 Dec 2025 10:36:02 -0800
Message-ID: <20251229183602.823275-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If SST-CP or SST-PP is not supported then don't store configuration
during suspend callback and restore during resume callback.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../x86/intel/speed_select_if/isst_tpmi_core.c  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index a624e0b2991f..5c4e1b4c0131 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -1721,6 +1721,9 @@ void tpmi_sst_dev_remove(struct auxiliary_device *auxdev)
 }
 EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_remove, "INTEL_TPMI_SST");
 
+#define SST_PP_CAP_MASK_BIT_CP_ENABLE	0
+#define SST_PP_CAP_MASK_BIT_PP_ENABLE	1
+
 void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev)
 {
 	struct tpmi_sst_struct *tpmi_sst = auxiliary_get_drvdata(auxdev);
@@ -1741,6 +1744,9 @@ void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev)
 		if (!pd_info || !pd_info->sst_base)
 			continue;
 
+		if (!(pd_info->sst_header.cap_mask & BIT(SST_PP_CAP_MASK_BIT_CP_ENABLE)))
+			goto process_pp_suspend;
+
 		cp_base = pd_info->sst_base + pd_info->sst_header.cp_offset;
 
 		pd_info->saved_sst_cp_control = readq(cp_base + SST_CP_CONTROL_OFFSET);
@@ -1749,6 +1755,10 @@ void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev)
 		memcpy_fromio(pd_info->saved_clos_assocs, cp_base + SST_CLOS_ASSOC_0_OFFSET,
 			      sizeof(pd_info->saved_clos_assocs));
 
+process_pp_suspend:
+		if (!(pd_info->sst_header.cap_mask & BIT(SST_PP_CAP_MASK_BIT_PP_ENABLE)))
+			continue;
+
 		pd_info->saved_pp_control = readq(pd_info->sst_base +
 						  pd_info->sst_header.pp_offset +
 						  SST_PP_CONTROL_OFFSET);
@@ -1776,6 +1786,9 @@ void tpmi_sst_dev_resume(struct auxiliary_device *auxdev)
 		if (!pd_info || !pd_info->sst_base)
 			continue;
 
+		if (!(pd_info->sst_header.cap_mask & BIT(SST_PP_CAP_MASK_BIT_CP_ENABLE)))
+			goto process_pp_resume;
+
 		cp_base = pd_info->sst_base + pd_info->sst_header.cp_offset;
 		writeq(pd_info->saved_sst_cp_control, cp_base + SST_CP_CONTROL_OFFSET);
 		memcpy_toio(cp_base + SST_CLOS_CONFIG_0_OFFSET, pd_info->saved_clos_configs,
@@ -1783,6 +1796,10 @@ void tpmi_sst_dev_resume(struct auxiliary_device *auxdev)
 		memcpy_toio(cp_base + SST_CLOS_ASSOC_0_OFFSET, pd_info->saved_clos_assocs,
 			    sizeof(pd_info->saved_clos_assocs));
 
+process_pp_resume:
+		if (!(pd_info->sst_header.cap_mask & BIT(SST_PP_CAP_MASK_BIT_PP_ENABLE)))
+			continue;
+
 		writeq(pd_info->saved_pp_control, power_domain_info->sst_base +
 		       pd_info->sst_header.pp_offset + SST_PP_CONTROL_OFFSET);
 	}
-- 
2.52.0

