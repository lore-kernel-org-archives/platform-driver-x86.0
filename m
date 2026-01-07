Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9AF1DFD96;
	Wed,  7 Jan 2026 00:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767745337; cv=none; b=kabslLbhubRmMGbSQpPBTBHsGiLvNIdFTrVRl1RCCFGbLkj5mQ4sP8JZl+jUQKBldNCwyuvmt7yiEqJYEundvivbty3n3sHpVAvK+8nYlHn5cclFnRkQxmFQJ4Z0gVIl7pEnJGq9xBwzOces3TYoflvNmxR42yQ/qRJ4oT80X4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767745337; c=relaxed/simple;
	bh=+zZsnqtWYOKWf13j3NIfJKTb3vuYMFSj5yf8TzgjSFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHKGyJ7xt6MOwAQXhc0FRcJ7YgB3+08X4GyF8Xv0X82+qTGErBNsN0l7n5NZesRpAQX8JUnrFlH1drXc8UAtj9lh4UfvELz+HgOZ+veixOHIiwaCGTLqQ+XnmrtGmIBniXm5CA7UleixGzwW9ucUuXxPF8LPzC2+nu4CiqaHPdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvCt44X2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvCt44X2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767745337; x=1799281337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+zZsnqtWYOKWf13j3NIfJKTb3vuYMFSj5yf8TzgjSFk=;
  b=cvCt44X2pvSDNiFmsE7ztooxDqLO8TB1ZO3fJUiujVMjMciq7vfJRfFR
   mOzm2X96/waPhfaIJeExGCtkPQqnC80BZjqK5LfdLHnBVeusWKNR8oP3c
   EiTcYALrN1+tyUe/sXiPNzrgJ2CyRPGljMODHWrWcUBVDplUgWBWA3Y6D
   EipTp4Gw6JgU1HhE90myItjhAMXs8yUBrd7w9wrZZjQYsIRHboAlKK3Tx
   lcTFWYOAW3l7FlujfwLOfEtqs2ywa/lblKoILX6fjdevXL7d6EKH1QFtq
   mbWhcla3dXTYDvFG1B2oaKeFrzt32w6Q5wXl1DrC5Ra6MU9wFWsXyZmwr
   w==;
X-CSE-ConnectionGUID: JLLcJwR8RKCLw3xeF8LfpQ==
X-CSE-MsgGUID: FFcLLK66QUOO1N0zurecAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69164125"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69164125"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 16:22:09 -0800
X-CSE-ConnectionGUID: NlP7E6iCQCSO3py5EQNrdA==
X-CSE-MsgGUID: 4dDWmAo8TMCrCWrgSi0KDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206931528"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 16:22:08 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.comn
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 4/4] platform/x86/intel/vsec: Plumb ACPI PMT discovery tables through vsec
Date: Tue,  6 Jan 2026 16:21:51 -0800
Message-ID: <20260107002153.63830-5-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107002153.63830-1-david.e.box@linux.intel.com>
References: <20260107002153.63830-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Newer platform will optionally expose PMT discovery via ACPI instead of PCI
BARs. Add a generic discovery source flag and carry ACPI discovery entries
alongside the existing PCI resource path so PMT clients can consume either.

Changes:
  - Add enum intel_vsec_disc_source { _PCI, _ACPI }.
  - Extend intel_vsec_platform_info and intel_vsec_device with source enum
    and ACPI discovery table pointer/
  - When src=3D=3DACPI, skip BAR resource setup and copy the ACPI discovery
    entries into the aux device.

No user-visible behavior change yet; this only wires ACPI data through vsec
in preparation for ACPI-enumerated PMT clients.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c | 16 ++++++++++++++++
 include/linux/intel_vsec.h        | 20 +++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 42471fd609b1..705672dcdd11 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -109,6 +109,7 @@ static void intel_vsec_dev_release(struct device *dev)
=20
 	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
=20
+	kfree(intel_vsec_dev->acpi_disc);
 	kfree(intel_vsec_dev->resource);
 	kfree(intel_vsec_dev);
 }
@@ -321,6 +322,10 @@ static int intel_vsec_add_dev(struct device *dev, stru=
ct intel_vsec_header *head
 	 * auxiliary device driver.
 	 */
 	for (i =3D 0, tmp =3D res; i < header->num_entries; i++, tmp++) {
+		/* This check doesn't apply to ACPI based discovery */
+		if (info->src =3D=3D INTEL_VSEC_DISC_ACPI)
+			break;
+
 		tmp->start =3D base_addr + header->offset + i * (header->entry_size * si=
zeof(u32));
 		tmp->end =3D tmp->start + (header->entry_size * sizeof(u32)) - 1;
 		tmp->flags =3D IORESOURCE_MEM;
@@ -339,6 +344,17 @@ static int intel_vsec_add_dev(struct device *dev, stru=
ct intel_vsec_header *head
 	intel_vsec_dev->base_addr =3D info->base_addr;
 	intel_vsec_dev->priv_data =3D info->priv_data;
 	intel_vsec_dev->cap_id =3D cap_id;
+	intel_vsec_dev->src =3D info->src;
+
+	if (info->src =3D=3D INTEL_VSEC_DISC_ACPI) {
+		size_t bytes;
+
+		bytes =3D intel_vsec_dev->num_resources * sizeof(info->acpi_disc[0]);
+
+		intel_vsec_dev->acpi_disc =3D kmemdup(info->acpi_disc, bytes, GFP_KERNEL=
);
+		if (!intel_vsec_dev->acpi_disc)
+			return -ENOMEM;
+	}
=20
 	if (header->id =3D=3D VSEC_ID_SDSI)
 		intel_vsec_dev->ida =3D &intel_vsec_sdsi_ida;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 931ff42361a9..9d7795480c49 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -32,6 +32,11 @@
 struct resource;
 struct pci_dev;
=20
+enum intel_vsec_disc_source {
+	INTEL_VSEC_DISC_PCI,	/* PCI, default */
+	INTEL_VSEC_DISC_ACPI,	/* ACPI */
+};
+
 enum intel_vsec_id {
 	VSEC_ID_TELEMETRY	=3D 2,
 	VSEC_ID_WATCHER		=3D 3,
@@ -102,6 +107,10 @@ struct vsec_feature_dependency {
  * @parent:    parent device in the auxbus chain
  * @headers:   list of headers to define the PMT client devices to create
  * @deps:      array of feature dependencies
+ * @acpi_disc: ACPI discovery tables, each entry is two QWORDs
+ *             in little-endian format as defined by the PMT ACPI spec.
+ *             Valid only when @provider =3D=3D INTEL_VSEC_PROV_ACPI.
+ * @src:       source of discovery table data
  * @priv_data: private data, usable by parent devices, currently a callback
  * @caps:      bitmask of PMT capabilities for the given headers
  * @quirks:    bitmask of VSEC device quirks
@@ -112,6 +121,8 @@ struct intel_vsec_platform_info {
 	struct device *parent;
 	struct intel_vsec_header **headers;
 	const struct vsec_feature_dependency *deps;
+	u32 (*acpi_disc)[4];
+	enum intel_vsec_disc_source src;
 	void *priv_data;
 	unsigned long caps;
 	unsigned long quirks;
@@ -123,7 +134,12 @@ struct intel_vsec_platform_info {
  * struct intel_sec_device - Auxbus specific device information
  * @auxdev:        auxbus device struct for auxbus access
  * @dev:           struct device associated with the device
- * @resource:      any resources shared by the parent
+ * @resource:      PCI discovery resources (BAR windows), one per discovery
+ *                 instance. Valid only when @src =3D=3D INTEL_VSEC_PROV_P=
CI
+ * @acpi_disc:     ACPI discovery tables, each entry is two QWORDs
+ *                 in little-endian format as defined by the PMT ACPI spec.
+ *                 Valid only when @src =3D=3D INTEL_VSEC_PROV_ACPI.
+ * @src:           source of discovery table data
  * @ida:           id reference
  * @num_resources: number of resources
  * @id:            xarray id
@@ -136,6 +152,8 @@ struct intel_vsec_device {
 	struct auxiliary_device auxdev;
 	struct device *dev;
 	struct resource *resource;
+	u32 (*acpi_disc)[4];
+	enum intel_vsec_disc_source src;
 	struct ida *ida;
 	int num_resources;
 	int id; /* xa */
--=20
2.43.0

