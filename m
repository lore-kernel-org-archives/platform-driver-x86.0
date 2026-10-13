Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585A555D886
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 21:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928037; cv=none; b=cA4+R8dmeEHBxNgeBZfkZ0BR2KoyhHsWEu/kHJ4hzG/6mS1bFvMF+sYs8FxVEPal7FwY/o4mGdMH9ccmToYzyQbU1V9CqJjc6EmFWpjBvZOC914mLIQuzVm1AY8cMEEVBLRz8h4HHTD3KX6cT7/edEp58VKH2aKI5BxBILcJn2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928037; c=relaxed/simple;
	bh=j0BnPlxq7JEVz6/6T9RbZkc1vLTA9xc7qG1Pv5i3+VE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WN93frBt3sJyZ8MmSRgzCOsRLKxRmt5zt2WeqzPOHTAWriX8I1F5Rbum/SCKDc6kVdZ8qTXD6whRWx9rx26JvEr7yhtPCzsaja8i2RJPccgxBm8uuy5abt6hV9xbVQM1CJYpScbaG2Rw1SUjMHirBx43NAYD5DFMObO1FmEjCOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOihguLR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOihguLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791928036; x=1823464036;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=j0BnPlxq7JEVz6/6T9RbZkc1vLTA9xc7qG1Pv5i3+VE=;
  b=GOihguLRdn7QMV/bCmjRrW3Hf3qctxcqIb5v+ocdJfPMNZww+yE3+MDI
   iON5LEMWQp95BLCCL+dDmucD8FWESRHPnNqWtBU4RMx5oQgHnO9saBudK
   QGKfbnKbifxMKM6o7A4hiwZ7aFzre7yLVH4/K469fLDOhWbmVOUYlgHEM
   lIjqgoCwciW52ycepIjzBwjm2XyonbSBxbYVOn/iYl7s3J1EYlSoGDliJ
   B3bthWW+9P3lTAEkuij1OPkZNMpJn309Ie4Ag71+qp+zhjYoStPr5AhIT
   PBORKQp1OVNg6f4xsy9mPZh4iRiScUXgUdGqysA3O+doaV77JM5CeVTTo
   w==;
X-CSE-ConnectionGUID: zy8e5tlHQAKZ9AKEs9/wwA==
X-CSE-MsgGUID: qUJhyv3oQ8Gb23Z4K88PkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="569431"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208,146";a="569431"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 14:47:08 -0700
X-CSE-ConnectionGUID: lVduypw6R+WyAd9+EHQvLw==
X-CSE-MsgGUID: BE//KoNSSIGFToH2Rqmebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208,146";a="1629838"
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
Subject: [PATCH v12 06/21] drm/xe/vsec: Do not register BMG PMT for VF
Date: Tue, 13 Oct 2026 14:46:59 -0700
Message-ID: <20261013214655.3502964-29-michael.j.ruhl@intel.com>
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

