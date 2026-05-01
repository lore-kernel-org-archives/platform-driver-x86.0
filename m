Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BD037E2E8;
	Fri,  1 May 2026 23:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677085; cv=none; b=t3ZnGwnfqu2QRIZOJlTVjN3K65R0L13rfaB2L4HXf/5yHzyytW1plqwF/B5Jc9pscvR7SGPv51pw/P46TXlE/augYxN5v1gHC03ePFR9ki0CORCmPRj9K4nAwR7BsTNDs9u0hK/EO2HdOBnv/QYEnVWT+MGWVXEhNuqWKtDxL/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677085; c=relaxed/simple;
	bh=qBWCLmei4jzwU5ywgj7EFgV0PJwvTRm0/TyVhXhL1G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nmjtb1IkLPuC1aPbTY6rObfZzORIccQ2ufHv1SXwrOB7c9TNZ3TV5qO7sggxuScEozQ54IodgXmK3brE5tkY0bB+A+kpfJVTEO3joUgkiG933KjT2wporoFKobH05158C7T0fcTpBlrHT0y8hu2hg5q/RJaiOLhMBYR+Nnur/Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijPPkAyn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijPPkAyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677084; x=1809213084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qBWCLmei4jzwU5ywgj7EFgV0PJwvTRm0/TyVhXhL1G0=;
  b=ijPPkAynoAkqblgVB4WEPT3GoNZ+FpftKDFg9ns2ha3CsrN3eBIc51t/
   BboDDFvH/odifG3vw7IaEojAQq7vd2OshPACatF+jOw0jBieTN2Xsn1UK
   g3/XJZwxdBJcgZg8dvozHgApuvqdK9KxS8g7s9mpkFs+QKj2OVgNNFg27
   1xuXN6yHRITH2cvVC86xG6UqmUHlQP+9EWbXSs+UxVnKmUz1eSmvocvz3
   gwPWEFpjSTENlcitX5uEvU1FfpPp35JaAReMLC3CKX/sPkkOK++lQ0X3m
   TEr3WLxMRx2maXNaxHiQy71SfCsqAd/vyDNocTJt7UyNY+kogjwcEyGaK
   w==;
X-CSE-ConnectionGUID: 0MC6elHxRY+XoywVAaGUYg==
X-CSE-MsgGUID: MC8PPYcUTBG4J4yK4hc2qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740158"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740158"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:01 -0700
X-CSE-ConnectionGUID: nTD82w9DQlyq7B+afuxUng==
X-CSE-MsgGUID: 9OiKplTXTySrULf46YyVgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948970"
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
Subject: [PATCH V3 15/16] platform/x86/intel/pmc/ssram: Make PMT registration optional
Date: Fri,  1 May 2026 16:10:52 -0700
Message-ID: <20260501231054.3890305-16-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501231054.3890305-1-david.e.box@linux.intel.com>
References: <20260501231054.3890305-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The SSRAM telemetry driver extracts essential PMC device ID and power
management base address information that intel_pmc_core depends on for core
functionality. If PMT registration failure prevents this critical data from
being available, intel_pmc_core operation would break entirely. Therefore,
PMT registration failures must not block access to this data.

Change the behavior to log a warning when PMT registration fails but
continue with successful driver initialization, ensuring the primary
telemetry data remains accessible to dependent drivers.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V3 changes:
  - Dropped the standalone cleanup-pattern patch from this refreshed
    series retaining the simpler ssram pointer flow requested in review.
  - Folded PMT-registration-optional handling onto that simpler flow
    with no intended functional change.

V2 changes:
  - Update commit message for clarity
  - Also apply the PCI telemetry path

 drivers/platform/x86/intel/pmc/ssram_telemetry.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index a253903b8ea3..9c3af822e262 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -109,6 +109,7 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev,=
 unsigned int pmc_idx, u3
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram =3D NULL;
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =3D NULL;
 	u64 ssram_base;
+	int ret;
=20
 	ssram_base =3D pci_resource_start(pcidev, 0);
 	tmp_ssram =3D ioremap(ssram_base, SSRAM_HDR_SIZE);
@@ -128,7 +129,6 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev,=
 unsigned int pmc_idx, u3
 		ssram =3D ioremap(ssram_base, SSRAM_HDR_SIZE);
 		if (!ssram)
 			return -ENOMEM;
-
 	} else {
 		ssram =3D no_free_ptr(tmp_ssram);
 	}
@@ -136,7 +136,11 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev=
, unsigned int pmc_idx, u3
 	pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
=20
 	/* Find and register and PMC telemetry entries */
-	return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
+	ret =3D pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
+	if (ret)
+		dev_warn(&pcidev->dev, "could not register PMT\n");
+
+	return 0;
 }
=20
 static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
@@ -209,7 +213,7 @@ static int pmc_ssram_telemetry_acpi_init(struct pci_dev=
 *pcidev,
=20
 	ret =3D intel_vsec_register(&pcidev->dev, &info);
 	if (ret)
-		return ret;
+		dev_warn(&pcidev->dev, "could not register PMT\n");
=20
 	return pmc_ssram_telemetry_get_pmc_acpi(pcidev, index);
 }
--=20
2.43.0

