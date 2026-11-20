Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141186;
	b=JxxdUYPB2+kqwIb7lR1bAadt6oMxaqrIRe9uQ27pEDn+qasRl/PQuUd3TjxvZobhfqS9
	 s5OX5Y+7ITrlsTvcyRCKFobWuFdCG+R3jHu67ZIrv2CMqAKlwl5mRKFKO4IRCSoojneHG
	 70eqrdm3hIQDN06MH0BkKLn/M656FwG0y8Mby4K4NNg8hhjGQvEgIMrgb8hLi3pBcTq6T
	 IoaQ2AyWfx/KenjlEbUdOmDieigNSruROXRnKOkT5oB/9oLjDZ+cCaXDmBZ0xNXdtdmIW
	 VUBHtVDrMnVpqXpVtPR5DHb3QiSv71lEWygOWh1gqcUG8TrV1j6+Tk+C3SDleKSgYSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141186;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0ZmZeGekadRgt5R2fWbT6co+UGuCJri2tVfQdcvEyHI=;
	b=pB8Ywbtrh3bZnZnyqJ0qJUQPjvRw5CQFFs9j35GKODR7FIAX11PVqv6RkNv8e6zPMtGv
	 t8DTVvZC74ZoILzPX+9cWTE9yFs7Rcf5oxIUGrIDgBSTOGXxshtnewTovc6nPyZ/IZFmJ
	 dAk4eeCElDJR/T/RmBPY0+KlN8OxdmRbZOGqCWkg6VPfldwQB8540K7zJ6xUCICp/ebDB
	 4qvXFwnGmn9TTo2hJpjQSJUzvswpTj0CFUwFtQGuxOuYZSepm/uD2R0uHKHI/n1rR231+
	 bVx83hAnWtECVLieuFH22HvaaAhMGzRv4ldjI+tWHwbVO7pEmR1B+zrlJrA08uoXkBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="OS4m8Gf/";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00042606A332
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00042606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OS4m8Gf/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141186; x=1826677186;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Uaco30gcp0GNNpP7d/MBW+dVjbt1tWfO/kzeIV1MUvY=;
  b=OS4m8Gf/gvDFnD1x32lr6d21s62it9IQn1p9TLeUd6wK1fSJ1q2uJiHy
   9ILhFCTlIdB2qzhC7hvXN+XQ0f6wV8/0VuAqT1uydHo1J1uTQ0d9b7dtF
   kkTlZ+kJaNUNqQ+0yPg2p1jYwci1nVFo01FRnrP11UzYr3qVeB/X95wYE
   nWVnaba4ik4uSKVU1z6KvmZ0Q5GdjbogfdpohHg98OpFfmNGYQUQ5ylMs
   mpQXm8mRcy4ivpzR4w9ILgS6aywqObbvzNvWkKo+7CFdCpWMa70K57PaB
   Bkajl4shu6F5hifeeXRWDJClEzRT0A67SVeBYqfcd09xgaZ/1JQMlZA/g
   g==;
X-CSE-ConnectionGUID: 3lWF6qPEQx6ykV0uizevxA==
X-CSE-MsgGUID: fApFiqG1R0SZQFeA3HLZkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898430"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898430"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:45 -0800
X-CSE-ConnectionGUID: K9BiR5fhRIqM0iCk2w9xmw==
X-CSE-MsgGUID: jHLe0QU9Rhm/mJ0HWJodkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487122"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:44 -0800
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
Subject: [PATCH v20 09/19] drm/xe/vsec: Refactor BattleMage PMT defines
Date: Thu, 19 Nov 2026 18:19:39 -0800
Message-ID: <20261120021929.473553-30-michael.j.ruhl@intel.com>
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

Rename generic defines to be BMG specific.
Define several magic numbers.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 6a28e58959be..668f76e3f6c4 100644
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

