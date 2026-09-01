Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86664A013B
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 19:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290893; cv=none; b=gib659Ddg7Kr8dzrlpxlyVXAWjWSoKL55+RCE0zAv6wBR2lEmDKxzClFoP1P6vUHD/k4/gNzysRhhmRuJ9KtkTagy4s19rsuLv26crKv4aZdjF1zmDna2sNOtCrV3Z19z9GmGZeh5vAVLS5VR42KmgbWe98mgXYY1PpFYUR78Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290893; c=relaxed/simple;
	bh=+rG5+CY+hIaN0fDsm9cCb+wn5auqDhD333yylY7oIy4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ugpu2Q1MkIDQzjYXXHekPuAOj9GhXpRN9latgDR4IWxxz5oncHviZQvQojoN9HwGSGe0Sga3/msxSlUbQbZ/2z0G1NX8jCHZg27cmRI/pfwdi/r+C97rcHHWjOv0/UeRPZG/h9xtIrzPExDA6N6ML45W/vJBDUpkvIHFIxsHCR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/DMZX6i; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/DMZX6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788290893; x=1819826893;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+rG5+CY+hIaN0fDsm9cCb+wn5auqDhD333yylY7oIy4=;
  b=G/DMZX6ih3p9DsnxNpfW6hRGOHNzEhdXFMt83hK8/VyQZ6dt/hOlYRqk
   hgqbGNXuaEt9QC8Q5TQ5Yr042Xj9nZhrqBSBH0A0TvphechDJM/j1Q4JO
   2vmFymL3ksx8y0j8joDCrGla68o39yx4oSpBj/VlpmsR6PKkannb8JEWk
   vqruVzWsuW8zOG2OwngFrnBFPZSL4vKAUCzgPO1J8b+T/3s/4Il8Mc5/E
   JFfMpN0y5p41miCIqy/mapKSxB/QD/Cy5DbvVhHtup+fHJk+sr9j5KzBl
   Tpg51Et/PjPsHD2d5oOhfFuJXcHbSvSMLjlEuByRbg8NcyzH7Vk0x6vS2
   A==;
X-CSE-ConnectionGUID: OVdvKuLkQqW4UeGd23hGXA==
X-CSE-MsgGUID: AIAlRQ7fSHGvUcfwOV+ocw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762565"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88762565"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:28:11 -0700
X-CSE-ConnectionGUID: USX9kc+pQsenytlj1naTvg==
X-CSE-MsgGUID: aDWf8cXQS/WWBkvllL/ykA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="269776844"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:28:11 -0700
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
Subject: [PATCH v4 18/18] drm/xe/vsec: Refactor platform check
Date: Tue,  1 Sep 2026 12:27:53 -0700
Message-ID: <20260901192736.626777-38-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192736.626777-20-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For debugfs, residencies and pcode_info are available on
the BMG and CRI (!SRIOV_VF) platforms.

Refactor to have one code path for adding the debugfs
entries.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index f17b993755f3..9e32a5e230b9 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -712,23 +712,22 @@ void xe_debugfs_register(struct xe_device *xe)
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

