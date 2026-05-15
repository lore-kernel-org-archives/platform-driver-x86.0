Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE42701BB;
	Fri, 15 May 2026 00:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778804515; cv=none; b=RQhgmJMWJeCyB7jj0R16ndlm4o94iuZQtJI/8/UpirmAV33XFPE4PVGAcLQZ1X+8+3h4FkGqc1HlRQLxkcE/j/HJNZ24mMlh+Nl0yU05FQ5aIhBUlLG4dFVxJzWXCOV6ihzLQoDT8+LuaZj82oMcZhWhg1Ng6J9AmjOZmZ0cI4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778804515; c=relaxed/simple;
	bh=PpVpiLghN5RQZSoRfBpEdIewj3QHqVZfwy2jpbfYti0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkECHzaQDYh/oCwXhAmtOfm6W55Xotvdd03j95W2Ln0d0WJMb6dcO1CNsaFvdYhoZJ/DHmHum6sBLw1bDyzR/QgYNhPNher6RgQtS6IEqvXdXlG3SqhBJwnEgnQvTN2dR9qvdiAyevT5hJUFurFqYJ5X17DlZnAu//Smp5isNEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rk81bjED; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rk81bjED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778804513; x=1810340513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PpVpiLghN5RQZSoRfBpEdIewj3QHqVZfwy2jpbfYti0=;
  b=Rk81bjEDT59NHjVEdTVp0M7y7bNia3P+OPhRVm11QU2C/bGN+LZEDQXP
   RKYL3diuL3MK39h/7bgFLh9qe7xE7frEA67e2UYc3DFcz75Bp5qmejSwp
   mv3udNbKLWV7dlOBJ385l9YwylgvtfbCKl0LhORvCz1nXVLF2xANVzkmZ
   PIu65R4aVVN5PWyR4fp3BjjbrHRbxDtsl5FkoAEpsoitnhdZkXBQGNyva
   xcTrqAdpTsxcDEbRhKEsLCKW5Cfcuh9p5KWN3iF29xn1tfVG8XpJDzt6F
   pqaNFrjYdFV9db3pX/72bGsK2UBByyVTLaEPuRF/YxfvhbFFBq2EpX+Gc
   w==;
X-CSE-ConnectionGUID: E7GB0F+7RC+EztDsS74Iuw==
X-CSE-MsgGUID: 9uAlYc5iQK+0nE51XovYGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78895182"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="78895182"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
X-CSE-ConnectionGUID: 3I7NZhzaRqmftHio0s67/A==
X-CSE-MsgGUID: I+5VYixDQL6DM7xBSq9FqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242879087"
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
Subject: [PATCH v4 14/16] platform/x86/intel/pmc/ssram: Add ACPI discovery scaffolding
Date: Thu, 14 May 2026 17:21:21 -0700
Message-ID: <20260515002130.701457-15-david.e.box@linux.intel.com>
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

Prepare the SSRAM telemetry driver for ACPI-based discovery by adding the
common initialization path and selection framework needed for both PCI and
ACPI resource discovery.

At this stage, existing supported devices continue to use the PCI path.
This change lays the groundwork for follow-on patches that wire platform
IDs to the ACPI policy path.

Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V4 - Replaced local raw ACPI discovery pointer type u32 (*)[4] with
     acpi_disc_t in SSRAM ACPI initialization path.

V3 - No changes

V2 changes:
  - Fixed cleanup patterns using __free() attributes
  - Addressed Ilpo's recommendations for safer cleanup.h patterns

 .../platform/x86/intel/pmc/ssram_telemetry.c  | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 597bfb7ad822..1a9f1e67cbe1 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2023, Intel Corporation.
  */
=20
+#include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
@@ -29,14 +30,17 @@ DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *=
, if (_T) iounmap(_T))
=20
 enum resource_method {
 	RES_METHOD_PCI,
+	RES_METHOD_ACPI,
 };
=20
 struct ssram_type {
 	enum resource_method method;
+	enum pmc_index p_index;
 };
=20
 static const struct ssram_type pci_main =3D {
 	.method =3D RES_METHOD_PCI,
+	.p_index =3D PMC_IDX_MAIN,
 };
=20
 static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
@@ -149,6 +153,67 @@ static int pmc_ssram_telemetry_pci_init(struct pci_dev=
 *pcidev)
 	return ret;
 }
=20
+static int pmc_ssram_telemetry_get_pmc_acpi(struct pci_dev *pcidev,  unsig=
ned int pmc_idx)
+{
+	u64 ssram_base;
+
+	ssram_base =3D pci_resource_start(pcidev, 0);
+	if (!ssram_base)
+		return -ENODEV;
+
+	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =3D
+		ioremap(ssram_base, SSRAM_HDR_SIZE);
+	if (!ssram)
+		return -ENOMEM;
+
+	pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
+
+	return 0;
+}
+
+static int pmc_ssram_telemetry_acpi_init(struct pci_dev *pcidev,
+					 enum pmc_index index)
+{
+	struct acpi_buffer buf =3D { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_handle handle =3D ACPI_HANDLE(&pcidev->dev);
+	struct intel_vsec_header header;
+	struct intel_vsec_header *headers[2] =3D { &header, NULL };
+	struct intel_vsec_platform_info info =3D { };
+	void *dsd_buf __free(pmc_acpi_free) =3D buf.pointer;
+	union acpi_object *dsd;
+	acpi_status status;
+	int ret;
+
+	if (!handle)
+		return -ENODEV;
+
+	status =3D acpi_evaluate_object(handle, "_DSD", NULL, &buf);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	dsd =3D pmc_find_telem_guid(buf.pointer);
+	if (!dsd)
+		return -ENODEV;
+
+	acpi_disc_t disc __free(kfree) =3D pmc_parse_telem_dsd(dsd, &header);
+	if (IS_ERR(disc))
+		return PTR_ERR(disc);
+
+	info.headers =3D headers;
+	info.caps =3D VSEC_CAP_TELEMETRY;
+	info.acpi_disc =3D disc;
+	info.src =3D INTEL_VSEC_DISC_ACPI;
+
+	/* This is an ACPI companion device. PCI BAR will be used for base addr. =
*/
+	info.base_addr =3D 0;
+
+	ret =3D intel_vsec_register(&pcidev->dev, &info);
+	if (ret)
+		return ret;
+
+	return pmc_ssram_telemetry_get_pmc_acpi(pcidev, index);
+}
+
 /**
  * pmc_ssram_telemetry_get_pmc_info() - Get a PMC devid and base_addr info=
rmation
  * @pmc_idx:               Index of the PMC
@@ -189,6 +254,7 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pc=
idev, const struct pci_de
 {
 	const struct ssram_type *ssram_type;
 	enum resource_method method;
+	enum pmc_index index;
 	int ret;
=20
 	ssram_type =3D (const struct ssram_type *)id->driver_data;
@@ -198,6 +264,7 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pc=
idev, const struct pci_de
 	}
=20
 	method =3D ssram_type->method;
+	index =3D ssram_type->p_index;
=20
 	ret =3D pcim_enable_device(pcidev);
 	if (ret) {
@@ -207,6 +274,8 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pc=
idev, const struct pci_de
=20
 	if (method =3D=3D RES_METHOD_PCI)
 		ret =3D pmc_ssram_telemetry_pci_init(pcidev);
+	else if (method =3D=3D RES_METHOD_ACPI)
+		ret =3D pmc_ssram_telemetry_acpi_init(pcidev, index);
 	else
 		ret =3D -EINVAL;
=20
@@ -239,6 +308,7 @@ static struct pci_driver pmc_ssram_telemetry_driver =3D=
 {
 };
 module_pci_driver(pmc_ssram_telemetry_driver);
=20
+MODULE_IMPORT_NS("INTEL_PMC_CORE");
 MODULE_IMPORT_NS("INTEL_VSEC");
 MODULE_AUTHOR("Xi Pardee <xi.pardee@intel.com>");
 MODULE_DESCRIPTION("Intel PMC SSRAM Telemetry driver");
--=20
2.43.0

