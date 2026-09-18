Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0904F3ED5
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 13:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737501; cv=none; b=ADfpadt/JOKh4Je7VPcYEqROwSnVslJC1JWu5XjUW13eOBMj64EkptzI7NkDQaa6UaS+GKP4fVvaVX1OwcACrWYhIbOboYdaR4xok25wsLm8/8cc+XmvtzgsgQzKEZvahnuccxM5ohF1SLdTUyOImij2Um4MMg8s1nso+7eSFb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737501; c=relaxed/simple;
	bh=0YZzYzqaWx1ReYnsQlleGo0WVvPODgzV5HhupFiWyZc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fw498S9m0D+a87zn20MujVqIFRO8z/Zxo12jMO/NsjLVauyx/vKnf7TVtr5KxSJFchq2Zml1k+p5Ie20jLoJy9MoNClYoc7x63IYHXIHRSy1GkjHtLi9ekEhB0uceNUdkBauXo82QgBdFmiFcrvsHQQj8gR8U7B2z4L4JSGjChc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWYaHjHb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWYaHjHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789737497; x=1821273497;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0YZzYzqaWx1ReYnsQlleGo0WVvPODgzV5HhupFiWyZc=;
  b=AWYaHjHbfyEYg+Fj5seSCgOi6lQmIBT+QE1aabx+W8YXEDImuy5wHnNe
   izTdeDhA70y1o6Fr/EXH3AJCZKSbP4JxE8pNgjlivctZS+hJzfH3gXlpD
   WszSVxtTXmZyCS8j7lc9Kg2HltGX+rS5IOUbKZ3GSpySJSXmLVBMjeqVT
   THo8GiL3uIys9FGrk4zyzSuHMtJC8CdNbmfKBis8d+D9I/6JiBFGwm2QF
   IE1UJIk7GHjLML30gXU9RSGHesY8Oy2RfhHn15iUkv1jmZx29kZWk9IPH
   6UwbaARVaH+mCKuqp7fRSnezXf/bbf929zxispiyeXp1RMTSP5+EDmLY+
   g==;
X-CSE-ConnectionGUID: VQEq6kZES9e1g8RwsfeMFA==
X-CSE-MsgGUID: CQF2MrSCTyqWEXOVjd9BgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89378252"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="89378252"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:18:03 -0700
X-CSE-ConnectionGUID: DqgMT6bhSvWinHmZrb6fmw==
X-CSE-MsgGUID: DogEB49RS3SPMGCrr4emTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270095338"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:18:02 -0700
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
Subject: [PATCH v10 11/20] drm/xe/vsec: Refactor BattleMage PMT defines
Date: Fri, 18 Sep 2026 06:18:02 -0700
Message-ID: <20260918131751.2408883-33-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
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
index ea60e2f3e917..1e1428313bd8 100644
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

