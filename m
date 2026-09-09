Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BC2576EA1
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968883; cv=none; b=AnpAr4zTVT5yrAp9pw7RyNYJIA7Pg/D3YxtSQDUz1GKVx5PGBbe7SOUz/6LZVlKOW8xmDwrlkAy48CNhVWUPsABmWvJwtaxQu9zyeKv+elr9HGmWPeA8dHR8p+XIXPEwrrOCPg+I9k61YfwV6L53dhQHlD95muuEtksMxHmUJYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968883; c=relaxed/simple;
	bh=oLSU59ScGc4fReM/vHKENeNZ64rIz08b847IWNPXf7Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BA5V8IvJkqTHLcYiO5d3oguJCefvdNPo77JvGwv7N+nIWRNyYH0gacuZLFMq4/SgKyaWVtG7j7xOMTdcePo4DM2uwDcGXQGZydGoKAhumivKyGzRrzti0W+XXahW4Hbu7AmquuXMbpQEFsxuRlXHtHb5SXo281iBh6RpVx2x6p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kyr/10Xr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kyr/10Xr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788968882; x=1820504882;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oLSU59ScGc4fReM/vHKENeNZ64rIz08b847IWNPXf7Y=;
  b=Kyr/10XrJPuu19eNdttJ5o+23Ri9uQLjIBXShz3NalLtQqAISd/l6Gnd
   u47z4QploXmmzGNzsxSWuYosqcanpD1ew19eBTQ9NTnKwB1+3C15HZsr5
   UMo/oUXkR1W/JWunz4sXy+tmBkgmibMo7kkfrnG3Nl9/jk9IDuYOy8M0F
   zcVDAk7kxiQ4MjgAO3x8sw9ZRkeJel1n/0xO20ujU4y3fWDmbXsIj58ho
   r/wGjvqLpz4Yv01zf8f5yKt+JJ9+rBKmvV34zdT38G/j7Ez3b10K1BCOa
   ziaBUQ2Sz/DCmUXF8XqfM+v68yCHB9IgYN2xnorylB0pbRcomXzgaEGdJ
   Q==;
X-CSE-ConnectionGUID: j+uKyQYPSeW6aUK21DjZGw==
X-CSE-MsgGUID: 3HgoClJuRrOLtBXLEXK6wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93091822"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="93091822"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:58 -0700
X-CSE-ConnectionGUID: W+FRGdgbQhmNu/MDfHUFyg==
X-CSE-MsgGUID: 4CsNGzIPT0CJVuA7DrIWkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="268102511"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:57 -0700
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
Subject: [PATCH v7 07/20] drm/xe/vsec: Correct locking order
Date: Wed,  9 Sep 2026 08:47:46 -0700
Message-ID: <20260909154739.1515514-29-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
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

