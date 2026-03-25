Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB19280A51;
	Wed, 25 Mar 2026 01:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403311; cv=none; b=pzaiL5MZdBOKUunl8u06ZEeU/zux7OeE2+c3rxxBfxXGXyyugVU6E0WwYlwtoACWJXYhYxPkCC5LkEsE/Cxr3l5ebPaOrwnh2HEyL1+QZafs1dTvGus4X8CfOk9XlHieUcHVRWbw6Ufa1VMV7jETsdaQLWQ8F8MbrICXC5Gxsfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403311; c=relaxed/simple;
	bh=Cw75RS+wl+j/4qp8S6wFnV+OvAUsieKdCCH1S+pIeuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wnp78NSBs5tuLK7t9SqX0grb0pT8J5vcOp+9EGaEoJmr1S/wC7Sx4S0oe9Bcgs3aEKIEdHX2biPvoYveaG7zNVrH3g0L3V1pRpEFX9UXnujH8NJ+DhqUZKbjAtpHMf6WP3RjeGABHOjc9aK02siRNjdssCd3whgaSQ/svVYm1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmCAXEKg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmCAXEKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774403310; x=1805939310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cw75RS+wl+j/4qp8S6wFnV+OvAUsieKdCCH1S+pIeuw=;
  b=OmCAXEKgFIYfLx4gpXwh+KWaWb+RT9+TooEtMfRgs/NMMB4Fw8RnReEn
   KgvxSKEHmEt+bDic8JSUS5yux/44ssNa5XLg7xTx2wLNLPkhxowNsnXjC
   clu6qZcXx1GEq3EKlwC4paM33BCeidH4smCgRabpgp/EcQgbvnofkf1b3
   UH7S9Gs+hDOoprGtxHZVd7utyftdt0SpuadV46M6THmwK4s8GK9uR6XWi
   q4V/rpcJdPHyR6kS3nZ19kZS7Jd7+GoqDDNPIBYpK8tkv42gFO6in18tQ
   Hn7UzNE5vLxfwkQw1KhfWvOp423txKktkpSWhIyepZozGPmsokhzEdMvD
   w==;
X-CSE-ConnectionGUID: 1+ilh/PXS+y6G34THssRnw==
X-CSE-MsgGUID: iSMIMkJRQOS0t5TbL3ozmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75317504"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75317504"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:28 -0700
X-CSE-ConnectionGUID: SIZn8mcRTUOaZ+qgzLWoNA==
X-CSE-MsgGUID: ySPSiCOZTKyOlT9dT7AjxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221190785"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:28 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2 07/17] platform/x86/intel/pmc: Add PMC SSRAM Kconfig description
Date: Tue, 24 Mar 2026 18:48:09 -0700
Message-ID: <20260325014819.1283566-8-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325014819.1283566-1-david.e.box@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a proper description for the intel_pmc_ssram driver.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

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

