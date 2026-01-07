Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10A73C2F;
	Wed,  7 Jan 2026 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767766614; cv=none; b=ToZM9GkksPI6D5P1ZJwAWBkaUAdabM/s8G/RhpkWTuKrST4sZrBDi4eoIBGqS1El5ENbuvTG6ukDr9tFM3FDfzwcaxiL1Lg84v6be3OJSXoGgdWf3wtTlUFtn4YRw1l4Q7ip7ok62E/TFRs5UignI++LraI6MI+8wMl/tfBdjrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767766614; c=relaxed/simple;
	bh=VFe3vXISGLmb6xx2PeD4uXP8/xRHv9ATvduP9a58mSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OcxHNMGLo275tMeIcGVC53az5gPXBksWNwqWCL0IGCDhsxYKLaTfk4X1/qObzBcwrtUmDxZz66tJagT+TJwmHp3sMSG/JKxanZMTFInNXBFLNzhQ9EJ2il9D49EyiaLy7fFfG85MJjotw990NijhS8dgZ6WeDPI8WbAMuTXcMu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gg4nmp72; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gg4nmp72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767766612; x=1799302612;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VFe3vXISGLmb6xx2PeD4uXP8/xRHv9ATvduP9a58mSU=;
  b=gg4nmp72dbqySMyEGcY1FOfyYHxGprJchCAjfpIExeVIt0JddgKBorfV
   x7wYjQpL9IAzcuAbpiNp2eyzxEZ+TL8vTT8FM3uVppeNuGhEu31W3vRXF
   m912r7VUDcjf2yg2MBDV7/7ulatWsl+NTgbx0bIH78JQmW6wf/yJ8G/1N
   HQhNt16jcvoH8WVCyMMLeletPwnv70Gv496rvf54kg8Z+Z92dKN59ggQH
   hAOXGL8WBmnwhetkjx6p/IrnZsfkZXOpAp5mGZirLxRFFce20e7zmR1DC
   GHf5o8WcDL3XN9NEFwS0AYT7ztUOfnudeS5JJ7gBVSgYWekbAgsHlLd8D
   Q==;
X-CSE-ConnectionGUID: ebY65HKFQ/CF9RUTR3bvCQ==
X-CSE-MsgGUID: +pBi7KSHQVyWCxs4oKGgbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79435471"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="79435471"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 22:16:51 -0800
X-CSE-ConnectionGUID: i7HJfNc4T2SiSIDYuwbbEw==
X-CSE-MsgGUID: W9mSJB9FSJeBsXkjIJgS2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="202060833"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa010.jf.intel.com with ESMTP; 06 Jan 2026 22:16:51 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2] platform/x86: ISST: Optimize suspend/resume callbacks
Date: Tue,  6 Jan 2026 22:16:49 -0800
Message-ID: <20260107061649.1634737-1-srinivas.pandruvada@linux.intel.com>
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
This patch is dependent on series "
[PATCH v2 0/2] platform/x86: ISST: Fix for write lock and suspend/resume"

v2:
- Move bit definition to defines

 .../x86/intel/speed_select_if/isst_tpmi_core.c  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index f71d7df03f35..9c078c8acb50 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -1721,6 +1721,9 @@ void tpmi_sst_dev_remove(struct auxiliary_device *auxdev)
 }
 EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_remove, "INTEL_TPMI_SST");
 
+#define SST_PP_CAP_CP_ENABLE	BIT(0)
+#define SST_PP_CAP_PP_ENABLE	BIT(1)
+
 void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev)
 {
 	struct tpmi_sst_struct *tpmi_sst = auxiliary_get_drvdata(auxdev);
@@ -1741,6 +1744,9 @@ void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev)
 		if (!pd_info || !pd_info->sst_base)
 			continue;
 
+		if (!(pd_info->sst_header.cap_mask & SST_PP_CAP_CP_ENABLE))
+			goto process_pp_suspend;
+
 		cp_base = pd_info->sst_base + pd_info->sst_header.cp_offset;
 		pd_info->saved_sst_cp_control = readq(cp_base + SST_CP_CONTROL_OFFSET);
 		memcpy_fromio(pd_info->saved_clos_configs, cp_base + SST_CLOS_CONFIG_0_OFFSET,
@@ -1748,6 +1754,10 @@ void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev)
 		memcpy_fromio(pd_info->saved_clos_assocs, cp_base + SST_CLOS_ASSOC_0_OFFSET,
 			      sizeof(pd_info->saved_clos_assocs));
 
+process_pp_suspend:
+		if (!(pd_info->sst_header.cap_mask & SST_PP_CAP_PP_ENABLE))
+			continue;
+
 		pd_info->saved_pp_control = readq(pd_info->sst_base +
 						  pd_info->sst_header.pp_offset +
 						  SST_PP_CONTROL_OFFSET);
@@ -1775,6 +1785,9 @@ void tpmi_sst_dev_resume(struct auxiliary_device *auxdev)
 		if (!pd_info || !pd_info->sst_base)
 			continue;
 
+		if (!(pd_info->sst_header.cap_mask & SST_PP_CAP_CP_ENABLE))
+			goto process_pp_resume;
+
 		cp_base = pd_info->sst_base + pd_info->sst_header.cp_offset;
 		writeq(pd_info->saved_sst_cp_control, cp_base + SST_CP_CONTROL_OFFSET);
 		memcpy_toio(cp_base + SST_CLOS_CONFIG_0_OFFSET, pd_info->saved_clos_configs,
@@ -1782,6 +1795,10 @@ void tpmi_sst_dev_resume(struct auxiliary_device *auxdev)
 		memcpy_toio(cp_base + SST_CLOS_ASSOC_0_OFFSET, pd_info->saved_clos_assocs,
 			    sizeof(pd_info->saved_clos_assocs));
 
+process_pp_resume:
+		if (!(pd_info->sst_header.cap_mask & SST_PP_CAP_PP_ENABLE))
+			continue;
+
 		writeq(pd_info->saved_pp_control, power_domain_info->sst_base +
 		       pd_info->sst_header.pp_offset + SST_PP_CONTROL_OFFSET);
 	}
-- 
2.52.0

