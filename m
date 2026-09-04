Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E3D3E558F
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Sep 2026 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546310; cv=none; b=M4m4G+FTQx9nMya6fzhJQ8ahHsjCI4xUiJRci7xCPedCVHH4IMzg8bdEgMWXOIgh+h8KNpIs+Qio3Knw6MKKkrKhaiQYTELUro9wpi7ZgSfdJGNk40xUF3kax17zLpLNy5n/ixPGHsRuI7Olt6UynE/gNb6dd9HEIzhKXZsArTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546310; c=relaxed/simple;
	bh=YlljUlfYK6ql8aglTP+s8zYB492b5ToRyyIJDOqB8ts=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJXo7W8wQ67TuZ5Pl+kvF6bPS7fQ8+YiGhTTsXsgsaomerocy+V6NdlsPn0eZZ1ArcOaFeMtns1Z7BfYU7eNVY2CbYm/OI45XpNcx0J+rNOrAkzOGB4WooK4PuHvtJBQ73UtJia3YxJpZjQumymi0x9wDQzq3aOq4Zm8hSTHCTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Md8kIEIp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Md8kIEIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788546308; x=1820082308;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YlljUlfYK6ql8aglTP+s8zYB492b5ToRyyIJDOqB8ts=;
  b=Md8kIEIp0VPqjb69FZiilbZkts5o5/czz4bnPD80p2izvpJ55e6QYcm+
   benW/a0cURnMAMlRs6pW2zWAFaLgq0Eb4zxM9VMfv6ELVrRRm5yjpOFWf
   vcPfvzwx5ZLY2qv1Ht6a7Nm6/FOo2yROJhuz8ed2dC0d2zMb/uPse3CAD
   O8D+IsC97P1f+y0bOc5eexby3mA/xE+b2ckpZe24C7LCobt3n0TU8JH5h
   zhf2r4QOgH5OcsA8aSSp07I1NVyw37o7sZhaHR/JdBq37eUZa3gSo7aQ3
   DWP+g1RI6QjUUh1l5WNiMCTSOem+VJCrFTvFiFIWbPbm9mQ2Ye7aJwO6p
   g==;
X-CSE-ConnectionGUID: wDTxAPxPQ2e2pNp9Y34nVA==
X-CSE-MsgGUID: ej9JQwGZQ66oJpiVDYyEPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88932207"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208,146";a="88932207"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:25:07 -0700
X-CSE-ConnectionGUID: 58tshCLHRT27RaQhJc2vsg==
X-CSE-MsgGUID: Fhdb8Vh0TSmb7WpWMYH8ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208,146";a="294992474"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:25:06 -0700
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
Subject: [PATCH v6 06/18] drm/xe/vsec: Do not register BMG PMT for VF
Date: Fri,  4 Sep 2026 11:24:56 -0700
Message-ID: <20260904182451.1164868-26-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
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

