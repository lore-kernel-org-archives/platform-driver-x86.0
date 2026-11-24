Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486088;
	b=LwmWu9a/ot4E8prLVwxy4jxPGoF9CnSvheMJwAkKfN7l3jGVxe8lHFYluQWWlC2ix/V/
	 7Brc2dk6Qp3Q4YWNEOoKDz6nBGIrPBVSdakmTlgdSIql99CEJucRZ17trNUKpfxdRWbdJ
	 205tmZYqLzgmPdD4T6lSanMASp58lGOs2/GlGIEB806acqixOECSAujmaoQbV+3+Jg8JR
	 NHpXoePboIrC7/pP+FWT6xGsq4wuo3h0b2KKfM0HHprx2eAjIZlTJ+MB4BJ61csyKmiMM
	 fAyGGO6JPSvDoW7hp0k8r3NIzFaCRkphQhb6OKTFGibTvccHCe+sEqwO1I5LvaCi6RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486088;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v4DNELIyYjP6esd00hG7Ix/jPgfno43ps3+Kp/fRlYY=;
	b=K2eyooHNZwVRR3yylPnMKJ+G9nbRJOXM9jjScijVOoqosfSl+4bi+T/BnNskmaC/aG1r
	 pummcH3qVKINZWfaF9lZmgnQmW7FfHC0ZWLJLXnzQOEGfQTuPymtVgUXy3EWW+fvetYO+
	 jgjt3ba8cBFW5hhJfaRcf1p2Fxsgv0cEL7rqEMGxT1gnVKZ5htnQR8SNWWsOt60U28UF+
	 DSmetMFJL19mqm6m1Q870Xo7SNixqsY4re7HJOKGQ2ZFXQwvvlG3vD9Ymu1CPLdNR735L
	 hM66MnPLUYR4JnIBQ3a6JRdSyV+U3XQcMxhAmjGhexlU3a+T6oP3vW+VV/36iXxN1Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="m4/Po6eh";
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34282606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34282606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m4/Po6eh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486089; x=1827022089;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LQ+y/K+s6jsJrOt1Xhnx6HqJN9Cdu3Ab5UZFYrPKzEY=;
  b=m4/Po6ehRf1RQn+/3fOsCiLtZTZzbjaS6Ujp2boDlBKDcGPPP+ZQPCA3
   PFZbRqpXfLbnrID3FqemSnKUKbYiXsRkZZ7a6ACyoycPZwJ3KWb0ablZD
   opFpS9PhnXd6HaO+EW3nPED3kMkJzBPjf/N9jUdgNZGBj2KXgfO6zFW+s
   hCuPkCNAp+OfZo0sNb/9h5Orc/vEnuyvN+CmkVNRwmDO87BA6FjR2Rqvg
   Es0Xw2xVbfeGIpskFNRoR6QtNi9ni7trQ11gOkhrb0YcxSlEdXffuqmWC
   CMg1z9GSJSFYVQ3my6TYMlIbkbAwh2KIehuL0WXjOWw05aGVHvDXK5P7t
   Q==;
X-CSE-ConnectionGUID: GfFghqcoRM2mjg2btSgwyQ==
X-CSE-MsgGUID: UCzdNqSuSRy51Xx1Q3R3DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153562"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4153562"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:04 -0800
X-CSE-ConnectionGUID: eu5R5sArR0+dZOEfVRmf1g==
X-CSE-MsgGUID: KEXBJLIQS5+ZcL9AE9chZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11621451"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:02 -0800
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
Subject: [PATCH v23 16/19] drm/xe/vsec: Add PMT GUID internal access
Date: Mon, 23 Nov 2026 18:08:08 -0800
Message-ID: <20261124020752.30551-37-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124020752.30551-21-michael.j.ruhl@intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com>
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

Xe accesses the PMT infrastructure directly. The current usage is
supported ONLY by BMG devices.

CRI has further requirements for access.

Add the platform id to the GUID register define and use that for the
register access.

Add an API to allow access the GUID based on the platform.

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h     |  4 +-
 drivers/gpu/drm/xe/xe_debugfs.c      |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_hwmon.c        |  2 +-
 drivers/gpu/drm/xe/xe_pcode.c        |  2 +-
 drivers/gpu/drm/xe/xe_vsec.c         | 59 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h         |  1 +
 7 files changed, 68 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 2f6658395587..fb5b5a8648ba 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -10,7 +10,7 @@
 #define BMG_PMT_BASE_OFFSET		0xDB000
 #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
 
-#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
+#define BMG_PUNIT_TELEMETRY_GUID	XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
 #define BMG_ENERGY_STATUS_PMT_OFFSET	(0x30)
 #define	ENERGY_PKG			REG_GENMASK64(31, 0)
 #define	ENERGY_CARD			REG_GENMASK64(63, 32)
@@ -24,6 +24,8 @@
 /* for CRI discovery and telemetry are in an indexed window */
 #define CRI_PMT_OFFSET			(SOC_BASE + XE_PMT_BASE_OFFSET)
 
+#define CRI_PUNIT_TELEMETRY_GUID	XE_REG(CRI_PMT_OFFSET + 0x4)
+
 #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
 #define BMG_G2_RESIDENCY_OFFSET		(0x530)
 #define BMG_G6_RESIDENCY_OFFSET		(0x538)
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 1a74a7106462..342182d5ecda 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -156,7 +156,7 @@ static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 	int ret;
 
 	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+				xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
 				&residency, offset, sizeof(residency));
 	if (ret != sizeof(residency)) {
 		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d1bdd3a872a8..be6feaff4baa 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -492,6 +492,8 @@ struct xe_device {
 		struct delayed_work work;
 		/** @pmt.retry_count: late-bind probe retry */
 		u32 retry_count;
+		/** @pmt.punit_guid_cache: cache of the PUNIT GUID */
+		u32 punit_guid_cache;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 9cbb65891aa4..55ff56a39599 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -605,7 +605,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 		u64 pmt_val;
 
 		ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
-					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+					xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
 					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
 		if (ret != sizeof(pmt_val)) {
 			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 266deecbb100..8c901e54f384 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -369,7 +369,7 @@ int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
 	guard(xe_pm_runtime)(xe);
 
 	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
+				xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PUNIT_TELEMETRY_GUID),
 				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
 	if (ret != sizeof(*version)) {
 		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 56aab437777a..bd96539d1bc2 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -643,6 +643,65 @@ static void cri_late_bind_probe(struct xe_device *xe)
 	intel_vsec_register(dev, info);
 }
 
+/**
+ * xe_vsec_get_guid - Get and cache the PUNIT guid value
+ * @xe: valid xe device
+ * @guid: returned guid
+ *
+ * Return:
+ * * -ENODATA device is not active
+ * * -EINVAL unsupported platform
+ * * 0 success
+ */
+int xe_vsec_get_guid(struct xe_device *xe, u32 *guid)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	int ret = 0;
+
+	xe_assert(xe, !IS_SRIOV_VF(xe));
+
+	if (!xe_pm_runtime_get_if_active(xe))
+		return -ENODATA;
+
+	mutex_lock(&xe->pmt.lock);
+
+	if (xe->pmt.punit_guid_cache) {
+		*guid = xe->pmt.punit_guid_cache;
+		goto unlock;
+	}
+
+	switch (xe->info.platform) {
+	case XE_BATTLEMAGE:
+		*guid = xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
+		break;
+
+	case XE_CRESCENTISLAND:
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		*guid = xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
+		break;
+
+	default:
+		*guid = 0;
+		drm_err(&xe->drm, "Unsupported platform: %u\n", xe->info.platform);
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	/* the GUID is static, read once and cache for all requests */
+	if (*guid) {
+		xe->pmt.punit_guid_cache = *guid;
+	} else {
+		drm_err(&xe->drm, "Invalid GUID: 0x%x\n", *guid);
+		ret = -EINVAL;
+	}
+
+unlock:
+	mutex_unlock(&xe->pmt.lock);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
 /**
  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
  * interface
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index e925dba4158b..88e6f6a9e4dd 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -11,6 +11,7 @@ struct xe_device;
 
 void xe_vsec_init(struct xe_device *xe);
 void xe_vsec_remove(struct xe_device *xe);
+int xe_vsec_get_guid(struct xe_device *xe, u32 *guid);
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
 
 #endif
-- 
2.43.0

