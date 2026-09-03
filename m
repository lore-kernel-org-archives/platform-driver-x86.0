Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA0511E86
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Sep 2026 20:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466256; cv=none; b=TrqYGbPqaJsjfld1P1YC+MJqphzC4BK1nX/b53KqQ7lQH+bhRyUVhnGDfDRs6T6M7hFNtYRnZgxcPop/Ckiox9hsMlJt2zZTieCGT+CcF/kGX47HcPanVbq/eqhH5kuqhuL+DxIuFliDduEHg646Zkf5J5w1Dss4jqsUAYHib+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466256; c=relaxed/simple;
	bh=YlljUlfYK6ql8aglTP+s8zYB492b5ToRyyIJDOqB8ts=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHuCxgear600OxIlQhfUT3gl4/x4autgu7nl1Vj4MuVCoH3y4MT9uN0jZ44dYIqg8hHx0n/FDh9H3Yxs7tCcbZmdWHKuAwl4Q7jP2VXMLKusXe+wZfgz0ifrWr2NNccBnTcNz7kcmNAtxzk+q12paIzfCL+i5iP1XnMqYY1s0rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gixbnmda; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gixbnmda"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788466242; x=1820002242;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YlljUlfYK6ql8aglTP+s8zYB492b5ToRyyIJDOqB8ts=;
  b=GixbnmdayzR2ZlDEFxMX2W1yJwfb8vAHgg2PIzvxZkqWDImINx9zeEWU
   RNExCbC4yaFXIB9GqpXOatfolnIU7SExqATEpwVaVm4vdCd2BQ5nLPQHJ
   PeWOc57y3hlqaJm3vqXQWaRt4ioQem7jHwYJUagB4JEddL/K+b/f+J7oU
   cz37/yHmXcTbovTq4CPpv8BtLI9MZdTfPjazyG6BKhQ6+WISS6BpOilaU
   PVWlSJzJ1CVTklM+6feKfPoWVGGdxWpHkfvBaI8YWN9Mw0DKMM1YsLVxT
   eOGDZeqOGXoYoZ095/r2e91wtkUpCYCg+HGWOD39gD+Zic73MMnOqIlzS
   Q==;
X-CSE-ConnectionGUID: h5Xu21L2S+m5VcHFnUYPzQ==
X-CSE-MsgGUID: HRF8iBCkSROEdAf3/Yzz+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88994579"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208,146";a="88994579"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:22 -0700
X-CSE-ConnectionGUID: 1JeCX/T0Qlm1WBYMYKCing==
X-CSE-MsgGUID: dVxqi84sQ9+usr5vyHMeiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208,146";a="273348061"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:22 -0700
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
Subject: [PATCH v5 06/18] drm/xe/vsec: Do not register BMG PMT for VF
Date: Thu,  3 Sep 2026 13:10:08 -0700
Message-ID: <20260903201002.1064889-26-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
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

