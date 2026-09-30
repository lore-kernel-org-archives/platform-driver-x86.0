Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD792D594F;
	Wed, 30 Sep 2026 17:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789381; cv=none; b=rGRsYkrBxYo6viTH40y03orHFYUH2ieN9hLSg8pEKiLOLnEGCHI26fJ2LNqqNnEc1kHEzqFJFNeVJbn1XITYB97Zl68zY+E31r3IlHmYCdSimVDHtcT08lYgLvKjR/uziMzjfmz91cwLLxrEGkaCvsOWR7ki7y1nn9tyqavHMYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789381; c=relaxed/simple;
	bh=LsLeqxYQgAybD6QcrWkUIw8mwMKm+WxkfDNLAHefl0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q7ilz1wMwVJwDlA81Z79xNSAWuronDUFX9KCFqV2SCb9F3/PxxflsaOM2/iN7QGb5T+QHuHyMSh3lklbNh7xCO4owizvGi2iLU5Cykl0TREXTBGpoXBKUX+HtZkb3tE4VZegfTSfDGNJ6vCDz0mFcNz4D7PMI285fKNB1lFPlDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3rHc+Nh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3rHc+Nh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789381; x=1822325381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LsLeqxYQgAybD6QcrWkUIw8mwMKm+WxkfDNLAHefl0c=;
  b=i3rHc+Nhiq2K0BZ6kigulGgGItB58CK8sMbJvDR0usiYh65odFF7w5Rc
   f1xhGS6FRhdm9jpTk+Wk+2+DfauvuYF/e64wQvN4ewMEhMa/ZyFo/jwBc
   XYY8Nq8va/3rp4oaL+5j0U8XInXNvrOJUc3t8+NUV0tQV+/9IsdtpmZTw
   mzXuY/OIWbmIXKafia3So+Q1jO8BnKhmiM4ffILOb0viRdlPWwaVfNmPR
   lo4EbDyG2hVg7ZOxXM8uQkpYdr3fpmXR+XNumX+IVuBABTzpUGASxOK8b
   zCL12gouSUku/ZuI1VwoUxF8QcaKtL2djm5BsPI95CZnKwlBh+Gi6dsNx
   A==;
X-CSE-ConnectionGUID: SuLQlPZKTJeXEgQ2rBibOA==
X-CSE-MsgGUID: OuXoeWcvSFa5c6ICr7bzvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632057"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632057"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:34 -0700
X-CSE-ConnectionGUID: cAzG29mwRvmSiYqRXUOlKw==
X-CSE-MsgGUID: EWQDEDZyRC+2RIRYzDI9dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959398"
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
Subject: [PATCH v3 04/20] platform/x86/intel/tpmi: Get tpmi_info directly from the parent device
Date: Wed, 30 Sep 2026 10:29:01 -0700
Message-ID: <20260930172918.743656-5-sathyanarayanan.kuppuswamy@linux.intel.com>
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

