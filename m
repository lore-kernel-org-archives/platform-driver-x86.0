Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486087;
	b=cMWvYIgkneuLfK2DXPfFa+M0mHkdSuiBIFrAEAWa1hZBzdi2s2SagbUfVbF3TvZlO4NW
	 Y9thoUm6donTUB7xRA2hhR4CVqQe3Dpl9Bf7mBRxIqvnGk46QGwTDzN4la3lsjEIRHkUr
	 /hbnNHYDNM1aFjuVRs5DruorEXefbjw57bmbXbLY5KwDBgaDYMTdqDlRu7m9JgS4DUqAS
	 VMnXunNubpqotN3HSqsRLmruR8yMAKUa4lTD9BnSAhxE6AzAzp7MtuCCWTTOL6kpNUNjY
	 1mEifMI/mbzUbl8WB1o7aGlZPQIXNuzFF/mAscsqagD8mo5mq6YkbuumKe4qxOmsbXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486087;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L2Ik0Ny5XHs7QaR2GGO+Hd9Fbby9S3G/BaIlRBJlhaE=;
	b=F3kUTZRIsb0WkQO8/YtZjs0hi68YoLoZbe7F16MJyi3E6G1J2WTDYao1ftgVLlISOh6Z
	 cBXR0mTiJYK1GAMarADH3p8qedQJdcBZ1//jMrVazno/xQ46x4o1dTx5WYEPdfNHEFYJH
	 W2Uwnlc7AcCZ5MD2heMPtig+qHmMR/qcZXB8InG6+oE3gZLQsuwC3qyRLpYj8ODFNURFY
	 JYuOMMkXywuIO1dUazJVjt6qhS/Q6f3u26AAt/htV7CNl/VIcO1IvQr1X7n7BK+Ld7asQ
	 wnXKdF+QBusH0upZYRSRzIQsqZ0VbLSiA/Mso3+8B4aPZ+GxWD+SFWQsN8l1uWAtgLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QSDCBNiP;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FD9606A322
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9FD9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QSDCBNiP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486087; x=1827022087;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sNBZBhODUIN+kKI9C5cmSmwZHsUjWRmkortTjnqPaoo=;
  b=QSDCBNiPVqTZX9TmXrQl/e8w9aTmrZqVGn0gT082nLty14ZDRIJ0Miz1
   mJeocag8Jgx+Unh/Pyq7QTRQ0zI7yprUjQZXvaCh9prkcm+j09ZgtbhzR
   Ioh6aQXijftGCcY5A60rO4EpQtUS3PAs/bDHus+Hh+w1DPPATLKPSkLAa
   pzF/FiqM2Zi2Zxwg6hP+qOIjddYySEN9xSW+TgsPIagyQNJ2EXQzKg0yq
   MmsbqukoTNZT3qcxz7ztyZCK5BQerXA0zvI5BNKby92EFBWePkNFB/ewO
   TITH06lxCiHyKnOQ4sHh2xibvshMtrVmOBtATMe9WjsaXJO58tayMOxc6
   w==;
X-CSE-ConnectionGUID: Vp7xMfxTRGaoKyDjUUfkZw==
X-CSE-MsgGUID: 87gkrpbYSTuZpfXMNchlFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153535"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4153535"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:03 -0800
X-CSE-ConnectionGUID: rbqdeCMHSBiQAQ/jmaeR6w==
X-CSE-MsgGUID: roH1hGYRRWeGwUz7lDf+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11621436"
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
Subject: [PATCH v23 11/19] drm/xe/vsec: Add base_offset to allow for more flexibilty
Date: Mon, 23 Nov 2026 18:08:03 -0800
Message-ID: <20261124020752.30551-32-michael.j.ruhl@intel.com>
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

