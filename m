Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7CC221FB1;
	Wed, 25 Mar 2026 19:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774467053; cv=none; b=lvrNwcRsojCQ9g+wjQrB57h4sScam4JimOxfRrf4Mc9TdH98ls0SuvUM25j2cErM6Tq7ujCBh3lBXtc6g1C0n8FhsDIeZOq3+KpA4PyZ9Th50kWJauhBALlnafCWeagpoeWVoF7UaRvqeQPUwBqoM9dVaJxkjaA7AgBaDXpMOQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774467053; c=relaxed/simple;
	bh=ESzOlrHkLo+z38r1hwoVAsm1lcpzRuevpjM4P2xWRXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g13H8+cw5JPjryIQkPhQeJefvv9VAq7ZNPMMMu4dfi1gZQU+attmp/v9nwvO2GruKL5nqrzaq1VmafshqE5a7Lg48FCz4+pz3ZbbQbeV7au0KUCJ739xB2xT74fR8xS8MTC7t9qyjCEJ/dnnsJKfHmtprnQmlRRe4wbjQAuB7BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ClHxHVuf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClHxHVuf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774467053; x=1806003053;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ESzOlrHkLo+z38r1hwoVAsm1lcpzRuevpjM4P2xWRXM=;
  b=ClHxHVufkJXAkT5D1GU9dEfMoL4njq4i8OZKiedkKQ4XVfllEt/UAYTD
   kEg4oWiRdVVYefzSRuCqjJtQJFVZlSt3w1W2B4kNaAh7/aT44Z8goMIhs
   7r5iRnCmkXHy14wLtQncLVBgDJyIT6ayJ9GJBVMNSU9Il3fRkV0iM37zN
   MCuWgyVuQQ4HNmHR4vPHqMqjDKQO++vceESXepHCpzeaktxnHK9qv9JBy
   4pWikejgAOcod8mfcItGW2bzUjf3CpUqNq+Mv3UYLcl/plxHFGe3E+ZSI
   WPDgxdef54rS6EWUKgBuL+EFGurpLHK8Tzt2Uk6Vc/NeOXog01MhzYY3R
   Q==;
X-CSE-ConnectionGUID: a4Gu/4+tTt+Sucp6LxUwQw==
X-CSE-MsgGUID: fZ2ogJUzS1CshGlLuUXq1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75403459"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75403459"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 12:30:52 -0700
X-CSE-ConnectionGUID: 1w9RTSVxSsGkgVM1vVTxEQ==
X-CSE-MsgGUID: zSWI48xoTxyjQ/YGxFqiBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="228844396"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa003.jf.intel.com with ESMTP; 25 Mar 2026 12:30:52 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86/intel/tpmi: Use 32 bit aligned address for debugfs mem write
Date: Wed, 25 Mar 2026 12:30:48 -0700
Message-ID: <20260325193048.3417349-1-srinivas.pandruvada@linux.intel.com>
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
 drivers/platform/x86/intel/vsec_tpmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index 98846e88d3d0..b70232d8ba58 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -479,6 +479,9 @@ static ssize_t mem_write(struct file *file, const char __user *userbuf, size_t l
 	addr = array[2];
 	value = array[3];
 
+	if (addr % sizeof(u32))
+		return -EINVAL;
+
 	if (punit >= pfs->pfs_header.num_entries) {
 		ret = -EINVAL;
 		goto exit_write;
-- 
2.52.0

