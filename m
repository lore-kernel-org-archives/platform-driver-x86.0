Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D999B346E47;
	Thu, 26 Mar 2026 18:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549497; cv=none; b=MQbuhL0kSxaEYtwiTFFMY93mNnHWlcUgDSxYLTNUhHqOfXTK3x+6m1vA2ZHpPRaD8wqC7bChTBcvYRLR+2k/Ne4PjdtVuMEJ3gX8TZL1TGyf+1PG1o2SmOI6iT4MCWwe+16NIa8OrmQo7ZXLp0Tc2uGxR8d/eDaJOCGq4OJ8DVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549497; c=relaxed/simple;
	bh=+5cmqVmE1jNiyGlri2CJNdNZebqHV69aKuGt5l+2ZkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sh3eD6/H86URzSB3/7myhFSab00Dc4g9TiBZbnSWoOQCakIy2OT7pc/nxnC0uoz6mEvv7Wfg3bShbDweu0K+cQOdjTzp81DGC4ZxDXHQZmjf3KwEGU1vMfoap0kUgQksm9rN+U7gxGa0Ob6T2YYHmwcPxwmxZvVto0Ha3uZ9S4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rc2eB5Zy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rc2eB5Zy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774549496; x=1806085496;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+5cmqVmE1jNiyGlri2CJNdNZebqHV69aKuGt5l+2ZkU=;
  b=Rc2eB5ZyIHKAyieJUdezHsiu9vCdJf9RcUV9bWVdA/6H1taxkkgwsEFI
   DV7in4YB9i9BTH7GieV8cIwdjakw0Lo9A7YkfisD2oXloTOR1T4KkLsp9
   5w3Sl0cw1pUdTSMqUfWoI76BBlySMA0X82Sk1FwVsFu2mTfIFn6HXLiro
   HMqKScyo/93bhm1ysEShtz1nal9ObRTOurn18nhkUITY6k829CJ5Osgl1
   gGYpwEHiWbjPmOdYGAd04XOwd2CGbMWZ5c8+cvBbrRk8CSg6//AQpgndO
   W7GKOxHIPNv9IOr69iK2tmrJ8YtedKrUbapgAdx+vSdHeAsmKaO84E61p
   Q==;
X-CSE-ConnectionGUID: OF9bgTSUQTqnxg04S+7abg==
X-CSE-MsgGUID: E3sAkQLNQVSJ4rDdUSeoWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79523789"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="79523789"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 11:24:55 -0700
X-CSE-ConnectionGUID: lsQ/TAdLQX6vS4UmU7GN5g==
X-CSE-MsgGUID: UkACtNutTv2+91WCjpL9xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="262991969"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa001.jf.intel.com with ESMTP; 26 Mar 2026 11:24:55 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2] platform/x86/intel/tpmi: Use 32 bit aligned address for debugfs mem write
Date: Thu, 26 Mar 2026 11:24:46 -0700
Message-ID: <20260326182446.3478672-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory write feature supports 32-bit writes to any TPMI offset.
However, future hardware generations may not allow writes to non-32-bit
aligned addresses due to hardware optimizations.

Since all TPMI addresses are 64-bit aligned and correspond to 64-bit
registers, enforce 32-bit alignment for write operations.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
v2:
	Use IS_ALIGNED()
	Here <linux/align.h> is explicitly added, but also included in
	include chain of other included header files in this file.

 drivers/platform/x86/intel/vsec_tpmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index 98846e88d3d0..b16968f76726 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -46,6 +46,7 @@
  * provided by the Intel VSEC driver.
  */
 
+#include <linux/align.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/debugfs.h>
@@ -479,6 +480,9 @@ static ssize_t mem_write(struct file *file, const char __user *userbuf, size_t l
 	addr = array[2];
 	value = array[3];
 
+	if (!IS_ALIGNED(addr, sizeof(u32)))
+		return -EINVAL;
+
 	if (punit >= pfs->pfs_header.num_entries) {
 		ret = -EINVAL;
 		goto exit_write;
-- 
2.52.0

