Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2A72E1C6B;
	Thu, 19 Mar 2026 05:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773899719; cv=none; b=VYA1gtc4iFzCgaSvLWN71W2hSA5SMwG9stKhqJweKc+3rjirJI/xhR4hjB+yV/l7Emr4d3xb4Q5cvv/ttxvtP1Y60JWohVslg2WkA9a75t4OhvWSBhTuSYQaVhCNCxgG6BaiDImXpEZvdGGkGvuCH9nROXYfwClcEJ2TIALOoVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773899719; c=relaxed/simple;
	bh=vgbmMHHp8Ak3vVRUFhQPjwE0qC590+Xu0m9TMF02JMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Np1Mhz7jPG2tZ1pIdvd7Wj1p0rnNM81me6KN+NRWdoWQCgZRajrHD5IKA1xzOdxed0znvBHaAIapO6QbrsghsGOFAmgKqsJ8Feemlaw3D+hzFEMhe/16u6HHWcIoPdKyYeqaCfkyBGu8TH2BiOTacOW+A4bPDU0R6k/xOZH6/oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JANJHv6z; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JANJHv6z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773899718; x=1805435718;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vgbmMHHp8Ak3vVRUFhQPjwE0qC590+Xu0m9TMF02JMg=;
  b=JANJHv6zSFrY3pPPlgrU83HXAcLxwdlycYpAQeAdt/Nxei4X/vqwo6MS
   Eb+iJqF4dor4VLMAwpbzTlc+nc8qK4UfOPLRCFW3tXQbQlgR9OyaIchzS
   hdAyuWMmkp3HOMFidb3K5ZuJw6vbjkCs6Ves7SQs3BZhVCkFxpxqw9oMA
   yXTZ6/aU9hHeoMiB49+y5/Y9zRePA/ArdOUbAEt8zTJ0RcaqKZW3JAGR7
   OXcHOAizGAVC5oD9AW36akOIBMpQQ4DQrvN3tixCJhZ67MYf1tCCd6szT
   QcyPp18Ez51PTdW+z8MMPWlkC18YLd8OUVdhtxi2SVLef43Eg+uVqNWe/
   w==;
X-CSE-ConnectionGUID: vH8abGzoRxa0YS6rLMRYUw==
X-CSE-MsgGUID: xPS8X00WROqJ3n60b3F5Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75084791"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="75084791"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 22:55:17 -0700
X-CSE-ConnectionGUID: 15GrGR/yRge1kbd15TQHdw==
X-CSE-MsgGUID: 0FmSa1knQs6Xg8XZN1CFEg==
X-ExtLoop1: 1
Received: from rzhang1-mobl.sh.intel.com ([10.239.158.35])
  by fmviesa003.fm.intel.com with ESMTP; 18 Mar 2026 22:55:16 -0700
From: Zhang Rui <rui.zhang@intel.com>
To: srinivas.pandruvada@intel.com
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/3] tools/power/x86/intel-speed-select: Fix some program return value
Date: Thu, 19 Mar 2026 13:52:54 +0800
Message-ID: <20260319055256.3226034-1-rui.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running the "intel-speed-select -h" command, it returns
1. 0 when using a version that is API incompatible.
2. 1 when using a version that is API compatible.
And this is confusing.

Fix the program to return 0 for "-h" parameter, and return 1 whenever
"Incompatible API versions" is detected.

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index dd9056ddb016..bd9f7a1d385e 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -1138,7 +1138,7 @@ static int isst_fill_platform_info(void)
 
 	if (isst_platform_info.api_version > supported_api_ver) {
 		printf("Incompatible API versions; Upgrade of tool is required\n");
-		return -1;
+		exit(1);
 	}
 
 set_platform_ops:
@@ -3191,7 +3191,7 @@ static void usage(void)
 		printf("\tTo get full turbo-freq information dump:\n");
 		printf("\t\tintel-speed-select turbo-freq info -l 0\n");
 	}
-	exit(1);
+	exit(0);
 }
 
 static void print_version(void)
-- 
2.43.0

