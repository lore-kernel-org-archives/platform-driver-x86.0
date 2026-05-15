Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32968233134;
	Fri, 15 May 2026 00:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778804515; cv=none; b=H4vRlRXoUEZA2egRBSrbPJvwfg6ScrpWoYHwutxGMRIHph4F6TWZOwi+ZOVtEnPgRu0Ou+BDdMbWVFDB6Lwi4EBiEe9W0z+Gs8215wG9itEZ+RlMCa/i8mWB6eNlmxXDsUIhdwT+QJD3fFUDePrSkGXhI79eb6EKbkRaLBceycs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778804515; c=relaxed/simple;
	bh=SLuu8OXEll0E3xKhG0fgqCLsG9qrqc6xA/qLvAvuYL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jen0jSyVcug1Yhkx8RtpUhdPmuOYsuWfRVQaqAUEkf0kpMjb2mce6ISM3sa9s1BmK12wPWEWpBDt+RmDUf4dcV+n4l71+I8LlTh4rdgJhqJ1OOP4d15lZmUdMYBwDpDhtmKwNR34sWnwAt9kYjmW0z0ynsbhY/2VAq7rHKoOIJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hcm+PC5q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hcm+PC5q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778804513; x=1810340513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SLuu8OXEll0E3xKhG0fgqCLsG9qrqc6xA/qLvAvuYL0=;
  b=Hcm+PC5qBM2OhZn8wDuyK31oqeg1W53mwpcTJh7vecVFTqnUnb2ZGmVV
   m01YVbs1slMAebLM6aYdNn4hNGdRoyqh6K3xQUb5r0zn9kNwEGG/jCGVM
   SPW+/KA8Z3GDwYovzdQM7e/i1h/U4lMEO4GQ7/QXFhQUoSiT5PyqUIP9+
   Z1Vw0NSNFTlI2HaO2uzqAq2gUjj97aTUX0p2hj5NLEkVMVjpgOYlkHeMm
   F/OqHGzyN2RL4iBaawlhDVColVtgwDzCuUIKxlhLlXvrnUmBo6yKYY5Bl
   qN69pDQqWV+ZIjn2PixtI0C3atV57SFYtNkNZvQyZQUriGCDrPXnb3ZUt
   A==;
X-CSE-ConnectionGUID: qX4YzWDGTUSpACD5nUqpPg==
X-CSE-MsgGUID: xoQgTpTfQOqkoC8BoxtaZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78895178"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="78895178"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
X-CSE-ConnectionGUID: LvuS3vUbTWusiwsIJlA7nQ==
X-CSE-MsgGUID: c+vIwxgdT7OYA5R5VsMOHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242879083"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: y,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 12/16] platform/x86/intel/pmc/ssram: Add PCI platform data
Date: Thu, 14 May 2026 17:21:19 -0700
Message-ID: <20260515002130.701457-13-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515002130.701457-1-david.e.box@linux.intel.com>
References: <20260515002130.701457-1-david.e.box@linux.intel.com>
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
V4 - No changes

V3 - No changes

V2 changes:
  - Added missing <linux/device.h> include for dev_dbg() usage in probe

 .../platform/x86/intel/pmc/ssram_telemetry.c  | 70 +++++++++++++++----
 1 file changed, 56 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 779e84c724ac..6917a10cbc80 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -7,6 +7,7 @@
=20
 #include <linux/bits.h>
 #include <linux/cleanup.h>
+#include <linux/device.h>
 #include <linux/intel_vsec.h>
 #include <linux/pci.h>
 #include <linux/types.h>
@@ -26,6 +27,18 @@
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
 static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
 static bool device_probed;
=20
@@ -83,7 +96,7 @@ pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u64 s=
sram_base, void __iomem
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
@@ -118,6 +131,20 @@ pmc_ssram_telemetry_get_pmc(struct pci_dev *pcidev, un=
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
+	return ret;
+}
+
 /**
  * pmc_ssram_telemetry_get_pmc_info() - Get a PMC devid and base_addr info=
rmation
  * @pmc_idx:               Index of the PMC
@@ -160,8 +187,18 @@ EXPORT_SYMBOL_GPL(pmc_ssram_telemetry_get_pmc_info);
=20
 static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct =
pci_device_id *id)
 {
+	const struct ssram_type *ssram_type;
+	enum resource_method method;
 	int ret;
=20
+	ssram_type =3D (const struct ssram_type *)id->driver_data;
+	if (!ssram_type) {
+		dev_dbg(&pcidev->dev, "missing driver data\n");
+		ret =3D -EINVAL;
+		goto probe_finish;
+	}
+
+	method =3D ssram_type->method;
=20
 	ret =3D pcim_enable_device(pcidev);
 	if (ret) {
@@ -169,12 +206,10 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *=
pcidev, const struct pci_de
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
@@ -187,13 +222,20 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *=
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

