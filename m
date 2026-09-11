Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39E359D60E
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 20:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157549; cv=none; b=cyj0jDSSX4NVam+zzfwS3zc/lcssAkU06lepQgBosiM6ATSA6fpDt8bm08qGfZzTSaQMUu1iYjd14jlDXodjL/TyRjwsv9s/yJXYkKWDrtTkoj4YBKBEVnlmY41JOTHpCo6lKrGy1KmnU+YIyryzzzFPe7a99yXFBZMnawvAgNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157549; c=relaxed/simple;
	bh=cQV6zuzeFlwJxW9InrJCSzFle9hN+gVLDCwPbTXMG2Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/BTsvskbKuNLnjQlxLY8qgV37fiGqV0ly/ZtvDJNUj2u/bWPCZ0QGGpXLzkoPkfESZJ7mwy8IPc1AiaKybo2o0UicHdSjIArfDE7sIarYeBPPo0KNCrHroLY4grE3AMw8KhxCEdewUZKRF0XHRPd9LiI2yaLJMFM7jhl5ruxEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T85TAjTE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T85TAjTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789157545; x=1820693545;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cQV6zuzeFlwJxW9InrJCSzFle9hN+gVLDCwPbTXMG2Q=;
  b=T85TAjTECFuKq4QF0J4Hx1kh3BJEyiOtZX5OA45VGDFGOGgrrjJWj8eM
   yzTxZuMbP42qwz20Q+aX06s21r3jroz12ISfKWEixmGw6NiuGnOklrizG
   O2M+IrBWDiRt7PXeK5YMZYwhBi73YQSAKAOjht7adaACnx7910Lcau1Z3
   pfL44dNzvVK8fiLFi3Y5RSR9zqK7BpMMxy3RnE8LG/1zY1+rg8+4wRBjx
   SKQsbqg2b/XDHE7U5GmPzVvFJP4dRRg57/b+il/w6HTq58TqcSb+fnvS8
   aVQyxifc30qZx8ybcWjTy3rwSH+sPmIuMVbk3rxRnRp3lNmArs1hxsQDY
   g==;
X-CSE-ConnectionGUID: lcmIAv8dSey21DValF4IBA==
X-CSE-MsgGUID: k6irHcMRQLqyo7IamjldnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115162414"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="115162414"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
X-CSE-ConnectionGUID: /iRPgMlWTeaCozdwPY7n4Q==
X-CSE-MsgGUID: DoOmBtxCStenpwgiguL4xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="277272106"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
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
Subject: [PATCH v8 13/20] drm/xe/vsec: Add base_offset to allow for more flexibilty
Date: Fri, 11 Sep 2026 13:12:01 -0700
Message-ID: <20260911201148.1610547-35-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
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

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_vsec.c         | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4661bfce2f4e..ebdc271ebeae 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -473,6 +473,8 @@ struct xe_device {
 	struct {
 		/** @pmt.lock: protect access for telemetry data */
 		struct mutex lock;
+		/** @pmt.base_offset: device specific base offset */
+		u64 base_offset;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index ca8414441a69..856973473fd7 100644
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
@@ -194,6 +195,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		goto dev_exit;
 	}
 
+	if (!xe->pmt.base_offset) {
+		ret = -EAGAIN;
+		goto dev_exit;
+	}
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		goto dev_exit;
@@ -272,6 +278,7 @@ void xe_vsec_init(struct xe_device *xe)
 	case XE_VSEC_BMG:
 		if (IS_SRIOV_VF(xe))
 			return;
+		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

