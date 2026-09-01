Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DD04A2049
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 19:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290878; cv=none; b=Y+4j5ktd5L9Z26ffVibt2kePHxNX4ReXlYKO9igFkUTxkRnb4dr0jfE+xPd1iueShmqZLYuhMavktiM3rLlJfaNEbNwgp9049RWfPZ6Cj3n5uZG2rsvwmFrf7hcVVuABH6qG6LLCUysDU6Uo1uQHDoCTXDJw5aZnjl7IufIbeNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290878; c=relaxed/simple;
	bh=W8dixMWm5lgDdO2kS2ztSj/350/4eS/UZxykCfYsUMo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cjzg89i7IZUGO+/4pByFgMCByz8a7KGHOA+FaXGB/NBpepc4+M3Gyb8UbfPAYnKH6HaESDxOWVvIOg+HHMtrgbA/MGSJRnschiSgaXUG3tk0mD6mQZtokcwhzCNKcfxp4QAhOWFYCefRVj8o21sc504QFNwm4EiRyCQMAi7ZwjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWMDQAhv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWMDQAhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788290877; x=1819826877;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=W8dixMWm5lgDdO2kS2ztSj/350/4eS/UZxykCfYsUMo=;
  b=SWMDQAhvNWht3JFrzBSyA/jLRepWSDhcydpihrAy//kjYh63ub+kPRK3
   kyn6fNPt6xygfuyr8Q3Jr1AcWprDz7rJE6b468v5RKCjnb68QU5flmE30
   rsZvVSOqDWcnFtwcWGuPERCfNFaYdpqxL0lP4DsLg8D6O/hSpLMU1EafG
   yc6j5WOVMho/T7rK4D9qD2COoGOZZt/SB038kGfrXVQuazaVDP4bPDCGc
   6huetkfveFmqWLhc237YMQfaUiwUxe2VrpmC3zrK4zugMYcmx1rxUya7w
   MoJFt0hE8fyTsmYRJ73NIAYweN+VrIwqyTanSzJIw0aJ7+sGcwH63Zkob
   g==;
X-CSE-ConnectionGUID: W4WCfjzrT9GmdzdQ64IAPA==
X-CSE-MsgGUID: zr8vInKfQ9Kir3rHzvmRfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762499"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88762499"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:57 -0700
X-CSE-ConnectionGUID: wfiyxp0aQO2LqFX1QormsA==
X-CSE-MsgGUID: hlKKM4oiTLudbjmXEgaM7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="269776748"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:57 -0700
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
Subject: [PATCH v4 08/18] drm/xe/vsec: Correct locking order
Date: Tue,  1 Sep 2026 12:27:43 -0700
Message-ID: <20260901192736.626777-28-michael.j.ruhl@intel.com>
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

Xe locking order is power state first, and then local locks.

Reorder locking to correct usage.
Use excplicit functions because of multiple locks.

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

