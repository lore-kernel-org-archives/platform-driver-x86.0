Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B35542EE9
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 21:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928036; cv=none; b=iq3nx2eocjqVZvcBcWOW4ra/3I80gbDSfktKzurQUVxEgKxYIG8+hC4ke39Js6i50qwcXcMvBlHfNz3tjudAXoRwkq7n9m0sW4Cgn9bQHXAzRIfJUvytXzL+Jz+jvEUqP3u6dgZz306tU2crpe4pfc2XxyIWwdHbcmTz/KiE6qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928036; c=relaxed/simple;
	bh=rayEZ0+oT/Iyk+FY8Hj0Rn8qFu76Ec9MdIYQCC7fDsI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYrTrXP9diHyz4qu7jlwio/XxSPN5KctyyEo+LNZwIN/pv0nXOYpJsThmoUrd7gbSktOAaPz8svpaY6jOSj1NhWM6t8QFZ9ugDbfmIl78mS1ykMivXGSC7gwDfakyinrMOYPrihlmihvF/0oksz2RLQIJ/ktoIaJKaMPwOTj4FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f32upw6f; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f32upw6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791928035; x=1823464035;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rayEZ0+oT/Iyk+FY8Hj0Rn8qFu76Ec9MdIYQCC7fDsI=;
  b=f32upw6fp5ihSjbYVRMQGWFf0yVEdrKuYaJKdl6aBbsoz8a/paDrd+bn
   IDHl12bqGBql9jk/G1lzOzOS5PilpZ6yt+a3WRUXstdO+zbRA4BSDtZU2
   ii4Kj/I4p/NbEIEFmuBuvwl2D9xGT3+SC6JR9Fm5dwSjwswWHGT+suMjV
   Plnfjg253xXUdAWBE4GoSUJwOh8fed+pGPAqBtHcEuse5x4x4HGgT8E83
   W+uIo4oGkF2Y2/m1m1xcRPuu4fj7HhXxQWQCCkJodwxxfOuq3zGBVBu7y
   rYO26hQXygir2tUHVh9mxboOKGZVUbUJd9rwzBb+4BzYATO8eR+WsL3vx
   Q==;
X-CSE-ConnectionGUID: ewwQBxs0RBKUmafzmu/T1A==
X-CSE-MsgGUID: +OqceXL9Qc+/0GjPU6ud0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="569434"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="569434"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 14:47:08 -0700
X-CSE-ConnectionGUID: eDLNl8uDRZ+Kg5VcJzdiMA==
X-CSE-MsgGUID: X9QY1bvcRAaDNLUOFNn70g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1629840"
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
Subject: [PATCH v12 07/21] drm/xe/vsec: Correct locking order
Date: Tue, 13 Oct 2026 14:47:00 -0700
Message-ID: <20261013214655.3502964-30-michael.j.ruhl@intel.com>
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

