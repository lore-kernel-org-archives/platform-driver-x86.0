Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42124CEE4B
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 20:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589554; cv=none; b=V75XUL+O4J/Aj2NjTE6XEDMGk74wkaVr0+DNPpFDpTFL/wfA4AYiONosb7iNAX5a23SFQbbxxXhCpqQsjUcmRE6nZ2bE3lRxfZVQYHDoc+SSIwbp7pXPuzPP1yDc+NeNGpCcOiY5hKuH5A3ahPbT3n8la5SFspP3F+pQpzVmMHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589554; c=relaxed/simple;
	bh=zGpE73V/hkrWMc8qKCQ3sV0WJK524j/nIBbGfm+6rec=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDVQm53MzLICjX3sdpNno72Sr+6e3q2vtcgZe4bIOy7M9pgUM19+W5u1ubnOvDpFkkfROQD1B1VCN2eKqFIV+jzip2hrVKSxlTLRJ/T9uldR158AUWnUns1zMQsCjTbjy1Eay2Jc4vXa6vzaGer85NB7TSnoSokIXSD25090P6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ni6HoSbT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ni6HoSbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789589542; x=1821125542;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zGpE73V/hkrWMc8qKCQ3sV0WJK524j/nIBbGfm+6rec=;
  b=ni6HoSbTN27CB9uptp2ixG/WFjuXOI9rob3XPFOjLYAx8KwRT5Mt/aTx
   wPxlJr2V/RYGpO32hshE+g/2Nt54uM1JXRgDQVCppghAQ9hUOuREmXet8
   4Vm3AJV1ARtzmDm9zWyOBlbneR+VD/LoQdu5mE3orfxd7gNLtNtkcCX9E
   bcoMwYrNCAVI0DYnnqIZbJLsR+h7iHL85ChxU0l+wJ/maF0xVFnmbMO0+
   Bu5Xn791MszBJ4YpkZMk9DIHO4Wj6w48vEG5vzjXhKH88voKGuGDrh5r2
   +KZ0Z+sRwY5bQoTy1uwWa3C1B8bEWKqDcVIiR+10Dl1Y/gN0L/kjxRhkD
   A==;
X-CSE-ConnectionGUID: Zmp9ZjBcTp6LzTt/QeYUvA==
X-CSE-MsgGUID: LF+INNi9Q4e3QDu9uP8gTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100296158"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208,146";a="100296158"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:11:59 -0700
X-CSE-ConnectionGUID: qRy7JUPcSzmE8bzoT43qiw==
X-CSE-MsgGUID: e5yuqIN8S+C47jHdB608pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208,146";a="277574006"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:12:00 -0700
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
Subject: [PATCH v9 06/20] drm/xe/vsec: Do not register BMG PMT for VF
Date: Wed, 16 Sep 2026 13:11:44 -0700
Message-ID: <20260916201139.2374531-28-michael.j.ruhl@intel.com>
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

BMG PMT is not supported for VF nodes.

If IS_SRIOV_VF() is true, do NOT register with PMT.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..481bcbcc6372 100644
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
 
+	if (IS_SRIOV_VF(xe) && (xe->info.platform == XE_BATTLEMAGE))
+		return XE_VSEC_UNKNOWN;
+
 	return vsec_platforms[xe->info.platform];
 }
 
-- 
2.43.0

