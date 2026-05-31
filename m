Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE16A32B12B;
	Sun, 31 May 2026 19:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780256808; cv=none; b=W6xA02HX30fuoaNezbIox/bX+lli47qcUhnjCWb3LNdbTLVDCLiGBSdgascXm/m/7rOQ7eMfFbv9E8a7Ij8uZ7uQTnN5FuoJzLwdXV1pQFcu42M4LchJ8B1YxAF2LnsQhM6Vr4BsOxrOdxo6468Go21rysrymz/0K7P7yya7Otw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780256808; c=relaxed/simple;
	bh=h+IKv9U4o7YQoZ/EC/BUnhtw3+GNZbQz4pf0mZHWabo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBNqN8O7fM2rYttgzLNfXAm+xRcvqRZoh4740K6ZkE0qbW0sl6KfuMNk09Wu6tPC6T1IwpLmMBfjkZI/H3gsjYsSbHgdNKFQVGr6Sw0Kcdn+PmdXjjw2NkngcA9Kq8VlPouSq9uIE1HE3C8R6k5iCLTcdbywhRWiJCCv0dSYQP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbMVRZdh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbMVRZdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780256807; x=1811792807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h+IKv9U4o7YQoZ/EC/BUnhtw3+GNZbQz4pf0mZHWabo=;
  b=GbMVRZdhcCYGnPL8lTE7NlmkrOi7IVqDbVkGInKNPtvCaaEh1dUTCme9
   bSI+RSTyUG8JG2TJTea8w5E7WDyJkuvtmZiL3iTzsFCjlMyWYIn+qoZiq
   dnX8+XRdQoIK92GId5kzfnPeYQgIBzqcd70fyA+HxCFXPIuS0OaJaQXVV
   XZZN7+VQCx9l8bogzJYFtrSTm8SscNKJ73XDssFi6OQh3jNImdGQA51uD
   NuFiV9UabjMBnjmhKNjXh63JGmMU56DTpyQHUFjBAofTiDbS445kN46SN
   GPN+KrmhkqvYJlNGX0IaNAUBxCNeU3P+jzR0oJOvqBvQAH5MeTNdV/MKE
   Q==;
X-CSE-ConnectionGUID: SyYw/SMARVqh9CFfntEzAw==
X-CSE-MsgGUID: 74jZWFDhS8+ZCP4kOYKxdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80751300"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="80751300"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:25 -0700
X-CSE-ConnectionGUID: aQu2Hu40RBKpOI4GeVIShA==
X-CSE-MsgGUID: Z+QH4sLYR5OjbtZZxt940A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="247363900"
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
Subject: [PATCH v6 10/15] platform/x86/intel/pmc/ssram: Add PCI platform data
Date: Sun, 31 May 2026 12:46:12 -0700
Message-ID: <cc2c6bd3f4b72048022dc3fc4a9e64a1992fadf6.1780248804.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780248804.git.david.e.box@linux.intel.com>
References: <cover.1780248804.git.david.e.box@linux.intel.com>
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
index 1deb4d71da3f..3d1f5a17903b 100644
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
+	return ret;
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

