Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760D337F00B;
	Fri,  1 May 2026 23:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677066; cv=none; b=pxJ7cxZGMItpZC4rWmORwYYR5soqRkiXQ5abbsKcS7+9LhW3XkPSIlj2GqR5xJiJQNMV3NcXsgGSQCm1LqyQJAWAx8n1a7FAMwZJy/BYnEDlYHmRTWJiC2K/ar8JEFKTGWKl68BrIMoZlZc0idsuIoxD7zUOYvyc95GetveyRhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677066; c=relaxed/simple;
	bh=BXisRw2z0h1rOLdPciBxTTS6tcRtuGUqVui0lWtRKs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SH1j/c5NP830aXmjf0r0ZnYdN9Pp3qtxlRa3fHbAvVrRHcrs/AYxaXMSUrrA+oATmd72l/kiNlKRlXTci0xQNAdpS8UZnU5nn3P1M67TqsigdR8ep7wForqbm5dbASmCIRzi7ZffhE5dWwmPaJBAlu3lrEg0aeUzh8MhE8+702g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clH4B2Rc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clH4B2Rc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677064; x=1809213064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BXisRw2z0h1rOLdPciBxTTS6tcRtuGUqVui0lWtRKs0=;
  b=clH4B2RcCwU1t0ZR++FqCXBZu11q8I6Ukg/jjfU5I+Xq7UT1e6ejuBaH
   9vyxUDr+Gg6nPtA2pYPEacrBRFcpLZK/E4tDZJ0MZ+7LulpH8bKE9GofR
   7yqbEU5E/YhyEEr3I+ymj8PlZUdLdBKX3TE/RK+4tCKAxDcO0ZomlrI89
   g+7+W779a2GjAW3s7w33u9/pdVbNENXS+gjH8g7HZpfWRFdzFk4BMjRjy
   xwSdySTtV0DgPGr760rDnFqtztzGrA0BfZW0jYg7+RbX8e5A/n5tMQUw4
   bxwZJCiwNjb60aGbQEzS/bcR+xo4NvpLVg/SlIFR6ffD2Sm5azZXPWlRP
   Q==;
X-CSE-ConnectionGUID: 5/49A3ALTZuc3OTQYHnpjg==
X-CSE-MsgGUID: nnJV7lewQ/ibJmf7voBmEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740143"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740143"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:00 -0700
X-CSE-ConnectionGUID: IaoAa0/xTKWjUUztBb0c9w==
X-CSE-MsgGUID: g085XIGjRyy9HeziTj0xrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948961"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:00 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 07/16] platform/x86/intel/pmc: Add PMC SSRAM Kconfig description
Date: Fri,  1 May 2026 16:10:44 -0700
Message-ID: <20260501231054.3890305-8-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501231054.3890305-1-david.e.box@linux.intel.com>
References: <20260501231054.3890305-1-david.e.box@linux.intel.com>
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
V3 - No changes

V2 - No changes

 drivers/platform/x86/intel/pmc/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/Kconfig b/drivers/platform/x86/=
intel/pmc/Kconfig
index c6ef0bcf76af..0f19dc7edcf9 100644
--- a/drivers/platform/x86/intel/pmc/Kconfig
+++ b/drivers/platform/x86/intel/pmc/Kconfig
@@ -28,3 +28,14 @@ config INTEL_PMC_CORE
=20
 config INTEL_PMC_SSRAM_TELEMETRY
 	tristate
+	help
+	  This PCI driver discovers PMC SSRAM telemetry regions through the
+	  PMC's MMIO interface and registers them with the Intel VSEC framework
+	  as Intel PMT telemetry devices.
+
+	  It probes the PMC SSRAM device, extracts DVSEC information from MMIO,
+	  reads device IDs and base addresses for multiple PMCs (main, IOE, PCH),
+	  and exposes the discovered telemetry through Intel PMT interfaces
+	  (including sysfs).
+
+	  This option is selected by INTEL_PMC_CORE.
--=20
2.43.0

