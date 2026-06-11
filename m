Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4CA3537F1;
	Thu, 11 Jun 2026 04:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152497; cv=none; b=tqu+g73XsIeT/7LHxMQmGCSBt7sPueVyKeb1+Bvvw/vWIHWmdZdTXu2LjVgtjVHjKbH+AK9kFFV+rt0dZqXvX2CtVatwMfLRGMe7oes8KDQODE97hloRRKMkFHfSAzG3BypowrmnNf2u1aoxG6M3O9qU/oDefNKtr2IwvlcVi88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152497; c=relaxed/simple;
	bh=KDTx2FsKwK+wDH9ev6Bg3h9P9Wr8fgOjbEwK+1mzSDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzvLOLx8snUnvRVaecYj3kobIh2x7weGCCMABiET4mKkP9cbb6PNnSvkG9CWELu/26ZFzUsA7NoDozaGT3ipX/XpHaZvc7SIo3wGJfKRVSLz/0svtJDIRwSZ8IqUSaoW0W8bFWRLqVOmQMH9j7UEXU8vPTYBz4Uf6s9Oi+I15wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZ9OJH0D; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZ9OJH0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781152495; x=1812688495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KDTx2FsKwK+wDH9ev6Bg3h9P9Wr8fgOjbEwK+1mzSDc=;
  b=FZ9OJH0DJT1N/5OIWbI8q7vihUecMWh1GI91/97YGo7miZfCALBHhROy
   kg222ELTuoHpqTEvK2U5blsEFe9LYnGYhm+u6OYJECbgmAdJd8tjfb58m
   MWk4MfPFOZ6WoFRiKbI6YuGRlD4uAcWVtfZLm6607lR6gJ/BOhuguk7oP
   0AHnrR8QJfbkevhx9LXfbLZnZrw0AwQLpO0MCZ+LbUnMLGb8YoDYVNAix
   a0Y27rlaD3+3x3IvfU780doJ+TsVV8DRbbDQaZ7mYDu+fhTh1N+HyPFZG
   m7GkTY2iQE/leF1cvpy150YgEiXzXWbcrDqIVwEmKr/oaEc+fBXo+9G0W
   g==;
X-CSE-ConnectionGUID: i6py9y9LQpm9PQ8kZZeDcA==
X-CSE-MsgGUID: tuJR+FTeTtSEZWsuxPSFcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84531000"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="84531000"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:53 -0700
X-CSE-ConnectionGUID: lvJ2SejDQr+LCLBbZw/K7w==
X-CSE-MsgGUID: vOd697MwR3Ws2k4pjOgdqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251468346"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:53 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v7 06/15] platform/x86/intel/pmt: Unify header fetch and add ACPI source
Date: Wed, 10 Jun 2026 21:34:34 -0700
Message-ID: <978d46578c82f0f9d23238b0377682182fd5ff9c.1781146840.git.david.e.box@linux.intel.com>
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

Allow the PMT class to read discovery headers from either PCI MMIO or
ACPI-provided entries, depending on the discovery source. The new
source-aware fetch helper caches the canonical discovery header for both
paths, capping PCI MMIO reads to the mapped resource size, while keeping
the mapped PCI discovery table available for users such as crashlog.

Split intel_pmt_populate_entry() into source-specific resolvers:
  - pmt_resolve_access_pci(): handles both ACCESS_LOCAL and ACCESS_BARID
    for PCI-backed devices and sets entry->pcidev. Same existing
    functionality.
  - pmt_resolve_access_acpi(): handles only ACCESS_BARID for ACPI-backed
    devices, rejecting ACCESS_LOCAL which has no valid semantics without
    a physical discovery resource.

This maintains existing PCI behavior and makes no functional changes
for PCI devices.

Assisted-by: GitHub-Copilot:claude-opus-4.7
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V7 changes:
  - Updated header copy size handling to use min() for size_t operands and
    aligned local style per review feedback (Ilpo).

V6 changes:
  - Removed unneeded headers parameter from pmt_get_headers() (Ilpo).
  - Added memset() to zero-initialize disc_header before copying to avoid
    uninitialized data in entry reuse scenarios (Ilpo/Sashiko).

V5 changes:
  - Bounded memcpy_fromio() to resource_size() of the mapped DVSEC entry
    to avoid over-reading namespaces with smaller entry_size.
  - Documented that entry->disc_table =3D NULL in the ACPI branch is
    intentional and that consumers must only be wired to
    INTEL_VSEC_DISC_PCI namespaces if they dereference disc_table.

V4 - Replaced local raw ACPI discovery pointer type u32 (*)[4] with
     acpi_disc_t for consistency with exported PMC helper types.

V3 - No changes

V2 changes:
  - Replaced intermediate header-decode helper with inline ACPI path
  - Removed separate disc_acpi resource
  - Moved ACPI fetch directly into intel_pmt_dev_create

 drivers/platform/x86/intel/pmt/class.c | 151 +++++++++++++++++++++----
 drivers/platform/x86/intel/pmt/class.h |   2 +-
 include/linux/intel_vsec.h             |   5 +-
 3 files changed, 136 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index 8d27f59d5bff..d0ab8e33c62a 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -205,9 +205,9 @@ struct class intel_pmt_class =3D {
 };
 EXPORT_SYMBOL_GPL(intel_pmt_class);
=20
-static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
-				    struct intel_vsec_device *ivdev,
-				    int idx)
+static int pmt_resolve_access_pci(struct intel_pmt_entry *entry,
+				  struct intel_vsec_device *ivdev,
+				  int idx)
 {
 	struct pci_dev *pci_dev =3D to_pci_dev(ivdev->dev);
 	struct device *dev =3D &ivdev->auxdev.dev;
@@ -287,6 +287,81 @@ static int intel_pmt_populate_entry(struct intel_pmt_e=
ntry *entry,
 	}
=20
 	entry->pcidev =3D pci_dev;
+
+	return 0;
+}
+
+static int pmt_resolve_access_acpi(struct intel_pmt_entry *entry,
+				   struct intel_vsec_device *ivdev)
+{
+	struct pci_dev *pci_dev =3D NULL;
+	struct device *dev =3D &ivdev->auxdev.dev;
+	struct intel_pmt_header *header =3D &entry->header;
+	u8 bir;
+
+	if (dev_is_pci(ivdev->dev))
+		pci_dev =3D to_pci_dev(ivdev->dev);
+
+	/*
+	 * The base offset should always be 8 byte aligned.
+	 *
+	 * For non-local access types the lower 3 bits of base offset
+	 * contains the index of the base address register where the
+	 * telemetry can be found.
+	 */
+	bir =3D GET_BIR(header->base_offset);
+
+	switch (header->access_type) {
+	case ACCESS_BARID:
+		/* ACPI platform drivers use base_addr */
+		if (ivdev->base_addr) {
+			entry->base_addr =3D ivdev->base_addr +
+					   GET_ADDRESS(header->base_offset);
+			break;
+		}
+
+		/* If base_addr is not provided, then this is an ACPI companion device */
+		if (!pci_dev) {
+			dev_err(dev, "ACCESS_BARID requires PCI BAR resources or base_addr\n");
+			return -EINVAL;
+		}
+
+		entry->base_addr =3D pci_resource_start(pci_dev, bir) +
+				   GET_ADDRESS(header->base_offset);
+		break;
+	default:
+		dev_err(dev, "Unsupported access type %d for ACPI based PMT\n",
+			header->access_type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
+				    struct intel_vsec_device *ivdev,
+				    int idx)
+{
+	struct intel_pmt_header *header =3D &entry->header;
+	struct device *dev =3D &ivdev->auxdev.dev;
+	int ret;
+
+	switch (ivdev->src) {
+	case INTEL_VSEC_DISC_PCI:
+		ret =3D pmt_resolve_access_pci(entry, ivdev, idx);
+		if (ret)
+			return ret;
+		break;
+	case INTEL_VSEC_DISC_ACPI:
+		ret =3D pmt_resolve_access_acpi(entry, ivdev);
+		if (ret)
+			return ret;
+		break;
+	default:
+		dev_err(dev, "Unknown discovery source: %d\n", ivdev->src);
+		return -EINVAL;
+	}
+
 	entry->guid =3D header->guid;
 	entry->size =3D header->size;
 	entry->cb =3D ivdev->priv_data;
@@ -371,28 +446,66 @@ static int intel_pmt_dev_register(struct intel_pmt_en=
try *entry,
 	return ret;
 }
=20
+static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
+			   struct intel_pmt_entry *entry)
+{
+	struct device *dev =3D &ivdev->auxdev.dev;
+	size_t header_bytes =3D sizeof(entry->disc_header);
+
+	switch (ivdev->src) {
+	case INTEL_VSEC_DISC_PCI: {
+		struct resource *disc_res =3D &ivdev->resource[idx];
+		void __iomem *disc_table;
+
+		disc_table =3D devm_ioremap_resource(dev, disc_res);
+		if (IS_ERR(disc_table))
+			return PTR_ERR(disc_table);
+
+		/*
+		 * The mapped resource is sized by the namespace's DVSEC
+		 * entry_size (in dwords), which can be less than the default
+		 * size (e.g. telemetry uses entry_size =3D 3, 12 bytes). Cap the
+		 * copy to resource_size() to avoid reading past the mapped
+		 * region.
+		 */
+		memset(entry->disc_header, 0, header_bytes);
+		memcpy_fromio(entry->disc_header, disc_table,
+			      min(header_bytes, resource_size(disc_res)));
+
+		/* Used by crashlog driver */
+		entry->disc_table =3D disc_table;
+
+		return 0;
+	}
+	case INTEL_VSEC_DISC_ACPI: {
+		memcpy(entry->disc_header, &ivdev->acpi_disc[idx][0], header_bytes);
+		/*
+		 * No MMIO mapping exists on the ACPI source path; the cached
+		 * headers are the only view of the discovery record. Consumers
+		 * that dereference disc_table (e.g. crashlog) must therefore
+		 * only be wired to namespaces backed by INTEL_VSEC_DISC_PCI.
+		 */
+		entry->disc_table =3D NULL;
+
+		return 0;
+	}
+	default:
+		dev_err(dev, "Unknown discovery source type: %d\n", ivdev->src);
+		break;
+	}
+
+	return -EINVAL;
+}
+
 int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_n=
amespace *ns,
 			 struct intel_vsec_device *intel_vsec_dev, int idx)
 {
 	struct device *dev =3D &intel_vsec_dev->auxdev.dev;
-	struct resource	*disc_res;
 	int ret;
=20
-	disc_res =3D &intel_vsec_dev->resource[idx];
-
-	entry->disc_table =3D devm_ioremap_resource(dev, disc_res);
-	if (IS_ERR(entry->disc_table))
-		return PTR_ERR(entry->disc_table);
-
-	/*
-	 * The mapped discovery resource may be smaller than disc_header (its
-	 * size is the namespace's DVSEC entry_size in dwords, which can be
-	 * less than 4). Cap the copy to the actual resource size to avoid
-	 * reading past the mapped region; any unread dwords stay zero from
-	 * the zero-initialized allocation of the containing struct.
-	 */
-	memcpy_fromio(entry->disc_header, entry->disc_table,
-		      min(sizeof(entry->disc_header), resource_size(disc_res)));
+	ret =3D pmt_get_headers(intel_vsec_dev, idx, entry);
+	if (ret)
+		return ret;
=20
 	if (ns->pmt_pre_decode) {
 		ret =3D ns->pmt_pre_decode(intel_vsec_dev, entry);
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/=
intel/pmt/class.h
index 84202fc7920c..a0ece4fc3837 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -44,7 +44,7 @@ struct intel_pmt_entry {
 	struct telem_endpoint	*ep;
 	struct pci_dev		*pcidev;
 	struct intel_pmt_header	header;
-	u32			disc_header[4];
+	u32			disc_header[PMT_DISC_DWORDS];
 	struct bin_attribute	pmt_bin_attr;
 	const struct attribute_group *attr_grp;
 	struct kobject		*kobj;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 07ea563f524e..843cda8f8644 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -28,6 +28,7 @@
 #define INTEL_DVSEC_TABLE_BAR(x)	((x) & GENMASK(2, 0))
 #define INTEL_DVSEC_TABLE_OFFSET(x)	((x) & GENMASK(31, 3))
 #define TABLE_OFFSET_SHIFT		3
+#define PMT_DISC_DWORDS		4
=20
 struct device;
 struct pci_dev;
@@ -122,7 +123,7 @@ struct intel_vsec_platform_info {
 	struct device *parent;
 	struct intel_vsec_header **headers;
 	const struct vsec_feature_dependency *deps;
-	u32 (*acpi_disc)[4];
+	u32 (*acpi_disc)[PMT_DISC_DWORDS];
 	enum intel_vsec_disc_source src;
 	void *priv_data;
 	unsigned long caps;
@@ -153,7 +154,7 @@ struct intel_vsec_platform_info {
 struct intel_vsec_device {
 	struct auxiliary_device auxdev;
 	struct device *dev;
-	u32 (*acpi_disc)[4];
+	u32 (*acpi_disc)[PMT_DISC_DWORDS];
 	enum intel_vsec_disc_source src;
 	struct ida *ida;
 	int num_resources;
--=20
2.43.0

