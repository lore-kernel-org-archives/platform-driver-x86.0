Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486087;
	b=ZyJA3yZVUICkfQTqhGs1VQVDKASA/OXHu20nX1vwdVLNrgA2xItnxgSc5l5/NrnjEP7d
	 WtJr3ozQ53u0HLtSIdYTWhGTbrRY0ARdLBRjQiV5u/HqWs6VMSgHApbeN/DpxzdZVvjGX
	 JydzHA0ASdrBDWIIhPS9QLzSLp0M9oU7y81Ys37AwkUrux40SeUSbUGlQuqmGC94xHFMC
	 heBoKZ8RGfoF79gMtP68EPtUFLeoUdgpxEKRzFngK4jr66IFqzoZ6WaIC+4Az2XkXurI/
	 JMsUt4Limtagq5IUR4eeM5HLs8GY8s/TfcyrZquyE6Za93KBDXZzl4g6uTL7OuHQAkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486087;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dX3MnVsEoRQY7MTMEerrBydFvE7qWK6YdREd5Ee23RM=;
	b=y21JtYRVJJdrlpZQbWClX1xYTNe+Epl2Q83qS8+lIHT+FJSxMXaoVIbuOxNg1DJ++Enx
	 bPg99/DdqvDtLxdpURCvSNM9Isqwh0tx1srVJ7cy/zxGU6fykf2YOyDktvZRLsZp3lukT
	 bqfgwX7Qkkq8A4LvikXmMxyT0jWY1zpPXs+cElRZBjhtp+7vcSN65P1peax6u9kSk+nEJ
	 um/MsbgGdAAi/Px5wv77k6Dhx5SLrJbRbAU4vAoDNndJ7a2MN9Lm+TeE+FwkPeUrFnMF+
	 fA79xYjEjWm/ACrbc0ouxigDEP++axp8i9kY3xq3Ile+PqU1hqtz7+Gu5ZnoSAy1gaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ex3PIW8I;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8326606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8326606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ex3PIW8I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486087; x=1827022087;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TyJ53LuPqkQPnbRdszEy2APb37wg4scl1rSpniqjTrM=;
  b=ex3PIW8IlYpgWoe/UHOsVMwJeU2+85BD+Ffs+coHp5Z3vIkZDxFYBt7V
   CMPJQqBpDOiVaLNgKrffufeQdXQbAfSj2Ulo/RaYpP8i68LK+V31Leqxl
   WePpOcA4Bw43ys/ZkaBWFsi73hnNJOba1Pb4HRgn2ZB7cPNAvAAYnJh40
   Hpqb4FpFGKPWZz4KlRwdU6s756Itnf4zkaZypX+84PVUsjhkVeNJSnUVR
   P0lRXJNFndVP+K4t7vROHDBBlStOzFSZSbCQd/xboU16SubPy6FgctJgw
   8BSQ7jKQsOztL9WAYTbUcWKkhfmNK0d/qatKXRwO0NfvCpikJYCSO/kXZ
   w==;
X-CSE-ConnectionGUID: tzFA8NgeR+aoQtRbSN6LeA==
X-CSE-MsgGUID: oQwnb1CMTR63XIvD332nMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153525"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4153525"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:03 -0800
X-CSE-ConnectionGUID: wMsvFQykTFOCXRm0UCOMmQ==
X-CSE-MsgGUID: 8LIV5sjXQpipglC/UQU8pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11621429"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:01 -0800
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
Subject: [PATCH v23 09/19] drm/xe/vsec: Refactor BattleMage PMT defines
Date: Mon, 23 Nov 2026 18:08:01 -0800
Message-ID: <20261124020752.30551-30-michael.j.ruhl@intel.com>
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

Rename generic defines to be BMG specific.
Define several magic numbers.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index c0e06b2aeca6..ebe56c85bc05 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -90,10 +90,15 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 #define GUID_CAP_TYPE		GENMASK(29, 28)
 #define GUID_RECORD_ID		GENMASK(31, 30)
 
-#define PUNIT_TELEMETRY_OFFSET		0x0200
-#define PUNIT_WATCHER_OFFSET		0x14A0
-#define OOBMSM_0_WATCHER_OFFSET		0x18D8
-#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
+#define BMG_IDX_TELEM_PUNIT		0x00
+#define BMG_IDX_TELEM_OOBMSM		0x01
+#define BMG_IDX_CRASHLOG_PUNIT		0x02
+#define BMG_IDX_CRASHLOG_OOBMSM		0x04
+
+#define BMG_PUNIT_TELEMETRY_OFFSET	0x0200
+#define BMG_PUNIT_WATCHER_OFFSET	0x14A0
+#define BMG_OOBMSM_0_WATCHER_OFFSET	0x18D8
+#define BMG_OOBMSM_1_TELEMETRY_OFFSET	0x1000
 
 enum record_id {
 	PUNIT,
@@ -122,29 +127,29 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	*offset = 0;
 
 	if (cap_type == CRASHLOG) {
-		*index = record_id == PUNIT ? 2 : 4;
+		*index = record_id == PUNIT ? BMG_IDX_CRASHLOG_PUNIT : BMG_IDX_CRASHLOG_OOBMSM;
 		return 0;
 	}
 
 	switch (record_id) {
 	case PUNIT:
-		*index = 0;
+		*index = BMG_IDX_TELEM_PUNIT;
 		if (cap_type == TELEMETRY)
-			*offset = PUNIT_TELEMETRY_OFFSET;
+			*offset = BMG_PUNIT_TELEMETRY_OFFSET;
 		else
-			*offset = PUNIT_WATCHER_OFFSET;
+			*offset = BMG_PUNIT_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_0:
-		*index = 1;
+		*index = BMG_IDX_TELEM_OOBMSM;
 		if (cap_type == WATCHER)
-			*offset = OOBMSM_0_WATCHER_OFFSET;
+			*offset = BMG_OOBMSM_0_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_1:
-		*index = 1;
+		*index = BMG_IDX_TELEM_OOBMSM;
 		if (cap_type == TELEMETRY)
-			*offset = OOBMSM_1_TELEMETRY_OFFSET;
+			*offset = BMG_OOBMSM_1_TELEMETRY_OFFSET;
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

