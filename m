Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E177045D1B9
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 16:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787588614; cv=none; b=cD3A5JdisWuZ3s9l+fbf5FCziRazOVRF1GuN6j07BfJyP7HPbjPvCHb0n5hAM7USBHse4Q0lsICoLglprIyv4DlL8chpMZ2sEHJqM1xEctIELk3Q05L6BbsodZ+gCfiuLbNw+8Dm9eSmQVJDvtnqZqGFZV1sFJk1E8zvdNyWrJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787588614; c=relaxed/simple;
	bh=IDb6Ixz9/y5Puin5GHNA6oNcgYp9d0JoawAmDv8Dzak=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/C7So57WhuZ2c+2d5jRZbBtFtV9tZvHnEMXiFBmszg0b+WVvt4/NwL+IEvejCtSHRUwEMWKUaRS+1meSYMjH+pt0iEq/2BLuH1Z29+7o+v4WNimCoRK6iS1QRsgIfdEQnEjUGhtbpDT64YSRRLmAM9yoUfnTsxq/Cznyh/hxbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ajzOAekA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajzOAekA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787588613; x=1819124613;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IDb6Ixz9/y5Puin5GHNA6oNcgYp9d0JoawAmDv8Dzak=;
  b=ajzOAekAV+oQhDhVNCmhtLMIvtTZEyG4gKcDq2k+bbQ14lRqVQVrKwTH
   ffVha/fBKo4+GEuV62a4sbiPoOIJKn31KRg3zdBsSzV3296BLAMOQRLy4
   lDT/eufNjBk6bewKezHlH8s2tUYhOMQZMgULL7bb7ZXHRY4XUw+/d/mr3
   8DekzWVbh3V08V5fRpwWGbe9UiXXtcQPNO2xEfKyTxFnUgaYwaaZpqw/9
   rrc2+E2EtPJFyE5lMsTUzDb1dHjfjku82n17hDzRH/8sE9BBDmXs/YY9x
   xGiFaHSd3JOImFen+ZurvaUP/tsJ2gW4aM0loKOxw1eQQTSwnWcjBAdmI
   Q==;
X-CSE-ConnectionGUID: 8UjXSP7DSbaGF9NedYKwCA==
X-CSE-MsgGUID: uiTX8yupTzGMehX2aveKmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91858066"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91858066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:23:32 -0700
X-CSE-ConnectionGUID: YA6uzOXcTX2/aWRrMu7DoA==
X-CSE-MsgGUID: KX0AGs2uTFqE2n9DrJ3bxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="267088131"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:23:33 -0700
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
Subject: [PATCH v3 03/10] drm/xe/vsec: Protect against missing config
Date: Mon, 24 Aug 2026 09:23:19 -0700
Message-ID: <20260824162317.2450380-15-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some init paths (VF) will not provide soc-remapper
callbacks.

BMG PMT access requires the soc-remapper.

If the soc-remapper is not configured, do not register for
PMT, and block read access.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..bd83a33aef6c 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -149,6 +149,9 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 offset;
 	int ret;
 
+	if (!xe->soc_remapper.set_telem_region)
+		return -ENODEV;
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		return ret;
@@ -157,9 +160,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	guard(mutex)(&xe->pmt.lock);
 
-	if (!xe->soc_remapper.set_telem_region)
-		return -ENODEV;
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
@@ -210,6 +210,8 @@ void xe_vsec_init(struct xe_device *xe)
 
 	switch (platform) {
 	case XE_VSEC_BMG:
+		if (!xe->soc_remapper.set_telem_region)
+			return;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

