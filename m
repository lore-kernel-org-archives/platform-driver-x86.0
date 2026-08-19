Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5963B8D79;
	Wed, 19 Aug 2026 17:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787161177; cv=none; b=XswaFOpfe7zh6UZD68DWU9ZWYGLaxeRyYmuaZFyEUQmit+c5iJoXY6jNbktLKIY0XiCYjqW4dPw5hJcSJmYJFccJnIlvD9LNIPqbHXq7bWJBGTCouaAc3qPOUBfT6OhuAwUa9DZp98j1rY683E6KQRaIfWktqKyJxFBFmPAG54U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787161177; c=relaxed/simple;
	bh=d8qbX77ZUMTQwK6dB+0R08AuaXverreJybv0rixYN6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eMbCpapDq/lrzL9vEI1sgFEuNkFPyj6+GQJAlLGnRZ2a4gF0E5svI/7mrEKdaBFM74ZBGdXCziCy2pvpUoCqstIf3WjNacY3ZbrVt7nRPuOAS6mbHfjjXjMuIH2Q3PjpJCl5IwagHuYxiqlxGmbnCmMJVnIXmK76KT5lgcJp98k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcoFQUgU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcoFQUgU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787161177; x=1818697177;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=d8qbX77ZUMTQwK6dB+0R08AuaXverreJybv0rixYN6w=;
  b=OcoFQUgUkr9g0p2XXQaq7jrsNmh0kVYeV1IPxkLsqmkjWSjt/Ws3u2Ou
   Z5NMG8RDBTIMWdj9pfWqI/bc7o5dqbCM6ODbX07duOWGmowuZcS0u2N4b
   HeJF1OEca4v7p5Hmjf5pudh83gtWpdSxxvje9xds5i6e9P0v4DR38E7qj
   /U3eZifxTSFIGlVxL7X4kSLlTKS8AE8V5OUmKAKMdmrGR5p12KE7REXoi
   Y+dtYF+RSn6WWgLRliUCiC7HU71Lx/SVaYkJFuRBFSbKdJoOdVxZxzvrv
   p2YljrpGv1ZRW43l6kL/nUu/Bw24/BcZdFq68e67mDv80GqmOCIsdO5N4
   Q==;
X-CSE-ConnectionGUID: ZK7/6yfSROCAVxEdZIwBAQ==
X-CSE-MsgGUID: W2tur6MqTBSrba8sxDJxgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="99211793"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="99211793"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 10:39:36 -0700
X-CSE-ConnectionGUID: 1mtPJ756Rhe2a8S+KJzQ8A==
X-CSE-MsgGUID: w6I+VACHTnmcBORuykyLLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="266227559"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 10:39:35 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v1] platform/x86: intel-uncore-freq: Add support for rugged Panther Lake
Date: Wed, 19 Aug 2026 10:39:33 -0700
Message-ID: <20260819173933.1184291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Add uncore frequency support for rugged Panther Lake.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
index 667f2c8b9594..3bc57b553eff 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
@@ -257,6 +257,7 @@ static const struct x86_cpu_id intel_uncore_cpu_ids[] = {
 	X86_MATCH_VFM(INTEL_ARROWLAKE_H, NULL),
 	X86_MATCH_VFM(INTEL_LUNARLAKE_M, NULL),
 	X86_MATCH_VFM(INTEL_PANTHERLAKE_L, NULL),
+	X86_MATCH_VFM(INTEL_PANTHERLAKE_R, NULL),
 	X86_MATCH_VFM(INTEL_WILDCATLAKE_L, NULL),
 	X86_MATCH_VFM(INTEL_NOVALAKE, NULL),
 	X86_MATCH_VFM(INTEL_NOVALAKE_L, NULL),
-- 
2.43.0

