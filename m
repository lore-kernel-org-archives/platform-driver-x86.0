Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071A154145F;
	Tue, 13 Oct 2026 19:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919798; cv=none; b=JxqwxOxSbDp01YNJJ4YKcY9yzETBDQrPC6uN1tjP5gQ1wV37sCig6a5Iwq5r6djoXJd3biQH1/wjmLot73oeZ2/FZOuVryma2+767QAfiRd7AGvMNGAoQEQhFQkfsawmAs0vBHcrFmewFII+9OgFmmYmjGXUexZr3sORQno3oGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919798; c=relaxed/simple;
	bh=xP6omJUzOTsdefm8xW7u8ghOXXFftXaatOunE+Cb2U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gd7Kfms2a51KnxVVTTCGBTQ9ULpoVvS+9dLbT3g+edIxQtOXRZ14J+IZakjJ3KOepSYLhPasYB2GB/1LU0OgOnLsRwTKOrWKFe5zLzJxz/pLPgOkKM8hDayZDYFaSnKG2N62uHluV3tR8vRGfmbc8tG5rGaIGJ4gjaWvu+QJf4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lu28LokD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lu28LokD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919796; x=1823455796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xP6omJUzOTsdefm8xW7u8ghOXXFftXaatOunE+Cb2U8=;
  b=lu28LokDtjKzH4D+7CDgvzYrboXXaFvpTxt7Vd8DtIcp/4unNrXoETrS
   7fnhSSHwDTvQU99AUohvhQgnxZT+hoM0Im7LMdcfO7FxB9h9PS9yymcBZ
   /BXyJlCV8jJ6x9Cbs/4ST3y3uKXGksZlS1GYyTTGelhksvnIJsfMbsFjj
   d/hMKAzdq7buY/xLg6vsJhVMbeHsrDvgfZLYZs1auT2V2ftBE1W7sLExs
   sogknTEg8fSIfE73SViDpAoV06ZisIfAUXlMuvOhuAQDiLpeZ/ZeTwApn
   dzOaRGcn3dg3uQ7lhNSBGz9SzpZgj8AWQsI/q4wejc9OvMvx0tJorNqVa
   g==;
X-CSE-ConnectionGUID: LtfbtF0GQl22GXVYCIEXmw==
X-CSE-MsgGUID: u5ZoVioZRuCEFSTG+F5cXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544115"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544115"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:48 -0700
X-CSE-ConnectionGUID: 01SOE0YRRoq/lWRrb9w29A==
X-CSE-MsgGUID: C5bxwcs3T9ekLeIC2EHF3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167665"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/20] platform/x86/intel/tpmi: Get tpmi_info directly from the parent device
Date: Tue, 13 Oct 2026 12:29:19 -0700
Message-ID: <20261013192935.2243291-5-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tpmi_get_feature_status() and tpmi_get_debugfs_dir() are called by the
TPMI feature drivers with their own auxiliary device. Both convert the
parent device into an intel_vsec_device and then read the driver data of
the auxiliary device it was derived from, which is the parent device
they started with. Read the driver data from the parent device directly.

Apart from being shorter, this drops an assumption. dev_to_ivdev() is a
container_of(), so it only holds while the device the TPMI driver binds
to is an auxiliary device created by the Intel VSEC driver. Another
enumeration method binds to a different kind of device and the cast
would hand out a bogus intel_vsec_device. The driver data is set on that
device in either case.

The TPMI feature devices are not affected. They remain intel_vsec_device
instances allocated by the TPMI driver, since the auxiliary bus is how
the feature drivers are reached and not a property of the enumeration.

No functional change.

Co-developed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index fdca799f7cf9..d254dc6a4d0d 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -356,8 +356,7 @@ static int tpmi_read_feature_status(struct intel_tpmi_info *tpmi_info, int featu
 int tpmi_get_feature_status(struct auxiliary_device *auxdev,
 			    int feature_id, bool *read_blocked, bool *write_blocked)
 {
-	struct intel_vsec_device *intel_vsec_dev = dev_to_ivdev(auxdev->dev.parent);
-	struct intel_tpmi_info *tpmi_info = auxiliary_get_drvdata(&intel_vsec_dev->auxdev);
+	struct intel_tpmi_info *tpmi_info = dev_get_drvdata(auxdev->dev.parent);
 	struct tpmi_feature_state feature_state;
 	int ret;
 
@@ -374,8 +373,7 @@ EXPORT_SYMBOL_NS_GPL(tpmi_get_feature_status, "INTEL_TPMI");
 
 struct dentry *tpmi_get_debugfs_dir(struct auxiliary_device *auxdev)
 {
-	struct intel_vsec_device *intel_vsec_dev = dev_to_ivdev(auxdev->dev.parent);
-	struct intel_tpmi_info *tpmi_info = auxiliary_get_drvdata(&intel_vsec_dev->auxdev);
+	struct intel_tpmi_info *tpmi_info = dev_get_drvdata(auxdev->dev.parent);
 
 	return tpmi_info->dbgfs_dir;
 }
-- 
2.43.0

