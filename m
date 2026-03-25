Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AADA35970F;
	Wed, 25 Mar 2026 19:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774467122; cv=none; b=OiiP2xLgAmb2kjnXBMrQipwMGn39tmDgp77QkM6R0rYIl7vMjzrdZaY9cqE/TMEnf4qwLrsEjH7cXpbXkijz8gVCh6IfbIgale/kjIMYf8la7NkoPht2P9RG7JG5cRTeBG49XPizIFg9qQOwDraHumUoJ59I+0SKgIRCCfT6KZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774467122; c=relaxed/simple;
	bh=IMDjRs+OUNQoyvJzKm7+T3Yin3GBSfIUMJzu6xkfZK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uPel1QfoNo84o0YgMtSAbsf9FBdFUe1z5VWcxSaW8ok+HBUFvOtG1P/g1o6hkgdinCu2GWmoBvPhaY7zSQZ/8aoM3AVtI9n5LMb8mf89wrgNGed0Z06GCyfZRva9tFrGbvdVLI3T4WNvxHG5Ophx6sohBRrgZR6nKM/gbaL9HU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eerQZA1X; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eerQZA1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774467121; x=1806003121;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IMDjRs+OUNQoyvJzKm7+T3Yin3GBSfIUMJzu6xkfZK4=;
  b=eerQZA1XfamC6Q6EwjfGWNKz+eymMJikaKTxzMkUTD+yEvNbDmzT6Zg9
   RcQM1/0q6ADDHVsqFQ+oM7MTx7FCKS9xH+Jy9FJMCzzIyhnuEj1LKMYx1
   OomCPLWbFF5jwu32NZSa/fM5buL9GgYudwAnlK+MyT7Rjy4Pm81gbNVkp
   wBKkueod0sLyj2Y+CuocNPJQzMMSEBHGGH4VueeeKOAUSUC3U7zomqvPC
   JWR6Khntl4rCKTjfpgBDTm/qGfp1jPXn2pX7wBAr1W8U7c1j8866ijpdI
   EGoBEW9OvrrdNh+0sIOpkDO2kpiW2S/VnHODxRKP/jyxBrT767mS2HJ3x
   g==;
X-CSE-ConnectionGUID: 4QhuTTPiQ3KlDYDjDSv1sQ==
X-CSE-MsgGUID: I3IBNALJTIex3YhBkIPQQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75403594"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75403594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 12:32:00 -0700
X-CSE-ConnectionGUID: vkXRs4laSv+7+Er3ruayCA==
X-CSE-MsgGUID: o+JNGXlbQWe61djYOL9a5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="228844527"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa003.jf.intel.com with ESMTP; 25 Mar 2026 12:32:00 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 1/2] platform/x86: ISST: Increase minor version
Date: Wed, 25 Mar 2026 12:31:57 -0700
Message-ID: <20260325193158.3417382-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation doesn't require any changes to support minor
version 3, hence increment it to avoid "Unsupported minor version:3"
message.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index dc22504aea32..283b44f5e467 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -36,7 +36,7 @@
 
 /* Supported SST hardware version by this driver */
 #define ISST_MAJOR_VERSION	0
-#define ISST_MINOR_VERSION	2
+#define ISST_MINOR_VERSION	3
 
 /*
  * Used to indicate if value read from MMIO needs to get multiplied
-- 
2.52.0

