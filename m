Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B355448F004;
	Tue, 22 Sep 2026 18:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102000; cv=none; b=K9VA4a4LAExS21t718G5P6gzFnxGx4MtAR5gQNFX2Atei7G+NiQF6xIDS29xxhLxP7ZWuPzF5XyTl5QPq1nBs6lD2i0/5KoV0tYp7wYXYZBHEFcbNaX8bA4SK1VgCQ+IgL40EVwKUohT6pSWqQIs0Sf6bwcbkx/KM0e4gSiw7p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102000; c=relaxed/simple;
	bh=LsLeqxYQgAybD6QcrWkUIw8mwMKm+WxkfDNLAHefl0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qp7To4+aX3uB/l03Se55IsIhNAZcXUMaJcMWLdasrhCzuzIavM3kmfnM2M1tp8g+7g208SBDmjz+dGWRVZ3kZxAoh2KaOLZ8XmDoFeUlQfm2l5shNsNFOkb5GpamW3MniYUx9qkmPwiH7wfjG3+kOfuYJ7RDmZtcgEWjqg87Zi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAsQfy4m; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAsQfy4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790101999; x=1821637999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LsLeqxYQgAybD6QcrWkUIw8mwMKm+WxkfDNLAHefl0c=;
  b=OAsQfy4mMTsAsn/YLk6IU/4JDcs0KiSmWn5c2ZuQed69NeG2ytJPWeyM
   ayfEaj7r8O/HRzcXqDcHMkKF+x5IXztxW2nYY/KNtsDh98eVPa8gmxgc+
   +LjeuL7/XqVbAHrCK0keA/gmFRCZDzC0rZhoEw9aU5A1iXrX/zFwXjjf0
   K9T+Oyvd9pKS6CyuI6lSE6QqbeJ4TG3kDFiDKpBMHcxQJn3wxaub1WOWU
   quvFkD3ztb29v3zHEOYrqepDDPEmXtzMBWyiUTsZk+/l6lZMJD5oEdEHR
   oR8RLRkNS76Vr9RaREijuRGHMns/xVdlZD9t01DI4wNyl50ijtGmcaReH
   w==;
X-CSE-ConnectionGUID: sLDiNNvZRE+NruV0U90cPA==
X-CSE-MsgGUID: ZEoFh/r+S3i7MrfRyIJEIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94564892"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="94564892"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:33:15 -0700
X-CSE-ConnectionGUID: ohGRwNeHR+CwXnK5R8frYg==
X-CSE-MsgGUID: d6dslco4QvuLKPCv5hrqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="271827974"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:33:15 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/10] platform/x86/intel/tpmi: Get tpmi_info directly from the parent device
Date: Tue, 22 Sep 2026 11:33:05 -0700
Message-ID: <20260922183311.3783010-5-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922183311.3783010-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260922183311.3783010-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

