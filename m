Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C10558200
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 21:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928151; cv=none; b=lLdNA+8QDMxN8z8vQ+BD1y8LmduVCRhR76b952Mp/+taqa/Zf03KUBG0G1KTN1J9CnkFLxIvzV6sQmVMd8aBz2YlnW3kbajFQCHgeOart8oiHyKvfzDkVKWvo5r9urtaFoKCbbhUEEq14rQQoVYG1ZWvqfsnxwTjwj23OU2CiaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928151; c=relaxed/simple;
	bh=dJ5q09Y0JRSNZHn9BaYBqOY2g6HmUax7eL1boDeDoHs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3IBPxkk7IfQk92xGoKZ1ZeJXoX77haoTOjPebflejgRVG5QEWFRmtJ46aYtxeQKwq+qDipHJ7vmmFYmd4dWv6x6IW8NqF+kzh5HmXQHYiqYqiK/65l46OmQYOS0zByyOHPQNkCPUOotGRflUdKEZB4DUodPLLBSK6yJGFbeL54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsBJ5mFO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsBJ5mFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791928150; x=1823464150;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dJ5q09Y0JRSNZHn9BaYBqOY2g6HmUax7eL1boDeDoHs=;
  b=nsBJ5mFOfvWYbpn2msfCjoJS9g7NS6VABWItM16+KdoI/2BzJxHLH2ty
   XmOBx6XK1f0G+juoNjMcEIyTIMwx0vZ/3nBB3SehlfVzm/3Mzxy5kTQpO
   NS1fbELkd0GVs8rCXbJBOJW3mnX8GQPsi90gehz9IuWAlWfbsz4bKts9B
   6NbKJDGLJqhUPxqtcbtVp3LeT0fzUPSQfqDFJjTmwb8vCfny0X/r+2IhJ
   GPxxA+nl/m86RHqEWbaZPa4tEmyLCpT7+4NiZ5vfnMEeWwuo9H0ZH/ySk
   uFqFo3ssKyUJyLl6PaSqrRQg5wNSb9f50rF6AZY1GbewcqGkf5mHURaNB
   w==;
X-CSE-ConnectionGUID: /4mLpYthRYqokKLgELNUjQ==
X-CSE-MsgGUID: Aw37ha8nQLO9J3pbUwVhhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="565947"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="565947"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 14:47:08 -0700
X-CSE-ConnectionGUID: j42PDZwpTIuEqIhNj83pkQ==
X-CSE-MsgGUID: ydcc6n2yR/a3phbgHhryHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1629856"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 14:47:08 -0700
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
Subject: [PATCH v12 12/21] drm/xe/vsec: Update VSEC probe order
Date: Tue, 13 Oct 2026 14:47:05 -0700
Message-ID: <20261013214655.3502964-35-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
References: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both debugfs and hwmon access the PMT data area before PMT is
initialized.

Hardwired offset usage allows this to work by accident.
Upcoming changes will break this usage.

Re-order the probe steps to initialize VSEC before the other
features are initialized.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8392c9fad3c4..c999d874a0e8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1074,6 +1074,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_vsec_init(xe);
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
@@ -1087,8 +1089,6 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
-	xe_vsec_init(xe);
-
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_display;
-- 
2.43.0

