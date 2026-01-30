Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2723E2DEA64
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Jan 2026 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780219; cv=none; b=YQaa7E4E4udDKoTcuxXFPoU+ufxlT0ZET/BwaIDFIDGeXbv+82vWz4EwRjs+gIgjAkBdnONtsK5qqopybkL3pg8Pk9C1Wk0BrD6W2OHOOPc5Bpf766aVZy1P59WwUX5wOkClubyrBWMpa1R7JAHGiemIuR8c6cwR76tCiiFji6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780219; c=relaxed/simple;
	bh=uiKi1kLCK8GQbmjF6MiSfNXxUnT0cATJ7oaikOcErww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AYFbo1LebZdrCuuIfZWa3D6B2qW7bKqS/E4KCzGd95wbPUuQgO3pN1RreqtbB4Kz0Q6PZmH373gtRHlWFRnbWdQyrTlOE4yWJqVrSrVL8xTPHPLGmqcwkzf5bu7XdxQHf4i556CpbtDVOL2/s4gbK+MkIfBf31CKriRpGhfcUmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkwFn/kF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkwFn/kF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769780219; x=1801316219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uiKi1kLCK8GQbmjF6MiSfNXxUnT0cATJ7oaikOcErww=;
  b=HkwFn/kFHfv+57qpKc74T1MfZr+lvE3hT17HB7TkTfNb8gwiOnT7FXYR
   rCnBA9S3zKx57oKgnaDN+LOVXNsGGxQsY4i13ekgRdcNs675FffX1rHFk
   4KFZc+bFOKMEPq9uCOHuImKuipgq+1qJFYV/4qFev01nuZeQWFybzyhVv
   LyLwl4K1E/YNCr1RcN4dMV4+LzGu/AUxhkSK+51VQrDaHiDvFs+qi2BJa
   loP4tNNiGtbOgxM/Gb531prA5aHztB099hxzfGZjuwQenAAuT9wT+dP4/
   6oJ4Zow0Uov6TBmT6IThzpiOjNLNrZpnTGwwn0nfPD0dsp03JaqMSlIWl
   w==;
X-CSE-ConnectionGUID: PFL17cHJQtChTFAE2R+ekg==
X-CSE-MsgGUID: Bk7kLs/uRE6mSkx3PaY7xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71194387"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71194387"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 05:36:58 -0800
X-CSE-ConnectionGUID: wfv7t4ObSyObglsnxgkCSw==
X-CSE-MsgGUID: VTj+Du67T8K9gEENMdyKHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="207983238"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.170])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 05:36:56 -0800
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
	david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2 2/5] drm/xe/vsec: Use correct pm state get
Date: Fri, 30 Jan 2026 08:36:42 -0500
Message-ID: <20260130133639.765378-9-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130133639.765378-7-michael.j.ruhl@intel.com>
References: <20260130133639.765378-7-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Crashlog needs to be collected at all times. The current pm check
assumes telemetry only.

Update read path to enable device for crashlog instances.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 4ebb4dbe1c9b..44607f1eaa88 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
+	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
 	u32 mem_region;
 	u32 offset;
 	int ret;
@@ -160,9 +161,18 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
 	if (!xe->soc_remapper.set_telem_region)
 		return -ENODEV;
 
-	/* indicate that we are not at an appropriate power level */
-	if (!xe_pm_runtime_get_if_active(xe))
-		return -ENODATA;
+	/* make sure that we are not at an inappropriate power level */
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
 
 	/* set SoC re-mapper index register based on GUID memory region */
 	xe->soc_remapper.set_telem_region(xe, mem_region);
-- 
2.52.0

