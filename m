Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E396A4BFE80;
	Thu, 24 Sep 2026 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274258; cv=none; b=o4uRlOp1G7tRZbQt1vAk9mlRh055zx2rl0ZgIxTu4JCHsFVy61yDRND8LFYvx//eSQhUJEnvi+yNi86/cQS+isZXYjFBzH58jOxoOW1Rc2Y3Qb6wTUFXCZG1FdPVW2eCSIFQ4PMqWMdz1+JN8T2tXQF2oTjrpWHEGiYZ+7C1mxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274258; c=relaxed/simple;
	bh=o5APm176F0/FU83RT6ufTKT7rGHZh+fvb55l7bHReIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XP0V4togV/OXhE2gxh8J6pnE6iDUMZG6jKY6iN/8fp4nB5eiichu/64OeZcWovbGI8kSFs8R6c+lE6Y1d84MwOhMKqD8v1tuG9/RAyiqdHF59FZMcG3SRNvS6HnG8Vjjvg1f75JGXyvMG1swORjdAi0PfSxoQyfxy+kcHurd0j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBnx2X7G; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBnx2X7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274255; x=1821810255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o5APm176F0/FU83RT6ufTKT7rGHZh+fvb55l7bHReIg=;
  b=VBnx2X7G6L/nD0sEjkTePuiOc8XCwM29X61c0LDpSgsIKlfI46fdk2T9
   pYrnbdch5LW2l2jfnd2rhdglAtUMx819YUPJd6bOp0hrVOa7beoV6IW5J
   7qRVwU8JdjYwgMDQCo1K4zRYp1JQNUBOV2ueatOEna+8PE0xjlNnO3hUK
   1NJ2vssez0ThQrL+bAkdtSuK/mxTOnM0i+Ro9bcfmVRyWkVqQ2Sy3xClJ
   uKQvEqRQE0M5/hkUrgrx55jRCZCnPA9eF+LzxqriOAtBh3IQ3XsGWjZ6v
   GjzLGq90MQ4H2+gj1gUqizCAQJucLTKGuXWqagFJ+yBZz5D2QkHEeRtLl
   g==;
X-CSE-ConnectionGUID: XKih8Nl8RHGk2FMaJ7FlFA==
X-CSE-MsgGUID: sMsOcbmnTle9BA5MOZNtcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164293"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164293"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:46 -0700
X-CSE-ConnectionGUID: ZuD6TrvJS/yibtf2pSGwag==
X-CSE-MsgGUID: JeMsbR9uTS+vwC5jYfRrcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229965"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/19] platform/x86/intel/tpmi: Describe the device creation policy on the function
Date: Thu, 24 Sep 2026 11:23:41 -0700
Message-ID: <20260924182342.212709-20-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The comment explaining the error policy of tpmi_create_devices() sits
inside the loop, between the call and the check it describes. Move it
above the function, where it describes the policy as a whole.

Also split the check into its two cases, skipping unsupported features
and failing on any other error, so that each reads on its own.

No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 0ef2642bd920..9a650053de0a 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -603,6 +603,14 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	return intel_vsec_add_aux(tpmi_info->tpmi_dev, feature_vsec_dev, name);
 }
 
+/*
+ * Create a device for every feature in the PFS that has one.
+ *
+ * A feature that is not supported is reported as -EOPNOTSUPP and skipped.
+ * Any other error fails the driver load. intel_vsec_add_aux() is resource
+ * managed, so the devices created before such a failure need no clean up
+ * here.
+ */
 static int tpmi_create_devices(struct intel_tpmi_info *tpmi_info)
 {
 	int ret;
@@ -610,14 +618,9 @@ static int tpmi_create_devices(struct intel_tpmi_info *tpmi_info)
 	for (int i = 0; i < tpmi_info->feature_count; i++) {
 		ret = tpmi_create_device(tpmi_info, &tpmi_info->tpmi_features[i],
 					 tpmi_info->pfs_start);
-		/*
-		 * Fail, if the supported features fails to create device,
-		 * otherwise, continue. Even if one device failed to create,
-		 * fail the loading of driver. Since intel_vsec_add_aux()
-		 * is resource managed, no clean up is required for the
-		 * successfully created devices.
-		 */
-		if (ret && ret != -EOPNOTSUPP)
+		if (ret == -EOPNOTSUPP)
+			continue;
+		if (ret)
 			return ret;
 	}
 
-- 
2.43.0

