Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6712A37EFFE;
	Fri,  1 May 2026 23:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677066; cv=none; b=aJAdmHTnoeK5pnmwME5fi/TBUxtb3rarlR3yRee2lZTktCG3LYY1I/zA9CkZqmJ4IsiUHbnFruIv6mbBmugEmV7IbY741cpJojwNyCUFNnwQJ0iQfVb6i76DDI+viLG40kN6bB5qNeNaj7tRV7/SegG8DhI3+Ra15cbprWrL2GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677066; c=relaxed/simple;
	bh=ptyHeC87N6zzmNuc0FtDsnFAXpwocgda75JQNbaqHII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9RgpunPG8RovRxoZobFPrGAXwe6RR0PFkROsXvM0DB34l9O9spVYaF+xDm8143BCBO41pURE4/fSfV+lRtkkpbXBfgZsOzOzOy+fqekI2KS20s3wtxVPw6OgvnHfIQ8qQMMcfywGIAmKdbFj3k2wZVvHYXJa4xmrVV5WWoMGpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3wG/U+0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3wG/U+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677064; x=1809213064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ptyHeC87N6zzmNuc0FtDsnFAXpwocgda75JQNbaqHII=;
  b=J3wG/U+0GlMWVxxEvBVLvbjgN15pJ8/btYxweZspkPM8xkTicEuJoGW3
   3JFHVA7Ps3oxA5EdoARcMiNZZT3gHoMQe+Qxq6bnxnjvnWs6S+xl7JS5D
   OBzeORnh+ZuiH/Eq+FL5/dFrxwq8jvr7TXUyg/OUKmp8BwhARlSr26wgX
   z3Qg6+vXMNHEnbsEhRXaImUScvjyvdlIcZ0aOF8MplsB2NtlEXSFAAYpK
   gSR/Tey0zJG36FN3KD/6TEjLj08qNsW+QKceKChrgaZRv+W9fZqzyDxXV
   Qwi3sG0VNoXutgpLR3lKj+8DeGAesNHaY/VBkT1Nf5K2pNH68sDusuyFc
   A==;
X-CSE-ConnectionGUID: iuUiW9zVSqKCyvUlHDK7Vw==
X-CSE-MsgGUID: GSVUj3v7TourDSiSv/BCfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740137"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740137"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:00 -0700
X-CSE-ConnectionGUID: 0IWDkq/ZRDOh3S/M35837Q==
X-CSE-MsgGUID: qNGPzZBvQluJw0XHrRCbGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948960"
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
Subject: [PATCH V3 06/16] platform/x86/intel/pmt: Unify header fetch and add ACPI source
Date: Fri,  1 May 2026 16:10:43 -0700
Message-ID: <20260501231054.3890305-7-david.e.box@linux.intel.com>
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

This maintains existing PCI behavior and makes no functional changes
for PCI devices.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V3 changes:
  - Folded the header fetch rework back into intel_pmt_dev_create() after
    dropping the previous common header decode helper patch
  - Replaced repeated literal header count values with
    PMT_DISC_HEADER_QWORDS for discovery-header handling
  - Updated discovery-header buffer declarations and copy size
    calculations to use PMT_DISC_HEADER_QWORDS * sizeof(*headers)
    for clarity in function-parameter context
  - Cleaned up line wrapping/indentation

V2 changes:
  - In pmt_resolve_access_acpi(), moved dev_err() call to single line
    instead of split across two lines
  - Restructured error handling in intel_pmt_populate_entry(), moving error
    returns from after switch/case into each case statement for better
    readability
  - Addressed Ilpo's feedback on error message formatting and error
    handling patterns

 drivers/platform/x86/intel/pmt/class.c | 130 ++++++++++++++++++++++---
 1 file changed, 118 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index 61834cbe3764..a162df5939e0 100644
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
@@ -370,21 +445,52 @@ static int intel_pmt_dev_register(struct intel_pmt_en=
try *entry,
 	return ret;
 }
=20
+static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
+			   struct intel_pmt_entry *entry, u64 headers[2])
+{
+	struct device *dev =3D &ivdev->auxdev.dev;
+
+	switch (ivdev->src) {
+	case INTEL_VSEC_DISC_PCI: {
+		void __iomem *disc_table;
+
+		disc_table =3D devm_ioremap_resource(dev, &ivdev->resource[idx]);
+		if (IS_ERR(disc_table))
+			return PTR_ERR(disc_table);
+
+		memcpy_fromio(headers, disc_table, 2 * sizeof(u64));
+		memcpy(entry->disc_header, headers, sizeof(entry->disc_header));
+
+		/* Used by crashlog driver */
+		entry->disc_table =3D disc_table;
+
+		return 0;
+	}
+	case INTEL_VSEC_DISC_ACPI: {
+		memcpy(headers, &ivdev->acpi_disc[idx][0], 2 * sizeof(u64));
+		memcpy(entry->disc_header, headers, sizeof(entry->disc_header));
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
+	u64 headers[2];
 	int ret;
=20
-	disc_res =3D &intel_vsec_dev->resource[idx];
-
-	entry->disc_table =3D devm_ioremap_resource(dev, disc_res);
-	if (IS_ERR(entry->disc_table))
-		return PTR_ERR(entry->disc_table);
-
-	memcpy_fromio(entry->disc_header, entry->disc_table,
-		      sizeof(entry->disc_header));
+	ret =3D pmt_get_headers(intel_vsec_dev, idx, entry, headers);
+	if (ret)
+		return ret;
=20
 	if (ns->pmt_pre_decode) {
 		ret =3D ns->pmt_pre_decode(intel_vsec_dev, entry);
--=20
2.43.0

