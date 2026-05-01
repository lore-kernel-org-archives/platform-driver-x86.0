Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E666F37E2E4;
	Fri,  1 May 2026 23:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677085; cv=none; b=qbfiBYy2/JXO3jthk30lV7W14Be1NxW6869MCxCTHiPNMrozWFrrRmxy+6HyLzYkccpI7T28yXFqMISm5B1+jfdyIbkjyMrW1qD2IWqAvY/oIbXxiSRYtuaxtvQR0gp24H3qGjR5L4mA+77b5Hr2zDNi/weYP7yMIED4Qw9DbmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677085; c=relaxed/simple;
	bh=0emidQ8REFBfU4xwwKcTN6kfgE3latxvUZJ+eIQEHrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxjpSzMXlZo44jSON1PXewoum76+nH2QrxH1z+j56LtUFbayCpdKeoSWj1xYwWpKHcqgXjpV/S9qpo7ITWWnvgOOxfp+fLGEKkTWpISj9uCqxF6vtmfLgExxteVNFauAPYqwQTyt6Rj7ZmqtA3oEiP6HedFzpkXjuSKayK+dcwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qgp+6Yrq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qgp+6Yrq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677084; x=1809213084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0emidQ8REFBfU4xwwKcTN6kfgE3latxvUZJ+eIQEHrg=;
  b=Qgp+6YrqF9jgG2tkXb1JglHM7edK5UrQOlyoEa9y5izlIbvy+7aDj5XT
   /MATG5d+ItpJcDhusME1Si6JjNptHcVkWupXEk7yznvItOmAKNKJHMspU
   mkuV26oTUXueiSgG7hIh5oWE25skUnfjHL3nMMvww0C0OSuPvOjccAjwM
   D2MZvJOFHhryeOKK4xlMpBQ6sUmD4T+SEKgEkClt4iEsJaGZJtJHg8cpw
   N7EKjV2+tpmsePQKumFws55TFabe1rqziS+isOIGbsy7Qkf9pyQD5PDVb
   xkGLWTkI5iGSQzhiTEr8vrAffTiPrWu2gZws4M9ygc3ERb8+QZty/Rq6B
   A==;
X-CSE-ConnectionGUID: EVwHpcxQQhCHF6uNF49f9A==
X-CSE-MsgGUID: YkU9Uk0DRgSZcfUfK9KAFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740157"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740157"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:01 -0700
X-CSE-ConnectionGUID: lypfefULRYKHnubYxL0KCQ==
X-CSE-MsgGUID: Jh0aybO8Q/qDewMCiivL5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948969"
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
Subject: [PATCH V3 14/16] platform/x86/intel/pmc/ssram: Add ACPI discovery scaffolding
Date: Fri,  1 May 2026 16:10:51 -0700
Message-ID: <20260501231054.3890305-15-david.e.box@linux.intel.com>
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

Prepare the SSRAM telemetry driver for ACPI-based discovery by adding the
common initialization path and selection framework needed for both PCI and
ACPI resource discovery.

At this stage, existing supported devices continue to use the PCI path.
This change lays the groundwork for follow-on patches that wire platform
IDs to the ACPI policy path.

Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V3 - No changes

V2 changes:
  - Fixed cleanup patterns using __free() attributes
  - Addressed Ilpo's recommendations for safer cleanup.h patterns

 .../platform/x86/intel/pmc/ssram_telemetry.c  | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 597bfb7ad822..a253903b8ea3 100644
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
+	u32 (*acpi_disc)[4] __free(kfree) =3D pmc_parse_telem_dsd(dsd, &header);
+	if (IS_ERR(acpi_disc))
+		return PTR_ERR(acpi_disc);
+
+	info.headers =3D headers;
+	info.caps =3D VSEC_CAP_TELEMETRY;
+	info.acpi_disc =3D acpi_disc;
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

