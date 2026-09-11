Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499BC4A8A11
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 20:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157537; cv=none; b=Phy1477NO8qQZ4tixcJYCQcxg8aB+gtP+tqbhPdaY7wQpOEVXHsQYPXxX3qil8S1X//Wua07ukiMk/Zncye6mEpjf65G0pBc9FQ66q15piHIY4yr0xeuXue40Boyd/PtMTaot9DoM7rlzxHB0W+w9zF8CKmAPWVGcd/2rih3t+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157537; c=relaxed/simple;
	bh=oLSU59ScGc4fReM/vHKENeNZ64rIz08b847IWNPXf7Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLM76xh1ZLQs6Q6Q8WfRVTSFAZvjArZLSOwkruIVEfTEBClmvJ2Dti30hGZH19s564JLad+ex1s8EODJ/Q3wh1tJCHi6/rNA9SbU8PFn4/mCmPh/LB2XJY/8emya5UbDjeo4xAtl60B43/0p+JJ+KXUcP92l4GVMG0zu/xcMTpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpykgKjq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpykgKjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789157533; x=1820693533;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oLSU59ScGc4fReM/vHKENeNZ64rIz08b847IWNPXf7Y=;
  b=DpykgKjqqSPMe4gB2mlbLW08Mqnd7dF7Xf8swIxe4efBgvwA7tnob+yv
   L3eB71w07biD61cgNsn9VzhPtQ9PG68ivz0bcPwlbC0XNcBp/6vYVIDNx
   ImmNtO1krgANHwjlKP69noDB++DaGs9+BZWktYcQZAM0I5COeTpBhDqoR
   E+Iv1bkq2TU2HVFw/DbhpNnlU6KVKyisQTQEzkfpEkumEt+HiLQyKpj/6
   j76twaqKh7hv9NDnhsEjFUp0daD2RHLvPZKIgPkDA1z8SMgbjEskPoBTH
   ssHc2vCBORIMNxPzFFJzJkV2LXgtG7vwlM5A/sHI7d5QEXSXfkHk5qurv
   w==;
X-CSE-ConnectionGUID: JwsqNUqDQqeV9yShAAZfmg==
X-CSE-MsgGUID: Yv8J2XUhRl6KcH/wgbDLBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115162387"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="115162387"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
X-CSE-ConnectionGUID: QX5ag0ZRQEOQLlStDnFytQ==
X-CSE-MsgGUID: +i/+/hzfR1uJ72vOjzL9Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="277272088"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
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
Subject: [PATCH v8 07/20] drm/xe/vsec: Correct locking order
Date: Fri, 11 Sep 2026 13:11:55 -0700
Message-ID: <20260911201148.1610547-29-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
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

