Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3344EDCA8
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737497; cv=none; b=GGM/UbrJi+OhzthUHqg35Cf9xXpbhGQgEdsTUU16IYjo5Glf+RoNApG9hLZS8SdRLj33FDtHkFhvFwqWyOB57BA+RIzmOiIC3cx3SP8tg36eYLTxIE3plE08g+PpILDu3uJFvNZoZGPgSa00yf1pOQECjF0gV/q9wFOrhJxdFzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737497; c=relaxed/simple;
	bh=MGQAlYiLpONZ0Ryb8RIVrBejnl/f0iDutSCPEzjDkR4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MjDb/09DqURJJuH9vKgP41LOt1GvSDsJ5gG0Xft/IkPIS0RAHoh0aaq66KWe8oYvfwPkRvwe43w0EkL5FEv8PKr20n/2od4O6l5oDEq44wM8AWRezwFKrbxnbsuJm+6U8M2vI/gBf2EoPib93XF8z6CH/ew2w/Qq6AgUIavVR6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyNisC2n; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyNisC2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789737495; x=1821273495;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=MGQAlYiLpONZ0Ryb8RIVrBejnl/f0iDutSCPEzjDkR4=;
  b=gyNisC2n75K/i8+WpzVkttToLDAv/Rr8wdjsytkpwaOc/zN2cDsvr3Rs
   KoXb1Kmo2NKjN3Ox78K8ABL66auszdlsVGNonkYDT74w7hbqczASAZB25
   ug+Zy96RB8t0chI5JBSEYW4dSuOi631Sc4RXtE6M4ffAcPCkvTh2ssj0E
   LznBzF6tgGLo3wu3CM2A8FYRAyx5THeRIS03+8wM/MYL4KAH2tulXP2ka
   vHlGxb7aV/yCsQBHQguWIqBJb9AT/xC947NKuRugDLBJN5ltDhPJ8lpzK
   RlR6zgQtckk08Nz61RbmLZcQhpoHeuL5dB/ps5TEHOhWx2kRoo4MVZJDq
   w==;
X-CSE-ConnectionGUID: 1pHQw0rQRC6NSlboCAN74Q==
X-CSE-MsgGUID: DG0l8bMQRG2BJNaB3kkBAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89378239"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="89378239"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:18:03 -0700
X-CSE-ConnectionGUID: +b12gVjtSFW6xpE0cCZ25A==
X-CSE-MsgGUID: V6HnOJyQSUG+pd9sLWfaLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270095329"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:18:02 -0700
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
Subject: [PATCH v10 08/20] drm/xe/vsec: Use correct pm state get
Date: Fri, 18 Sep 2026 06:17:59 -0700
Message-ID: <20260918131751.2408883-30-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Crashlog needs to be collected at all times.  The current pm check
assumes telemetry only.

Update read path to enable device for crashlog instances.

Include check of the WATCHER CAP_TYPE for completeness.
WATCHER is a possible type and needs to be accounted for, but is not
supported.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Fixes: 2c402a801c19 ("platform/x86/intel/pmt: support BMG crashlog")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 1b88ac1d2448..1cb9a78ee0ef 100644
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
@@ -157,9 +158,18 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	telem_addr += offset + user_offset;
 
-	/* indicate that we are not at an appropriate power level */
-	if (!xe_pm_runtime_get_if_active(xe))
-		return -ENODATA;
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
 
 	scoped_guard(mutex, &xe->pmt.lock) {
 		/* set SoC re-mapper index register based on GUID memory region */
-- 
2.43.0

