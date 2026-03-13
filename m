Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787F1336882;
	Fri, 13 Mar 2026 01:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773366748; cv=none; b=S7q3Eia/j56IJKzGsfEdW6Zl2sDqaVf+EfUklcAM+6reKmcC3LZdQWpyNxbgaTGgBAXltx8nGdJr6N/KSGsGbtv++SyiKVXqZvLoDnOxt/HKHPXYNjDlfMpJ2GU0KYIXgFBMP5/KYgk4IfmegN7fGXMJD5DcUhTc4BCE5LLDAh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773366748; c=relaxed/simple;
	bh=0wdWYOTQIrn2DAmCCZnu5w7Dz3BlEgyNXBT+ovP1hMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTMag8sANXLFF5+4OTATnxURMTeNFuzTJzOrx6q0FHGoe+u8XcUWO0OywmqUsACuRqBMTaM+unHhZOvolXOet/QSreBC97aDbZByqk4M63Cqul48N6l/ojcxPqTrIk804wgEBM2yjcVdbgB8tYucy8/QM+2xrWEcFKiGW3WrU3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFzsC/P+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFzsC/P+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773366745; x=1804902745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0wdWYOTQIrn2DAmCCZnu5w7Dz3BlEgyNXBT+ovP1hMg=;
  b=IFzsC/P+uWRl+exxPk7WE/QdJJ8GMnpdNV73uHIL4Z6w5HP2xMMz6CJr
   G7EE5tFRmHi8g/tbwGHvXwfHq4xX4zKrnyitJY3E5Kk9CrqnhWgr/HpZI
   349mCql7GlIAWG/BcS0KuOkUXaf/jiiISK0NaT2ixBrhlrBVuR5/tcre1
   sLnOSIMJ5ZXAqoFNaW4JHxoe+izx5BIEPQj2kX15mqOu5XRHP2MtoyEqI
   3Tho50yMk5/FhwtRbvZ0EmrSgmYW4ZIORakdiqk5PzF+hvA2W6996bV9i
   GfD1AwDEi6yMPd7eI6AymgAGm6aNv6sC7SgSl3gIHydfXm25rXrtlEH8r
   w==;
X-CSE-ConnectionGUID: PwduMbQrTi6Aus6/KnPuxw==
X-CSE-MsgGUID: 1U6P/aRgQeKKQrfRrXhGUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74354581"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74354581"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
X-CSE-ConnectionGUID: vrHvvp0eRJqEhXjrAedY0A==
X-CSE-MsgGUID: +lq3nR5/RiugRyW7GOxSVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220108503"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 12/22] platform/x86/intel/pmt: Unify header fetch and add ACPI source
Date: Thu, 12 Mar 2026 18:51:51 -0700
Message-ID: <20260313015202.3660072-13-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313015202.3660072-1-david.e.box@linux.intel.com>
References: <20260313015202.3660072-1-david.e.box@linux.intel.com>
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
 drivers/platform/x86/intel/pmt/class.c | 124 +++++++++++++++++++++++--
 1 file changed, 115 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index f94f51178043..ddd9c4bf7323 100644
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
@@ -287,6 +287,82 @@ static int intel_pmt_populate_entry(struct intel_pmt_e=
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
+			dev_err(dev,
+				"ACCESS_BARID requires PCI BAR resources or base_addr\n");
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
+		break;
+	case INTEL_VSEC_DISC_ACPI:
+		ret =3D pmt_resolve_access_acpi(entry, ivdev);
+		break;
+	default:
+		dev_err(dev, "Unknown discovery source: %d\n", ivdev->src);
+		ret =3D -EINVAL;
+		break;
+	}
+
+	if (ret)
+		return ret;
+
 	entry->guid =3D header->guid;
 	entry->size =3D header->size;
 	entry->cb =3D ivdev->priv_data;
@@ -371,18 +447,48 @@ static int intel_pmt_dev_register(struct intel_pmt_en=
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
+
+		/* Used by crashlog driver */
+		entry->disc_table =3D disc_table;
+
+		return 0;
+	}
+	case INTEL_VSEC_DISC_ACPI:
+		memcpy(headers, &ivdev->acpi_disc[idx][0], 2 * sizeof(u64));
+
+		return 0;
+	default:
+		dev_err(dev, "Unknown discovery source type: %d\n", ivdev->src);
+		break;
+	}
+
+	return -EINVAL;
+}
+
 static int pmt_read_header(struct intel_vsec_device *ivdev, int idx,
 			   struct intel_pmt_entry *entry)
 {
 	struct intel_pmt_header *header =3D &entry->header;
-	struct device *dev =3D &ivdev->auxdev.dev;
 	u64 headers[2];
+	int ret;
=20
-	entry->disc_table =3D devm_ioremap_resource(dev, &ivdev->resource[idx]);
-	if (IS_ERR(entry->disc_table))
-		return PTR_ERR(entry->disc_table);
-
-	memcpy_fromio(headers, entry->disc_table, 2 * sizeof(u64));
+	ret =3D pmt_get_headers(ivdev, idx, entry, headers);
+	if (ret)
+		return ret;
=20
 	header->access_type =3D FIELD_GET(PMT_ACCESS_TYPE, headers[0]);
 	header->telem_type =3D FIELD_GET(PMT_TELEM_TYPE, headers[0]);
--=20
2.43.0

