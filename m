Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480752;
	b=2jXSohJ16Q7+AT4YUwzFBFCtghaiUfc9lnwQ/hbd7t0vdWcHiDVxADeqjjVXFLP/KubJ
	 9vwjTMmrrz8OB3lHc+Ffxghtq0c3hQrbpVXdPZdzbOejlgErk2rnEd+cLOgtoqeVo3gRx
	 ky4piMxR1wnsyQ+97IFusDNQSs/wCS+d05T+jAIQ/2+GcFS1aUShGJtlHA3NVNATgeob5
	 aZKPDEw0qJdnbP0aIseWUH3lxS4Hyi+OkDUQmKjAxnoxDkI63vXhGwkjBJIsflwGOCrVy
	 gOjWYMI72QN3P5T09bsBljEOxjW/vj1/7p3lb1QN5n3h0ufhFeQ4k9I6bq2Q0N+jZWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480752;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RfY2qagWNg43LYzybryauizKXVh2curKFP/pO+9cW9Y=;
	b=dBwrnJw4WuEty4mm1Lj+/sPJPpqhIexZA6JeijmIa1ryVMlFcGzAfFE9Qr2dkyyVWZsS
	 2SXg4esBQHMOhMYgSUMOZVNH5jrFbBTvch1rsFg+Fu96Qxw6KoDkdHQ3dcPaZVHnqdIen
	 PlqVPU3gF2GWRxOvEUlg0cK0Qyi5yS6PcF6bWRTP2UyKPomWd0fmolh/AxwTiB2XmKprD
	 axWV8Y0C3TIzwP+Sb9TIvXAm0uJOtKQ1QrJaIW6G38RrgZNPs7Qcr8HYU9k9itqsnKpZ9
	 WmNht+oW46WhmKGKxh/zRGIc7dOacefdhtfD6X2M+rBIlWriSuZMsUmJAUjBnITUVaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bfuv60JP;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99947606A32E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99947606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bfuv60JP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795480751; x=1827016751;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iKXK6fOE15BpQx8kKMFE4QRjfuWkOWJlUIRKShaIovo=;
  b=Bfuv60JP4e09Qd4Bd7OtQSrGzEELIaEdbAyfWDeN835BPz7tlZN0No+v
   Ne/gQF787vpaAVxSUMTUWLe2OScy83Bk+Fa5H4rmwOTx/T4WhqRMDTm/r
   GkQN2derbn4p0SPmB/ePzOZ7mw/vdLV44i2dyUZK6tvdQvtI0tq/kHhL9
   LE0xkJr+NeaDSH8KM/wfFxQhdzbge3e/y8PE0A4RpiZdq6BIyYGbGY8BI
   dYiZF1iQ9ZxNCQYGBzErTqvdKPdwhUPTqBdZ3WD6ZetMf6Y7IajEP43Jy
   IbaKY23bx7qKINbsijx1NGeN/fzjF8bOJXTOIQSlBNvtpnb2zwo2vpddy
   Q==;
X-CSE-ConnectionGUID: GcGTi6WGRzC9AtRbHnHkBQ==
X-CSE-MsgGUID: qGNilXtrTAmci7RMVhzvig==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4332911"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4332911"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:06 -0800
X-CSE-ConnectionGUID: AxQNVF9RR6KtKz1rx/xKjQ==
X-CSE-MsgGUID: guy+CMVgTmySlPf0pU+pWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11805781"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:06 -0800
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
Subject: [PATCH v22 18/19] drm/xe/vsec: Refactor platform check
Date: Mon, 23 Nov 2026 16:39:14 -0800
Message-ID: <20261124003856.4145635-39-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
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

