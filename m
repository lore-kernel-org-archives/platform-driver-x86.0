Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA07302750;
	Fri, 22 May 2026 02:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416532; cv=none; b=bDfec0wj401jTA/zDHf6oBFY1d+XfagYZ7tgd4USmRGZwpSI+6RHPkyaDDVdEWcnYebFQ5ohg/d/linnwfxfZwPJ2t917f3yxKyYXWktZ1nNUA2XYPzJcCPvTW6q81yEoEx31vSzVybChbavX2iBGCRhzbM+nmxpL2JwiASmPFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416532; c=relaxed/simple;
	bh=pxP0710UqCEAgnduapsN4AC6HkjKOjUq3GR5fHYaioI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orUyiwAtbHVju8J/6lJ5zPBU+g7IDd9KIdVZAAcTjwlxPrA8QpWtwVjNPjlC7VT7PXt6ytj6wLin+PrY7Xv4Xs7UTKFsXtQXdDBLAZbS6CwkNQlGr+Gn65jhpLf619mLDbJER3k+H3NDHZsZXwoKYqaDKO1+FBcpGMo9jZnVLQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWFS2lMB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWFS2lMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779416527; x=1810952527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pxP0710UqCEAgnduapsN4AC6HkjKOjUq3GR5fHYaioI=;
  b=PWFS2lMBhlR5SokUFnLkudxN/u/59wfxkF2ZkmYdpC4P+ZavRG+o51O+
   1hXOg1n4K9QUoYE6GBs4+aJzmoZfwl+5q6rBJcp+VimPFY0Ssfsg9DXzq
   HYn8BoEhzct9le0WMCUWtECw7jo8O1QUycmSeE7BzZUPeqD6cL6Sni+DT
   OOoxaWyYh1K7r+acbJshkRG5FC85JPIVtlxhAJrXkxYX79Q8s65RwWMT2
   1HIY9pgtM9HJTEV7Won/uJlsA7FgLs1RU7rV4LSNS9/WnInmstp9QzvwM
   oyI93InjM+R3xB2FKw7craZ3gYJ1/r81clmPJ0iuOFSe1yS8LDNdkYwIM
   g==;
X-CSE-ConnectionGUID: Q8JKaLxkSbmf4Nqf6/LADA==
X-CSE-MsgGUID: 1jkqAoibSPO90ZOZzRDoyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80400538"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80400538"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:21:59 -0700
X-CSE-ConnectionGUID: tJn8vqrvRYCg/oG+LNglvQ==
X-CSE-MsgGUID: X1r9oKDPS1SrtRpWnhh2Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236335378"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:21:59 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v5 08/16] platform/x86/intel/pmc: Add ACPI PWRM telemetry driver for Nova Lake S
Date: Thu, 21 May 2026 19:21:38 -0700
Message-ID: <20260522022147.4137494-9-david.e.box@linux.intel.com>
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

Add an ACPI-based PMC PWRM telemetry driver for Nova Lake S. The driver
locates PMT discovery data in _DSD under the Intel VSEC UUID, parses it,
and registers telemetry regions with the PMT/VSEC framework so PMC
telemetry is exposed via existing PMT interfaces.

Export pmc_parse_telem_dsd() and pmc_find_telem_guid() to support ACPI
discovery in other PMC drivers (e.g., ssram_telemetry) without duplicating
ACPI parsing logic. Also export acpi_disc_t typedef from core.h for callers
to properly declare discovery table arrays.

Selected by INTEL_PMC_CORE. Existing PCI functionality is preserved.

Assisted-by: GitHub-Copilot:claude-opus-4.7
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V5 changes:
  - Added #include <linux/limits.h> for U16_MAX (Ilpo).
  - Split acpi_handle declaration from ACPI_HANDLE() assignment
    and placed the assignment immediately before the !handle
    check (Ilpo).
  - Reordered local variables in pmc_pwrm_acpi_probe() in
    reverse-xmas-tree order (Ilpo).

V4 changes:
  - These changes were supposed to be in V3
  - Updated pmc_parse_telem_dsd() in pwrm_telemetry.c to use acpi_disc_t
    in the function return type for consistency with the exported typedef
  - In pmc_parse_telem_dsd(), change acpi_disc declaration to happen at the
    allocation site as specified by cleanup.h
  - Style, readability and cleanup-path refinement based on review
    feedback

V2 changes:
  - Added explicit <linux/uuid.h> include for guid_t type availability in
    core.h
  - Added explicit <linux/bits.h> include in pwrm_telemetry.c for GENMASK()
  - Added <linux/cleanup.h> and converted goto based cleanup to __free()
    attributes per Ilpo's feedback
  - Combined u64 hdr0 and u64 hdr1 into single declaration
  - Converted pmc_parse_telem_dsd() to return acpi_disc directly with
    ERR_PTR() for failures
  - Added braces around _DSD evaluation failure path

 drivers/platform/x86/intel/pmc/Kconfig        |  14 ++
 drivers/platform/x86/intel/pmc/Makefile       |   2 +
 drivers/platform/x86/intel/pmc/core.h         |  16 ++
 .../platform/x86/intel/pmc/pwrm_telemetry.c   | 216 ++++++++++++++++++
 4 files changed, 248 insertions(+)
 create mode 100644 drivers/platform/x86/intel/pmc/pwrm_telemetry.c

diff --git a/drivers/platform/x86/intel/pmc/Kconfig b/drivers/platform/x86/=
intel/pmc/Kconfig
index 0f19dc7edcf9..937186b0b5dd 100644
--- a/drivers/platform/x86/intel/pmc/Kconfig
+++ b/drivers/platform/x86/intel/pmc/Kconfig
@@ -9,6 +9,7 @@ config INTEL_PMC_CORE
 	depends on ACPI
 	depends on INTEL_PMT_TELEMETRY
 	select INTEL_PMC_SSRAM_TELEMETRY
+	select INTEL_PMC_PWRM_TELEMETRY
 	help
 	  The Intel Platform Controller Hub for Intel Core SoCs provides access
 	  to Power Management Controller registers via various interfaces. This
@@ -39,3 +40,16 @@ config INTEL_PMC_SSRAM_TELEMETRY
 	  (including sysfs).
=20
 	  This option is selected by INTEL_PMC_CORE.
+
+config INTEL_PMC_PWRM_TELEMETRY
+	tristate
+	help
+	  This driver discovers PMC PWRM telemetry regions described in ACPI
+	  _DSD and registers them with the Intel VSEC framework as Intel PMT
+	  telemetry devices.
+
+	  It validates the ACPI discovery data and publishes the discovered
+	  regions so they can be accessed through the Intel PMT telemetry
+	  interfaces (including sysfs).
+
+	  This option is selected by INTEL_PMC_CORE.
diff --git a/drivers/platform/x86/intel/pmc/Makefile b/drivers/platform/x86=
/intel/pmc/Makefile
index bb960c8721d7..fdbb768f7b09 100644
--- a/drivers/platform/x86/intel/pmc/Makefile
+++ b/drivers/platform/x86/intel/pmc/Makefile
@@ -12,3 +12,5 @@ obj-$(CONFIG_INTEL_PMC_CORE)		+=3D intel_pmc_core_pltdrv.o
 # Intel PMC SSRAM driver
 intel_pmc_ssram_telemetry-y		+=3D ssram_telemetry.o
 obj-$(CONFIG_INTEL_PMC_SSRAM_TELEMETRY)	+=3D intel_pmc_ssram_telemetry.o
+intel_pmc_pwrm_telemetry-y		+=3D pwrm_telemetry.o
+obj-$(CONFIG_INTEL_PMC_PWRM_TELEMETRY)	+=3D intel_pmc_pwrm_telemetry.o
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/i=
ntel/pmc/core.h
index 118c8740ad3a..f458eb908c07 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -14,10 +14,15 @@
=20
 #include <linux/acpi.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/intel_vsec.h>
 #include <linux/platform_device.h>
+#include <linux/uuid.h>
=20
 struct telem_endpoint;
=20
+DEFINE_FREE(pmc_acpi_free, void *, if (_T) ACPI_FREE(_T))
+
 #define SLP_S0_RES_COUNTER_MASK			GENMASK(31, 0)
=20
 #define PMC_BASE_ADDR_DEFAULT			0xFE000000
@@ -562,6 +567,8 @@ int pmc_core_pmt_get_blk_sub_req(struct pmc_dev *pmcdev=
, struct pmc *pmc,
 extern const struct file_operations pmc_core_substate_req_regs_fops;
 extern const struct file_operations pmc_core_substate_blk_req_fops;
=20
+extern const guid_t intel_vsec_guid;
+
 #define pmc_for_each_mode(mode, pmc)						\
 	for (unsigned int __i =3D 0, __cond;					\
 	     __cond =3D __i < (pmc)->num_lpm_modes,				\
@@ -583,4 +590,13 @@ static const struct file_operations __name ## _fops =
=3D {			\
 	.release	=3D single_release,				\
 }
=20
+struct intel_vsec_header;
+union acpi_object;
+
+/* Avoid checkpatch warning */
+typedef u32 (*acpi_disc_t)[INTEL_VSEC_ACPI_DISC_DWORDS];
+
+acpi_disc_t pmc_parse_telem_dsd(union acpi_object *obj,
+				struct intel_vsec_header *header);
+union acpi_object *pmc_find_telem_guid(union acpi_object *dsd);
 #endif /* PMC_CORE_H */
diff --git a/drivers/platform/x86/intel/pmc/pwrm_telemetry.c b/drivers/plat=
form/x86/intel/pmc/pwrm_telemetry.c
new file mode 100644
index 000000000000..70fdc79b48a2
--- /dev/null
+++ b/drivers/platform/x86/intel/pmc/pwrm_telemetry.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel PMC PWRM ACPI driver
+ *
+ * Copyright (C) 2025, Intel Corporation
+ */
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/intel_vsec.h>
+#include <linux/limits.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/resource.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+#include "core.h"
+
+#define ENTRY_LEN		5
+
+/* DWORD2 */
+#define DVSEC_ID_MASK		GENMASK(15, 0)
+#define NUM_ENTRIES_MASK	GENMASK(23, 16)
+#define ENTRY_SIZE_MASK		GENMASK(31, 24)
+
+/* DWORD3 */
+#define TBIR_MASK		GENMASK(2, 0)
+#define DISC_TBL_OFF_MASK	GENMASK(31, 3)
+
+const guid_t intel_vsec_guid =3D
+	GUID_INIT(0x294903fb, 0x634d, 0x4fc7, 0xaf, 0x1f, 0x0f, 0xb9,
+		  0x56, 0xb0, 0x4f, 0xc1);
+
+static bool is_valid_entry(union acpi_object *pkg)
+{
+	int i;
+
+	if (!pkg || pkg->type !=3D ACPI_TYPE_PACKAGE || pkg->package.count !=3D E=
NTRY_LEN)
+		return false;
+
+	if (pkg->package.elements[0].type !=3D ACPI_TYPE_STRING)
+		return false;
+
+	for (i =3D 1; i < ENTRY_LEN; i++)
+		if (pkg->package.elements[i].type !=3D ACPI_TYPE_INTEGER)
+			return false;
+
+	return true;
+}
+
+acpi_disc_t pmc_parse_telem_dsd(union acpi_object *obj,
+			struct intel_vsec_header *header)
+{
+	union acpi_object *vsec_pkg;
+	union acpi_object *disc_pkg;
+	u64 hdr0, hdr1;
+	int num_regions;
+	int i;
+
+	if (!header)
+		return ERR_PTR(-EINVAL);
+
+	if (!obj || obj->type !=3D ACPI_TYPE_PACKAGE || obj->package.count !=3D 2)
+		return ERR_PTR(-EINVAL);
+
+	/* First Package is DVSEC info */
+	vsec_pkg =3D &obj->package.elements[0];
+	if (!is_valid_entry(vsec_pkg))
+		return ERR_PTR(-EINVAL);
+
+	hdr0 =3D vsec_pkg->package.elements[3].integer.value;
+	hdr1 =3D vsec_pkg->package.elements[4].integer.value;
+
+	header->id          =3D FIELD_GET(DVSEC_ID_MASK, hdr0);
+	header->num_entries =3D FIELD_GET(NUM_ENTRIES_MASK, hdr0);
+	header->entry_size  =3D FIELD_GET(ENTRY_SIZE_MASK, hdr0);
+	header->tbir        =3D FIELD_GET(TBIR_MASK, hdr1);
+	header->offset      =3D FIELD_GET(DISC_TBL_OFF_MASK, hdr1);
+
+	/* Second Package contains the discovery tables */
+	disc_pkg =3D &obj->package.elements[1];
+	if (disc_pkg->type !=3D ACPI_TYPE_PACKAGE || disc_pkg->package.count < 1)
+		return ERR_PTR(-EINVAL);
+
+	num_regions =3D disc_pkg->package.count;
+	if (header->num_entries !=3D num_regions)
+		return ERR_PTR(-EINVAL);
+
+	acpi_disc_t disc __free(kfree) =3D kmalloc_array(num_regions, sizeof(*dis=
c),
+						      GFP_KERNEL);
+	if (!disc)
+		return ERR_PTR(-ENOMEM);
+
+	for (i =3D 0; i < num_regions; i++) {
+		union acpi_object *pkg;
+		u64 value;
+		int j;
+
+		pkg =3D &disc_pkg->package.elements[i];
+		if (!is_valid_entry(pkg))
+			return ERR_PTR(-EINVAL);
+
+		/* Element 0 is a descriptive string; DWORD values start at index 1. */
+		for (j =3D 1; j < ENTRY_LEN; j++) {
+			value =3D pkg->package.elements[j].integer.value;
+			if (value > U32_MAX)
+				return ERR_PTR(-ERANGE);
+
+			disc[i][j - 1] =3D value;
+		}
+	}
+
+	return no_free_ptr(disc);
+}
+EXPORT_SYMBOL_NS_GPL(pmc_parse_telem_dsd, "INTEL_PMC_CORE");
+
+union acpi_object *pmc_find_telem_guid(union acpi_object *dsd)
+{
+	int i;
+
+	if (!dsd || dsd->type !=3D ACPI_TYPE_PACKAGE)
+		return NULL;
+
+	for (i =3D 0; i + 1 < dsd->package.count; i +=3D 2) {
+		union acpi_object *uuid_obj, *data_obj;
+		guid_t uuid;
+
+		uuid_obj =3D &dsd->package.elements[i];
+		data_obj =3D &dsd->package.elements[i + 1];
+
+		if (uuid_obj->type !=3D ACPI_TYPE_BUFFER ||
+		    uuid_obj->buffer.length !=3D 16)
+			continue;
+
+		memcpy(&uuid, uuid_obj->buffer.pointer, 16);
+		if (guid_equal(&uuid, &intel_vsec_guid))
+			return data_obj;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS_GPL(pmc_find_telem_guid, "INTEL_PMC_CORE");
+
+static int pmc_pwrm_acpi_probe(struct platform_device *pdev)
+{
+	struct intel_vsec_header header;
+	struct intel_vsec_header *headers[2] =3D { &header, NULL };
+	struct acpi_buffer buf =3D { ACPI_ALLOCATE_BUFFER, NULL };
+	struct intel_vsec_platform_info info =3D { };
+	struct device *dev =3D &pdev->dev;
+	union acpi_object *dsd;
+	struct resource *res;
+	acpi_handle handle;
+	acpi_status status;
+
+	handle =3D ACPI_HANDLE(&pdev->dev);
+	if (!handle)
+		return -ENODEV;
+
+	status =3D acpi_evaluate_object(handle, "_DSD", NULL, &buf);
+	if (ACPI_FAILURE(status)) {
+		return dev_err_probe(dev, -ENODEV, "Could not evaluate _DSD: %s\n",
+				     acpi_format_exception(status));
+	}
+
+	void *dsd_buf __free(pmc_acpi_free) =3D buf.pointer;
+
+	dsd =3D pmc_find_telem_guid(dsd_buf);
+	if (!dsd)
+		return -ENODEV;
+
+	acpi_disc_t acpi_disc __free(kfree) =3D pmc_parse_telem_dsd(dsd, &header);
+	if (IS_ERR(acpi_disc))
+		return PTR_ERR(acpi_disc);
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, header.tbir);
+	if (!res)
+		return -EINVAL;
+
+	info.headers =3D headers;
+	info.caps =3D VSEC_CAP_TELEMETRY;
+	info.acpi_disc =3D acpi_disc;
+	info.src =3D INTEL_VSEC_DISC_ACPI;
+	info.base_addr =3D res->start;
+
+	return intel_vsec_register(&pdev->dev, &info);
+}
+
+static const struct acpi_device_id pmc_pwrm_acpi_ids[] =3D {
+	{ "INTC1122", 0 }, /* Nova Lake */
+	{ "INTC1129", 0 }, /* Nova Lake */
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, pmc_pwrm_acpi_ids);
+
+static struct platform_driver pmc_pwrm_acpi_driver =3D {
+	.probe =3D pmc_pwrm_acpi_probe,
+	.driver =3D {
+		.name =3D "intel_pmc_pwrm_acpi",
+		.acpi_match_table =3D ACPI_PTR(pmc_pwrm_acpi_ids),
+	},
+};
+module_platform_driver(pmc_pwrm_acpi_driver);
+
+MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.com>");
+MODULE_DESCRIPTION("Intel PMC PWRM ACPI driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("INTEL_VSEC");
--=20
2.43.0

