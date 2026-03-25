Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14A3296BBA;
	Wed, 25 Mar 2026 01:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403314; cv=none; b=LF3nigkD6YbX38VfhJV5yT2cesVJ1abio9Q3OTxeJDKtz+yJONB4c/XStLRHNFFlXs4jRsTv/0lAGau1DfoUv/+NWbhJ12r3FciWKbHlbV8W09oNQINjWoc66BBHpUMPLYynEPh0xrgSbU6HTG+QoSZiZV/70pMvfkJfhH3jqoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403314; c=relaxed/simple;
	bh=gmq8eVGTXbj2cwLbvfzFGPSYMeb8z2WsEpbuda+cbT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p94ut5GWLn3ieCJCsrulzZSKmSZhvsekgKKvhBAPDEL+k+u28S4snqKPn+9Ps1xqXpjqyNe1BwvHrMYMerPqQe5RQTXynq10n8yXb1GFAhhoW/pnvtj0cLbx3aYHxs7xPmaz5jztwL5E0sBQXAWuGqf5eqcziV+AtKe0w4piS70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBBcokyH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBBcokyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774403313; x=1805939313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gmq8eVGTXbj2cwLbvfzFGPSYMeb8z2WsEpbuda+cbT4=;
  b=BBBcokyHnyyvzEIg2+WZs9dOxGVxao7X1ppCWE2/mdunW5QpuwBRzZBZ
   pvellidSml6uRnRlesSSAzk7F/nIBtBRV1OavD6vLOc2j334Ep/3b4w0O
   1eV/0D1657yvMWPK8LQars0z+62xMMK9v3Nula0ZWVmhZADu6oaFLPraO
   vfSYRk9DHgNTMUvookhplMVyewvF8pqTld4ZUN8r2Kl5X2MVqzMYuPRqe
   yAH+NRdLAb3pIiShcHfkYGY0NTPV2zU0qjvvZFFnZnIezaO5CTIC2L9gh
   VDHLtIrvNHg6RX35dqu0pRt9m0S/ZOce7PxDzVSfkJ0x/sn6KmZGMci4i
   w==;
X-CSE-ConnectionGUID: oKn01dSvReWkNZ/Ph22lyg==
X-CSE-MsgGUID: hPY1IiMcTpmLLGUO7u98dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75317520"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75317520"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:32 -0700
X-CSE-ConnectionGUID: crLZAcXyRCmqx+4zepj0eg==
X-CSE-MsgGUID: Hsh8plc+RUyp2WM34fs1YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221190794"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:31 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2 12/17] platform/x86/intel/pmc/ssram: Add PCI platform data
Date: Tue, 24 Mar 2026 18:48:14 -0700
Message-ID: <20260325014819.1283566-13-david.e.box@linux.intel.com>
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

Add per-device platform data for SSRAM telemetry PCI IDs and route probe
through a method selector driven by id->driver_data.

This is a preparatory refactor for follow-on discovery methods while
preserving current behavior: all supported IDs continue to use the PCI
initialization path.
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

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

