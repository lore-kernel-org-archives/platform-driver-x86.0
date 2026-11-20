Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141185;
	b=Z7gwPUKDmKiSFzoabc9PzL83BwoaOntp25nnvAhCzTyNh2Ofek0TE3DFJHmco5z42C+O
	 564X28YRT4oaKw3ocQj7i+bTvNjcfYewlxwkKLDSdFoLSsxC2407qam7yYt+wBu64aCzS
	 hj8IDJjDircTcIx3RBrHTGLGV8dFhkgn0YxATRoLfrMYox50wM0y18SH/M+VGArYwz5Bh
	 WYZ2H0Z0sfKSgPy4tzBVI38UqXUeu5qQX04yynDFnvfbsmk/9d8/E3NbLHoXX6XpS0K9X
	 JGXFLXzFsVmXsXrkiAvDH50fT7sAtdCZevI0mmI29VgBLPJAVIMrhmF81yifBj9R/DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141185;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7CDbWc2YZjyz6kpfeZ6t6hCc1UwDPPlcoxY8jSmf+Pc=;
	b=nPALbqCNAMjHCUsU9wvHmlTjoZmjAz8maZGTOlbFGRivq6JQSpOOycH2ea+mkBblU0I4
	 91Xbx7RPv4/gT147fMo1CO3OHRbjIt1orGY9F/8a9RpfZRf2M/C7g5hNG4eEjwIvTefI6
	 Td4z5+Xjg9FEE/RPAgsAea2cZx/fQpT/xvRbN7/YZU7t95Vh22kIOC33Ijqv2uPt1oXti
	 4hE6mISsQh8mVjhMVZaHPHh9IhzO+DQore2pknLzZO0WxOm2okZd4FeCZU2OLElL2N+8w
	 Jg/G96iszoo2nIiQgkg1Cj7njmxCEBd+teciroUB9JUU947VxhQbrAQ+pAy8BwRg8GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ImgQ8TWl;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037F1606A332
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 037F1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ImgQ8TWl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141185; x=1826677185;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=j0BnPlxq7JEVz6/6T9RbZkc1vLTA9xc7qG1Pv5i3+VE=;
  b=ImgQ8TWli/lZzv5hNYpRsbsikSGpob9kNor1j5WaKmC/3nOnOpKsNsaP
   tgZ2wO+CemqA4yhKzHIPFhi5L2iVGHs6lgoJLVolG4hSRdC6O6UPgxg62
   luXehUF/Ef7KbcI+UP32fo7M4hfXUHWIfwimGdXcRJZn7kauTeIH6IJE2
   KF23ID/3MG2bten3BgwEhKzNsSBuBgoCu1PPuKVXx3NHKRUIF/aV4ak4b
   B8NVw9SXRn1r+Yqs4dbN2wfcUP2HHqzyuGxkhOaNX8jj9XCXeVWJi0x6F
   rlo94gAg06i4o3jvHx6fSRgd4iX6H2l3EK10VElLxo0wyx8Q9BZYAsQpp
   Q==;
X-CSE-ConnectionGUID: ZKQ0DwAZR7CpZimtYhTuzQ==
X-CSE-MsgGUID: L+Q/+IbxQRGeUDRKn5qk5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898405"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208,146";a="3898405"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:43 -0800
X-CSE-ConnectionGUID: BfY/U2FFSkq7QDENwz3CXQ==
X-CSE-MsgGUID: 2rDAB3mVRpGRFqL+ibW2oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208,146";a="10487103"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:43 -0800
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
	james.ausmus@intel.com
Subject: [PATCH v20 04/19] drm/xe/vsec: Do not register BMG PMT for VF
Date: Thu, 19 Nov 2026 18:19:34 -0800
Message-ID: <20261120021929.473553-25-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120021929.473553-21-michael.j.ruhl@intel.com>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
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

