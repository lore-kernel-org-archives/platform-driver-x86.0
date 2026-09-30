Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B9E5187EB;
	Wed, 30 Sep 2026 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789379; cv=none; b=UF2RT137nMpE4T00q3EPf90//zxd4wmXwaGjex3/vCbIzQdG9YPpPH2BLMFj1D/sDu4gnvYCBRYUcu+JM0NMXd17XvepWj4C/5N8FIAh4vlpyUyn2xpIQDVl65bBu0d0+qa+nzUcHcwxCYYjONzMKeqc/LV7hIhgglHzXGuTxCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789379; c=relaxed/simple;
	bh=TKLJqwOdfqdczTZY63mKSLHqDkP1wnzAjiDjiaAxGBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+8bUFRX2VbEGlVVnmw6tUlNXolm1E1CIL1mVZAdd5IkMoPozIj0QvI7LzxvCe3FbjL0rjHEut9x2V4VEV/DUBfWH7OlnN1JQEBtl75QgkFZbei1ncwLFHEl3qhs0Vq9fSLEfIXFGr5m1KcxnZq7scJkxY9V5wl48U/Qnu696DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SA8vniUT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SA8vniUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789378; x=1822325378;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TKLJqwOdfqdczTZY63mKSLHqDkP1wnzAjiDjiaAxGBc=;
  b=SA8vniUTBJZQADhKAGFNTtCRPuLdYCywLZBXpRj8FKX538w2y34NPhlt
   CGCOCIpnZ4Kfy8XZS7yXf5+EnBe6S2E1BLEqvrl+4hztIDJ0PNzIrsYOC
   bTAj10p3CwHiczzOI3ADx/9WzcSmzdlozNlRt96shT0uPQ+oK4qrCVoN5
   12idrA0uYlTusfF4Vrn0hYbR1P+aE5CF3UngFanYXbgR4xviTKcvD6CPH
   2VY/HUuAEMxip0wb0bzdFsOV0Im5IOqq8tldKBpoBfXLAcr3SebGPkmZR
   kQ7PoFbjyU7ccGEDQgDVrhax7UlZBszeF/c9rN1NJ9Ydsfj/hHmzGXoSs
   w==;
X-CSE-ConnectionGUID: b1potfRaRQG6oiu3p3jwfw==
X-CSE-MsgGUID: UIewxMJ2QkaXHXYHa2dDgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632064"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632064"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
X-CSE-ConnectionGUID: wDj7Vw+KRcGcjEIEaTR3Qg==
X-CSE-MsgGUID: Z5dqQxT3TquL21DOhk9Rpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959408"
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
Subject: [PATCH v3 07/20] platform/x86/intel/tpmi: Drop unused arg from tpmi_set_control_base()
Date: Wed, 30 Sep 2026 10:29:04 -0700
Message-ID: <20260930172918.743656-8-sathyanarayanan.kuppuswamy@linux.intel.com>
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

tpmi_set_control_base() takes the device for its devm_ioremap() from
tpmi_info->tpmi_dev, so the auxiliary device argument is unused. Remove
it.

No functional change.

Co-developed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index f3cd8aa30af0..f1dfe2b23c9c 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -565,8 +565,7 @@ static void tpmi_dbgfs_register(struct intel_tpmi_info *tpmi_info)
 	}
 }
 
-static void tpmi_set_control_base(struct auxiliary_device *auxdev,
-				  struct intel_tpmi_info *tpmi_info,
+static void tpmi_set_control_base(struct intel_tpmi_info *tpmi_info,
 				  struct intel_tpmi_pm_feature *pfs)
 {
 	void __iomem *mem;
@@ -809,7 +808,7 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 		}
 
 		if (pfs->pfs_header.tpmi_id == TPMI_CONTROL_ID)
-			tpmi_set_control_base(auxdev, tpmi_info, pfs);
+			tpmi_set_control_base(tpmi_info, pfs);
 	}
 
 	tpmi_info->pfs_start = pfs_start;
-- 
2.43.0

