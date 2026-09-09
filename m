Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5472C572693
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968884; cv=none; b=F4e04vFcDW59auHNA2w03T6/CYpVu4NZM7dyVwV3zBfGVcI7TTTGE/tkCV2vuDDtUaU29BVDYwn9gONtsTflUgttUuLV2e8vmdWThNWbP+eDclaOFiDcJ0Rw63dPQl4NHT+fzpFmk4BfbdBl3GG06cP0vm6kgV9YRHUdkUlY2ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968884; c=relaxed/simple;
	bh=YlljUlfYK6ql8aglTP+s8zYB492b5ToRyyIJDOqB8ts=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bnd+2qWo1gL7uybPRvT4RjvFgb3k/c8LAcAM3f0/01yGwFvFYBPLXliUCeAl1v9DADHRv+wg8xuSCZ6cBrlqd/VR2qBuEicqDhZt+bcOxLFlRAt0+PP8zlgbcSa3upUTk891GRyY4LiIq7MsCKVxLb7S9FLKvvlG8RvzqHN7v/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U92AEwMu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U92AEwMu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788968882; x=1820504882;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YlljUlfYK6ql8aglTP+s8zYB492b5ToRyyIJDOqB8ts=;
  b=U92AEwMutSu8ie+dZCWUXYt0c/sd+4ZtBn3RH+pmyFASjZLxagqG+85z
   yRwxkJUyG8pRr7OeZIc98XAn0QrYquXlxruzdOfKJ24x2HYNsCwwrcQyR
   /nNnvLREafIzIR4RnLGrAnHjHnniE2+FwB5Xa6ozoNE/tkgQIWpGn3G7Z
   9pLOpsZm7DHipfd3wc2ohlnGxeXVadgpbJHRYzpevmEVWxhJMdVJRMW17
   bqNdP25pJf8i1ZwLVgnHuEb0W5KTXnrwr9RiYnkBxJJpn2p4m+vS+RVXr
   N9s+HMU9dLrY4a8GBbvgBWFBKdHQbM3x6QKJJqB5/plJJo6/GcFpMs7sG
   A==;
X-CSE-ConnectionGUID: uDAc7pGtRu2qyjf3rQWaiQ==
X-CSE-MsgGUID: ODUJV4e/StyVpm81lZ/C7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93091818"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208,146";a="93091818"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:57 -0700
X-CSE-ConnectionGUID: huoj6TIwQ0WMGj6Uy+FVbQ==
X-CSE-MsgGUID: d4s8wDldTbSVFolXIa3b4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208,146";a="268102508"
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
Subject: [PATCH v7 06/20] drm/xe/vsec: Do not register BMG PMT for VF
Date: Wed,  9 Sep 2026 08:47:45 -0700
Message-ID: <20260909154739.1515514-28-michael.j.ruhl@intel.com>
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

BMG PMT is not supported for VF nodes.

If IS_SRIOV_VF() is true, do NOT register with PMT.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..71bc359b2ad1 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -149,6 +149,9 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 offset;
 	int ret;
 
+	if (IS_SRIOV_VF(xe))
+		return -EINVAL;
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
+		if (IS_SRIOV_VF(xe))
+			return;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

