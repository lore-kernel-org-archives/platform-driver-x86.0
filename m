Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED643DED6
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 18:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187098; cv=none; b=CsSX1R3hE95ET+/rQLwNBgc1AlW60LFcPET+2CSFsMzg/fjubx5J7cbv5id9fl4lvswyXQfgfq4Zj5k6ot/EMhZYFJpFjWeOpj6tZT2ANRs+3QvLSZCatLbPe4qq0OE5OVqLW29TrbiBqaW9NGiGas+SrypDjsbLrlZy+baffxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187098; c=relaxed/simple;
	bh=hSYzUnb+WraD/wngPAdgq3GOqeM+Ns4mCvTlHxPnI/8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FohoxVQQs99X6DOLniZcHok1SKnVUqFakIT/cd1XwUsEBACbZxpESzIjBXRX0c0NCPrUZoCUNzhtIAQZdgjmIb/4MXkDm8EmdNy2M2VcC5adugsB67SgoGAyI/Z8GPDyzaKFgdXfyAPq3UbK37C1KUWpBVAFJNG3Cno8lkjsMK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SY3uFGML; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SY3uFGML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790187095; x=1821723095;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hSYzUnb+WraD/wngPAdgq3GOqeM+Ns4mCvTlHxPnI/8=;
  b=SY3uFGMLpIsG4mUbcqFHR3IDc/Bb8TKu4GsdRHfWfc0QJHSmuvD1o5m/
   Om1jFzNnH5ejjSwDSJGbTleo5LczBrj/UPJNoTMfHqWLtLK9M63mFbdlQ
   oheKwizG0T29BR4qiasB61PsfaXVGlfdvekI79ysZRYHxOvUr1m4lQX96
   3sghA0DgI/mgeVZE5LZOzyGZn2H8PNfss1+dT2nWV1MM9ab8vTjgIvEPr
   GQyUZmaZo2w4OjhbHkY/7I61rOhnpTwPclWwHWiJZWrsFvuyq8VDV9S2i
   fzRu4TdTllBqFuIPGUpwOH3T1hCQPRndKaXPfw+l/rbWRGWiBCesrDD9+
   Q==;
X-CSE-ConnectionGUID: MqJq5dNoQtu/8PIHwiOBQA==
X-CSE-MsgGUID: CmO0GmrJRSCcloM3k+Ty/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93416033"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="93416033"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:25 -0700
X-CSE-ConnectionGUID: 1wdcmvetTsaaLc8iROgEtg==
X-CSE-MsgGUID: 0KsDJUfIRUKWPB/8+kgcIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4980715"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:26 -0700
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
Subject: [PATCH v11 13/20] drm/xe/vsec: Add base_offset to allow for more flexibilty
Date: Wed, 23 Sep 2026 11:11:28 -0700
Message-ID: <20260923181115.2514193-35-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
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
index bb4234f00453..e08348a95b28 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -486,6 +486,8 @@ struct xe_device {
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

