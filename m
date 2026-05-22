Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABD82F549C;
	Fri, 22 May 2026 02:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416527; cv=none; b=U5Pb/+zBr+I57CrwQXbXaykcNNqgl3yDwfzaMULQvXY0epPwn15sXjoXKq/V8h1dA1GF7QZoIl+C2YCmO5c6RftDavnMl/hUFCX2uaiGnbeklXbzUB3Fa03Z6kVHemzpK4n2GLNM7MOQv+3065Z2eceT37gQmEu73qXoDPcr/ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416527; c=relaxed/simple;
	bh=wm8joZsY+DwrEDvTNHX8brD+sgq0sMJwFhHY+z0EhRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p+i54bjoAu3I4k13kcFBBKGXlNjsjS/Lveu0t4u3xp1DKmlSilXA56gE4RsTH4fzbxWjSPL1G5x16VLpAtKcj4d9SC1Y2rKAUyHJnby7KY7m96bUTu9D7R/kSJNsD0bBc0NQmOa1XD6aZMrrScsjutrEBLdECULC4BKyyn9wYqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPbEhgTI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPbEhgTI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779416522; x=1810952522;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wm8joZsY+DwrEDvTNHX8brD+sgq0sMJwFhHY+z0EhRs=;
  b=iPbEhgTIGz+M6Qy0W001fODP1sVD6Xj8pHLOUDVTo0OSr4MQD/3cYXyc
   B3un1UjGvU28LsFfF0t35lAFjYv3gXY+Aj/r5ZRHGYYJ3J2hvOhQUACeS
   01y44bwVhniz3gHf1exktbiN/IRIzpkeosad+v1SWrGWMvmCuCzoGiAE9
   xEGI0yNH4RHKC9eWcH8iNEfb9rrJqB3VDCz4ltijFqy07J4XjSvYpqRkA
   yQtF0eNSNmmoh3/ySV6n/bMTUmO2mUZm3i0bIToKV8lKyA8xHysKPQiaF
   CyhMG6NciuwITsLZFQNHgJd5AvGUwCmXbwLWdgnRsEGITLJPfYXhlYFRJ
   w==;
X-CSE-ConnectionGUID: kwgVcUgaTTSMREnB/8TgWw==
X-CSE-MsgGUID: uoPYQe8xRtmqykQ268g5OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80400532"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80400532"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:21:59 -0700
X-CSE-ConnectionGUID: Ejk82xCwR0+gCcAFEdqqFQ==
X-CSE-MsgGUID: Lg3taeelR1qCPF+TajA5xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236335374"
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
Subject: [PATCH v5 06/16] platform/x86/intel/pmt: Unify header fetch and add ACPI source
Date: Thu, 21 May 2026 19:21:36 -0700
Message-ID: <20260522022147.4137494-7-david.e.box@linux.intel.com>
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

Allow the PMT class to read discovery headers from either PCI MMIO or
ACPI-provided entries, depending on the discovery source. The new
source-aware fetch helper retrieves the first two QWORDs for both paths
while keeping the mapped discovery table available for users such as
crashlog.

Split intel_pmt_populate_entry() into source-specific resolvers:
  - pmt_resolve_access_pci(): handles both ACCESS_LOCAL and ACCESS_BARID
    for PCI-backed devices and sets entry->pcidev. Same existing
    functionality.
  - pmt_resolve_access_acpi(): handles only ACCESS_BARID for ACPI-backed
    devices, rejecting ACCESS_LOCAL which has no valid semantics without
    a physical discovery resource.

Also, when copying discovery headers, bind the copy size to the canonical
discovery header definition instead of relying on separate literals.

This maintains existing PCI behavior and makes no functional changes
for PCI devices.

Assisted-by: GitHub-Copilot:claude-opus-4.7
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V5 changes:
  - Cap memcpy_fromio() in pmt_get_headers() PCI branch to
    resource_size() of the discovery resource, matching the cap
    added in the cache-introducing patch.
  - Documented in the ACPI branch that disc_table is intentionally
    NULL on that source, so consumers that dereference disc_table
    must only be wired to INTEL_VSEC_DISC_PCI namespaces.

V4 changes:
  - Added discovery header width macro, INTEL_VSEC_ACPI_DISC_DWORDS, in
    shared intel_vsec header and in definitions.
  - Aliased to PMT_DISC_HEADER_DWORDS and converted PMT discovery header
    arrays to use it.
  - Replaced literal header copy sizes with entry->disc_header size in
    pmt_get_headers() for PCI and ACPI paths.

V3 changes:
  - Folded the header fetch rework back into intel_pmt_dev_create() after
    dropping the previous common header decode helper patch
  - Cleaned up line wrapping/indentation

V2 changes:
  - In pmt_resolve_access_acpi(), moved dev_err() call to single line
    instead of split across two lines
  - Restructured error handling in intel_pmt_populate_entry(), moving error
    returns from after switch/case into each case statement for better
    readability
  - Addressed Ilpo's feedback on error message formatting and error
    handling patterns

 drivers/platform/x86/intel/pmt/class.c | 157 +++++++++++++++++++++----
 drivers/platform/x86/intel/pmt/class.h |   3 +-
 include/linux/intel_vsec.h             |   5 +-
 3 files changed, 142 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index 246e11837800..1a77709edc6a 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -204,9 +204,9 @@ struct class intel_pmt_class =3D {
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
@@ -286,6 +286,81 @@ static int intel_pmt_populate_entry(struct intel_pmt_e=
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
+			GET_ADDRESS(header->base_offset);
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
@@ -370,29 +445,71 @@ static int intel_pmt_dev_register(struct intel_pmt_en=
try *entry,
 	return ret;
 }
=20
+static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
+			   struct intel_pmt_entry *entry,
+			   u32 headers[PMT_DISC_HEADER_DWORDS])
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
+		 * entry_size (in dwords), which can be less than
+		 * PMT_DISC_HEADER_DWORDS (e.g. telemetry uses entry_size =3D 3,
+		 * 12 bytes). Cap the copy to resource_size() to avoid reading
+		 * past the mapped region; any unread dwords stay zero from
+		 * the zero-initialized allocation of the containing struct.
+		 */
+		memcpy_fromio(headers, disc_table,
+			      min_t(size_t, header_bytes,
+				    resource_size(disc_res)));
+		memcpy(entry->disc_header, headers, header_bytes);
+
+		/* Used by crashlog driver */
+		entry->disc_table =3D disc_table;
+
+		return 0;
+	}
+	case INTEL_VSEC_DISC_ACPI: {
+		memcpy(headers, &ivdev->acpi_disc[idx][0], header_bytes);
+		memcpy(entry->disc_header, headers, header_bytes);
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
+	u32 headers[PMT_DISC_HEADER_DWORDS];
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
-		      min_t(size_t, sizeof(entry->disc_header),
-			    resource_size(disc_res)));
+	ret =3D pmt_get_headers(intel_vsec_dev, idx, entry, headers);
+	if (ret)
+		return ret;
=20
 	if (ns->pmt_pre_decode) {
 		ret =3D ns->pmt_pre_decode(intel_vsec_dev, entry);
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/=
intel/pmt/class.h
index 84202fc7920c..950fa4ee300d 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -18,6 +18,7 @@
 /* PMT discovery base address/offset register layout */
 #define GET_BIR(v)		((v) & GENMASK(2, 0))
 #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
+#define PMT_DISC_HEADER_DWORDS INTEL_VSEC_ACPI_DISC_DWORDS
=20
 struct device;
 struct pci_dev;
@@ -44,7 +45,7 @@ struct intel_pmt_entry {
 	struct telem_endpoint	*ep;
 	struct pci_dev		*pcidev;
 	struct intel_pmt_header	header;
-	u32			disc_header[4];
+	u32			disc_header[PMT_DISC_HEADER_DWORDS];
 	struct bin_attribute	pmt_bin_attr;
 	const struct attribute_group *attr_grp;
 	struct kobject		*kobj;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 1fe5665a9d02..4c58a7f5031e 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -28,6 +28,7 @@
 #define INTEL_DVSEC_TABLE_BAR(x)	((x) & GENMASK(2, 0))
 #define INTEL_DVSEC_TABLE_OFFSET(x)	((x) & GENMASK(31, 3))
 #define TABLE_OFFSET_SHIFT		3
+#define INTEL_VSEC_ACPI_DISC_DWORDS	4
=20
 struct device;
 struct pci_dev;
@@ -122,7 +123,7 @@ struct intel_vsec_platform_info {
 	struct device *parent;
 	struct intel_vsec_header **headers;
 	const struct vsec_feature_dependency *deps;
-	u32 (*acpi_disc)[4];
+	u32 (*acpi_disc)[INTEL_VSEC_ACPI_DISC_DWORDS];
 	enum intel_vsec_disc_source src;
 	void *priv_data;
 	unsigned long caps;
@@ -154,7 +155,7 @@ struct intel_vsec_device {
 	struct auxiliary_device auxdev;
 	struct device *dev;
 	struct resource *resource;
-	u32 (*acpi_disc)[4];
+	u32 (*acpi_disc)[INTEL_VSEC_ACPI_DISC_DWORDS];
 	enum intel_vsec_disc_source src;
 	struct ida *ida;
 	int num_resources;
--=20
2.43.0

