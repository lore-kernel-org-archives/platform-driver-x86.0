Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95322BE7DC;
	Tue, 26 May 2026 01:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760062; cv=none; b=liLuW8j2cOgA++rxJMBGGC1wGlGPne7MSMShb27XrMCJF08MxzjcSzNQ6/c6qSnwyhXMwoqQHjI0LBY/qmBpzUBU6yThXXgROSwqtn+Z+PtPVbBw37g0pcJSfQZuCR8Jt5liqKWwT1i+4ErhfGxEX2/nsI4VrDOTQ5tGQjxTQj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760062; c=relaxed/simple;
	bh=l+0k3pL690pJsxbbZcDoKMIySbaXAwDNuHINmk4emK0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7G3Tbn7Slo4pdNKtclCcOMecpUweeNcWPDoHjTuqOE2RDKGKlSIwINIxYaqTbIXqAEcjuBbCH/9hlpg8SBKC8T7JTLDFUakG/24FmeNXTaQ0XhCRq8QSUWgqDCPmsGc8VehBdy+7lCBTu4S8BXuOyo8hLwBiH82mtHap1zZhbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCsF9I8c; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCsF9I8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760057; x=1811296057;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=l+0k3pL690pJsxbbZcDoKMIySbaXAwDNuHINmk4emK0=;
  b=JCsF9I8cdhNnqjTo9BxF1CSQwJ/HhNLvIIeWDPqSLx+usJBM/RQJMlqB
   CeITGVcgn+kTwHCzPzGPfwG1gSVh0YCg2pRziVxQ7aX6qOkY5vH22c331
   epLShubnz3+oXtChJXB38WE48wuaD9ukH+Qp/9DaEJKD2p+0txlKYb86F
   zeA6/B7r8S60edcuXaagYMHLCT7w/Z+fDtHm2BQ/O/5hkcrOXJNR5lzoP
   iQLURZGoVgrIQv2FfYC1sglLWQLSx8xF5roph3FWRtyIrrwW/d++nAR5R
   W4LDgV+Bhf9yxwrI1BtSQO9MBKlXvAU7lwbQnHQ5IaaTrTqBPl/g99UaV
   A==;
X-CSE-ConnectionGUID: 18QxtSiLTOyPlR+w/cecXg==
X-CSE-MsgGUID: wp8pwR2BR2OVjsUiDUpEJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539887"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539887"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
X-CSE-ConnectionGUID: 5OKnMaIGSf6hz5a/YU3p3w==
X-CSE-MsgGUID: CopMR1pgRPCPdM76/wb5Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074969"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 02/17] tools/arch/x86/pmtctl: Add libpmtctl shared type enumerations
Date: Mon, 25 May 2026 18:47:00 -0700
Message-ID: <20260526014719.2248380-3-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526014719.2248380-1-david.e.box@linux.intel.com>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add pmtctl_types.h to centralize shared libpmtctl type definitions used
across both the public and internal library interfaces.

This provides a common definition point for core library-facing types,
including device backend classification and logging verbosity levels,
avoiding duplication across API boundaries.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 tools/arch/x86/pmtctl/include/lib/pmtctl_types.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/include/lib/pmtctl_types.h

diff --git a/tools/arch/x86/pmtctl/include/lib/pmtctl_types.h b/tools/arch/=
x86/pmtctl/include/lib/pmtctl_types.h
new file mode 100644
index 000000000000..8e3bf5a173c4
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/pmtctl_types.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_TYPES_H
+#define PMTCTL_TYPES_H
+
+enum pmt_device_type {
+	PMT_DEVICE_TELEM
+};
+
+enum pmtctl_log_level {
+	PMTCTL_LOG_ERROR =3D 0,
+	PMTCTL_LOG_WARN,
+	PMTCTL_LOG_INFO,
+	PMTCTL_LOG_DEBUG,
+};
+
+#endif
--=20
2.43.0

