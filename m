Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141186;
	b=wGVBzr5f7mz+NBRQ0eU83lG1BYl2lx1OKqFCUOeqXzKsM484lH1wrfb3O0TgWPFh1Bn0
	 v7GfDQqcsLAyzY0r5F3Vs6n5JslSOGtOKKq5sNu4sPanVEtJF9x9VZXhqJcpGP5nlKTe3
	 6GNljJOfakMTRNI6zN9DFCp5Ce/SG/5/vq2lIWc3A1CN9jP14haC9CqoNm0oXO72VeaYe
	 YKavNruplGoKpSCRovYE4WY4DoSFL8XBCRcBGRdPv+xXo4lMnzULFvOTvLRo5U3iZ61sC
	 zysqLTdYE0nanXkM1FndXwnT8vQwe3TSrcBdsYEUdUk/ZHC16RRuU+nb/qPlgqbAHQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141186;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Oevm9qfwbaHBlmfx+BrZqzf0pzNTwxsVLIlLkAPIFng=;
	b=j/V04q17QRQ4nwbYD71q1xOnlgQgXxFJsiBOlPtCDoSsAXftFxKw/lqbpwMJitqXJRut
	 jyRQBIggWbUH5w6esKepdQO/I/o/CjeBxV60FS+LNPTowyRQOodTMIaLkuQqkO6I7t9Ze
	 ylr9uKutQj4y5LbQ7L9j9Og+3AqTGFGLDMuVcC2QYWAh2poc27pyIM8M1LVV5H3fjpp8y
	 TKX4DBbHFfRWwE2LeSjddaxvDXw2aPD6BegQtNlF4GE/0DQB8CYfVeXimPwwaSK2Rhv6P
	 cX1s/oa5US4WAQ0z06fNQeiAccfO3uhRyCjF52XALgGWiIbMLqfQ3alaxaciSic/LQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PivA3sVy;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74480606A325
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74480606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PivA3sVy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141186; x=1826677186;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zh02p6rjsfyI+8Y6eiu/PeTW7l/t31NzS1aRUlZ/NO0=;
  b=PivA3sVyZx5dgLdBuRWNWTSr85H3b2MuK0KfdHQvcsQP0ygsu4CbXklJ
   oCjSKXXrTIE9e4HJXtgRzfT55C4z7H4EtRpbiJmC+MgIEjPsgqhCKNJ1P
   +GolqkPS6rbmNvA/UgOctQRbuIFghTqiYVRgP8fnXqoYiZdAFfpRDXH71
   ibV5uZDDagwQ3m8GAIgHQYt5D89a3pFexKqAgLcoEhypivmFmu5fPQfLR
   qWCI7o6qjEz/Igra5pNtDuACcSWOKOanrcyAwHztjg+PwmVbTfBP9vM9r
   HeIRcynuu+9Ly1qRq2R9ree1TFLPNtl3SXCTi95Jl0XsiLUsL7YrN424j
   A==;
X-CSE-ConnectionGUID: S0t6+K6pTuC6taFHc34kCg==
X-CSE-MsgGUID: Qj2ti6xCSN+4iGxiXCx5nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898443"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898443"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:45 -0800
X-CSE-ConnectionGUID: 9M3Kg+aBQ4WJE+DouFzEXA==
X-CSE-MsgGUID: uEaa1D1dRr6ln5+TAIaH3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487129"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:45 -0800
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
Subject: [PATCH v20 11/19] drm/xe/vsec: Add base_offset to allow for more flexibilty
Date: Thu, 19 Nov 2026 18:19:41 -0800
Message-ID: <20261120021929.473553-32-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120021929.473553-21-michael.j.ruhl@intel.com>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
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
index 668f76e3f6c4..bd272891caeb 100644
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
@@ -194,6 +195,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		return count;
 	}
 
+	if (!xe->pmt.base_offset) {
+		ret = -EAGAIN;
+		goto dev_exit;
+	}
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		goto dev_exit;
@@ -271,6 +277,7 @@ void xe_vsec_init(struct xe_device *xe)
 
 	switch (platform) {
 	case XE_VSEC_BMG:
+		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

