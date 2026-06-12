Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD9736B05C;
	Fri, 12 Jun 2026 21:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298135; cv=none; b=oYWkpwbfGFK5hoCwrPR7FzDb2sI9dQYBUS6MpiULj2BBPJ7H1ODM6h/FwLRa7gW7Qk2pRDz4cUPeYVS7/ZXp+XEHox+qjpgZfRWuStWRcowbHvkVSrEBc/9r7GKyQHJN82vnteCQnTbWx6bGT2oRSgJbY9aKGTWalxGU5uCM3YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298135; c=relaxed/simple;
	bh=LjNy/YZPcDwJpyqNlLJ9U2Z8d+VkxHR3kucZxxmAp3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QF5wJZ8eTdRQrrVRGHCwuMkmDgSIMQ/8wJ/RXHxZlJVC0dC765RF3o9atNE6uO9b/tk8PRcq1DPg/lLe9UV+vZX4bIx0LFrPufvmfnPUMsCnvpr0MyvVEeyi1aJ0gHiFf5e8Ba3GNOp6ueLTdk5+kYQgXCq1NgP48yrBt0BLhgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9TJJaFI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9TJJaFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781298135; x=1812834135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LjNy/YZPcDwJpyqNlLJ9U2Z8d+VkxHR3kucZxxmAp3E=;
  b=A9TJJaFInvbuMgO1a6XgTHYOeA7WJ0sN3D1l6dTcJiSYVuHehUwsxuDE
   uMv8KWX7qvxHfo4qgBYy2TnWWED0teBj8yAA/YzZcQREbRn0ynbmkfLrG
   j8UJjK/qp4qOPz8LXUPhm8tID4pRwX30dEN+h9+jdgbP11H/Er0LqPCLK
   +l96c6Iqq+d1dB5o7ffP4iGLmY0b3QVunEHN6KGc58249BtKlfAPDKs3w
   Yixh3rW9iEq5p+fLhuRdGU+/bhRitMNb7GVC/aUqAqN+EN6o5SJLeaS6Q
   zfG3UUEyVfFQTXwm+7fQZ8yz/MocW5Jlob4Kd3Z4uzT72jYEiDrq1hsLH
   A==;
X-CSE-ConnectionGUID: zpIoKGPfQC2Iw1sQrowxFQ==
X-CSE-MsgGUID: hlwUrKc6SvGJc1vO9YIpEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86037983"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="86037983"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:12 -0700
X-CSE-ConnectionGUID: QYRXcyotSNSLPH0ke3nr2A==
X-CSE-MsgGUID: 5SfyGVuKQxOEPBWaQWy2aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="250832863"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:11 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v8 05/15] platform/x86/intel/pmt: Cache the telemetry discovery header
Date: Fri, 12 Jun 2026 14:01:46 -0700
Message-ID: <f805e2ada52dc0661761cda7f692e76e6ea2d257.1781294741.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781294741.git.david.e.box@linux.intel.com>
References: <cover.1781294741.git.david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

pmt_telem_header_decode() only needs the discovery header dwords, but it
currently decodes them by reading directly from entry->disc_table.

Cache the discovery header in intel_pmt_entry when the device is created
and have telemetry decode use the cached values instead of performing MMIO
reads at decode time.

The DVSEC discovery resource for a namespace is sized by its per-entry
entry_size (in dwords), which can be less than the 4-dword cache (e.g.
telemetry uses entry_size =3D 3, i.e. 12 bytes). Cap the memcpy_fromio()
to resource_size(disc_res) so the new cache does not read past the
mapped region. Any unread dwords stay zero from the zero-initialized
allocation of the containing struct.

This keeps the telemetry header decode path independent of how the
discovery data is backed and avoids baking a direct MMIO assumption into
the feature-specific decode logic.

Assisted-by: GitHub-Copilot:claude-opus-4.7
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V8 - No changes

V7 changes:
  - Replaced min_t(size_t, ...) with min() because both operands are size_t
    (Ilpo).

V6 changes:
  - Added #include <linux/minmax.h> for min_t() macro used in
    memcpy_fromio() size calculation (Ilpo).

V5 changes:
  - Cap memcpy_fromio() of the cached discovery header to
    resource_size(disc_res) so the newly introduced cache does not
    over-read namespaces whose DVSEC entry_size is smaller than the
    cache (e.g. telemetry has entry_size =3D 3, 12 bytes).

V4 - No changes

V3 changes:
  - New patch split out from PMT header-fetch rework to cache discovery
    header data before downstream decode/population.
  - Added to carry the post-v3 bug fix while preserving the original series
    ordering intent.

 drivers/platform/x86/intel/pmt/class.c     | 11 +++++++++++
 drivers/platform/x86/intel/pmt/class.h     |  1 +
 drivers/platform/x86/intel/pmt/telemetry.c | 12 ++++++------
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index 7da8279b54f8..8d27f59d5bff 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -12,6 +12,7 @@
 #include <linux/log2.h>
 #include <linux/intel_vsec.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/pci.h>
@@ -383,6 +384,16 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry=
, struct intel_pmt_namespa
 	if (IS_ERR(entry->disc_table))
 		return PTR_ERR(entry->disc_table);
=20
+	/*
+	 * The mapped discovery resource may be smaller than disc_header (its
+	 * size is the namespace's DVSEC entry_size in dwords, which can be
+	 * less than 4). Cap the copy to the actual resource size to avoid
+	 * reading past the mapped region; any unread dwords stay zero from
+	 * the zero-initialized allocation of the containing struct.
+	 */
+	memcpy_fromio(entry->disc_header, entry->disc_table,
+		      min(sizeof(entry->disc_header), resource_size(disc_res)));
+
 	if (ns->pmt_pre_decode) {
 		ret =3D ns->pmt_pre_decode(intel_vsec_dev, entry);
 		if (ret)
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/=
intel/pmt/class.h
index 8a0db0ef58c1..84202fc7920c 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -44,6 +44,7 @@ struct intel_pmt_entry {
 	struct telem_endpoint	*ep;
 	struct pci_dev		*pcidev;
 	struct intel_pmt_header	header;
+	u32			disc_header[4];
 	struct bin_attribute	pmt_bin_attr;
 	const struct attribute_group *attr_grp;
 	struct kobject		*kobj;
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/=
x86/intel/pmt/telemetry.c
index d22f633638be..953f35b6daec 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -72,16 +72,16 @@ static bool pmt_telem_region_overlaps(struct device *de=
v, u32 guid, u32 type)
 static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
 				   struct device *dev)
 {
-	void __iomem *disc_table =3D entry->disc_table;
 	struct intel_pmt_header *header =3D &entry->header;
+	u32 *disc_header =3D entry->disc_header;
=20
-	header->access_type =3D TELEM_ACCESS(readl(disc_table));
-	header->guid =3D readl(disc_table + TELEM_GUID_OFFSET);
-	header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET);
+	header->access_type =3D TELEM_ACCESS(disc_header[0]);
+	header->guid =3D disc_header[1];
+	header->base_offset =3D disc_header[2];
=20
 	/* Size is measured in DWORDS, but accessor returns bytes */
-	header->size =3D TELEM_SIZE(readl(disc_table));
-	header->telem_type =3D TELEM_TYPE(readl(entry->disc_table));
+	header->size =3D TELEM_SIZE(disc_header[0]);
+	header->telem_type =3D TELEM_TYPE(disc_header[0]);
=20
 	return 0;
 }
--=20
2.43.0

