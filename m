Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52B13B14CC
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 20:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589572; cv=none; b=PaKjIWxUh6k84UPcOuJYu5mp+KtMjJDrpmN1Ld7M2cLrkaXuLWyGko3swfj7E+De1cFxBge/wdEKMSBAtlct2j8ohQy6xEMV/MLG5u3ZTOxxqGPlLsObptYVjKKnjxeEuy+2gGVVAIYASVnoimqW/H1MZYccKIGH5PLKRdat5WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589572; c=relaxed/simple;
	bh=61sYWOr5jQl5pF8+mHf/Sr2M7t3c+t9NoXZbMeoGRP0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiWostMQj3YGokNG6OHXj3pBfHZYZfsDEwi4WlPEUAXqRGu0EHaBpu0CF38XZDGjkdEvgZyKq22odS5+m7i4lI9HbwKEzZR/0KjnV8wWNi4Hakw0PlkSjFcTlovpxE8o9JOdleI4Ub1dJ6McTpS1Liizx8r2Vv1rRTFpgW/VH90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgoX7XL4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgoX7XL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789589568; x=1821125568;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=61sYWOr5jQl5pF8+mHf/Sr2M7t3c+t9NoXZbMeoGRP0=;
  b=FgoX7XL4xG0k55h0fiWhT4yT2vMBhVqDhrTVVe24MzHNrvbBlCkie+La
   3YtTU/biXjZMi6+ERTlfo/3O+eLpQWKW9iDx+UwPjumbQ8hi5F0xphLC7
   1i4hR2Jw3omWxCXC5cRz773a9TbHkzANUXTZXlk0ESAR70RNaoePCRrdN
   mjoryTRFUiqGkGBavZcr6p1rs9oWxrsPJ+GctpZa3D/1o98Zjr3UGZWHx
   Xby3KANV4oIx0yCllkrQDjEC2yPU5p3NgIp5YVLzErZVeIggzRbSUU++h
   dJ+kaGPiY6g1+XtOUn1Bx2wEWcC66CRnxlBAQWga3VKeEbZKVQhOWrLKu
   A==;
X-CSE-ConnectionGUID: L27D1HlNQxSqLZYH5tMGNw==
X-CSE-MsgGUID: ZZvqnH5pTTSNWx1BgKzQcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100296194"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100296194"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:12:01 -0700
X-CSE-ConnectionGUID: S/A5Z7pHTt2Z+vYQT2XVFg==
X-CSE-MsgGUID: OQ1WR9FUTLGGK1HaBUDv/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277574034"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:12:01 -0700
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
Subject: [PATCH v9 13/20] drm/xe/vsec: Add base_offset to allow for more flexibilty
Date: Wed, 16 Sep 2026 13:11:51 -0700
Message-ID: <20260916201139.2374531-35-michael.j.ruhl@intel.com>
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
index 0bf727ed3b99..47290726a4bf 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -173,14 +173,15 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
  * Return:
  * * -ENODEV device is not available (hotplug)
  * * -EINVAL for VF and PMT WATCHER requests
+ * * -EAGAIN base_offset has not been set, so init path has not yet been done.
  * * count   number of bytes read on success
  */
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
 		      u32 count)
 {
 	struct xe_device *xe = kdev_to_xe_device(dev);
-	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
 	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
+	void __iomem *telem_addr = xe->mmio.regs + xe->pmt.base_offset;
 	u32 mem_region;
 	u32 offset;
 	int ret = 0;
@@ -191,6 +192,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
@@ -268,6 +274,7 @@ void xe_vsec_init(struct xe_device *xe)
 
 	switch (platform) {
 	case XE_VSEC_BMG:
+		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

