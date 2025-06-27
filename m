Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696952ECD17
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 20:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057020; cv=none; b=Tj3NDC065EpFbw4ziBgojFFN+k1QxCXdjr/rUKK6+oYFEeixHTZahEcB93RO8xI2RKdNoDwofiSSG0d1Y2y0EK+T1buCDPh6fjsMfd1g9bfkK94EP/BVDPi2248M0b+tT8q4DR4QAmSFsZ0uAV5VkGflzz4MPnFrdbxXkUclDTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057020; c=relaxed/simple;
	bh=E4bt8/36Du6A+i4TIkEWgeSL1+mddI4OuQIet7d/e+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mII5JE3XvZEVRqfInU8WoX2CAbPwcJDsBV34Q4+pyZ4E5O27N+ePmz0yj30q3HYohgWJl2/i121+NFI8k4aPqFVizFyOpfShb84HOFl/oFNmUPB7AaKF9Zv9H5noP11iE4JQmefdUkUIos1Nv2TlRrkbIRTi8y3xj6ZJ+kwA8kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USrdspGB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USrdspGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751057018; x=1782593018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E4bt8/36Du6A+i4TIkEWgeSL1+mddI4OuQIet7d/e+g=;
  b=USrdspGBoLyIfxS1V8EStIHPsW6aohA9Iv1EwiUTypiC8EgMD0OPPj5o
   hG9edlaNmk9nCPhh3cb/w5Ngid4zZsPArXufU89sY9jRxVnrGq85V4oI6
   NKGtYvK5uAuN764Mssu2lTai+P81MaVR8SVFUVd0qswPBUCzFKQwAiNCI
   Lzpc5Owvn+AOdpVdvVvy9CFuwqxWMNcB4V1VLudzQROIvafA1X3rVI4rh
   fczxvnL/iOYrCImwpA08GfGVaJ563cMCOMALKq5bkoEJeXrBtU1I6dA+V
   xInnepSt5aTLNecfJ2JMSfJC95oZp5FTipqyFkc8j8o7stplKfnjoV22m
   w==;
X-CSE-ConnectionGUID: BCD9gbSkRM6kGV+AcE9QZA==
X-CSE-MsgGUID: wPMG4Vg/SzqDD/M0BhyNZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="41003169"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="41003169"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:38 -0700
X-CSE-ConnectionGUID: QUYzD9RVSDKZmAvSAB2kUQ==
X-CSE-MsgGUID: tii9ttBpQlu6/KHCt6hshA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="156938985"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.252])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:37 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v5 02/12] drm/xe: Correct BMG VSEC header sizing
Date: Fri, 27 Jun 2025 16:43:11 -0400
Message-ID: <20250627204321.521628-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204321.521628-1-michael.j.ruhl@intel.com>
References: <20250627204321.521628-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intel_vsec_header information for the crashlog feature is
incorrect.

Update the VSEC header with correct sizing and count.

Since the crashlog entries are "merged" (num_entries = 2), the
separate capabilities entries must be merged as well.

Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 3e573b0b7ebd..67238fc57a4d 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -32,28 +32,18 @@ static struct intel_vsec_header bmg_telemetry = {
 	.offset = BMG_DISCOVERY_OFFSET,
 };
 
-static struct intel_vsec_header bmg_punit_crashlog = {
-	.length = 0x10,
+static struct intel_vsec_header bmg_crashlog = {
+	.length = 0x18,
 	.id = VSEC_ID_CRASHLOG,
-	.num_entries = 1,
-	.entry_size = 4,
+	.num_entries = 2,
+	.entry_size = 6,
 	.tbir = 0,
 	.offset = BMG_DISCOVERY_OFFSET + 0x60,
 };
 
-static struct intel_vsec_header bmg_oobmsm_crashlog = {
-	.length = 0x10,
-	.id = VSEC_ID_CRASHLOG,
-	.num_entries = 1,
-	.entry_size = 4,
-	.tbir = 0,
-	.offset = BMG_DISCOVERY_OFFSET + 0x78,
-};
-
 static struct intel_vsec_header *bmg_capabilities[] = {
 	&bmg_telemetry,
-	&bmg_punit_crashlog,
-	&bmg_oobmsm_crashlog,
+	&bmg_crashlog,
 	NULL
 };
 
-- 
2.49.0

