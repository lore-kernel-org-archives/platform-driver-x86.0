Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1FB51C353
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Sep 2026 18:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546317; cv=none; b=uax9udzsq3uL3jshM3u2uqLtTY0pb+DP9x2OAjpytv8W88r1wvxBYcwKnOFYs/bXVhFvPS5MCaiJwlMsewxLLwFOTJ229kfgPhxommWaszvqrZtwBNxqJWcLhX1NajLuVfmrzUZKrjln9U3lNgq88MsffBJTmIlk38HTdgZ7PbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546317; c=relaxed/simple;
	bh=GceCAcaaGJiGFn3WNl1vRm2/Wk+8/41/q/onpNyS8nQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zf5NC+IXBrK9NSXEwFzN1qShkeDjpLbVZlBeYUY+Ey61R+h6BuoC9u2I+BB+bwzQ4uQW1fVpBvGqBd8nIF3hjXzo9b2kYSx0vUz3s3eL/CNDZtiDKYHlZMPg12MwqilWiQiUmIfCs8E+CC+Vw5DIy/PROuF7E5g37mCZYrk2cIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAVht/yP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAVht/yP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788546316; x=1820082316;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GceCAcaaGJiGFn3WNl1vRm2/Wk+8/41/q/onpNyS8nQ=;
  b=bAVht/yPP11X827GC1lyWrsN4KyjYXsKTezeKec2cX+gdjayJmk5lAtH
   Ukj4wuH9NrvrDsuRN0sv+aXZM37gyJx6ZGBvmO9FTIsK4vfhLDq53uUck
   zXIC5Zho1T91w2SFV7IpD/h1DJPYzoPfJJeHoXJkw67OaOdUv9ZBWxHDL
   s4AbYAUGuljBPCW1oPiGp8RHZudbAeS1g8h1zShY+A++iBSUdv91S2wT2
   u83rHXwqgCiSxAG6x0p8qW/dcZIL+k8VqW5K18SX57Z2xXYGK59XqLnCA
   UzhzKsK7igJ8eDrob9IyDB4ep4jMO6NCqUOiWEY4x0pCpkbEyHg4RqHrP
   g==;
X-CSE-ConnectionGUID: UlsvYuLpSJSa++b/HDD0sA==
X-CSE-MsgGUID: vplmyLGVRF23GNQ/zTNGpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88932277"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88932277"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:25:15 -0700
X-CSE-ConnectionGUID: 9U5rsX1ZRwCP4GpFRNiO7A==
X-CSE-MsgGUID: Ace2IuMiS4CQV5viVppxig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="294992513"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:25:14 -0700
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
Subject: [PATCH v6 18/18] drm/xe/vsec: Refactor platform check
Date: Fri,  4 Sep 2026 11:25:08 -0700
Message-ID: <20260904182451.1164868-38-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For debugfs, residencies and pcode_info are available on the BMG and
CRI (!SRIOV_VF) platforms.

Refactor to have one code path for adding the debugfs entries.

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index c56f0e4a9b90..d90fa2dc6231 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -761,23 +761,22 @@ void xe_debugfs_register(struct xe_device *xe)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
-	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
-		drm_debugfs_create_files(debugfs_residencies,
-					 ARRAY_SIZE(debugfs_residencies),
-					 root, minor);
-	}
-
 	/*
-	 * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
-	 * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
-	 * PUNIT_VERSION_OFFSET.
+	 * Residencies and Pcode version read from PMT is currently only supported on CRI and BMG
+	 * platforms in PF mode.  Both platforms support the necessary telemetry read mechanism
+	 * and have a fixed offsets for the required data.
 	 * Attempting this access on other platforms must be verified before enabling support.
 	 */
 	if (!IS_SRIOV_VF(xe) &&
-	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE))
+	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE)) {
+		drm_debugfs_create_files(debugfs_residencies,
+					 ARRAY_SIZE(debugfs_residencies),
+					 root, minor);
+
 		drm_debugfs_create_files(pcode_info_debugfs,
 					 ARRAY_SIZE(pcode_info_debugfs),
 					 root, minor);
+	}
 
 	debugfs_create_file("forcewake_all", 0400, root, xe,
 			    &forcewake_all_fops);
-- 
2.43.0

