Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E34A59B689
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 20:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157544; cv=none; b=XkwyU3n84lTok9nnAtHnh6ArlvOruo/AAcDODiTI5Hef9mSm5bOLUwKOuCT/xsD6AZLpyNXJDIkzplCgvwB6ifiAF98NF6mIoH1hMfz6bxp3gyeuVcIuJ1gLW/exU0paaL4VpVv+gl0Yi0x8MY9JckZE1HzkduPjV8b7zi6y7kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157544; c=relaxed/simple;
	bh=hK10ala/CIbTCQRu+zYC4dqX517GLIuekh7Mdpmw/QE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LDGigiNAuN2W51VGkKIDBc86cC3pDe0NtNNyTmxmBKjUa7LzqJX5P8o3pOnTLESjz/1gJakjxFJ9i9GwlFpOURfvaSDAvPnBlG8xe4sC1dzf1sa4ixObMurY/OSe6AnBXR1loXnnFyIr46iJaHb7XrCqF1LKIr0/YvhJR46BrcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0GaWbhi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0GaWbhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789157537; x=1820693537;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hK10ala/CIbTCQRu+zYC4dqX517GLIuekh7Mdpmw/QE=;
  b=Z0GaWbhiYCGer60jHXvq7YbK3Uquu0c2/t4F1PxnK9A54FncMckgs18l
   jmJeYZh5HKB6sWQ1nDGZhpM1+Ka5ysSN2IE/ApBi95Lua+RF+ae+jVjln
   opY1+bBQ32Cu302X1lFAt98/UvHzv15zxD8UVamcYKyXziSfLeZ3G5+od
   0ppLTyrjcliIS4b7cYeysXWhkz07rytkbb0KbjOnAVanXiPyqw2MhPZC5
   +iHpeHNH2KaGiEPQIR0fCqjLEqSKHQvjrrLbNgjtQIhBc1tLQHmkiGTYe
   KeobDOvj7MXXi26ZiHjMECyv6XQFXSN87DeXQF0CmiGYXVp9NWcab9peB
   Q==;
X-CSE-ConnectionGUID: XANZ/v8BS8OVZK+rE50zyA==
X-CSE-MsgGUID: 1cKMrX5gSguchj2YWidg6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115162405"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="115162405"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
X-CSE-ConnectionGUID: chlvRRedTsqtXnojtLdGXw==
X-CSE-MsgGUID: pN/Kr8SiTieRGcjIon1+0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="277272100"
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
Subject: [PATCH v8 11/20] drm/xe/vsec: Refactor BattleMage PMT defines
Date: Fri, 11 Sep 2026 13:11:59 -0700
Message-ID: <20260911201148.1610547-33-michael.j.ruhl@intel.com>
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

Rename generic defines to be BMG specific.
Define several magic numbers.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 3bea89f2a5c5..ca8414441a69 100644
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

