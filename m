Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103697;
	b=Te5B+Uc9MbQOp56gjsVu7w64qJ/R/NDkeugp+7YWsdWO02MIaaf3YUT0iEO2vG+xhes1
	 SX0YrI/5MFuD9+cHivXEfO4cViXswggv39FrLnlIkcecDya5Bs3XqGUjG6nNxYO+veK9Y
	 hR19GIR8ctP9kFvPzxtCogqGxsWpYaFoJteGszXJHtBi0On3IRQtdN320qoaEtkLPrZ5a
	 VfguHimffwr5ucT16JgVl0Wr+SLReIt1Wz+YCLm06NA9xXvhPGrxzVv9lN3Y7RY/ZBeqB
	 SMVXZp7aoaHS7ok8B1lZqAts1oz8HiT0Ay9fDU6jngnSxP4niAsFJH6zH71D6ksmz1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103697;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dX3MnVsEoRQY7MTMEerrBydFvE7qWK6YdREd5Ee23RM=;
	b=CK7cHTgBPFMOO6pHgw4B8ny8HPSfVRkVrI0OCwjuVAsdrvvaxaUNdzjsetm1kKbE6Bsy
	 S8VE2T85X+XtrOt47/rLf/ssxfe9/1rAGPRKNgy6PILFCBP8xCH43CVfVTeYfUKd5UEzU
	 IZrGQzW3enrpcbPezSlAgLWyCrYRAhkMs0MXZajZwrig1PHJunbYcyVYi2ZW7zkYMApia
	 UFnEkDP/fweW0qa7wxHQ6ZGF4+LQKBQfTbecJkWHREvr06BFeEt2GeqigFUSckiFizaiI
	 HwZnBHbuLRdxXsUK3+hAbfmJmT632Tyxswqi/RS8jHMmL+hhsAhZbOQAL/W9FIx4iDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bvOi3vJe;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2897B606A333
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2897B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bvOi3vJe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103698; x=1826639698;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TyJ53LuPqkQPnbRdszEy2APb37wg4scl1rSpniqjTrM=;
  b=bvOi3vJeGMn1EOYgiiLyjVMDb7Vrb5b1frTs+BJjvrXXyhbujeJU/FUV
   rBhBl0U8uny21vOTV+X3CsfUnF2/OH4euVuUdcHgCMWh97tKcQO/Qyz6d
   OQAobLydCr6lHZj3xIDeF6JSVxX+tZpnhZrfEI4+wFeLGi4Nd5qzJvRtl
   21pYfgXM0kylyS0JgUSDzsl6N9Q0PjxN5gpM9d7IlwWPLUamHcyBlDxDW
   8tljJOkwQ9Trh9tpXVECKf3k9V25A2l9ha1/REEkO0Y33rJLXXw8NrFH+
   ZR6MyYyzxHNxVwdhUst1BFcVQ+Y2cd1rv6/+ZiQ02fVv8i7MxrA4gk3IT
   Q==;
X-CSE-ConnectionGUID: C5Bm24GGR9uG9vKW68LATA==
X-CSE-MsgGUID: j7JkuRi7RaGyeWmhXma4bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3848991"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3848991"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:53 -0800
X-CSE-ConnectionGUID: uI68xaaiTki54skzv77Ruw==
X-CSE-MsgGUID: gy67QuFpTIqrJj2Ik87oBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263410"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:52 -0800
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
Subject: [PATCH v19 09/19] drm/xe/vsec: Refactor BattleMage PMT defines
Date: Thu, 19 Nov 2026 07:54:47 -0800
Message-ID: <20261119155438.40762-30-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119155438.40762-21-michael.j.ruhl@intel.com>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
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

