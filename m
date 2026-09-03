Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43915511237
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Sep 2026 20:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466257; cv=none; b=FYQB0lemCvNHGq4JETIMQkmhtlNzydn7jGxkFTZQAynvNuTpAvhoXSqQAl132OdRiq1mf4xY5tBmGkx4rYurqC7+FHOVJG/jpUIOF7QaF2hErnfaq1Yvm1jeiFz2+8FD/UAJ+HJEb2nXsTeVqZy0AxUFmxmiP/+PAqUOOQN9Tak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466257; c=relaxed/simple;
	bh=oLSU59ScGc4fReM/vHKENeNZ64rIz08b847IWNPXf7Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwTDphvE6s3JbUlOBc4UjF+lzWPJhyC2eQwOxJmLA/E/MSXxRn4HepvlQ9ytdy/qMMV6LoVi7NIufsBIRmDAgfmcZBpOS+VvLCounBTJudn1OKuXcT38xdaUFQNGjEmFmmN3dlUbaobn9zzEEmvSZGsqiERdCIVz6lAiJL7pbO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rlm2gjbw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rlm2gjbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788466244; x=1820002244;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oLSU59ScGc4fReM/vHKENeNZ64rIz08b847IWNPXf7Y=;
  b=Rlm2gjbw6+y7Pyef1+LPsnSlKbdurFjtqGB85fZDs97KAUUGO8x/OGdf
   qlFcUTT0fk6OtDrKVp8ARybt+HNBX9TJsX2ZO1dfjbDo9WWhTzLY5y12v
   aweKPtQ0ItwdevSeiG8pnwPuCgo/fYzGwzpbJmJwtmV6hkkFlWQt8WGCc
   x+xXTU8lAbASGbhv7JmHHufToYHx/dvIFrTFYN+V/r60laZSksNy5skKz
   34c8TrrLEbi7h4UZF1vt6uFqRrIbG6AwjKbb9T9FGfIZcSdGwItmAJaC5
   /UX0C0BE8ZNBdyseWpfFd4qgKJ4hz8Giohmw1/e52zeYDSWrBURNELJbV
   Q==;
X-CSE-ConnectionGUID: 2zG0L214TFmnZq3IUrJUgA==
X-CSE-MsgGUID: tDWZdbr/QeKU2M2LQnsuqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88994599"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88994599"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:36 -0700
X-CSE-ConnectionGUID: HaLXBNfETxOa2fTIL8BXuQ==
X-CSE-MsgGUID: OPMoO5eARLWDp6Kj8zyL0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273348075"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:24 -0700
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
Subject: [PATCH v5 07/18] drm/xe/vsec: Correct locking order
Date: Thu,  3 Sep 2026 13:10:09 -0700
Message-ID: <20260903201002.1064889-27-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
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

