Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A73DC85B
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 20:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589566; cv=none; b=TCyN/FR4zFyj8ceUw2msN0Sdk4MFoHq/ikCLYP8Cu/MvFdKFEdpUcJGzlpS605+iOtRUELeMyhpiy7gyg0ahc6rmebKeeOdT/lBZCGegh8PrLSMsJye5xR0nDfJG04zzH5RiS7tZmmwZtdyaY7pNiUj3pkHU1had65crBjWycI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589566; c=relaxed/simple;
	bh=gG1sQHPbPJ4Cq/dI19EwzOvsMB1T3EvHwtS3wkphv0A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cIvHNmGuuLxu325Pveot1Eyx5kCNG1rmdvA2ob0JzQIgd2SkUcwMT8JzY/2a8tO/Yktlcy/XyegKeo1QNGsbBNBTXcUF/Pvjgsmw7zYwTIF6paa2NMyI5sSdUdmVBZwEDCVDQ2tdPdLR8kre2XTnvzofrFUjcIbiwvhQuAeVSY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8JkIZ2a; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8JkIZ2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789589545; x=1821125545;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gG1sQHPbPJ4Cq/dI19EwzOvsMB1T3EvHwtS3wkphv0A=;
  b=W8JkIZ2aE8PoRUnq+wawkxj9XiOK+Df7sLWro48zqf8tlDrJVjmRWeVj
   2WzqYzmU/DT5Rt6FMRs7AazDcl/ylw/qJFr7r3fahRVT4BRCgNVoiCwMr
   tu+VXkWTUazP89d7shU0/c3iATsfin527TJIospGC8HSSurq/JsTihoOV
   yARx7QXhDlsRbMwsC8CXmnXUWgdNU6S9mhjaJ4oC5PPg9QD85GTWGza4k
   NVEKYIV3Fv3m9KE/Jm1A54L9dnUuNccNy9z6lFyAkJuDeoJdOCwbR60Md
   iy2WH32vvL7As+U3I9Ygcboqv1M98GRjLljJIqY36TP3eY9LQ7EtQMT1A
   g==;
X-CSE-ConnectionGUID: S++nhXVLT/G59cLSHYtsEQ==
X-CSE-MsgGUID: zl5FD/33SWCirOd6TtsdBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100296163"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100296163"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:11:59 -0700
X-CSE-ConnectionGUID: 60xGOZzDQF6U03MACkcqRA==
X-CSE-MsgGUID: ZHWYLmsrTqWkdK9yVqaJNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277574009"
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
Subject: [PATCH v9 07/20] drm/xe/vsec: Correct locking order
Date: Wed, 16 Sep 2026 13:11:45 -0700
Message-ID: <20260916201139.2374531-29-michael.j.ruhl@intel.com>
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

