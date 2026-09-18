Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461703B2FDB
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737496; cv=none; b=jmljSiB7cBIn597+dOJzz8DU66QaUuDn11W6IZs1YCvYrta776NMA7qErcXgYf2QfvHNzbAUrkI9p+8awU5glLFbJfgAO4ErdmkX8VapHKdtILlAF8ajPdF9zHReHKm0C0SumGTmG/EqIzTP34MEN/k4ik2q1+/s+Kosk0sDDWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737496; c=relaxed/simple;
	bh=gG1sQHPbPJ4Cq/dI19EwzOvsMB1T3EvHwtS3wkphv0A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UvTO36StHK/58qzJ02dcGtYFhxtJ5vyGWVVJthG+rzAF5MWTU8Q+IvaPds2AqQvFRJn50tzvzivs+HJt3VrNxZyeQtsNEOp7jp/6dVg8CQyb5Q6tTtZmGgeAWPD2MxDmQiXyCuHaE23cPpwY5VeRONL4BnwWGg2O5mPBc+Vea0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PN5VFd1i; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PN5VFd1i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789737493; x=1821273493;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gG1sQHPbPJ4Cq/dI19EwzOvsMB1T3EvHwtS3wkphv0A=;
  b=PN5VFd1iixbtBkLUIwDeYzf5ab/rc7bV3gOMd4yN2RGroOw8dTxvbj5b
   Bfur9JHgamHYN0e+r8h0zRF+is2bKOapnYAuC/vdNhIZXXM9E+6lZUw3i
   EdqD7Okyahp42sjiOyp+EMG8Cr8QHuL7CFFBE1Ku7ZP530X+NJtHzcOzT
   w4ZJau8uF6sCjE7lvbN7jgG8nvVFkySqIhsGDVlayyiP380tdSRLpV66M
   3ppsrU7fJX/bFBaxBkXlaKHbTThvHiyv6U3eyarGtY3hdddZHebtpO1KE
   gasQ0Dc3TftEHIOxs6gkBgiY6jFV8fak+yqdke4QgvLbxLcc0QUXR66fu
   g==;
X-CSE-ConnectionGUID: pXsBsM5LR/OGATJwTt0i2g==
X-CSE-MsgGUID: s3HLhdKrTt2YsQlOuM36uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89378235"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="89378235"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:18:03 -0700
X-CSE-ConnectionGUID: yMhiHV7LTuubThzIasni3Q==
X-CSE-MsgGUID: ehgY+pQlRbuN3SpYfMlkEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270095325"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:18:02 -0700
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
Subject: [PATCH v10 07/20] drm/xe/vsec: Correct locking order
Date: Fri, 18 Sep 2026 06:17:58 -0700
Message-ID: <20260918131751.2408883-29-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xe locking order is power state first, and then local locks.

Reorder locking for correct usage.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 481bcbcc6372..1b88ac1d2448 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -157,16 +157,17 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	telem_addr += offset + user_offset;
 
-	guard(mutex)(&xe->pmt.lock);
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
 
-	/* set SoC re-mapper index register based on GUID memory region */
-	xe->soc_remapper.set_telem_region(xe, mem_region);
+	scoped_guard(mutex, &xe->pmt.lock) {
+		/* set SoC re-mapper index register based on GUID memory region */
+		xe->soc_remapper.set_telem_region(xe, mem_region);
+
+		memcpy_fromio(data, telem_addr, count);
+	}
 
-	memcpy_fromio(data, telem_addr, count);
 	xe_pm_runtime_put(xe);
 
 	return count;
-- 
2.43.0

