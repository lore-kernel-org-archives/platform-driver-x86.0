Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382354A5EA6;
	Tue,  6 Oct 2026 18:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311485; cv=none; b=eRwgZqqujOt9WTLC27XgvG+nfcxeMtXF8dOz6Nh6Lx8ld5WCJdlPDJOaHrjdaYAvTj1nvSSwXMKjkTvRzbiug5zG7vE1/ptPTKGP5j/c1fxgh3IK5ZWF9AXmqmsGF/F0b69vzfVVsb0i/qI4VUUkHux23NT3nrWfmqip8wma7kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311485; c=relaxed/simple;
	bh=s0UXAW1jglOMQ0ACum63m+uMDYIGQktW+Os4ylk8wug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgRhv9EKrPGEv6equV5Dt7dlXqr4Atk/lP4/w/Y1HTTG/O4sbdEwlbhMNk3mpfati9hUCDLddrvWd6HZWmKpUZqdee3aR+hUalbo1jOUNn7s4nxbaA7XYqb1zVtA7AtYAcUEJrRZj1Y9jk8j7CfMCuJxlCvXRSxdWe6VPIsWnrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMsSq1V/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMsSq1V/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311482; x=1822847482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s0UXAW1jglOMQ0ACum63m+uMDYIGQktW+Os4ylk8wug=;
  b=SMsSq1V//lKS8pkbZvrT3IPQyd99Tiwnj3diMaiQ6I224PNm/ftumf/y
   a1P/B3auJsL1MbOq9T/uiqcTYZ1AOJV4+3FOfKNpknudCmmveXLDDeYyz
   jggY4h2dosmXyOjk4OzTd4V06GYSCUDeeTRq2SXzmzUiut0L9d3dpcEMa
   qSNBskwFDorXReotQh7+Jk2Kx9cZCL4vOFxl2PBFpfo1886PhIaBfyPVm
   5Do89ugzoDY3Wb0BHNFgdYkT17TmfPCCLpjAg48s+ihwTNbIzGCFAIBMX
   Em16zPBBRgXuqNDwZKBoz0B9g0do8AsKbc032AYnnf75+tmI52BA7QW3d
   A==;
X-CSE-ConnectionGUID: XUfun0IYRLiHO+/Mwi850Q==
X-CSE-MsgGUID: cOLtTp6ZRVuW10WY4VLC1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591628"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591628"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:58 -0700
X-CSE-ConnectionGUID: DRiuubJbTnO2xDzDihkJ7A==
X-CSE-MsgGUID: lzUSTx/nQTGfG+IxXkKdmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500297"
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
Subject: [PATCH v4 18/20] platform/x86/intel/tpmi: Use DEFINE_RES_MEM() for the feature resources
Date: Tue,  6 Oct 2026 11:30:35 -0700
Message-ID: <20261006183037.1507007-19-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tpmi_create_device() fills in each feature resource field by field,
deriving the end from the start and setting IORESOURCE_MEM by hand.
That is what DEFINE_RES_MEM() exists for, so use it.

The resources come from kzalloc_flex(), so the fields the macro sets
that the open coded version left alone, name and desc, were already
zero.

No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 097754365897..91d8083fecc0 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -583,9 +583,7 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	for (i = 0, tmp = res; i < pfs->pfs_header.num_entries; i++, tmp++) {
 		u64 entry_size_bytes = pfs->pfs_header.entry_size * sizeof(u32);
 
-		tmp->start = pfs->vsec_offset + entry_size_bytes * i;
-		tmp->end = tmp->start + entry_size_bytes - 1;
-		tmp->flags = IORESOURCE_MEM;
+		*tmp = DEFINE_RES_MEM(pfs->vsec_offset + entry_size_bytes * i, entry_size_bytes);
 	}
 
 	feature_vsec_dev->dev = tpmi_info->parent;
-- 
2.43.0

