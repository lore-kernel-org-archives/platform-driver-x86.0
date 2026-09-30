Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5085221C1;
	Wed, 30 Sep 2026 17:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789392; cv=none; b=isv4CdT95LB0tL/n0sPWt+4FXTDnSh25wbrwpyJGxnfQ00Q7jIc5cGIrux1YtpUJXa4jLSEJQUuowCUVbzXoXap7kLgiNCewsqk2Ty2phxvOFj0bCpRWzFfAxH7wkoCK+o3USjXNgPnJYIMt6z4Dzjo8qxQs8Z2wcvHvNdNIC0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789392; c=relaxed/simple;
	bh=iP38JaL7y4TxxaR32RTFixnhVUVkz+XsFujEas5cjyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o7F+S7aP2vehzpIGuZwN1RkGBWMkKt/XbnLVNMQBOqMhZ4YaRBbbSyugHtrsIU+6O7m3xxgx/nP1xB6hYLeAyXCcESBRXEBu3YsmG61HA5ZXupxwuvqXQpm+sZI+lLosDbeYWHNY+1IA/Dm0Ig2V0eAxlAF+JttOZrUG0vhPaNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABW8b43l; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABW8b43l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789391; x=1822325391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iP38JaL7y4TxxaR32RTFixnhVUVkz+XsFujEas5cjyw=;
  b=ABW8b43l0q42BffEaf0zcpAohNjNqEJR6/Priqv2ekI5RaED70pVjOme
   ZdjnNy4+UHMq8WAmETHChH3xZgO/FQKacNCEVLuq1cxIDNFYCiO5aUd7M
   sO5zru5ywdRRjvw0qnS8Q/ZzjJnm5evbaC9TN3r6cYcrkLxR+HlIGo4Le
   nh8+HYVgYsQaxiCbtIiveVYu7/5dQFhyL0sSeRL5/4ROgGqwLrsczQVxk
   Ldxl49P1SCDNxEaxetN/IHPEwEeMvVelqWeKFJCtTscKYxpRHyJZODhYp
   b2UnvzL45q1hfqBkHod0l9Qlm4l1Q2hDJTPS0twSlpfBTEZR0dhwQ4LHF
   w==;
X-CSE-ConnectionGUID: KldqFeiORW+pvN1vhU6kzA==
X-CSE-MsgGUID: AOR8VA7bRGGYNaERn5pQ/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632091"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632091"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:36 -0700
X-CSE-ConnectionGUID: RD4OeL/YQOOvdQHkgHF3Gw==
X-CSE-MsgGUID: N1vhElX7QOi1CXYCDcZEpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959447"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 20/20] platform/x86/intel/tpmi: Describe the device creation policy on the function
Date: Wed, 30 Sep 2026 10:29:17 -0700
Message-ID: <20260930172918.743656-21-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 52d843501020..83ea576e4db1 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -601,6 +601,14 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
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
@@ -608,14 +616,9 @@ static int tpmi_create_devices(struct intel_tpmi_info *tpmi_info)
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

