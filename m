Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A474756B1
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 18:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187109; cv=none; b=Ivsz4dqPO2VFEUb/DjnnCibtgrR9AZtK7OI+PkQ7T7s/5ZDrMCj3ZJiX7HISlF+xiNi3a48yvst/GsyPy+mMm1rElgCr3q1pM+enmNv2kuAR6EiTxVqe4WAFkrDFfJusxZvYzMkDxc9showZEqHJ40MDoJCMzI/jYGxBWK+MoK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187109; c=relaxed/simple;
	bh=GceCAcaaGJiGFn3WNl1vRm2/Wk+8/41/q/onpNyS8nQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YFaO/9m9M6OG2oClXPBqqDHiJ0W1I7yeTJIiNXj47C+lqFz6DC8tOK+8jMZAxZMPEhvq3UaAaNMZ8QfHcBShGtiYGj68aITUhGXjdY4/BUrAkrqw7qOuVPwS0Kk616SqkmHnn+R2IUNmwv2Ipcv6JzsoL9E0B4pp+J6wjOhip2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkYE32Zf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkYE32Zf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790187104; x=1821723104;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GceCAcaaGJiGFn3WNl1vRm2/Wk+8/41/q/onpNyS8nQ=;
  b=VkYE32ZfxrgyG1MrBEQ2wwQvPR9DhfoHSgOLZnPDq2YFVgRVIbQ0pKMR
   8qEKEFkml5TeN5z3x/gr8GSLADhhzaySW4B+P1GTalCZUNszUED00wMKM
   7tjYZ5xlCQQEsgXELAFZgK4q8iBrrVC6Ap/+tHfkKJ85hCI0cPX1Mr/eE
   nPYQQlEF0SDnn9D1v9gxTB2CGOmXJ2YbBhcFRloka5IH+wa6HlkVrr2/i
   NfD0vUwf9h5UoSNskUyQr1CRZlG+ntDttXb3ZXql/VhbK2N8JBNihlFPZ
   R+MxVrMFbypAUzW2Ew7BOJDgpzjXYU7GUzHUwM895LLNBStSeEG+C2WlA
   g==;
X-CSE-ConnectionGUID: DETh5+1hRoW39ZUZ6opmwA==
X-CSE-MsgGUID: Kv7Rju6gTfSebz34DmgxOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93416069"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="93416069"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:25 -0700
X-CSE-ConnectionGUID: B5dVZineQaungBp2vHkaiw==
X-CSE-MsgGUID: Q/ilGg4oTGqWhPUZmRKa+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4980736"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:26 -0700
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
Subject: [PATCH v11 20/20] drm/xe/vsec: Refactor platform check
Date: Wed, 23 Sep 2026 11:11:35 -0700
Message-ID: <20260923181115.2514193-42-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
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

