Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480749;
	b=YllU4ePVtzY5KJiPm5EHnb8rbpL5L147YXXYpN9LnzyYvBnS5H9OZiRHZBeOoLzeEYpH
	 o0cJs5RuMVcOaItKD2n4pYqEqJF+n1rP9F5tH/Z/LbaAgEcUcWGGKyCeLlbz9RXA1rgyI
	 tnDYdswGX4hqYFI2L1bMXw5JUHoTNAfpBM8tDUgmtrzMAlQ4rH3j9aZY0tvuERrvKANwi
	 HefOi7im5Dj4ly+9g8X+eRaFfsCZtUDuv2a77jwFxFi7+MP1srIoLTQDdelDtWx+eCMfV
	 4NI9+h5xUVZlSOSutsgNM/RmN/uPi4JhGwrdQUTAUcimvVhig8+y7ZfqgDPuKQ6f5Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480749;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8tJxo1k4F6xf8gVL51rzG+x2tFlwx0r/UVyY5MAn2V4=;
	b=Ffof5d8AyEP6bl3V2X0WOsOIp4dpzl6L9t248bzEN7nYn2MPkor+WVksiL9JByQml8wY
	 vOYV9x3tU3xa8+2iuDkh08sMYoVf9Q3hcpwtz0IM24sF4tjlZICJ2Pqtx+tH7L4OxUZbY
	 BCFpVG8w0qmftpgbPdJ+z6inkszp8KGCkg3HQ84k/zzESm+ApVu7KKUnYp+m6jBAhPme+
	 wTY8c0XN4iT1ZC8Gw/34m3WNVhsGgS+c6d2l5PhMMs8bxe26oI8oyxL/Gqb1aUrD+/09a
	 QDL25XZCqG628Uu/hYZzMmahvU5Z6Jyb7pOdCd2DSgQQDNW9JosZIUVBk8/snFoG4kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N943Ss3t;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62573606A331
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62573606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N943Ss3t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795480749; x=1827016749;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rayEZ0+oT/Iyk+FY8Hj0Rn8qFu76Ec9MdIYQCC7fDsI=;
  b=N943Ss3tUp32o8fIh/J/c99385auxxGwS1LhGqKpsMn7bVZpDa4ke22x
   HMFpXqIc+GiS1ZFCnliu0e4m/vaiFowQCNfRgDdOck6eBDVLqlA/KZ7dw
   ybTMBtGEPjrjhC9teNf7DTeYEqIc3HO1lHScxTXVNfa3x6tWnVRlSvbef
   Hzz4fhhR4Lhxh8E8JQYwi5zotvHaWHihvRZ9HHwp0ByTy+GKKuW29IFdc
   FQxPdb3aqyLXAUGlR2NL9bdsiBkgfQqXjaMhsBSVvjJISrrmIv1NdaZIE
   j69QWZ/1tktW30nl34LtR5U26vV5tAKFRNuG+9KoTV6oMx8sUe9EmDNCJ
   A==;
X-CSE-ConnectionGUID: NJzKjDjcS6yHwKqktKnJtQ==
X-CSE-MsgGUID: Lszcw8lyQ4+E6N+nG9LwOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4332847"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4332847"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:05 -0800
X-CSE-ConnectionGUID: K/X243iFR3y9JgJl7/k6Rg==
X-CSE-MsgGUID: 5Vqk3YXmSyGQ1VteNGwT+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11805743"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:06 -0800
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
Subject: [PATCH v22 05/19] drm/xe/vsec: Correct locking order
Date: Mon, 23 Nov 2026 16:39:01 -0800
Message-ID: <20261124003856.4145635-26-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
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

Xe locking order is power state first, and then local locks.

Reorder locking for correct usage.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 178f22db4046..d93c042cf25b 100644
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

