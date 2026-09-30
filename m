Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269D5517BAF;
	Wed, 30 Sep 2026 17:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789377; cv=none; b=K+TRAmwaU/GZQmKxJMveoNQVDACDUiJz02pjzV7ZMYuF5uX6nlHuuXzXKBDiM3B+ScsyjraM161Cz1lJaoe2INVrO6NMhNTgi7QK9SuT89onqkn5aA1PjJSbZBJDYVMXdRyCGlTHJSYnq8UqY7ykZk0BPnIiDDoxujW87rwWQLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789377; c=relaxed/simple;
	bh=1YKJlmNEPCE2F3n+VhEhSB9oLunKLzhg22mwoRQ9ck4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pfQ0uzrrD3cr/PgfBXswDViPT1LG1HaYCtrG1ZEJh5ZTpgg7mbeTCkH9KiSO988EyJ//nYNZcODD4Vol5kaFm8i4tBrTJ+ZzfAQVAT2QKwLCAYZUhhtnoQxg/K67JNjqKw906eAfs3NsdbjEi/MklRWBngOtK80VwqhPvmzLydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YyvfOfKu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YyvfOfKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789376; x=1822325376;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1YKJlmNEPCE2F3n+VhEhSB9oLunKLzhg22mwoRQ9ck4=;
  b=YyvfOfKu4lqW8Z3ej49pLEtm1ksEG0GQJous8yW8vSxFpMurTtWIOnJS
   3FhPYGUG58MMWbUKCfVc/U8bHgW09F7sDQKcaHEtIqXsR10AHwdP5IDmY
   GCoUDi8QXWgKQoNDRsMrSjXpTVpTJ3KMYnp2MbMRRgJ9g6gfs/Q4rE+pw
   6DBeDcqJXcoT1ppVm6/7ME3bSNvDHXUAXS7X+A3b0mq+XxVQweT1v9o9U
   miAdvFr3MiBv5A3PInbd1wcXClR1DmGok6PVLmEU6M+q3GO3xduFxH+dL
   GCIO/Ii2u4FMSMZe11TWlAv2kW+Gqfz4OVnYkK67U+WwHw8x1hCq2bqRX
   Q==;
X-CSE-ConnectionGUID: 9YrwEa1vSxOGMHXzsM2pWA==
X-CSE-MsgGUID: 6lbdECNFQ2GsWUnVv4ZLQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632055"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632055"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:34 -0700
X-CSE-ConnectionGUID: KrVkQ9qdRNq7UfNGA85BEQ==
X-CSE-MsgGUID: 2UzCbFAkRaKiv6fxfsy/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959395"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:34 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/20] platform/x86/intel/tpmi: Remove unused vsec_dev from intel_tpmi_pm_feature
Date: Wed, 30 Sep 2026 10:29:00 -0700
Message-ID: <20260930172918.743656-4-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intel_vsec_device pointer stored in every PFS entry is never read
back. Remove the field and its assignment.

No functional change.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index edeae3fd23a1..fdca799f7cf9 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -93,14 +93,12 @@ struct intel_tpmi_pfs_entry {
  * @vsec_offset: Starting MMIO address for this feature in bytes. Essentially
  *		 this offset = "Address" from VSEC header + PFS Capability
  *		 offset for this feature entry.
- * @vsec_dev:	Pointer to intel_vsec_device structure for this TPMI device
  *
  * Represents TPMI instance information for one TPMI ID.
  */
 struct intel_tpmi_pm_feature {
 	struct intel_tpmi_pfs_entry pfs_header;
 	u64 vsec_offset;
-	struct intel_vsec_device *vsec_dev;
 };
 
 /**
@@ -767,7 +765,6 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 		int size, ret;
 
 		pfs = &tpmi_info->tpmi_features[i];
-		pfs->vsec_dev = vsec_dev;
 
 		res = &vsec_dev->resource[i];
 		if (!res)
-- 
2.43.0

