Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3406E35CB60;
	Thu, 11 Jun 2026 04:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152500; cv=none; b=iAR/gsp54SJ3r5hdnOPNEK2GO16ib+dSqLPjZ1DZ6Z+njQkVWsgbC9B33+2hDM76b6IGhtFyfO8wgNztjlVqe3y5/uhqg39Uo0acn6EXC/kLXdzsyf4xZaAiqWxbUiWG+VBjeF2AksaWhil3Pq6rymSvaH8gBt+EADEwpSz7DuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152500; c=relaxed/simple;
	bh=q47zlMjm5G81/GJZdRphTeSzcHHzqjkUqUIKpwp3oQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YCkjRpfKtl01xRbQLWMbIOtsDfePsgia2bDlG/QGxneYekfZUvUsqIMDMV35GGvuVyCU6RAzwXOLBSO3mANymxfdoSczj9sO0Ym2B7AbtRBAg/YojfnIzK6KL5gbIoSnXEZKKZbNQnLspspOVx1Hl58HQPnY7EwEmVaY9494Iz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKP7gagh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKP7gagh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781152498; x=1812688498;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q47zlMjm5G81/GJZdRphTeSzcHHzqjkUqUIKpwp3oQg=;
  b=TKP7gagh5PFEwY76kB7P9J1s7Pp0wGsZm+CIlctRd/G7GmienFtCJU9J
   Q/qDLWErrcRYVQYTwSniDJpDQxZ5OfxfufrHLQlcWOjGY4tpJlQHOSPOh
   63vkyVEpyRwa3ibokBHT4XiP6fkPtlRBNYCQUazMJQCttM0OUHh+Q5RgJ
   sjndAmiKcdfv7b5KbQyLCYDocxNPT1c8VfPcG4cPrCBIzC0SIH+ILKHz3
   QPufZ9Y7XIchJD0/HreiQcwbYKQZ7ti00DcPxKtDbgd6AOEXiz9doAmjc
   Z1+dqai1k+eL8IvJ1QD+RKB4vsfNnv4bZ+3Cvg80R+j7cPNoKnZexY90J
   A==;
X-CSE-ConnectionGUID: uSYzGP4AQHeeHBqPR74Euw==
X-CSE-MsgGUID: TkQpHyB9Raq/0WLLSyxQYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84531013"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="84531013"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:55 -0700
X-CSE-ConnectionGUID: iDrbeAuTSzqpndoHlVZKeg==
X-CSE-MsgGUID: +wCX9kWfR3KZ1UBzE95zoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251468351"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:54 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v7 10/15] platform/x86/intel/pmc/ssram: Add PCI platform data
Date: Wed, 10 Jun 2026 21:34:38 -0700
Message-ID: <7b0fe1a86d9292c15bae7d88315e64f5fa4b73bf.1781146840.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781146840.git.david.e.box@linux.intel.com>
References: <cover.1781146840.git.david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add per-device platform data for SSRAM telemetry PCI IDs and route probe
through a method selector driven by id->driver_data.

This is a preparatory refactor for follow-on discovery methods while
preserving current behavior: all supported IDs continue to use the PCI
initialization path.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V7 changes:
  - Changed pmc_ssram_telemetry_pci_init() to return 0 in the tail success
    path after secondary PMC probing (Ilpo).

V6 changes:
  - Reordered from v5 patch 12 to maintain logical flow before probe
    state refactoring.

V5 - No changes

V4 - No changes

V3 - No changes

V2 changes:
  - Added missing <linux/device.h> include for dev_dbg() usage in probe

 .../platform/x86/intel/pmc/ssram_telemetry.c  | 71 +++++++++++++++----
 1 file changed, 57 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 1deb4d71da3f..05f213aa108f 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -6,6 +6,7 @@
  */
=20
 #include <linux/cleanup.h>
+#include <linux/device.h>
 #include <linux/intel_vsec.h>
 #include <linux/pci.h>
 #include <linux/types.h>
@@ -24,6 +25,18 @@
=20
 DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_=
T))
=20
+enum resource_method {
+	RES_METHOD_PCI,
+};
+
+struct ssram_type {
+	enum resource_method method;
+};
+
+static const struct ssram_type pci_main =3D {
+	.method =3D RES_METHOD_PCI,
+};
+
 static struct pmc_ssram_telemetry *pmc_ssram_telems;
 static bool device_probed;
=20
@@ -69,7 +82,7 @@ static inline u64 get_base(void __iomem *addr, u32 offset)
 }
=20
 static int
-pmc_ssram_telemetry_get_pmc(struct pci_dev *pcidev, unsigned int pmc_idx, =
u32 offset)
+pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_i=
dx, u32 offset)
 {
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram =3D NULL;
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =3D NULL;
@@ -109,6 +122,20 @@ pmc_ssram_telemetry_get_pmc(struct pci_dev *pcidev, un=
signed int pmc_idx, u32 of
 	return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
 }
=20
+static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
+{
+	int ret;
+
+	ret =3D pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_MAIN, 0);
+	if (ret)
+		return ret;
+
+	pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_IOE, SSRAM_IOE_OFFSET);
+	pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_PCH, SSRAM_PCH_OFFSET);
+
+	return 0;
+}
+
 /**
  * pmc_ssram_telemetry_get_pmc_info() - Get a PMC devid and base_addr info=
rmation
  * @pmc_idx:               Index of the PMC
@@ -151,6 +178,8 @@ EXPORT_SYMBOL_GPL(pmc_ssram_telemetry_get_pmc_info);
=20
 static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct =
pci_device_id *id)
 {
+	const struct ssram_type *ssram_type;
+	enum resource_method method;
 	int ret;
=20
 	pmc_ssram_telems =3D devm_kzalloc(&pcidev->dev, sizeof(*pmc_ssram_telems)=
 * MAX_NUM_PMC,
@@ -160,18 +189,25 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *=
pcidev, const struct pci_de
 		goto probe_finish;
 	}
=20
+	ssram_type =3D (const struct ssram_type *)id->driver_data;
+	if (!ssram_type) {
+		dev_dbg(&pcidev->dev, "missing driver data\n");
+		ret =3D -EINVAL;
+		goto probe_finish;
+	}
+
+	method =3D ssram_type->method;
+
 	ret =3D pcim_enable_device(pcidev);
 	if (ret) {
 		dev_dbg(&pcidev->dev, "failed to enable PMC SSRAM device\n");
 		goto probe_finish;
 	}
=20
-	ret =3D pmc_ssram_telemetry_get_pmc(pcidev, PMC_IDX_MAIN, 0);
-	if (ret)
-		goto probe_finish;
-
-	pmc_ssram_telemetry_get_pmc(pcidev, PMC_IDX_IOE, SSRAM_IOE_OFFSET);
-	pmc_ssram_telemetry_get_pmc(pcidev, PMC_IDX_PCH, SSRAM_PCH_OFFSET);
+	if (method =3D=3D RES_METHOD_PCI)
+		ret =3D pmc_ssram_telemetry_pci_init(pcidev);
+	else
+		ret =3D -EINVAL;
=20
 probe_finish:
 	/*
@@ -184,13 +220,20 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *=
pcidev, const struct pci_de
 }
=20
 static const struct pci_device_id pmc_ssram_telemetry_pci_ids[] =3D {
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_MTL_SOCM) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCS) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCM) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_LNL_SOCM) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_PTL_PCDH) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_PTL_PCDP) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_WCL_PCDN) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_MTL_SOCM),
+		.driver_data =3D (kernel_ulong_t)&pci_main },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCS),
+		.driver_data =3D (kernel_ulong_t)&pci_main },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCM),
+		.driver_data =3D (kernel_ulong_t)&pci_main },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_LNL_SOCM),
+		.driver_data =3D (kernel_ulong_t)&pci_main },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_PTL_PCDH),
+		.driver_data =3D (kernel_ulong_t)&pci_main },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_PTL_PCDP),
+		.driver_data =3D (kernel_ulong_t)&pci_main },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_WCL_PCDN),
+		.driver_data =3D (kernel_ulong_t)&pci_main },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, pmc_ssram_telemetry_pci_ids);
--=20
2.43.0

