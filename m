Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96D54A482F;
	Tue,  6 Oct 2026 18:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311459; cv=none; b=UvghpcjDhz89aPMt26noBJ9RtO0Cj+hifxKxuHNntTTho61TR7fAJkKy+MPWmb/3qL2g1plWmpLDR81bbgJQOFBr1tX8NNqrkJo/ADVfhuiJE8rCqu6N2wlETwfeWKd8NZCx8NFC6FB22t8Rc7rZa8MIekpe7qYEewKC80Vigno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311459; c=relaxed/simple;
	bh=xP6omJUzOTsdefm8xW7u8ghOXXFftXaatOunE+Cb2U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+2uzipSzGl+zvTIat9V45MybUuz9uyGrzWeLbOagSold8OkP0PVi3rESL5/p4pGuK0h5GYx+PWYobuxH7ynWldZkQs7ZsB4GlU3TfbiW4c4bo1+KKVTflozuYjZNqPMXGAI8QQzWqiLuPHbhPMtzyTTX8zQ4U/Mb1oowKWcsSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6kz1ZY4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6kz1ZY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311458; x=1822847458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xP6omJUzOTsdefm8xW7u8ghOXXFftXaatOunE+Cb2U8=;
  b=n6kz1ZY4iQAlujx624oT6ueIJi0esLEdZe3oveDXAzHBp14/ZO21SSDY
   ZKJogiMXVueMJYHbBRq+icsoBWVdI+nbAWz4kYNxmc+aHSxv1w92IIRtv
   tlgjiiok3HqvooL8peGcCTkGLrZ+1XGO3ruQNMifF/NGt4w2FCyD5yUXb
   kdZn/Cog4KZsszo95gpfmNyyvkjRMWC7kWFEbRKtBX7sRd/6bwrTn/vuD
   xLwCEbGynq4u+bBaN8zRpdRIuxfnOqCnHPekiQqgVDf6C8lwfKaBI52Zn
   dsFwqyS9WHkzsjF8WaPqxCo1Wk2Xh+AqvY+c0hIXr0hN9x/X/7HWo2+nG
   w==;
X-CSE-ConnectionGUID: 9l5TbiEmS/ydBMFvbcPthw==
X-CSE-MsgGUID: VrPjJ0uqQo+Wa71gaQUq5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591592"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591592"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:55 -0700
X-CSE-ConnectionGUID: x9/rTUnVR7iGwa44i5MP2w==
X-CSE-MsgGUID: 2/spysWXRD2Vz5iD8ZT0kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500255"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:55 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/20] platform/x86/intel/tpmi: Get tpmi_info directly from the parent device
Date: Tue,  6 Oct 2026 11:30:21 -0700
Message-ID: <20261006183037.1507007-5-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

