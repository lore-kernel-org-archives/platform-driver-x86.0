Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC971A8F9A;
	Fri,  3 Jan 2025 15:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735919611; cv=none; b=OXOr+cvuzVDgY1sT7toi3BOJC68G2+iaXrdREMEDVl1UCkHsURKY5EMSv4llTeZNKQpC4rbvNlGPZrBxSLQ8EHfSH8JBBs3MRVJKj+JAy4b0QECA2jUkynPLMRfka7MhtahM0QEEyCHRupTIFn1Sx7YiDGhpVqLxsW87eCfV5bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735919611; c=relaxed/simple;
	bh=GQKKSwkS5uDA7r+YxySsENhIVbI3hSNDZidksSZbixo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rV1F728jWCmUgnOKn4QiwmzWRm+jBn3guTGjGB5N7fJky1TrrCDqiN2eV73U8UVOAgTM4yhF8WB4ChcLzEWyt9Ei3SRRmZjyfnjMh9Pwox37GikdwcaRKPlEGufR8vbqUhESkI6ZWrE6C1HNUm832/+nt80lZzfcvOJIZW8XwCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6/8774f; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6/8774f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735919610; x=1767455610;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GQKKSwkS5uDA7r+YxySsENhIVbI3hSNDZidksSZbixo=;
  b=f6/8774fMgq746KSSPXwNJ98j1UU3I2Cid++Tdw5ni9CWQpeiB8ztdiA
   23Ebc00Rz+mkl+ocv9G/eTcObLNuBcrO9BLWdMrDiKi5XTjao7fN9KRBE
   gt8lHE3TSps95v1s0sMbkBt58PGK5WentApeqhSWDeY+YDJAS2rIRbQOT
   ESitMEyMv1wCgDJz+g5/NTj7+PYR6TSK+UsOoAQZdAkTQZRQHnp6gGrRd
   bnStS3yjNIQoY6GELw1vGShFvGzeqesOx3Iy8s7WCh1SCaesBqTvGuYjj
   t9lHGqP6LX/AKXI6DoV3GlAWHxukYd3Zh4yIoQeBLxxnVRVZJ68eMIsKo
   A==;
X-CSE-ConnectionGUID: djBxYfWxSZOSdgaqApbheQ==
X-CSE-MsgGUID: pidSExnLTb+1M9PgkI+oHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36392095"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36392095"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 07:53:29 -0800
X-CSE-ConnectionGUID: rcUI1X9BTfGE4xYero5PJg==
X-CSE-MsgGUID: y89Re3hNT1mHacqaNiowUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106868355"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa005.jf.intel.com with ESMTP; 03 Jan 2025 07:53:29 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 1/2] platform/x86/intel: power-domains: Add Clearwater Forest support
Date: Fri,  3 Jan 2025 07:52:53 -0800
Message-ID: <20250103155255.1488139-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Clearwater Forest support (INTEL_ATOM_DARKMONT_X) to tpmi_cpu_ids
to support domaid id mappings.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_power_domains.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c b/drivers/platform/x86/intel/tpmi_power_domains.c
index 603e7ded06a9..2f01cd22a6ee 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.c
+++ b/drivers/platform/x86/intel/tpmi_power_domains.c
@@ -81,6 +81,7 @@ static const struct x86_cpu_id tpmi_cpu_ids[] = {
 	X86_MATCH_VFM(INTEL_GRANITERAPIDS_X,	NULL),
 	X86_MATCH_VFM(INTEL_ATOM_CRESTMONT_X,	NULL),
 	X86_MATCH_VFM(INTEL_ATOM_CRESTMONT,	NULL),
+	X86_MATCH_VFM(INTEL_ATOM_DARKMONT_X,	NULL),
 	X86_MATCH_VFM(INTEL_GRANITERAPIDS_D,	NULL),
 	X86_MATCH_VFM(INTEL_PANTHERCOVE_X,	NULL),
 	{}
-- 
2.47.1

