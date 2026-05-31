Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D5131E859;
	Sun, 31 May 2026 19:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780256806; cv=none; b=QKXr44JgAhxAl0SpSWwaB75pHgi687+Qz2/BACjUkiwcHGtNNvyPn2DgCO8KvsWkM9SlE4DveoiW4Z2HO1pO9GcBvM13ze7SAHnRj1GLeYqPPQlMogrcK6BVZDuBIFVaMUOXp8svJlsfgm2hLuQpWaajPUzQWvbQchUpSPOk6lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780256806; c=relaxed/simple;
	bh=o0TyZGlVRFEQKlw1ffUQ8orRDEyaavfx/H8mCMZaym0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P/IJvAbRmWfH4qZ93r7i+vOVN8wvUgTqsVkh2snohIunlgdWvclXSdnIy8xoxXe4qn5fCI8mP6xF/kcswmKm+fPucBW4OzsyIMQjh8Lq9DjQh1DTlkcQJiDGeWQ1eXdY2eeeL0j0vMS11qdPHmObV84LvJqSKRUw9aP4Wms/DP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPRdcels; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPRdcels"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780256795; x=1811792795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o0TyZGlVRFEQKlw1ffUQ8orRDEyaavfx/H8mCMZaym0=;
  b=nPRdcelsEvvW/NwVM24gjUN+iKBFXwCVmgcVaeHy9m+p8iUaqdnBgvUi
   SHjLEcPJWpBDmhoeiKVwZKPcbVidhOf0ennTRcW68i7x2MBi7q3CO+7+s
   GRpzpEWNcarGTTF5yy5DkL7KFAw92cJhaq+IclRTCMoIWvsyJNez6MHiS
   X9BsY1WSpw/mqIldU+JH7bBoMXoA431SWtdsyHqpzyBr9pRSIbzC40Wfc
   WfxAkpZXmXmlet5UPjCTzCw09cJ03TYCszC/9E6l5axHeYelvXSrvM8+a
   YyqRC9aBOLZ8BL2wjGgcHJgKdsAaNJWgRo9p66KzDlUsv/xc2ugM7aVzH
   Q==;
X-CSE-ConnectionGUID: dQmxCztSQCSIuX2sF9HGEw==
X-CSE-MsgGUID: x8EuXLZAQVOHyxMUJ4QF0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80751290"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="80751290"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:25 -0700
X-CSE-ConnectionGUID: AhGNfwkuQBW7GGy6dtNnhg==
X-CSE-MsgGUID: iCpUf43DT4e1EWnMbvsUUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="247363897"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:25 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v6 07/15] platform/x86/intel/pmc: Add PMC SSRAM Kconfig description
Date: Sun, 31 May 2026 12:46:09 -0700
Message-ID: <a1ca21b325618aee88c7f5fcf2a9c30a29425d55.1780248804.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780248804.git.david.e.box@linux.intel.com>
References: <cover.1780248804.git.david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Add a proper description for the intel_pmc_ssram driver.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
V6 - No changes

V5 - No changes

V4 - No changes

V3 - No changes

V2 - No changes

 drivers/platform/x86/intel/pmc/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/Kconfig b/drivers/platform/x86/=
intel/pmc/Kconfig
index c6ef0bcf76af..e9012b703918 100644
--- a/drivers/platform/x86/intel/pmc/Kconfig
+++ b/drivers/platform/x86/intel/pmc/Kconfig
@@ -28,3 +28,14 @@ config INTEL_PMC_CORE
=20
 config INTEL_PMC_SSRAM_TELEMETRY
 	tristate
+	help
+	  This driver discovers PMC SSRAM telemetry regions through the PMC's
+	  MMIO interface (PCI) or ACPI _DSD properties and registers them with
+	  the Intel VSEC framework as Intel PMT telemetry devices.
+
+	  It probes the PMC SSRAM device, extracts DVSEC information from MMIO,
+	  reads device IDs and base addresses for multiple PMCs (main, IOE, PCH),
+	  and exposes the discovered telemetry through Intel PMT interfaces
+	  (including sysfs).
+
+	  This option is selected by INTEL_PMC_CORE.
--=20
2.43.0

