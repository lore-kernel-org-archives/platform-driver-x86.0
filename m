Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE3A28C840
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024720; cv=none; b=QyLgcN66Aq+gohTTIheYQCSkAWLju7U9w/pQYQa5VmJ2GmLj5n60WHxq/BVEC4/cwBfcXKTjnJp7JoPicmFtGdxr96QAwMfQ7L58ia39UpXZNWPFPvVvSnDvqGKNe+QSGjyAyFZkTAXdlXsWFHk22UO4KY4vAoZ2wTNcdWUwOdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024720; c=relaxed/simple;
	bh=KpYGypVcX7t8XC6+1QVIAwWNj4o+z4lwVgGGwmxqbKo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFxSY4YMdu2uaOpsjX14ZjwyCUBbshoOv7ZywZ/RTf5aXmH5ONqbU5WMkVG/0C26yqpVSMr2xn1vk5HmR2HJGqv6kQxstQW/gZdK0T1NlMHTS39K8gstSK5AnwdB7zVbaSjCF53T33u+JmIIRMsqk9nDolI7AkBVYVozxENqYrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3O+tXjd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3O+tXjd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786024719; x=1817560719;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=KpYGypVcX7t8XC6+1QVIAwWNj4o+z4lwVgGGwmxqbKo=;
  b=X3O+tXjdIICKFalzeron445MIDbl/9l+TGFNIlt/LxqNnkoxYacXP/tY
   Rhy5I/0bpo1tw8dqT0lQTIr/rYqx0Ae94Ay7RMXMDysBBFnaVBjO/g+YC
   /HU00qciypC9nY08ke0vSH88REmS4p/vlrimaO1XuCquEnl6lZ2eBfuJk
   L22iEGp6HycFql5k2+lpSzZH6GIYcM9xaFCWIehKy3uB6MlgOc/a/ytzy
   p8qIHx3apnRGPgw5T/s8EF5J8LnclApYoAtfVSAaWovA4jo6449JV1iOa
   QAR45X0CGVcPdztvIfQmS5Vuh+YwvuxkcP4tdfxlSqCy0dZe6sL2voXnC
   w==;
X-CSE-ConnectionGUID: MK5+zW6iRdiYrSUp17RLZA==
X-CSE-MsgGUID: ixeIbSwuSN+h8yuZj2REmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89141336"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="89141336"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:58:39 -0700
X-CSE-ConnectionGUID: jIuOG3+hStS2dt8BQ0uj6g==
X-CSE-MsgGUID: pQ8Tz6MZSAWgWqIFVLH8/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="265594936"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:58:38 -0700
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
Subject: [PATCH 3/7] drm/xe/vsec: Use correct pm state get
Date: Thu,  6 Aug 2026 06:58:23 -0700
Message-ID: <20260806135820.1422040-12-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
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
 drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..f9b519f2b91f 100644
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
@@ -160,9 +161,18 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	if (!xe->soc_remapper.set_telem_region)
 		return -ENODEV;
 
-	/* indicate that we are not at an appropriate power level */
-	if (!xe_pm_runtime_get_if_active(xe))
-		return -ENODATA;
+	/* make sure that we are not at an inappropriate power level */
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
 
 	/* set SoC re-mapper index register based on GUID memory region */
 	xe->soc_remapper.set_telem_region(xe, mem_region);
-- 
2.43.0

