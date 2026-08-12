Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3BD379982
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563480; cv=none; b=GFioFHRfhj5EbdKTYayf8sE2p6PkzRpE5DD+KP8WJvJ6i5EtJIvsDnbzpVvCGhBkDP8er1f/s4k2hG0skkXxuoAnblXL4fcPQOjzmUf1jjRfc5QLgLjRFsdTuXvFSyNAUxOq3+Il6r3kWyDi4v+OYnBCBOM5zwITK08E6eFGvJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563480; c=relaxed/simple;
	bh=iC3F1+unad+8lP/Q5JnOD0GFaB3o6KPxqsxPcskIobA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8Mcwo65irjxBjACSe9xqmtY6Pf7dOxHgIEd++ddJXiRR11Fa/lhyIWwrxAHDS6S/Sa7knktP8nGQbg+FD/wABX2SUobdKV1BV3ZkUrx2JLqVu7jrhG+orXRF5M0x7R/U4RIGYhLhLouFmsun4QTJjmf82lQUQeaGqTBIEVFDnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYBP7HR2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYBP7HR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786563479; x=1818099479;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iC3F1+unad+8lP/Q5JnOD0GFaB3o6KPxqsxPcskIobA=;
  b=FYBP7HR2tbgg3dTE8LUerenrLGpV6B368e9ojWQe8Q4nZyUnLXvKuYdb
   4jIDqplyjo/RxdbOEV5lMxSjuDtSJEPLDXKiQ//WpPm3qLopdDegvS4VZ
   5M6aQ5uLOhVPeg3fyX7yTSh8S8ZoHRXn7XWgTg6zwrmiETAvpt6NQoHlc
   203EuUCxYgO0j1Rfw4CRRfioK2quUX5mQfOkHjnknk27KRcolZhloQvme
   TbFfA7aIu5x8ohxHtpgaEZAJFNc1bOlslgIAt089uc7AVOvTh5gaZ7gqh
   ImL6CegZS9t116+McP8rJdziq8WHnCgHPbDgqiggPumLg+Mgs59nSqU1Z
   A==;
X-CSE-ConnectionGUID: KXEx1t04T36dpipJyy+PkQ==
X-CSE-MsgGUID: HGZWLh0nSp2U6GnKA/1PKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104515381"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="104515381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:37:59 -0700
X-CSE-ConnectionGUID: tA4c/jmHQ8aWyqw2AZV2Eg==
X-CSE-MsgGUID: gfk9PDihTM2vBdQLpVXlfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263779928"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:37:58 -0700
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
Subject: [PATCH v2 04/10] drm/xe/vsec: Use correct pm state get
Date: Wed, 12 Aug 2026 12:37:45 -0700
Message-ID: <20260812193742.2170188-16-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Crashlog needs to be collected at all times.  The current pm
check assumes telemetry only.

Update read path to enable device for crashlog instances.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Fixes: 2c402a801c19 ("platform/x86/intel/pmt: support BMG crashlog")
---
 drivers/gpu/drm/xe/xe_vsec.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index bd83a33aef6c..8d99a3770b5a 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 {
 	struct xe_device *xe = kdev_to_xe_device(dev);
 	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
+	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
 	u32 mem_region;
 	u32 offset;
 	int ret;
@@ -158,16 +159,28 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	telem_addr += offset + user_offset;
 
-	guard(mutex)(&xe->pmt.lock);
+	/* Always allow crashlog. Telemetry, only when powered */
+	switch (cap_type) {
+	case CRASHLOG:
+		xe_pm_runtime_get(xe);
+		break;
+	case TELEMETRY:
+		if (!xe_pm_runtime_get_if_active(xe))
+			return -ENODATA;
+		break;
+	case WATCHER:
+		return -EINVAL;
+	}
 
-	/* indicate that we are not at an appropriate power level */
-	if (!xe_pm_runtime_get_if_active(xe))
-		return -ENODATA;
+	mutex_lock(&xe->pmt.lock);
 
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

