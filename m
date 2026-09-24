Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F267C4AD4DA;
	Thu, 24 Sep 2026 18:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274250; cv=none; b=ETDzLqCnaINUVgglnhWgEsS72yo1tWl97I3ggkNE7MFsUyeJmQQYqiZirbPWEh6LV4SGJ7eoh2s/JPRD442P1CttiGeAxx0qYM1OZGBv8NoqL0DSLynfQcuCHWpWjCHVUF19j+IZveOC38phISvfv9ACNgfZEY2ca31uuCfT3gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274250; c=relaxed/simple;
	bh=LsLeqxYQgAybD6QcrWkUIw8mwMKm+WxkfDNLAHefl0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4eEYIpdvYZDx+hXoAhCqyaL/DRGlkYjaDe5w2hecZpOhd+CNxuuPW4VuOkxD283GU9ZfDuOVUu0JV96x8+C9Sp3slUqc6sDxaWUlAbq12sYxE/bsML1NwvijHOXehICfGZup2Py3TsyTPZO0h1r9oD91gBCxsSeamrIes8erHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFbaiZZ9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFbaiZZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274249; x=1821810249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LsLeqxYQgAybD6QcrWkUIw8mwMKm+WxkfDNLAHefl0c=;
  b=PFbaiZZ9tts8BLU/W7+XoBipTgCdGEUvbWEmh+im57LqYxW8Own63szQ
   cBpAV1wIWASo+DwCjpFHBuhj5MhwhFLj10QqU/OQBm/5mWjcR7k78B8Es
   /cQbJerlB5fvpcBdNHTX68YPPcmhKwdRHIX2DnHn5MC6aZhZaooA33Gdh
   RTWLk0997gMtAvFUfITS/VTd7rFTGordaCrV8t+onqDJgDmE4Yotgg/PK
   vw97NweDnKcMNxtIbXgFGIYW1a6Hqmkzrc6AAWQUYcMUSYdMIli6XwQKo
   rxnM3ozi40iMqNX2priWXp26EnE85a4cCg1Ms8n3yOE3S9xvqw/xknTd9
   Q==;
X-CSE-ConnectionGUID: GqMogmSMScmQKFlV7AYZ9A==
X-CSE-MsgGUID: fXs204AVTIKsDxMtXFxuNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164261"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164261"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
X-CSE-ConnectionGUID: SOULEzykR8eh2ShCFdX7WA==
X-CSE-MsgGUID: 14si3sNbQgSN++mlBbGxgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229919"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/19] platform/x86/intel/tpmi: Get tpmi_info directly from the parent device
Date: Thu, 24 Sep 2026 11:23:26 -0700
Message-ID: <20260924182342.212709-5-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

