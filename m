Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486088;
	b=Qwszk1TDLBZSajnCVgq/MtYcshCQ3QHVLq+7W0TcWtjOwQ5Bti2g4QbPdRndJh14Vleb
	 TCET0uwevfHhTmh5b3EqGYrZokSlKG8mnJozp8JDjc8/sXOLCj9pCbCMF8LUb9WSuCJyi
	 8ATNThhZV/bgwaxf7FY3e8CwpCb5p06hlhKUsJr04pVSKTQvHeyLQs7A/efjLRcNMqCX6
	 PTOBAT+SrFpedsyrvflCAJlFF1qoqN+ZgF2cnPZysxyBQRxpeca9pRvnetvJuAGXwBGZz
	 yDr6XJ8/yAcjlHqSaIdVGrwDfdfCigQIJyK7eGB+3L3s0KFxaNWXM3EtiWp8MRlnU8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486088;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RfY2qagWNg43LYzybryauizKXVh2curKFP/pO+9cW9Y=;
	b=KCRYUFhx45p191Sl0DqiGDXkh1wAi76QXG/tI76ycgMq7duEarSBnSysMxLJFe0DCFLV
	 2JUPMK7ay6Jr/RBaSNPwwfGLuBnJqnDUVlsssr3/3FsuQwr0kXvRVgk9D/hhrB8RH3Flp
	 yW3Xhx8Tv6FFwVLUMH9VGvG7c+TZVq98eFzIVgfnQwQxYtrLKT4v+sC+Q+KvKecZi7Pc0
	 mQwBsuIMKQkhK/dbA3cj0hl8cjKWT0PxU4vdKaZhZu4SbOWrMIz7ZfTG9Q812Jwn4aBCR
	 X2AWEA99VCd9G603cGyFbCIG5AVPMotqSTyikct42jnQ+pYQvoSUCfK+4V7alWup5xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O+mufm17;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B11B606A322
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B11B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O+mufm17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486089; x=1827022089;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iKXK6fOE15BpQx8kKMFE4QRjfuWkOWJlUIRKShaIovo=;
  b=O+mufm17Qh9+AxjIR/EgAJFq0dTxYGFyQ9Ym7Dbboy0aFPdYGVgFaXqD
   T9oSA08n7SXf5shsqQdjE1CoO7DFQ8H+IA9iM/IXFmHXiwN0ymG4p6C98
   Js7ZiQCtCoGgX/PHfQv9BdLaXhlqT9N/2CYVoP//HkUAMbpnwHb2UIzkJ
   3mo4jtgKAKswr01bfQhMCCD8KuTrHqArQv1BAyJYdTTvpEDrgZGPg1DNS
   Ja10YS4muw0gg2BNHPJGYuhtp3gjwez+qGqMFTaJKH7bNRP3QW094EWUT
   A3S30HPoxPwKEJ/p3VyA3GUCJdfrh40bik/bveJ3KHrY4OWxaBraYOLuH
   A==;
X-CSE-ConnectionGUID: GWDXaSWRQ/OYPtE5/a8h6g==
X-CSE-MsgGUID: mFM7CFODQ9aB+YCi2R61Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153570"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4153570"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:04 -0800
X-CSE-ConnectionGUID: grWq1a3QT6qvIA4qgasJWA==
X-CSE-MsgGUID: qkn91yfxQwSDUcMEBhq6/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11621456"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:02 -0800
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
Subject: [PATCH v23 18/19] drm/xe/vsec: Refactor platform check
Date: Mon, 23 Nov 2026 18:08:10 -0800
Message-ID: <20261124020752.30551-39-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124020752.30551-21-michael.j.ruhl@intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com>
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

