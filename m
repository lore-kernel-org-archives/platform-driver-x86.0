Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8756257ED88
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968893; cv=none; b=rhlUSgmf1VIWqGrB3dxbPKFfhj/08Sn21fjckv5li8TcNXn9s5OWNYogMEiFB6ACpEunoQSESCjm18UqKP9DAndCq9w4qV43m8AMUPw7jZmG4KTF10g3KxoBDmcI+7lkY+zv9hp8PEjGQaW0Dwp8dXTC0GCF3GQbS9Ql+iDPZcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968893; c=relaxed/simple;
	bh=W/xQHZJIzB+cFBbgFF0gpUdYzff/tHO2v19/mB1Qblg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GY77uraTxcFS0Sbu/TDYUwq7OPv2ngZzrKoZe06G+fyGE6MaCO4dyUjYVWLjrCHXDZ8XWyrLB85tpi5XJhM9PNC91LIU1TqrbL06/tjG2nUn7fTHQrAdfuWoGkAeVr5x+mS0Pweo2uSOTyDuhcpT1Kl/wXou0cU5BT1LOEBTHVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YId0Ka86; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YId0Ka86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788968892; x=1820504892;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=W/xQHZJIzB+cFBbgFF0gpUdYzff/tHO2v19/mB1Qblg=;
  b=YId0Ka86c4uU3BcXWM7yEhGhTevagFxie6+c/Zv3wAj89u7qBC9ua6nc
   l0L/heGNJgz/e+IcYrPvMV8IZo6ByOKCr4U4XEgomUW1Uve6pbSFZwT+N
   XDYc9401d+tkDq9X6Py0QnvBthtZupJpSVLtnc+QLDINpF5JZg9mSq3Fb
   8tLbYg8lcpJpd7zVAy7k2QsAaN0W7c7OgEv69YRg5p23ZBexeVytrkghk
   MTydZR1QMVDFLti//tiqtGhcQqDdSQpuQSK11xYSjrqgJnZvRZlvDBgue
   Zuk2V9B4SASletTLxXaddHEBck4nOpZjBrYv78mYAzB//NAlOPwYeyRfq
   Q==;
X-CSE-ConnectionGUID: ScRgG4FFTRe5I/husW5lvQ==
X-CSE-MsgGUID: TEHw4t/HSOCmLhySNpUYuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93091887"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="93091887"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:59 -0700
X-CSE-ConnectionGUID: QZQpHQHAQ52BuvXNjmqfTQ==
X-CSE-MsgGUID: P8RqG/15RZKgQejjwwfgQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="268102550"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:57 -0700
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
Subject: [PATCH v7 20/20] drm/xe/vsec: Refactor platform check
Date: Wed,  9 Sep 2026 08:47:59 -0700
Message-ID: <20260909154739.1515514-42-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
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
index 53ff542806f9..ec8c8dafe78b 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -762,23 +762,22 @@ void xe_debugfs_register(struct xe_device *xe)
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

