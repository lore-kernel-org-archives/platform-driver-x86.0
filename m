Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE23F303CAB;
	Fri, 22 May 2026 02:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416538; cv=none; b=V8IMoHDhKUu6KVbdo0z28DFLSrW3V2Se+dgjcEFtAwAA3ewjSGPZOUHCNORtBTJlqKrdaF/VKhIht0XWO2fmnv+hOBdqXXYEs5xJebb+jm4PJSnIapKJVyZoX8YF9a/XS8sz5mFrGQoZhm4DuAefqthnKqn7gcl8a+beJmWQk1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416538; c=relaxed/simple;
	bh=tmeJ+WXY0BWC6W/I2Hzy7tRHN3mPL3ta4fHoMj/2qmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLiXaMMQb5AvZllyX0vt5FZMrFkNFtyRjCaZnzo7/7r3sjiOtGnAJVAUYplgV/vNIxjJs3BthN8hzOAvopCGosRI1LAfZD4ifo9HJ78to3CKRMdlxzR5XI1PbyMl2GIAM2QU/282n4ADZAmE9V6Y0qR5okCcsEFWvS8DMwztAZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epUCvJf7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epUCvJf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779416537; x=1810952537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tmeJ+WXY0BWC6W/I2Hzy7tRHN3mPL3ta4fHoMj/2qmc=;
  b=epUCvJf7NdwrY/0qmkBkJUm7IDxhPuEnFQ7M+cJGkMCF/+n0ZwwTgTIH
   8nUmeX4PLP8nxBAq+6r12G02OMmj45eWnoGv7VvjF7ECVnI49OkKvgy4f
   ARMO3lSKmDi8ElbX4K969A0ZSxdvOdsL/TzshJhMmhKmf/TaaADy63Gk/
   Q/QNsXD7NCt8No7CjXCpv05ZwwjYjGV3FbvWYFSzKHNxHtajKy6hQQJT9
   twQ5o7ZgbiNRCE7+vhKcMFsBtMosbvbJSlN2/RoKSJg/SsDzMFaTKxJBR
   w47N6lgDLHp80aLG61XkiXug5/hSBcuFoMazPTMybAp6EbCwUYC8MLq7y
   A==;
X-CSE-ConnectionGUID: 9xKD0yeiSpSgzGS9C9qMZw==
X-CSE-MsgGUID: Ms4CF3fMRBiqJ6NmRmTDsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80400562"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80400562"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:22:01 -0700
X-CSE-ConnectionGUID: 8CD55Ya6QkmgoT4Fo5Y6pw==
X-CSE-MsgGUID: 9QRnOH6LTY2w0dxnh1jUrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236335390"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:22:00 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v5 14/16] platform/x86/intel/pmc/ssram: Add ACPI discovery scaffolding
Date: Thu, 21 May 2026 19:21:44 -0700
Message-ID: <20260522022147.4137494-15-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522022147.4137494-1-david.e.box@linux.intel.com>
References: <20260522022147.4137494-1-david.e.box@linux.intel.com>
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

Assisted-by: GitHub-Copilot:claude-opus-4.7
Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V5 changes:
  - Fix dsd_buf leak by moving the __free(pmc_acpi_free)
    declaration after acpi_evaluate_object() populates buf.pointer,
    and switched pmc_find_telem_guid(buf.pointer) to operate on
    dsd_buf so cleanup releases the actual allocation.
  - Split acpi_handle declaration from ACPI_HANDLE() assignment
    and placed the assignment immediately before the !handle
    check (Ilpo).
  - Reordered local variables in pmc_ssram_telemetry_acpi_init()
    in reverse-xmas-tree order (Ilpo).

V4 - Replaced local raw ACPI discovery pointer type u32 (*)[4] with
     acpi_disc_t in SSRAM ACPI initialization path.

V3 - No changes

V2 changes:
  - Fixed cleanup patterns using __free() attributes
  - Addressed Ilpo's recommendations for safer cleanup.h patterns

 .../platform/x86/intel/pmc/ssram_telemetry.c  | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 597bfb7ad822..ac330f7df649 100644
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
@@ -149,6 +153,69 @@ static int pmc_ssram_telemetry_pci_init(struct pci_dev=
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
+	struct intel_vsec_header header;
+	struct intel_vsec_header *headers[2] =3D { &header, NULL };
+	struct acpi_buffer buf =3D { ACPI_ALLOCATE_BUFFER, NULL };
+	struct intel_vsec_platform_info info =3D { };
+	union acpi_object *dsd;
+	acpi_handle handle;
+	acpi_status status;
+	int ret;
+
+	handle =3D ACPI_HANDLE(&pcidev->dev);
+	if (!handle)
+		return -ENODEV;
+
+	status =3D acpi_evaluate_object(handle, "_DSD", NULL, &buf);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	void *dsd_buf __free(pmc_acpi_free) =3D buf.pointer;
+
+	dsd =3D pmc_find_telem_guid(dsd_buf);
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
@@ -189,6 +256,7 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pc=
idev, const struct pci_de
 {
 	const struct ssram_type *ssram_type;
 	enum resource_method method;
+	enum pmc_index index;
 	int ret;
=20
 	ssram_type =3D (const struct ssram_type *)id->driver_data;
@@ -198,6 +266,7 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pc=
idev, const struct pci_de
 	}
=20
 	method =3D ssram_type->method;
+	index =3D ssram_type->p_index;
=20
 	ret =3D pcim_enable_device(pcidev);
 	if (ret) {
@@ -207,6 +276,8 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pc=
idev, const struct pci_de
=20
 	if (method =3D=3D RES_METHOD_PCI)
 		ret =3D pmc_ssram_telemetry_pci_init(pcidev);
+	else if (method =3D=3D RES_METHOD_ACPI)
+		ret =3D pmc_ssram_telemetry_acpi_init(pcidev, index);
 	else
 		ret =3D -EINVAL;
=20
@@ -239,6 +310,7 @@ static struct pci_driver pmc_ssram_telemetry_driver =3D=
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

