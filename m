Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5294A2050
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290878; cv=none; b=bxO+t7E+vEK9bQL51tUFpoJl1amO89d/Ys123qg2X308rXdwF4orM912TrfSo844h3uFcpb82e8chHT3YOJW+4+eFLFHjvtGR3ZItTBikjzzkwhmIKuIebG3t4Gtr+VTu1zRZzm5Cm+uJZfoPbSdfqkOEBnzBRKt6Nb1rgX3x5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290878; c=relaxed/simple;
	bh=YlljUlfYK6ql8aglTP+s8zYB492b5ToRyyIJDOqB8ts=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dOiNoqanAguJcdAIN+drh3Y65+NT/ywGqwtGJXTUQ+GXjC2Fi4M5M+rNYMpVV3oh9BkyqpsRyInPojZVIVLhFHy6NEvVvTDnt3odpxRf+1clg1ksiAnZIoRDPUYPKOzk45LyL2QMl2dI9Y7rfNVYzKv/k5DEUmwIVr8R8QmGkx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b43Muwdf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b43Muwdf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788290876; x=1819826876;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YlljUlfYK6ql8aglTP+s8zYB492b5ToRyyIJDOqB8ts=;
  b=b43MuwdfChdvn7YuqpEfIWSGZN1ksob/1zWSMxhTgbKkFUIwIplhpstL
   oRJ91whcy0TMz9QcHkfN9u22mq3jsoLUNUaZZ2fIKJUPuPFkpdm5CrWf0
   UMLETzOrq/2MaZ194mAIlsYeeL/B092eWFHbUTMQnA1HfHxhbyZcx7tyu
   pg67Su6nTVruqVOPT6uaedLaVcxpzbWPECub1gVAsZ7u55hINpRDaT+l7
   T4IGPpd1XwOQ0yTNC49yy0p7FaylU7G7j0hp3WUKFHMIuFbJqwZRVfRXi
   rJxuQfutC+zdpK/J8JCVq/nTSGN8ywP9VTGepj3rOuS3wPcl42IlVkn+u
   g==;
X-CSE-ConnectionGUID: Q32tmf/OSYiZiN2C0RxpZQ==
X-CSE-MsgGUID: ah1i2wy0RcibuvA2PTafEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762491"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208,146";a="88762491"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:56 -0700
X-CSE-ConnectionGUID: ac0UGXpIS6y7TB9KAh3vTw==
X-CSE-MsgGUID: GY9gJJVxQIOb5TxHaOSDJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208,146";a="269776743"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:56 -0700
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
Subject: [PATCH v4 07/18] drm/xe/vsec: Do not register BMG PMT for VF
Date: Tue,  1 Sep 2026 12:27:42 -0700
Message-ID: <20260901192736.626777-27-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192736.626777-20-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
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

