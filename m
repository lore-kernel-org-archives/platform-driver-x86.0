Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208168;
	b=phBNtxdmTpdHV1jbbp716VQyyozL86f0d0E2XAvle1DCLXU0xYmN30iBh75SNQE3Oq0z
	 zYtJtsfI6O5FTUk24bgVoXagk75iIPDl7XdRn8JAkbNyvtBMdeWh0EEpfT/dubf3A18xI
	 8s4ATZd2KA6mwOpjkipCJ2IjTJNW/q0gP9bDngGDFTfNGxn6AqftTnD1dMaQJEddYFu5X
	 BKfcxpC554P6akDQSASrFyijvk8eoJci6RepHUestY/TKSAiVQMaYeJ1+44R2kFgxglHW
	 FVlNsO3jXXeUwXfyqIRFRFZ5NWo+rJIM4r/kEwjbGi2ZUJAKrjlGHRXyOQVL5hucmfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208168;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8tJxo1k4F6xf8gVL51rzG+x2tFlwx0r/UVyY5MAn2V4=;
	b=xtMfNhAgVTC3h7yJae5ILDJnaowaIQ4Aige7fbJDQUTAX7nA0kP3B5a2LYgZJIQXQjUS
	 tBLbN3llZB6w2HB86hxO4gM5GA+PwF5W8mTe1qBmQG5lB7Alzh7GSWf4bwNx+BWR3+XdI
	 5PHWJCs4NgnCbKlZlxpHDOaFtELfPYImlDNhbtOC5CdgIUFDzDa/0INkrdxtYCbS/cE05
	 vmPV+t8x9e4oPjnwcD8OoDgHHbIz/xjufEyxkN+mLXLOL+C/VUhaa3vc8C2UiQsF9fyMb
	 MMIOOzSzDkf81Tc0hGWn4U4qEWSXX7gtOGXfvd1RiqrtgDW61juPtD8GE78+3SeG8VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LvgwRyLt;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2D6606A68F
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE2D6606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LvgwRyLt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208157; x=1826744157;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rayEZ0+oT/Iyk+FY8Hj0Rn8qFu76Ec9MdIYQCC7fDsI=;
  b=LvgwRyLt4tm8jKSpzq4Nj8L5Au2YzSYNILM0fGThxwNQnzlvZT57kbaw
   G6FM1L/IhJp2qohlbwmj7ZnUeM3j5NSnJK/kmG+dSTJb9s6a6ptEHGwVv
   lFhNOj6Jpmf6MXtd7tpI9B6zIbAuyXCDehmAkQj4dqZSWEkw6YkG0q3St
   BIxyemPWx4ILzKi4ha7uxh2WluIbX4N9+a5RSghN/kOSSvWcirRrZG60f
   wti2SDJ9+1dtiq3/u09yndJKktODC4L9WkmpB9mc2klpDhnfEos/KMFqL
   uVrWyVb//wejR18Ta/IxJDmSfn5iZiGClXpNcZHBEYkIhamN1p3hff68y
   A==;
X-CSE-ConnectionGUID: lNgphy0OTXSE5aA6E7l8/g==
X-CSE-MsgGUID: lsgs2rDRRaSSI39I8OgxTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136364"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136364"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:50 -0800
X-CSE-ConnectionGUID: UuUu6CFPQgm3GyhD8Zxj3w==
X-CSE-MsgGUID: AA+irwd6TOS0HZBEd5+M9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10908703"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:48 -0800
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
Subject: [PATCH v21 05/19] drm/xe/vsec: Correct locking order
Date: Fri, 20 Nov 2026 12:55:45 -0800
Message-ID: <20261120205540.1220643-26-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
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

