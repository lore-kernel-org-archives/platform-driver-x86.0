Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206C533EB17;
	Sun, 31 May 2026 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780256810; cv=none; b=s+Bl0hfJDdNSjDJMxNc93pmcf5ariZfqWgMx1Bh6m2hq5FuymIyYhwDew3L71zl0m9Rpx/Zs28N2dAc6AFX5L2AqqFJt7JA3ZFk7hmEfn06RQrJGbUkwC+dzah8j2p1+OmeoxN4XttoKRrhGxr86GNTCL7qf8uZcdam5V8bRLoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780256810; c=relaxed/simple;
	bh=GSvLqUD0nGmiglJWarKF1YMqSX+lVEvF8llg4bIoc1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZ08Edh3jGMw1lUoYzUlHbjBzKCTVZ5xx28ikmcSJvdCbftRNr0zWFbkQ/Q9vOgpMcfsdzttJB0TSF4QQxmSKAUPDT/RHMsM/MqVnABYNPHFLSPp3uMs90ylYEqfoJrTnrREGe5ghzr8WICMOaW/jTQRzWmShXXEcNlK9z5dl/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfR41iVy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfR41iVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780256809; x=1811792809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GSvLqUD0nGmiglJWarKF1YMqSX+lVEvF8llg4bIoc1w=;
  b=gfR41iVyGVtoJ3g4GOKLvOnw7e0w97ls2R1p0Vf2RNvLaiW1AHYi/50m
   nz5sVPknVnU+RGP+wOxXsHmCdWr0vcMWdz1Y52iEIWZWzI2qv/uTiebNT
   jdeWSwR4E1CYf6QChdgoYR5xfq0bp4FH98qEzbAoDfcvonhIQ/Jp8UXDf
   vLgs5cBGuAUdH9D2artHYVBy4e456Fb6D7yNatb0VaomsL3zThxxHyOy0
   LapRGmQXQ6R+Zh2G4s5/vRv47zuQIfJk3whM6YL0f89JWiE9lCakoE80L
   pEC19tn76R5CkTV+Vcd9tHzwxeQB9WKG+Xz/jTww66eK2M9eRqwPTEM4+
   A==;
X-CSE-ConnectionGUID: wFTijFSYTnyPLtTcECO23w==
X-CSE-MsgGUID: EQCr1hCiRmqUuE9k7vDQgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80751311"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="80751311"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:25 -0700
X-CSE-ConnectionGUID: EzF4okOCQSOS6dzaciyNsg==
X-CSE-MsgGUID: QqqFvil0RKuS/jq1HfW71g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="247363903"
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
Subject: [PATCH v6 13/15] platform/x86/intel/pmc/ssram: Add ACPI discovery scaffolding
Date: Sun, 31 May 2026 12:46:15 -0700
Message-ID: <0437ded98dc4ae5b7fc6a07c8b2a5277290e7c49.1780248804.git.david.e.box@linux.intel.com>
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

Prepare the SSRAM telemetry driver for ACPI-based discovery by adding
support for reading telemetry regions from ACPI _DSD properties.

Add pmc_ssram_telemetry_acpi_init() to parse _DSD for telemetry discovery
tables and register them with the Intel VSEC framework. Extend ssram_type
with a p_index field to specify which PMC index each ACPI device owns
(unlike PCI which discovers all three PMCs from one device).

At this stage, no platform IDs are wired to use ACPI discovery - existing
devices continue using the PCI path. Follow-on patches will add platform
support.

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V6 - No changes

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

 .../platform/x86/intel/pmc/ssram_telemetry.c  | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index ad961ee469b2..7ebfbb177499 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2023, Intel Corporation.
  */
=20
+#include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
@@ -31,14 +32,17 @@ DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *=
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
 enum pmc_ssram_state {
@@ -222,6 +226,73 @@ static int pmc_ssram_telemetry_pci_init(struct pci_dev=
 *pcidev,
 	return ret;
 }
=20
+static int pmc_ssram_telemetry_get_pmc_acpi(struct pci_dev *pcidev,
+					    struct pmc_ssram_probe_cache *probe_cache,
+					    unsigned int pmc_idx)
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
+	pmc_ssram_get_devid_pwrmbase(probe_cache, ssram, pmc_idx);
+	probe_cache->valid_mask |=3D BIT(pmc_idx);
+
+	return 0;
+}
+
+static int pmc_ssram_telemetry_acpi_init(struct pci_dev *pcidev,
+					 struct pmc_ssram_probe_cache *probe_cache,
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
+	return pmc_ssram_telemetry_get_pmc_acpi(pcidev, probe_cache, index);
+}
+
 /**
  * pmc_ssram_telemetry_get_pmc_info() - Get a PMC devid and base_addr info=
rmation
  * @pmc_idx:               Index of the PMC
@@ -295,6 +366,7 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pc=
idev, const struct pci_de
 	struct pmc_ssram_drvdata *drvdata;
 	const struct ssram_type *ssram_type;
 	enum resource_method method;
+	enum pmc_index index;
 	int ret;
=20
 	ssram_type =3D (const struct ssram_type *)id->driver_data;
@@ -303,9 +375,12 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *p=
cidev, const struct pci_de
 		return -EINVAL;
 	}
=20
+	index =3D ssram_type->p_index;
 	method =3D ssram_type->method;
 	if (method =3D=3D RES_METHOD_PCI)
 		probe_cache.owned_mask =3D SSRAM_PCI_PMC_MASK;
+	else if (method =3D=3D RES_METHOD_ACPI)
+		probe_cache.owned_mask =3D BIT(index);
 	else
 		return -EINVAL;
=20
@@ -325,6 +400,8 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pc=
idev, const struct pci_de
=20
 	if (method =3D=3D RES_METHOD_PCI)
 		ret =3D pmc_ssram_telemetry_pci_init(pcidev, &probe_cache);
+	else if (method =3D=3D RES_METHOD_ACPI)
+		ret =3D pmc_ssram_telemetry_acpi_init(pcidev, &probe_cache, index);
 	else
 		ret =3D -EINVAL;
=20
@@ -375,6 +452,7 @@ static struct pci_driver pmc_ssram_telemetry_driver =3D=
 {
 module_pci_driver(pmc_ssram_telemetry_driver);
=20
 MODULE_IMPORT_NS("INTEL_VSEC");
+MODULE_IMPORT_NS("INTEL_PMC_CORE");
 MODULE_AUTHOR("Xi Pardee <xi.pardee@intel.com>");
 MODULE_DESCRIPTION("Intel PMC SSRAM Telemetry driver");
 MODULE_LICENSE("GPL");
--=20
2.43.0

