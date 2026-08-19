Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF01D34404B;
	Wed, 19 Aug 2026 17:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787161097; cv=none; b=iyFuOMfdesjfq+JiLMLW3fAbfyYmrwF/0P1EqXoo43stj5rKCtcozMo8a9lDLXESVkXT3ltgzW0K1/FMirTkGNmV0JbyeZ7rbON2dy5KKO8GXzxYA42RIDrqQLnwHAXJhciQRDP3bDRBebADPR6qKYxZo3YEwnQCVazWLIO/CuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787161097; c=relaxed/simple;
	bh=qDDbCoFTFBIJXv1NIMJBCpQj1wfQa88c+eKXso4C5mY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=USppkrJTndRxIii1RORSTYswXQASMY0Xj4x26KtR2dGY6Ow1YO6ZH8Nw2Y9e6KXNWvq1ObBVci8AYDzjJt2pH4nGRMwFkFPDxdpuXZX61en632z+NuXmj8OrZXaVrZikOstQs/K/3RPpsxRz0Fo+AE+OId8BQXiCU3bwQMpJvUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9U22eUG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9U22eUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787161095; x=1818697095;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qDDbCoFTFBIJXv1NIMJBCpQj1wfQa88c+eKXso4C5mY=;
  b=d9U22eUGPj6/uZPVrE9djlvcUgOfBE20rpS4UIsww73T7OCQGFLTo0gp
   rZzgAPwBSCrXYMXaK2sG0kOzi0Y06lIQsuDzH09UM/4KwP41iOm03RUay
   RyKrbWXSgMmRvYOzNHmHiYJW5Ypn1nhITaX5H20z/ULd+d5Wv9cyWDAom
   Qd1u82C0JXAHrvyRzdtfYTqw9ViM9utNW+oexLC6AclpxBmLmU80H33oB
   jWAeH+y4QUka4JP+DJ8LJKqMIBma/OWzxq6cvIw9SBDfRlQeZp6MSlI16
   JtqFpz8bnZDH62FcPnQhMiO77hV1KyUbFmELEo18mQzQFzMjGB1invKTZ
   Q==;
X-CSE-ConnectionGUID: MruifMzJR76JkRlB65VHBQ==
X-CSE-MsgGUID: 0HhFvy8LQLGaBBLDbhY1mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105071330"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="105071330"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 10:38:14 -0700
X-CSE-ConnectionGUID: zFP5YTYcS/ukklUZNMqA1w==
X-CSE-MsgGUID: +BhcxwzmR5q+HOz3rKUhUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="262358356"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 10:38:13 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: David E Box <david.e.box@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v1] platform/x86/intel/pmc: Add rugged Panther Lake support to intel_pmc_core
Date: Wed, 19 Aug 2026 10:38:04 -0700
Message-ID: <20260819173804.1184250-1-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Add rugged Panther Lake support to intel_pmc_core driver.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/pmc/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 825ba5fa0bcb..14e186aa15fe 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1849,6 +1849,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
 	X86_MATCH_VFM(INTEL_ARROWLAKE_U,	&arl_h_pmc_dev),
 	X86_MATCH_VFM(INTEL_LUNARLAKE_M,	&lnl_pmc_dev),
 	X86_MATCH_VFM(INTEL_PANTHERLAKE_L,	&ptl_pmc_dev),
+	X86_MATCH_VFM(INTEL_PANTHERLAKE_R,	&ptl_pmc_dev),
 	X86_MATCH_VFM(INTEL_WILDCATLAKE_L,	&wcl_pmc_dev),
 	X86_MATCH_VFM(INTEL_NOVALAKE,		&nvl_s_pmc_dev),
 	X86_MATCH_VFM(INTEL_NOVALAKE_L,		&nvl_h_pmc_dev),
-- 
2.43.0

