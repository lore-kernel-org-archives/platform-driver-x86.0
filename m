Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208176;
	b=xQ/pG0cwU76dO8W9KGr+kPSY4AWiHsDnmZzgU+TyE6IaaL2ir22wOGzw9mdNOQKzX/Sy
	 Y+UZMCIlyh/xFmtWKVcZRmg/Vtl+iKTRIZ3xJtceWOqByn6AGJHlYx1qH+vbKAJAkXMNp
	 APs/FJm7GqubnVne/RH3ApFQuie69mKtzi/SIBMsKlCNobnKpaNM1kRBl2rDhRc7se5rf
	 wjC96Pe7rxuIgh3mN8ZGdvGg7GP6LUuJyNHFtXP18l/SnKcxRRugfXxBn0XQOmDtIVLdD
	 EvaLw9fEgAaHweGrJKefGwOCgQCR2hZaZ0PmcgWUEpEMBLA01VyrkXPrCrBLYHpK7gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208176;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L2Ik0Ny5XHs7QaR2GGO+Hd9Fbby9S3G/BaIlRBJlhaE=;
	b=hleuyIbxY2Pq2okGCf6EUzzPELwdVinrX66TgI/m8jar6r//1TKqTKr255gxbYR4ESgy
	 i1V2tiuy39XH7h+Sj7hOE3OwxvWlSju+vORAq9utbiapKfCVVo4CMcPjvUUd9CJgxFr/t
	 tQm/+cI6rpVo7STpu0pN8LfB3mEjppq/qVeK9jchF5sMtr/HAV4J2Ge5BzJbCQZ7xYGdI
	 iboldz90seW7NXtUtr/ocLTQ4F7FXyGrzstOLlib29w6hbPutUMYWPz3qdzoAgqztpRdj
	 FFFA8eO6BqixMPYXSAp/wfeKwGRf5ltdqs3tniu0Kdi4DNG5nb56HEBIr0Sa/ISJgBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EBatIMeM;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE3860A2602
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDE3860A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EBatIMeM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208173; x=1826744173;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sNBZBhODUIN+kKI9C5cmSmwZHsUjWRmkortTjnqPaoo=;
  b=EBatIMeMtpK4jTREM5t63iGK2HeH76QrXqXYJh0bP6TwtirzPL21XOSq
   skdnYGOzJHfKhnfXRa4FVTljo5QFpQjAsAupUdn+AEtNEpWHZ3CailN4z
   J4HhRwbxrD1SlDVlm1NLBakiP3EThU+Gw38f+hkkVBenmgvkfYGc7+/n0
   FgMeQw+iiIyGntLzXy/wXH7b4sTnvX/kiNi2QkRfJnoIafLbLIrGCk62h
   JV0o5AXk+bw6wqju51KKgMk6BgjiozDzNtI1FNFrPW/3Ev8nYlvAkv2gA
   pOgUj5MbJgpMUSiN+xm1npjfN7ffwAWuN2g5yBSQHAqB73dUD1JIhKllr
   g==;
X-CSE-ConnectionGUID: C1bZgN4mTe6IKNdbPDZyLw==
X-CSE-MsgGUID: iswbumZETwGPcyIYQICeyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136396"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136396"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:51 -0800
X-CSE-ConnectionGUID: uqPluke/TbGhBSvpQS03iw==
X-CSE-MsgGUID: 8FZ5bnR/SgCZ0kD//+EqeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10908721"
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
Subject: [PATCH v21 11/19] drm/xe/vsec: Add base_offset to allow for more flexibilty
Date: Fri, 20 Nov 2026 12:55:51 -0800
Message-ID: <20261120205540.1220643-32-michael.j.ruhl@intel.com>
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

Current pmt_telem_read() usage is a fixed (for BMG) offset.
In order to support other devices this must be settable.

Add a base offset for more flexibility.
Add a check to verify that it has been set before allowing
device access.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_vsec.c         | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f2a31949073..28b1669a14d8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -485,6 +485,8 @@ struct xe_device {
 	struct {
 		/** @pmt.lock: protect access for telemetry data */
 		struct mutex lock;
+		/** @pmt.base_offset: device specific base offset */
+		u64 base_offset;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index ebe56c85bc05..04aec1e5c15c 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -172,6 +172,7 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
  *
  * Return:
  * * -ENODEV device is not available (hotplug)
+ * * -EAGAIN base_offset has not been set, so init path has not yet been done.
  * * -ENODATA for incorrect power state
  * * -EINVAL for unsupported PMT feature
  * * count   number of bytes read on success
@@ -180,8 +181,8 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		      u32 count)
 {
 	struct xe_device *xe = kdev_to_xe_device(dev);
-	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
 	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
+	void __iomem *telem_addr = xe->mmio.regs + xe->pmt.base_offset;
 	u32 mem_region;
 	u32 offset;
 	int ret = 0;
@@ -192,6 +193,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	if (!drm_dev_enter(&xe->drm, &idx))
 		return -ENODEV;
 
+	if (!xe->pmt.base_offset) {
+		ret = -EAGAIN;
+		goto dev_exit;
+	}
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		goto dev_exit;
@@ -269,6 +275,7 @@ void xe_vsec_init(struct xe_device *xe)
 
 	switch (platform) {
 	case XE_VSEC_BMG:
+		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

