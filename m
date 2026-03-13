Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FFA332919;
	Fri, 13 Mar 2026 01:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773366743; cv=none; b=A0F/9jc+nVQXGNJEZ9EhLJEXHYk69nnn02QeJVf8voDfVdYKSJxH7hI2TXHvFnBnkrtNLU1minE1QiFc2hKNRgEaU+oXBHFGHXgIcWd5Uqi992H/HadtD237QFcSj6Jm5bNfsfL6SgcWP2uqDL195WSPoxRKZ0/WwnaYuA6OiKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773366743; c=relaxed/simple;
	bh=zekN0HwiIvxOapPmkqVTiox/ehyWXXQRcyg8Gec4a1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WupjjdGb9u/ehoPttqwJdOSaHAIRgWsPmJnjQ1EPQGX+b7Z/myAw0ohH7gww03Yi6KsZoL5gV8+w/7JZA8A+UuuntOKSHInNTsOew+rppG6am0vQ8jRqYiB40FKw0pnE9bRsOSZkFcFTi/Eby1nbYHoltwO0DzzK+G0pjKSVkmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUM51uoE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUM51uoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773366742; x=1804902742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zekN0HwiIvxOapPmkqVTiox/ehyWXXQRcyg8Gec4a1I=;
  b=mUM51uoEdxZqzKr5WsxTENYdZ8dLufURmhwWeBFq6er41h6u0FHC7KhY
   cZu2f1ni49arRfrZiaBHJ4zuLGHOrZZRKskTn9dUa4X8UO7H9VhaWCw0c
   Vhp1L1ElHobmLOhExjJSEaqgVI9DykjMhoE9r7xGJQ5LfmCh+KEALMFE0
   JCxxeJpg1URX0Apgz8D1p+N0emvRIcmsTHgP4rYm9BFD3bjvKzQUgZsX9
   xn1t3592XXSd094uchnxcnSM6/2ylCVyJeLMZn/6s61UrnPaSkTSUlzSw
   LPlxHthnWQ+fmtMzWXfljBqIrLqkNjKhV0N2L5M7jMwuh4PQ+HxL31xGw
   w==;
X-CSE-ConnectionGUID: g2TbAWkLSZeMHgyx0SpS5A==
X-CSE-MsgGUID: /0jvBP7/TwOwUjSr16MnpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74354556"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74354556"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
X-CSE-ConnectionGUID: v1qVw0lJShCSNA3+7Yw+sw==
X-CSE-MsgGUID: vz6Bbs3SQamaPWZKx9TVbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220108484"
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
Subject: [PATCH 06/22] platform/x86/intel/vsec: Plumb ACPI PMT discovery tables through vsec
Date: Thu, 12 Mar 2026 18:51:45 -0700
Message-ID: <20260313015202.3660072-7-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313015202.3660072-1-david.e.box@linux.intel.com>
References: <20260313015202.3660072-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Some platforms expose PMT discovery via ACPI instead of PCI BARs. Add a
generic discovery source flag and carry ACPI discovery entries alongside
the existing PCI resource path so PMT clients can consume either.

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

Previous changelog:
  Changes in v7:
  - No change

  Changes in v6:
  - Fix checkpatch parens alignment warning
=20=20
  Changes in v5:
  - No change
=20=20=20=20
  Changes in v4:
  - Use check_mul_overflow() instead of array_size() which was
    incorrectly checking for 0 anyway.
=20=20
  Changes in v3:
  - Re-send with all changes intended for v2 which was sent without them
    being applied.
=20=20
  Changes in v2:
  - Improve comment to clarify BAR resource setup doesn't apply to ACPI
    discovery
  - Add missing #include for kmemdup()
  - Use array_size() for overflow protection
    (review comments by Ilpo J=C3=A4rvinen)

 drivers/platform/x86/intel/vsec.c | 23 +++++++++++++++++++++++
 include/linux/intel_vsec.h        | 20 +++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 34b2c19ecff0..7d5dbc1c1d05 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -24,7 +24,9 @@
 #include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/pci.h>
+#include <linux/string.h>
 #include <linux/types.h>
=20
 #define PMT_XA_START			0
@@ -109,6 +111,7 @@ static void intel_vsec_dev_release(struct device *dev)
=20
 	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
=20
+	kfree(intel_vsec_dev->acpi_disc);
 	kfree(intel_vsec_dev->resource);
 	kfree(intel_vsec_dev);
 }
@@ -320,6 +323,13 @@ static int intel_vsec_add_dev(struct device *dev, stru=
ct intel_vsec_header *head
 	 * auxiliary device driver.
 	 */
 	for (i =3D 0, tmp =3D res; i < header->num_entries; i++, tmp++) {
+		/*
+		 * Skip resource mapping check for ACPI-based discovery
+		 * since those tables are read from _DSD, not MMIO.
+		 */
+		if (info->src =3D=3D INTEL_VSEC_DISC_ACPI)
+			break;
+
 		tmp->start =3D base_addr + header->offset + i * (header->entry_size * si=
zeof(u32));
 		tmp->end =3D tmp->start + (header->entry_size * sizeof(u32)) - 1;
 		tmp->flags =3D IORESOURCE_MEM;
@@ -338,6 +348,19 @@ static int intel_vsec_add_dev(struct device *dev, stru=
ct intel_vsec_header *head
 	intel_vsec_dev->base_addr =3D info->base_addr;
 	intel_vsec_dev->priv_data =3D info->priv_data;
 	intel_vsec_dev->cap_id =3D cap_id;
+	intel_vsec_dev->src =3D info->src;
+
+	if (info->src =3D=3D INTEL_VSEC_DISC_ACPI) {
+		size_t bytes;
+
+		if (check_mul_overflow(intel_vsec_dev->num_resources,
+				       sizeof(*info->acpi_disc), &bytes))
+			return -EOVERFLOW;
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
index 4eecb2a6bac4..1fe5665a9d02 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -33,6 +33,11 @@ struct device;
 struct pci_dev;
 struct resource;
=20
+enum intel_vsec_disc_source {
+	INTEL_VSEC_DISC_PCI,	/* PCI, default */
+	INTEL_VSEC_DISC_ACPI,	/* ACPI */
+};
+
 enum intel_vsec_id {
 	VSEC_ID_TELEMETRY	=3D 2,
 	VSEC_ID_WATCHER		=3D 3,
@@ -103,6 +108,10 @@ struct vsec_feature_dependency {
  * @parent:    parent device in the auxbus chain
  * @headers:   list of headers to define the PMT client devices to create
  * @deps:      array of feature dependencies
+ * @acpi_disc: ACPI discovery tables, each entry is two QWORDs
+ *             in little-endian format as defined by the PMT ACPI spec.
+ *             Valid only when @provider =3D=3D INTEL_VSEC_DISC_ACPI.
+ * @src:       source of discovery table data
  * @priv_data: private data, usable by parent devices, currently a callback
  * @caps:      bitmask of PMT capabilities for the given headers
  * @quirks:    bitmask of VSEC device quirks
@@ -113,6 +122,8 @@ struct intel_vsec_platform_info {
 	struct device *parent;
 	struct intel_vsec_header **headers;
 	const struct vsec_feature_dependency *deps;
+	u32 (*acpi_disc)[4];
+	enum intel_vsec_disc_source src;
 	void *priv_data;
 	unsigned long caps;
 	unsigned long quirks;
@@ -124,7 +135,12 @@ struct intel_vsec_platform_info {
  * struct intel_vsec_device - Auxbus specific device information
  * @auxdev:        auxbus device struct for auxbus access
  * @dev:           struct device associated with the device
- * @resource:      any resources shared by the parent
+ * @resource:      PCI discovery resources (BAR windows), one per discovery
+ *                 instance. Valid only when @src =3D=3D INTEL_VSEC_DISC_P=
CI
+ * @acpi_disc:     ACPI discovery tables, each entry is two QWORDs
+ *                 in little-endian format as defined by the PMT ACPI spec.
+ *                 Valid only when @src =3D=3D INTEL_VSEC_DISC_ACPI.
+ * @src:           source of discovery table data
  * @ida:           id reference
  * @num_resources: number of resources
  * @id:            xarray id
@@ -138,6 +154,8 @@ struct intel_vsec_device {
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

