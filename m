Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F29043744F
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187092; cv=none; b=YH/2nPPHhSNSVWZ4WVdsqWTW1UPGSK75RjddrmqyHqq6YVTpOQQpLyVB5/ELHGp861B1xOsNgEsdgRQX9LnPahZqB6U5KoxZF2XLcDeKM9H5BnxcV3Zvg8nJOgFQF3OsclK/RfZcN4dfX3Dc0APXgf+jV5F+BiTsNXglNY86Kkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187092; c=relaxed/simple;
	bh=j0BnPlxq7JEVz6/6T9RbZkc1vLTA9xc7qG1Pv5i3+VE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvvOWsIbDtx1Dx11CoYzjakNDs22WDVylD3vDp2LmQjjvqRa964MbrAL1MzGZ4uuSv5czELOWTKpFZZGmQ5S1KqfNoLMSLQpQd2muStptPGQVOrmOkQBqdQhNYG4NV++555mdUk7F1PjmQgt+2HHOM6YvxidRPytkoelmSCZbiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TnSxyMUp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnSxyMUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790187090; x=1821723090;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=j0BnPlxq7JEVz6/6T9RbZkc1vLTA9xc7qG1Pv5i3+VE=;
  b=TnSxyMUpSQQY08hb3F97EZO/Dfwoqr+K81jfqhnfl3Zv0RJ7V9UwtffT
   hmSWKrK1lqUhnwmq2GOcCJ3GwAkXB+47QwsE3ntchUpumZlBmeFncDtIP
   IYdkJyzfog1GNsmPfrdN/mGzn6PItyiYW8R/L49EmWyho3LxI39K6JX+6
   bbz4uEG7ZpzP/AZMPUcMJPzPQIkxUHOkybuGOiq/aKVTI/A9OC4KpFDCC
   gzeYsfjMp78yUl17mekSGU3+EOj8PhL+6VGwVtAjd+UkEd/GlOlyrqJM/
   2caTAQvTdCUiAuHKIkku9zsSjo//vmqXac9hqd5JJDfxFVlwkEyumI0W5
   A==;
X-CSE-ConnectionGUID: YPSvJzfoRou9vcg8zpuX+Q==
X-CSE-MsgGUID: NHDSmzsgQ2W5EUyTp1AmNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93416001"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208,146";a="93416001"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:25 -0700
X-CSE-ConnectionGUID: Kfo+xUZoTUe1L+Se8DtYvw==
X-CSE-MsgGUID: rIwTZI68RPS95p/z50q2cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208,146";a="4980691"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:25 -0700
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
Subject: [PATCH v11 06/20] drm/xe/vsec: Do not register BMG PMT for VF
Date: Wed, 23 Sep 2026 11:11:21 -0700
Message-ID: <20260923181115.2514193-28-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BMG PMT is not supported for VF nodes.

If IS_SRIOV_VF() is true, do NOT register with PMT.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..178f22db4046 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -149,6 +149,8 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 offset;
 	int ret;
 
+	xe_assert(xe, !IS_SRIOV_VF(xe));
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		return ret;
@@ -157,9 +159,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	guard(mutex)(&xe->pmt.lock);
 
-	if (!xe->soc_remapper.set_telem_region)
-		return -ENODEV;
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
@@ -186,6 +185,9 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
 	if (xe->info.platform > XE_BATTLEMAGE)
 		return XE_VSEC_UNKNOWN;
 
+	if (IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE)
+		return XE_VSEC_UNKNOWN;
+
 	return vsec_platforms[xe->info.platform];
 }
 
-- 
2.43.0

