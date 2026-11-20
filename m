Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141188;
	b=aYnGyV2YDYbMWXIzrKlWdC1UrOKOIh7bmW+fwaW29cPqaqP/apGxDiE5B1rPFBZTHmzz
	 WPWulhye1yiF7s5epWeAxhFCJN5ZgRvCAw4NmykeeV+BFE2Xf9e8C0ZZlYhd6YQcrPgN6
	 ixWNlgIa2YgaeRziP3GbXH8/vipZewat4ngapVj8S9CVyVrYuibUtn34qTCsiqaiWNHz6
	 VySoRy+IIOFU28/6GA0OImg9gpYIggKBsYyfpoQOoXGSjJcx4TLcQtT/JXLGWCk3exNX1
	 aNCCs1zJR+xTisQRagzyKI3qKGIOSed8a3Xn/46eUkKZPpUsjqwpN9kIVhgrPJKUlQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141188;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RfY2qagWNg43LYzybryauizKXVh2curKFP/pO+9cW9Y=;
	b=uMbiuij43AxIl41OxpUlHZiUyooDX5vV0S+p+Nplgag4vuv0+OeLF9tU7I6jiL8w490Q
	 DVf7pkmdaF5aw8/SoIxmVyc3Z8OP800gsNiMBQ1I3URpzJ3c3wlEC9nb2E4xOv/bnJ+g+
	 RaHo2MRno5lke2vcpjIyQa93mjyILKTC7fdBWhPsDE4BXHmyC06qc9h1re5YTFItmOg4/
	 vc/4pF1WP3v5UPkfh1o2SE9H+uIkm1jo68YiN3Kj/Z649AJjCVtcvji07UvYm/861J+yb
	 WDqQE2x9vgN940kJVSJZV39MIsnnOlfvFim5lkiTlqB7xUpRjEn01kSe2/HBX5W+0qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lj4BoT9Q;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7B2606A333
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE7B2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lj4BoT9Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141188; x=1826677188;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iKXK6fOE15BpQx8kKMFE4QRjfuWkOWJlUIRKShaIovo=;
  b=Lj4BoT9QlxE0qe905v+2SWEkqjWR/JHtU9a9YIbfHxfqQwmnDyEx+JdK
   AwaIOtsfIcr4Txr0pBD0yYOGTUd8K1OWDOMLlc3LVX5/uy39+vfR+YAKc
   qe2Y1rlpAw4VPiQEa7nXuyZzJ8YBGIjSUoU7VTAyT9xIl5iTcs0uRMXZE
   pf5t8aiKEw9hUgS/92ZXyophTwKGAvK+/gzCIF0sH4XxXgowwkNBtygTO
   ZVatzKlrk7Zf9qZcDDIU0C6cGMfSHY8SrkCHnpwApU8OoyDmiJzEEhsgl
   VvgoafZKdQMUc+DF/Jh2ElFH/k4LlQUuuDfDOEJSgyex7pPRwU/ny/lF3
   Q==;
X-CSE-ConnectionGUID: v4eeIfklSpONBinjYnj7rA==
X-CSE-MsgGUID: v8G9LkYsTHWlnMpUtYkKdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898479"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898479"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:47 -0800
X-CSE-ConnectionGUID: vhYG7WNPT86iaqSY211OXA==
X-CSE-MsgGUID: E5eRLLqxTReXAntZR4mCkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487162"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:46 -0800
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
Subject: [PATCH v20 18/19] drm/xe/vsec: Refactor platform check
Date: Thu, 19 Nov 2026 18:19:48 -0800
Message-ID: <20261120021929.473553-39-michael.j.ruhl@intel.com>
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

