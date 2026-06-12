Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044F537CD41;
	Fri, 12 Jun 2026 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298138; cv=none; b=mN1RKq8synNXev7c547LfrluruBjtZx28y+YW+mGG8Gxnef2QFZmP1fUU5pRW6ynoq9ilYmO7j51MO8WxD1ugwTduykL3h8q0CCtQd8Eanorh5qz6aDGAlIi/T84fmqRVopqiBvekR2xXK4TT5O1vvk1hL9R6Prt8Yu61+fXZr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298138; c=relaxed/simple;
	bh=gCGq2m2rNffR04xAjs4JT6Z+nzMKn81SMaR9yM/ABMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JxZeUphwqeWVzOSEjrjAoDvHzJkqIGQvNNhG2+eBnIr95HbpehGNahtqKEz3sZ0OLUpOYYqlCZ1ZNGDXCJ1W2BbiXB10lHVXbDLL0JN7ECuybP/Sfu3zeYRwgbkFsm4Zl4lUdFad9EUuQ8Q3CuluZSEmW51c1c1tn+6Ly6FD7ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HP3X0kCz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HP3X0kCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781298138; x=1812834138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gCGq2m2rNffR04xAjs4JT6Z+nzMKn81SMaR9yM/ABMw=;
  b=HP3X0kCzlNAB4w329oIKhg+5HP2xn7r5SqJwbFJTR+XeknbSrjos+KoE
   K76RKig/nVYaomAa9YgNlco/zfbRV6oaAEHVpejewUMwucpMqS0gjXI5v
   Aaf23gQBghReDyQ6EFquy2QUBm3cEgN9rs+/UGRjV9g4q5ps2moKyggrO
   tBhUkeX/xajudm/W8slNq5Xxf4xuX74YeS7tEVayEUu2qBi/JirqkT+zv
   f4yL7SgQouqezJVtyWsCmRxhfuSvciCn1u29yoo9vVO8qEB68yglAWDpc
   Gm1Cf60L9M/FU1vrIX/C4HaukqY9zRRu7Mylg0y7Vp07aq6JoiYRUM+gO
   Q==;
X-CSE-ConnectionGUID: x4QEklBzTFOOukZ+e1It+w==
X-CSE-MsgGUID: QE7hVB8ISFaHfDwe3Dp8jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86037989"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="86037989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:13 -0700
X-CSE-ConnectionGUID: +HHSI1F8TpSWoQUnyR1Mwg==
X-CSE-MsgGUID: +AKaD6HeRHKR3pmuVUMCrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="250832865"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:11 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v8 07/15] platform/x86/intel/pmc: Add PMC SSRAM Kconfig description
Date: Fri, 12 Jun 2026 14:01:48 -0700
Message-ID: <bd7ba2f98450751af1de054dac0469acc1138513.1781294741.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781294741.git.david.e.box@linux.intel.com>
References: <cover.1781294741.git.david.e.box@linux.intel.com>
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
V8 - No changes

V7 - No changes

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

