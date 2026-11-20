Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208181;
	b=1fXqLwNC1XFVXkY5WH7BdsqOuihWbcDR92t5yWJBnyLCjrido1SH9oEPGHoaXZdkD0a+
	 VLFg5ck4f6NWQUGFy1zc3IzBy5CBUJlXKJ2zD0+ZLm89BgUpIr94JczMz/qlcbHJgPqLU
	 qZd/ACTJUiVYo7cTR1Q2hV4rx6rDh6cNh85YJdGkfVBbfJARQJOp7dQZGwiKzcWs9R5vX
	 RKsAbV2e7+8b0eWoyJQ6IrBeSZvNzhiESl2/RpyIdtBlHHzcnYswszasW6KqpY+jIjElv
	 5GYLJNXvu4zZ07uxR7zP//y+BDP0Eg1E8Kjue5KEO75REaq4d2jCIoUN3/Bttd/RLTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208181;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RfY2qagWNg43LYzybryauizKXVh2curKFP/pO+9cW9Y=;
	b=DRaTwGZTV5kA7rZplE5GqXEsofV8S2ynUVR2+W2JtLhn/MpBhdN8MnyQvs6Q0sqwMFnA
	 2lfx3W7fXHaUNpuEOxaF4928R1+B7oVbbsVGHJtvJkkd3w7zDDMTGXpLPVs48dbraOJSn
	 lBA2uP/y7Hr+S1qSfThSMbxCAvHUAmcp6uZxgSyolDxoU9CUP/iNsR19oU4VL9iFY2jXU
	 eP4HBgCTFodLX0MPt7QkVKohAlEPfjhikfz1eztCzaQkLOCpRY1OmV8qQAU4gILbF1r4+
	 4nk7FS0ldxYMDiBJ8vd/8Bq581CU0iXFqR8UlvFNZHeMUIS0zIYS7XIknyprM1kP57g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FWlzSzQR;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D4B606A6AC
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D4B606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FWlzSzQR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208180; x=1826744180;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iKXK6fOE15BpQx8kKMFE4QRjfuWkOWJlUIRKShaIovo=;
  b=FWlzSzQRevtoN5taUy9/IFz0DFm4BSLwyw4PlRbuUB35uQd3YbP7wUrG
   M8LuJG1vWCJn6KsCkrRYivdyy7eOf8/3aivLWCDTiRGKpmCih23IXSp5I
   FhedD+5xz8tiuuRyMml0Rei/ghub5lCFXMCtnGKIQhzkT6reXCRosYrDK
   Z8aSjIjiFN1Sk+Saq5OOIRXStK0MAzXlebRecpav/oRs51bIECTRkDysC
   pZUCEmmZmj8aobNTes7VuFszeii7qP5gu+5pyk4mVV5+5fWGDf/K/kp86
   wneOC5/ZJZtfh+6ob1JJ5kp6zxH1RFAYJ47oxgm6oYBsomRWko8O/+7q3
   w==;
X-CSE-ConnectionGUID: IKSr2bLiSMOeXMPaVv9htw==
X-CSE-MsgGUID: SlzmbftpTlqBKPAGSqB8Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136431"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136431"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:51 -0800
X-CSE-ConnectionGUID: m3zFYHZXRaGVLMv/4AnooA==
X-CSE-MsgGUID: OUHJ19iOR+24u2Axx20Pyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10908742"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:49 -0800
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
Subject: [PATCH v21 18/19] drm/xe/vsec: Refactor platform check
Date: Fri, 20 Nov 2026 12:55:58 -0800
Message-ID: <20261120205540.1220643-39-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
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

For debugfs, residencies and pcode_info are available on the BMG and
CRI (!SRIOV_VF) platforms.

Refactor to have one code path for adding the debugfs entries.

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 578ee973d159..bc62d1054d29 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -704,23 +704,22 @@ void xe_debugfs_register(struct xe_device *xe)
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

