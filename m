Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911E751C358
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Sep 2026 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546311; cv=none; b=R7CxyzcT6pR6w9UwnkEMh4Yf8FqFgSJW1uY1vip0n6oYbBVDX69KprWNw3CiwReJWEx7iqmmPSsCTcysAYqnqvdgFn6uUs5DKMUDdLbXa3kG+S/2tJ2KBWdr44Cp8uSBQDdgdzc0wfR1yVpXZ0/rar2CrGlO92PABuFhbSlA1lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546311; c=relaxed/simple;
	bh=oLSU59ScGc4fReM/vHKENeNZ64rIz08b847IWNPXf7Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRNsG0SgOtLCOevoSqYQyM04A7oLifWqpsDukexECoWi/xAC7DEPs9elsyKKdec31T63OdqaxQxeR8jxWvRIw1Dz1MXXm1f0VvToduLxGKpNZmktKta1l6YcMRY5vspxNPvjbReMsVRv1dzmT8qiFuSc/R5KtZjuLwE3gbXCFSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgEbis9p; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgEbis9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788546309; x=1820082309;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oLSU59ScGc4fReM/vHKENeNZ64rIz08b847IWNPXf7Y=;
  b=jgEbis9pGIEr8Clo/BAxPsrpuZJ8Pcppas5wszYnSrUdNWLPBxJw2/tw
   fbR2psqcbAvTKGsGQFw93QzdkbEeNTl1dsTP3x5wPoPjkucjQWm9nJCvd
   1/1ahszNKg0oFgc9k+4lTj2Y7qq7d8Nf3c4Jv7zf7iyHRg/EK/JdZSQjX
   3cnaWvd+kmI6INGWG3ifubxPYbeKUV2YTpABsQemDlPfz47DFZlScS8zT
   FC7YE0j2uOlcLwRgMxvYCViEdPkFIdl7G1jfYh+KoR5szQUwH9RoZMoIF
   hJibi6FhAwzX+JnZo1h7aO8kbCLOQjC/H2KegkyCwH6Nwx9bcu8s6SPR9
   g==;
X-CSE-ConnectionGUID: yO4PPS9gSDOkvpTGdbeing==
X-CSE-MsgGUID: YchzgC6gReejusF3GfF9yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88932213"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88932213"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:25:07 -0700
X-CSE-ConnectionGUID: 5/l+zj68T3WbldTBMYemRA==
X-CSE-MsgGUID: 2YN0gJcYTaGmuC+bWLkCAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="294992477"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:25:07 -0700
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
Subject: [PATCH v6 07/18] drm/xe/vsec: Correct locking order
Date: Fri,  4 Sep 2026 11:24:57 -0700
Message-ID: <20260904182451.1164868-27-michael.j.ruhl@intel.com>
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

Xe locking order is power state first, and then local locks.

Reorder locking to correct usage.
Use explicit functions because of multiple locks.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 71bc359b2ad1..dd7723ba6c1c 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -158,16 +158,19 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	telem_addr += offset + user_offset;
 
-	guard(mutex)(&xe->pmt.lock);
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
 
+	mutex_lock(&xe->pmt.lock);
+
 	/* set SoC re-mapper index register based on GUID memory region */
 	xe->soc_remapper.set_telem_region(xe, mem_region);
 
 	memcpy_fromio(data, telem_addr, count);
+
+	mutex_unlock(&xe->pmt.lock);
+
 	xe_pm_runtime_put(xe);
 
 	return count;
-- 
2.43.0

