Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F6E4A8FD7;
	Tue,  6 Oct 2026 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311485; cv=none; b=kCo+gv3T5ZRR3rMsp1nOEWWtYq9vWdCK5xsnmMcBjXUB3P61l8IsVbkISxB27gpOHoGeNmvMtDeoB2nv21b7j168RhRtiVnj4Xbc7Va62YNYgBTwqCevJwWIOe0En7NhYOlNIBVmjejD7Kt2iJJzCxaWT3BaCZeKYHNp+OxX/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311485; c=relaxed/simple;
	bh=ecmz5smcB2fI+iVz6uagudZ7WzdL9uHLsTbINoBogRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MvxVi2mE6zzj82qLWrKGMU+LZXRccIUlPdlwB7T1KgV9XIzDJ870VJeY6Ccmidj/SJQaqxFcbdR+cikD8ma+ufPeKImER3I56r7vyVabOeFj01NJzTyQDtgkh1iS8qfi73g3B7BnXbpQxzaK8eg7jSzk2TuHwmpCF2Wb45+gfc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+lccz9G; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+lccz9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311483; x=1822847483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ecmz5smcB2fI+iVz6uagudZ7WzdL9uHLsTbINoBogRU=;
  b=H+lccz9GKn92vC8Yvw6gD79GDExZr5Jsq2x+jl4Lmw24n5xxNWx3TxpA
   iFaX35/9fzDrr7+yiYQeMa9QMBKKh4DsINGy6yIw/kEGyh9rWYxSCeZLl
   gY7yp2ndcp90cZRxi/zMg8ge4g/micL/AqcK4XeSRnm+9kbufVuAVWOfC
   05XFd+S96DEjw6VK+frkeD3pvL2Zb43qCPgGE5wAN7OUM9ByrAC/XyIu2
   L2AMwRjK4Trg2scD0svhxIZ7bGDwRe0ykIzdeAUXzJkKrmbK5KqSgjz/B
   tIcQDaWCTRfw/qaz26qNgGsgHNl/kr/9uP/hMH5IVoZUjNmIN8NVhCOPQ
   g==;
X-CSE-ConnectionGUID: QMcFglaFQNGw84rFwVLuYQ==
X-CSE-MsgGUID: uUy7futqRCG/7Q3DIfvZsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591632"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591632"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:58 -0700
X-CSE-ConnectionGUID: WiK5javZRtuuq0cnHUDMww==
X-CSE-MsgGUID: LdaA/Fj6QrapJnaRt9IY/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500303"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:58 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 20/20] platform/x86/intel/tpmi: Describe the device creation policy on the function
Date: Tue,  6 Oct 2026 11:30:37 -0700
Message-ID: <20261006183037.1507007-21-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

