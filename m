Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647DB4BF954
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 20:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589571; cv=none; b=pwgDrPZfXZD0AFd5Cy64THLwp6QJXY2hB3TpFomD1UM1EBY0rPicaNa18a9JM8Gk4wmHV3Yrqz/jzu0bxBPN7YcR0v6BpBchwcV+vh4lkMqdgE3yUVh1P087m+BgUX/IJLUI2r7m5656aJSGmI8r2yN89oYBWxS+Zp06mZqZg1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589571; c=relaxed/simple;
	bh=LPGG504LJ3vrcENFvlBo/VSFE0LKRYZg7u6iUu7Y6Hs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPOk+C+BUSsS6DU3o89qJk766/D7oOCV3DvbL9IEYlpQI9WWEc45cpCy6WzeH6W5oseQLvA+wPEQ5RXRFFU6jwqejk4UNK1ZANZ+XBZK6gnAQMEqw1pypJvC4M4lGglf4RoZ6NxRb3WSLrypi06OlQJevqYfdYO02Wvje60O7OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KR9/Tnvh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KR9/Tnvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789589565; x=1821125565;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LPGG504LJ3vrcENFvlBo/VSFE0LKRYZg7u6iUu7Y6Hs=;
  b=KR9/Tnvh+iCFYUrKTpN2+zfovPCNI6p74NVyPXM7Yzk6Xw8921gzcNqu
   71vIzNId9CNsKKFnVluUTnl30ZFMn3nFcSXfILJ5jkfzzx3vh/eriMEkS
   UQlJ4HJXiNsA/YQ12SR6hWjjJwndViZa/pL3B3mRlSZ3650+UH57/DDnz
   kPOUrbjHS7tYI6Y66iM5REZKi6l9s8ISJ9ngux3f9drTsNou3KOAlk2oH
   N038XoeV8QJ5H17XRp9WxtkZzpVL7GnIctFgFUn3cQ1bPta3A4hsTnkSu
   PynjcuJEKotbfrjCvj3jytGzEVbqvGSz3Hd8ORD9cfeiIDBsICxfhdUVp
   Q==;
X-CSE-ConnectionGUID: 1dT8f2/GQmy78pznH6673w==
X-CSE-MsgGUID: NAYdnZzTRviS8MKxW5AX+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100296189"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100296189"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:12:00 -0700
X-CSE-ConnectionGUID: 2jCsxDgfRZue+3H8vBWdVw==
X-CSE-MsgGUID: 1UdyYYipTC29cLtkiHMxPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277574031"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:12:01 -0700
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
Subject: [PATCH v9 12/20] drm/xe/vsec: Update VSEC probe order
Date: Wed, 16 Sep 2026 13:11:50 -0700
Message-ID: <20260916201139.2374531-34-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
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
index 205cb4e7f9e8..3ec950606e67 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1053,6 +1053,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_vsec_init(xe);
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
@@ -1066,8 +1068,6 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
-	xe_vsec_init(xe);
-
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_display;
-- 
2.43.0

