Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53072576EA9
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968884; cv=none; b=jOK9XicUd92K/I1LGWY2h/pv1pDYRauJ9BPtKlSPtHUoIxIZSiV741kx+RfKlLpca3Wbn400C/xqPww6g+GJHpRqYeflTo2pvKuu27dntD9TAxuchvK96dlJWur/OQqfxmAih7NzZLGRcshqjtvOHuA5AYWPVQPb/ghrVH5AleI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968884; c=relaxed/simple;
	bh=cBLkstfZV7FeSnmOp5Vv8t6GcefvtRBwmlxcw1AND1k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjBiAvNMDSdNSdkKfnqeRiZGkbGT7XthSGz+fxvhZIwK0zkPOewjklzOUTxqaORO00MDCIn+KTEhFiiXhpryMCeR70viQ4k3nuRjNeBgfVVC+3TPq9QLFjRw/H94kdF3E9V98w4DKf/1RUtkvv+EO5tBKUcICb6zbWFnIITG2j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqfWST6c; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqfWST6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788968883; x=1820504883;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cBLkstfZV7FeSnmOp5Vv8t6GcefvtRBwmlxcw1AND1k=;
  b=SqfWST6cqHyxmYckOwpsOGEy325jJESkPTc8xWYjdb1EeB6dnOMrlt26
   WPxJ+2rEOeqSh3yPKy9SldEqLNunkSw3f9t6cL5PYSbVMRk84EN5FmkVH
   lp8cgtrcoGV0iQd8D0rCkCgV5Unsh50cFQwMmqahgdENkvxeTmR60bttZ
   SvEIB2AXHqSaugZlHSOsnLYplDH01fTRiFRQvWS1/zcZftxqmCz+GcDR2
   Qi6ozWk4+gusaXzUMsRys6cSGP4ZAbHO81tQDCkW5XSmSK/MibFLSTCi0
   q9dsPDCFPGwmB8xNUPck4KH3k2t1smAB4k+j8gPspbtYWLAeqMzJqDQ5R
   Q==;
X-CSE-ConnectionGUID: WMPpYvZiQk2Cf8FtsHbljg==
X-CSE-MsgGUID: dhE1Js0kQi+eYNtUkBBQ9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93091827"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="93091827"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:58 -0700
X-CSE-ConnectionGUID: AP9j4V6YQ9iJPKuXiYeBRw==
X-CSE-MsgGUID: mFgQv48cStWRgdjQ2gL4Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="268102514"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:57 -0700
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
Subject: [PATCH v7 08/20] drm/xe/vsec: Use correct pm state get
Date: Wed,  9 Sep 2026 08:47:47 -0700
Message-ID: <20260909154739.1515514-30-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
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

