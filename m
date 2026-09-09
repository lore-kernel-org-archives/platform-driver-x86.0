Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E65577E36
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 15:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968888; cv=none; b=fGJL8lYCB+9KKb5J0arl78bOorg7WDUieIGFgoFs3PSZoFJ2OEpTiDMGC3N0I3xeuw/z+WkObNoSUDRjKqtlzeizugFo1yom33LwnP2LU0laFpt4QaDxpAHxzjtXHXzkvWOzCiSOXqWswuTyf3FshE5sJdMS5sjvHFsZ1K3eQJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968888; c=relaxed/simple;
	bh=jAuRfG7f+tXzori0499A2Pjdiea+MVvia5MkJ0BIdBM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFSEu9LqCsiG08gDJagVZqfpUq5AELo6qNh8NcuiV4qHqQ3n0FvEzk66RpGPVXWKdzMA+Q+Hmsaz7dEpiXHguxHHlDGveo2s0tjhB0lO9DtrnMePU3YsJvgHllo7R5CEgqto2zdttaJmJyti7/u4g7p+lgGl6ONpNM3gc3D6zRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTDD/NLr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTDD/NLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788968886; x=1820504886;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jAuRfG7f+tXzori0499A2Pjdiea+MVvia5MkJ0BIdBM=;
  b=fTDD/NLrsuGJTAoNoJIBxfjggZF40kFk0hCfKlnW6F5rJQzPGXYh67w6
   yG1GDW1+8jCk/VoY3sKOCebImfF05Z/HTf20CCiVklji26Lgp66O1mUsq
   rC9MGlS3D5AZWXMrNSEkjsTvkSoUtTU+D6uLzdH8ewYpptbAI4pXvvdJY
   ODz1rhMRH5ZiHbMm2UgHJLxpaDcFE1sJQi7ZbMUTiDWBEdx7AAKZZxbvZ
   3HLqXOUkUUj/r7YqejvkW+yAdgO7vELCKfKvRjwo6DbQYlh+ryL5pzB6k
   lU9obrFUF1tjauMc98KfYebj2ha2cdO1ifFz4xmakn5HqKVe026HwaQI0
   w==;
X-CSE-ConnectionGUID: G/c7oJHuREOWhZ8xwPUeMQ==
X-CSE-MsgGUID: 5ir0evitRhq4SSx9tZ7rEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93091850"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="93091850"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:58 -0700
X-CSE-ConnectionGUID: sC7/81mCSx+VR9NeoH2PIA==
X-CSE-MsgGUID: 0RCGJfk9QMueTqsofoHn7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="268102529"
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
Subject: [PATCH v7 13/20] drm/xe/vsec: Add base_offset to allow for more flexibilty
Date: Wed,  9 Sep 2026 08:47:52 -0700
Message-ID: <20260909154739.1515514-35-michael.j.ruhl@intel.com>
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
index f88bacf63c83..b50af84350fb 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -467,6 +467,8 @@ struct xe_device {
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

