Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71424456E19
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 20:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157536; cv=none; b=e1w/WuSUg7WOAcDhwLd8DczNcixUMwyvXiMv5GubLfwxCEYlKOHbTnlVYpOVcM3T0FXp8tRLKsgf/8eiDu62sfEk2pH8VoFCJsbiX5B/6pdekkhHBXlFj7aUykVa6r77QgHyQcBuALcr9tgh2I2M3YobGnPCHDga8Uz6dHSSNwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157536; c=relaxed/simple;
	bh=cBLkstfZV7FeSnmOp5Vv8t6GcefvtRBwmlxcw1AND1k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTKm3jsqSfy9wz+sZyj5tFV00mCdD7qw/8Y7CXAYuIIfkWOUPTY2OAkh0B/rgaUTZ6L017BwQkGTDfTvSoaKttpS5tXLjJdrUrTy81buER9yAvu7NuORbGgoj97Xqs+TPcU6/JPoNp07HtiA6JaASW4nxmlO2pVyRDEa+qKoJWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5J9F7JY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5J9F7JY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789157532; x=1820693532;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cBLkstfZV7FeSnmOp5Vv8t6GcefvtRBwmlxcw1AND1k=;
  b=M5J9F7JY7yK45sZ5XJ8YHqicCFByuolFum3y5e6oXIT1b3uzniCgkz1B
   cgibEN12VkPGy18h4cEpcEx95SQUqoBc5W2HfPhua8gt/ZsbFe88lUeir
   gJosW8wmOSS9YE2rIejNLDkhxyGYi/MNSWSBWfuj0s3jf4UNaaXChqW5u
   wCCAAA4zOEETvG6KtAb97yBWXnkGz62mTioTbd7IDkbpPHGjh+htkfoed
   tD8Ss1TefCz802Mj9rxcBjtumk7JIQnAktsLUDnriL1m78D4TNyt7nNoD
   Kep/mBfSAdiKPxg75/vIL3BlnAo0oIUJfglP4d1dsvvz6hOiIh3AvTLpv
   w==;
X-CSE-ConnectionGUID: 5cSG9D6nSg6tWiLMwb35Bg==
X-CSE-MsgGUID: K0b9FndMSjGQ45ZZAG3BpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115162392"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="115162392"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
X-CSE-ConnectionGUID: k71HEDN/S2OsaojZg7dunA==
X-CSE-MsgGUID: xdcS01ZuQbmZBJqhkCOtaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="277272091"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com,
	anoop.c.vijay@intel.com,
	badal.nilawar@intel.com,
	matthew.d.roper@intel.com,
	james.ausmus@intel.com,
	karthik.poosa@intel.com
Subject: [PATCH v8 08/20] drm/xe/vsec: Use correct pm state get
Date: Fri, 11 Sep 2026 13:11:56 -0700
Message-ID: <20260911201148.1610547-30-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Crashlog needs to be collected at all times.  The current pm check
assumes telemetry only.

Update read path to enable device for crashlog instances.

Include check of the WATCHER CAP_TYPE for completeness.
WATCHER is a possible type and needs to be accounted for, but is not
supported.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Fixes: 2c402a801c19 ("platform/x86/intel/pmt: support BMG crashlog")
---
 drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index dd7723ba6c1c..468a221378fa 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 {
 	struct xe_device *xe = kdev_to_xe_device(dev);
 	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
+	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
 	u32 mem_region;
 	u32 offset;
 	int ret;
@@ -158,9 +159,18 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	telem_addr += offset + user_offset;
 
-	/* indicate that we are not at an appropriate power level */
-	if (!xe_pm_runtime_get_if_active(xe))
-		return -ENODATA;
+	/* Always allow crashlog. Telemetry, only when powered */
+	switch (cap_type) {
+	case CRASHLOG:
+		xe_pm_runtime_get(xe);
+		break;
+	case TELEMETRY:
+		if (!xe_pm_runtime_get_if_active(xe))
+			return -ENODATA;
+		break;
+	case WATCHER:
+		return -EINVAL;
+	}
 
 	mutex_lock(&xe->pmt.lock);
 
-- 
2.43.0

