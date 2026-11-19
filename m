Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103701;
	b=YtCrVN8ghK1dqZFSiEkwZhkBc1GBbSL3yf5b8d55fUalU7upCdJLsUZE2FrrpBng1P2v
	 TMJlrqwl5eRhNIU245I0xYpzO+gCzRauwRzMawtakgZ4A9SCwtxhlSofHT2DJB6uqpZ0Z
	 +cxVj7axe6EfcLCs2fQ02/GudcbRm1R7euQNHHoH/RNU/PKcL7jjel/T4bstkOD354/BS
	 EFDbyWH32ZFAxb1f8spG8LuovVllmhXBHzoGo/DjiM4OXsOCRifD8S0h6a9jN6wCM7tab
	 c8YA9AcYCYJDQaeqpnxB4dViaG8FKeilVkihvq0RRlKstKad2b10YSMwvuO5dMKLqtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103701;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RfY2qagWNg43LYzybryauizKXVh2curKFP/pO+9cW9Y=;
	b=PQv9aPumL8XXL/FdUlxRqLP17yRJPeQPx07uPnrSs4JjsmVBBOSd9q2I5U7jNybYjjGg
	 8Avuhc6PvG84S7YT6faS6WofKfEpEVeSJf3upLbvjdKoHBuErAvsV7gjWg+GZDvspsRC+
	 IaJQjSW8TWBQuvl9jWcptthhxo5kjQgtSTi+C1SCSEpAiX9zgTufOgek2jYTkrpVFu2eK
	 aamRSgALCSnDrckL/2AH1/3TV49njp8zEr3B+tH94WDmX78yDJ5ikzEdLlzcy/MtmXUZc
	 fm6k7YnQJr15uxUpBrEvLRK1N48cweS4kl/NmXMYT+6uKR4+KR3J/nR4ZpX8iQ2WBpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H8BTtR3w;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50887606A334
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50887606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H8BTtR3w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103702; x=1826639702;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iKXK6fOE15BpQx8kKMFE4QRjfuWkOWJlUIRKShaIovo=;
  b=H8BTtR3w37hTESKwTitqN/CUp2sQpOKUKrPQu8ORSbyl/wQUIF1BKmk1
   6K7CFB9P//kh949qjqEtdPJehqnlOxLpw9E3uQ9HIMlX1KDLnLMKBADeR
   VX3pi07CQSibslDGXYHjZ7B/FihQTxL84qW36UW9JjNbEKJEJJDaA0Zru
   YSBfObNsCHzvtzETxe4JSb/N7trwuq8Mcfu6kRdhTIXRwRxvjKXaz6z2w
   S1+jM2fv1mZoimHIYhb75AMVtc8LtvkhHjNLkTeqlqpfjccScUCiU9Blj
   4uu2nz5NXsHY9YqQnNETXMfSSoW3772s1lJW2nEGv++FLJX1Sl8xbDOvP
   A==;
X-CSE-ConnectionGUID: QpElOVZVRhKxIapvNj3e2Q==
X-CSE-MsgGUID: /FB8PrUtS3qwLK5ibpHKiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3849061"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3849061"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:56 -0800
X-CSE-ConnectionGUID: 9G+i8qXfQma3hfR/WZlxxw==
X-CSE-MsgGUID: arlGslMMTm+dFrL97rj9zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263448"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:55 -0800
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
Subject: [PATCH v19 18/19] drm/xe/vsec: Refactor platform check
Date: Thu, 19 Nov 2026 07:54:56 -0800
Message-ID: <20261119155438.40762-39-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119155438.40762-21-michael.j.ruhl@intel.com>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
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

