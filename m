Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19534BFE95;
	Thu, 24 Sep 2026 18:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274258; cv=none; b=SeRBqb3VI+NrmHQ2cdf1Z0crSU7CAlaMcOjbjqGH8fJXYFVXRiYaxanATnzl7u2eqbtRp23zaL6ZjiAfA9d4ZGYZu2O4ynDW7v/vGzt1BKbbbRe3cUgsTK9v+iyj3yau5CoWB+Ow9E2Cn/5OUjbJRgOZFZRtiM5V2kARd7eb2/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274258; c=relaxed/simple;
	bh=QURcM/Sl11YV/obAy8HTQgCR2276WZ8jaBwew00fMmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQT211w9zY3oeOAk3xys/Y3oE0lVHAe/I5RqgwgJ9cK82w9UHqtRWo+LuAMEt3FfnDkVhHfMLV+rMFJyVrldd8Mga8QO51VWMZlyr5gQ8Vp6uwGX9s3/cPfeRCeI69Hu6iy7/flC/YovrZyXgO8NzKCIvN7VVXnzzKiG8+/DX8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5DBamYn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5DBamYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274256; x=1821810256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QURcM/Sl11YV/obAy8HTQgCR2276WZ8jaBwew00fMmY=;
  b=A5DBamYnJO6IlHa+wIiJNo97UfptfDKmtx1IUTpA+pBSmnUX8yUNYRT2
   vbN+VBH3FNCVVmENsFH94P+7d3sWiYfGwMWmS9fRMwXbofmk34O3OGC5+
   0lwemntSMYBGWzRh+ltbJ5tV2B3CtGxSuj9bjWwhj3YXh9WmNQg0v0hzI
   ozO64goSi1KtusGIFPHmqPoEzZrXMXFgJPQc08D1D3nd4I5ra/hW2SrGR
   GBoR/cBapIkdO7mRVSVyAU/3peXHyFmNt3lMmX+FUNb3mLUpFtz4NV5yL
   0WAfCTEc9Uz8x/t4ceM9y1rkAna1T5OjrAAkywzqb/s16L4la/FQsk6mR
   Q==;
X-CSE-ConnectionGUID: 0JST+Cx8S2y2yU/Bv1hkdA==
X-CSE-MsgGUID: shpzS+rjTvO5rbuFFQsVIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164286"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164286"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
X-CSE-ConnectionGUID: rF9fRK0zT7uzQVarhuEd6g==
X-CSE-MsgGUID: dE7h5mk6QgOTkoNidu3sfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229949"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/19] platform/x86/intel/tpmi: Use scope based cleanup in the memory dump
Date: Thu, 24 Sep 2026 11:23:36 -0700
Message-ID: <20260924182342.212709-15-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tpmi_mem_dump_show() frees its dump buffer and drops tpmi_dev_lock by
hand at the end of the function, so the ioremap() failure in the middle
of the loop cannot just return. It breaks out with an error stashed in
ret, which is the only reason ret exists.

Attach the buffer to __free(kfree) at its allocation and take the mutex
with guard(), then return the error directly from the loop. mem_write()
in this file already does both, so this makes the two debugfs paths
consistent.

No functional change intended.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 00f27ac0a753..5332d30aac6c 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -393,32 +393,29 @@ static int tpmi_mem_dump_show(struct seq_file *s, void *unused)
 {
 	size_t row_size = MEM_DUMP_COLUMN_COUNT * sizeof(u32);
 	struct intel_tpmi_pm_feature *pfs = s->private;
-	int count, ret = 0;
 	void __iomem *mem;
+	int count;
 	u32 size;
 	u64 off;
-	u8 *buffer;
 
 	size = tpmi_get_single_entry_size(pfs);
 	if (!size)
 		return -EIO;
 
-	buffer = kmalloc(size, GFP_KERNEL);
+	u8 *buffer __free(kfree) = kmalloc(size, GFP_KERNEL);
 	if (!buffer)
 		return -ENOMEM;
 
 	off = pfs->vsec_offset;
 
-	mutex_lock(&tpmi_dev_lock);
+	guard(mutex)(&tpmi_dev_lock);
 
 	for (count = 0; count < pfs->pfs_header.num_entries; ++count) {
 		seq_printf(s, "TPMI Instance:%d offset:0x%llx\n", count, off);
 
 		mem = ioremap(off, size);
-		if (!mem) {
-			ret = -ENOMEM;
-			break;
-		}
+		if (!mem)
+			return -ENOMEM;
 
 		memcpy_fromio(buffer, mem, size);
 
@@ -430,11 +427,7 @@ static int tpmi_mem_dump_show(struct seq_file *s, void *unused)
 		off += size;
 	}
 
-	mutex_unlock(&tpmi_dev_lock);
-
-	kfree(buffer);
-
-	return ret;
+	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(tpmi_mem_dump);
 
-- 
2.43.0

