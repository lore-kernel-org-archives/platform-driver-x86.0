Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4973253FD58;
	Tue, 13 Oct 2026 19:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919818; cv=none; b=c6iXkhMSiufzQKtbre+vSdBPx+35aETzuZvYh9JN2ZYYFm+QvffYmD3rWgp6piaa72cLcv2zILjhGj3nmUMjUeZzjTNe8bGibJd1Xvil0MXlPYbLeXLIC6bumBAC2/s7Rzu/yAcisb4XS6ya7cqK6V9fgoZfDgsvBNmrX1GLZMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919818; c=relaxed/simple;
	bh=ecmz5smcB2fI+iVz6uagudZ7WzdL9uHLsTbINoBogRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ARde7s7CNqqd7OrnT3l9h59zwoW/+UHh/SwppnI265O/pw87RUUOLYN4innDbmvCCa1sRLoV/gfZG7F5VLTKuwNuwXTE6gvl2pLRTXjnqg0McWuRWlQ3Wi2uxp3f9D5rlatyzmEtoGvu9HLnEioC76I7Av7dI/n9kZ88Q4Vw0NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3Mb1XFK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3Mb1XFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919816; x=1823455816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ecmz5smcB2fI+iVz6uagudZ7WzdL9uHLsTbINoBogRU=;
  b=B3Mb1XFKcw2jC1jQ8joTkzT2+gUYkv4phvojB4MZp6oWi0uHucJ5yORx
   1+OVki25EZp63wKD68wopnDJyUtHNjLZgNE66GVgKJcVb5/CrBaf0ELr9
   p094wRAH9lp6W3DOMmQ1AqLWhq8pBjqSWdxF02w0vPVem0DG0KSZ5iDJE
   wGf94nwoojYpoS6HPQqu7sIb9oEnYGpZbqx66GbKQXrEBBlXhx5BLRFJ4
   9v3g94ACa7hZn++J67Q8mMLr+aomzClsAW75WLo2svAfCDwdJIFqm9r0K
   d2t6cc1LJK2rxjtfIV5RFXY7fI8THT9q4ZVPxvEV+0rfGV7B7xAHvL0mv
   g==;
X-CSE-ConnectionGUID: ByO4kBgOT3GFJs4EjJ89jA==
X-CSE-MsgGUID: zbPh8EIPRTi/XoEelAR1yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544147"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544147"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
X-CSE-ConnectionGUID: 43Wnw7EtR6a0TQzflB/lfg==
X-CSE-MsgGUID: UyAqLfecQyivNtiPNgDIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167723"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 20/20] platform/x86/intel/tpmi: Describe the device creation policy on the function
Date: Tue, 13 Oct 2026 12:29:35 -0700
Message-ID: <20261013192935.2243291-21-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 55c8e23dd2ce..b6b811016dfd 100644
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

