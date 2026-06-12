Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0973D3D0C;
	Fri, 12 Jun 2026 21:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298142; cv=none; b=SAXpukd8mDgpDOwufqK2/KYnn5x7pSWNDt6CPDTxb9cgXx8AZJ6eJAZJ0D6gbH7hFpHZog2Ew9uArm0Ijf8o8r48oa4dQik68YcgmNXIlktXwz/PjUlSV9TTQyAH/11nV2n75VmhUBWvV2c8C7Dubl8YwWmEXEDAcrzyoXR/Uk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298142; c=relaxed/simple;
	bh=2tm2YIGoTnVvOf9vpSqU3Zu5thL1enIDIH3KONrrZzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYQ6U6kmnn9KqQw62mHdueyoh+d7nSiMQtitgvAmdHJXM7e+eMQPfaFtoRqGB/ZSp08h9qcave0pr/fujDUFJKEPsUqPyj2XitIh04TLK6UBhQvqAuQWJ5KZk/LajGUKDPd8zejvNqbi+drXlz2pwa3GGP8+RoKtG79+jSJbpxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VySb3ktJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VySb3ktJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781298141; x=1812834141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2tm2YIGoTnVvOf9vpSqU3Zu5thL1enIDIH3KONrrZzg=;
  b=VySb3ktJxhD/4H/8+LMTHtQajgchj3RbSlVeis3zgxVGpUJCKk7DOQGI
   c7v0C4l42I7x0wmoXTqR6tevAtc4jdgmO48yg2ze2ksN5Ri6lF9PJi8VX
   c4gOCel+gvsju7hYkP3BqaWr0KwWVPUlKLl7Y/0QsPLXzQol6IB7hzbbo
   5fQ1PdjJ27u4LSqRBTTa299m+rLeDUjINWejx/Q0o45OtgE0TFR2C2mMl
   huzsEbiMbXiL9WbMtGEKFdPvb+ihbAanEsMGWH+gdZPdtqkHPxwbCCjeh
   gjh/3RHaw8hKHDFfoj1KrLtgypFLg7U9TbOTUO1dMwGAoviEQFKYYWIqG
   A==;
X-CSE-ConnectionGUID: 7v2YnnNZTCGEglB6ZD0xxA==
X-CSE-MsgGUID: MtxjJQpRTDSInYW1o+L7dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86038008"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="86038008"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:13 -0700
X-CSE-ConnectionGUID: ADr9z0LPQB+yygOqlMQddg==
X-CSE-MsgGUID: OlKovAh+TSCzbZr1wCLqJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="250832870"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:12 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v8 12/15] platform/x86/intel/pmc/ssram: Switch to static array with per-index probe state
Date: Fri, 12 Jun 2026 14:01:53 -0700
Message-ID: <a2cccf532bec04fcc370819890d936212bc1b14c.1781294741.git.david.e.box@linux.intel.com>
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

Replace devm-allocated pmc_ssram_telems pointer with a fixed-size static
array and introduce per-index probe state tracking.

This prepares the driver for later per-device probe handling where tying
the PMC tracking storage to one probed PCI device is no longer suitable.

The previous single global device_probed flag cannot describe the state of
individual PMC indices when multiple devices can be probed independently.
Replace it with per-index state (UNPROBED, PROBING, PRESENT, ABSENT) and a
staging cache that publishes discovered values only after probe completes.
This avoids races between probe/unbind and concurrent readers.

Use marked state accesses with release/acquire ordering to prevent compiler
and CPU reordering issues across concurrent probe/unbind cycles.

This patch was substantially rewritten in later revisions. Originally
developed from earlier work by Xi Pardee.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Assisted-by: Claude:claude-sonnet-4-5
---
V8 changes:
  - Added descriptive comments for per-index probe state tracking fields
    and publish logic.
  - Added kernel-doc state-flow description for
    pmc_ssram_telemetry_get_pmc_info().
  - Updated commit message attribution note to acknowledge original v1
    work while reflecting substantial rerolling.

V7 changes:
  - Made PMC_SSRAM_UNPROBED explicitly =3D 0 for clarity.
  - Replace the explicit smp_wmb() / smp_rmb() pairing with
    smp_store_release() / smp_load_acquire() when publishing and consuming
    the per-index SSRAM state.

V6 changes:
  - Squashed patch combining v5 patches 10 ("Use fixed-size static pmc
    array") and 13 ("Refactor memory barrier for reentrant probe"). Both
    patches addressed per-index probe state tracking and reentrant probe
    protection, so they were combined for better logical cohesion.
  - Added per-index probe state enum (UNPROBED, PROBING, PRESENT, ABSENT)
    to replace devid overload where devid was used as both payload and
    probe state indicator. This fixes stale data issues on reprobe,
    distinguishes between -EAGAIN (probe in progress) and -ENODEV (probe
    failed) error semantics, and prevents stale values from being visible
    after failed reprobe (Ilpo/Sashiko/Claude).
  - Added staging cache that publishes devid and base_addr only after probe
    completes successfully to avoid races between probe/unbind and
    concurrent readers.
  - Added .remove callback to handle proper state cleanup on driver unbind.
  - Used READ_ONCE/WRITE_ONCE for pmc_ssram_state[] accesses to prevent
    compiler optimizations from causing issues across concurrent probe/
    unbind cycles.

V5 - No changes (for both original patches)

V4 - No changes (for both original patches)

V3 - No changes (for both original patches)

V2 changes (from original patch 10 "Use fixed-size static pmc array"):
  - Replaced hardcoded array size [3] with MAX_NUM_PMC constant

V2 changes (from original patch 13 "Refactor memory barrier"):
  - Expanded commit message to explain synchronization rationale
  - Remove unused probe_finish label associated with the old global flag

 .../platform/x86/intel/pmc/ssram_telemetry.c  | 218 ++++++++++++++----
 1 file changed, 176 insertions(+), 42 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 211d842df449..3349f65ae7bd 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2023, Intel Corporation.
  */
=20
+#include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
@@ -24,6 +25,7 @@
 #define SSRAM_IOE_OFFSET	0x68
 #define SSRAM_DEVID_OFFSET	0x70
 #define SSRAM_BASE_ADDR_MASK	GENMASK_ULL(63, 3)
+#define SSRAM_PCI_PMC_MASK	(BIT(PMC_IDX_MAIN) | BIT(PMC_IDX_IOE) | BIT(PMC=
_IDX_PCH))
=20
 DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_=
T))
=20
@@ -39,15 +41,37 @@ static const struct ssram_type pci_main =3D {
 	.method =3D RES_METHOD_PCI,
 };
=20
-static struct pmc_ssram_telemetry *pmc_ssram_telems;
-static bool device_probed;
+enum pmc_ssram_state {
+	PMC_SSRAM_UNPROBED =3D 0,
+	PMC_SSRAM_PROBING,
+	PMC_SSRAM_PRESENT,
+	PMC_SSRAM_ABSENT,
+};
+
+static enum pmc_ssram_state pmc_ssram_state[MAX_NUM_PMC];
+static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
+
+struct pmc_ssram_probe_cache {
+	/* Per-index values staged by probe before publishing globally. */
+	struct pmc_ssram_telemetry telems[MAX_NUM_PMC];
+	/* PMCs this probe instance is responsible for publishing. */
+	unsigned long owned_mask;
+	/* Subset of owned_mask that was discovered successfully. */
+	unsigned long valid_mask;
+};
+
+struct pmc_ssram_drvdata {
+	/* PMCs published by this bound device; used to unpublish on remove. */
+	unsigned long owned_mask;
+};
=20
 static inline u64 get_base(void __iomem *addr, u32 offset)
 {
 	return lo_hi_readq(addr + offset) & SSRAM_BASE_ADDR_MASK;
 }
=20
-static void pmc_ssram_get_devid_pwrmbase(void __iomem *ssram, unsigned int=
 pmc_idx)
+static void pmc_ssram_get_devid_pwrmbase(struct pmc_ssram_probe_cache *pro=
be_cache,
+					 void __iomem *ssram, unsigned int pmc_idx)
 {
 	u64 pwrm_base;
 	u16 devid;
@@ -55,8 +79,45 @@ static void pmc_ssram_get_devid_pwrmbase(void __iomem *s=
sram, unsigned int pmc_i
 	pwrm_base =3D get_base(ssram, SSRAM_PWRM_OFFSET);
 	devid =3D readw(ssram + SSRAM_DEVID_OFFSET);
=20
-	pmc_ssram_telems[pmc_idx].devid =3D devid;
-	pmc_ssram_telems[pmc_idx].base_addr =3D pwrm_base;
+	probe_cache->telems[pmc_idx].base_addr =3D pwrm_base;
+	probe_cache->telems[pmc_idx].devid =3D devid;
+}
+
+static void pmc_ssram_publish_absent(unsigned int pmc_idx)
+{
+	/*
+	 * Publish only the state without modifying base_addr and devid. This
+	 * lets a reader that already observed PRESENT finish copying the
+	 * previous values even if unbind concurrently publishes ABSENT. Readers
+	 * that observe ABSENT return -ENODEV without accessing data.
+	 */
+	smp_store_release(&pmc_ssram_state[pmc_idx], PMC_SSRAM_ABSENT);
+}
+
+static void pmc_ssram_publish_present(struct pmc_ssram_probe_cache *probe_=
cache,
+				      unsigned int pmc_idx)
+{
+	/*
+	 * The devid and base_addr fields are read from hardware MMIO registers
+	 * whose values are stable for a given PMC index. A reader that observed
+	 * PRESENT from an earlier probe can safely copy them while a concurrent
+	 * rebind republishes those fields because both probes read the same
+	 * hardware values.
+	 */
+	pmc_ssram_telems[pmc_idx] =3D probe_cache->telems[pmc_idx];
+	/*
+	 * Publish base_addr and devid before publishing PRESENT. Pairs with the
+	 * acquire load in the reader that consumes them after observing PRESENT.
+	 */
+	smp_store_release(&pmc_ssram_state[pmc_idx], PMC_SSRAM_PRESENT);
+}
+
+static void pmc_ssram_mark_probing(unsigned long mask)
+{
+	unsigned long bit;
+
+	for_each_set_bit(bit, &mask, MAX_NUM_PMC)
+		WRITE_ONCE(pmc_ssram_state[bit], PMC_SSRAM_PROBING);
 }
=20
 static int
@@ -96,11 +157,14 @@ pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u6=
4 ssram_base, void __iomem
 }
=20
 static int
-pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_i=
dx, u32 offset)
+pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev,
+				struct pmc_ssram_probe_cache *probe_cache,
+				unsigned int pmc_idx, u32 offset)
 {
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram =3D NULL;
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =3D NULL;
 	u64 ssram_base;
+	int ret;
=20
 	ssram_base =3D pci_resource_start(pcidev, 0);
 	tmp_ssram =3D ioremap(ssram_base, SSRAM_HDR_SIZE);
@@ -125,22 +189,38 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcide=
v, unsigned int pmc_idx, u3
 		ssram =3D no_free_ptr(tmp_ssram);
 	}
=20
-	pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
+	pmc_ssram_get_devid_pwrmbase(probe_cache, ssram, pmc_idx);
=20
 	/* Find and register and PMC telemetry entries */
-	return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
+	ret =3D pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
+	if (ret)
+		return ret;
+
+	probe_cache->valid_mask |=3D BIT(pmc_idx);
+
+	return 0;
 }
=20
-static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
+static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev,
+					struct pmc_ssram_probe_cache *probe_cache)
 {
 	int ret;
=20
-	ret =3D pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_MAIN, 0);
+	ret =3D pmc_ssram_telemetry_get_pmc_pci(pcidev, probe_cache, PMC_IDX_MAIN=
, 0);
 	if (ret)
 		return ret;
=20
-	pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_IOE, SSRAM_IOE_OFFSET);
-	pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_PCH, SSRAM_PCH_OFFSET);
+	/*
+	 * If MAIN PMC enumeration is successful but either IOE or PCH fail,
+	 * don't fail probe as the MAIN PMC is still useful as it provides the
+	 * global reset and slp_s0 counter access. Failed or missing secondary
+	 * PMCs are left out of valid_mask and published as absent.
+	 */
+	pmc_ssram_telemetry_get_pmc_pci(pcidev, probe_cache, PMC_IDX_IOE,
+					SSRAM_IOE_OFFSET);
+
+	pmc_ssram_telemetry_get_pmc_pci(pcidev, probe_cache, PMC_IDX_PCH,
+					SSRAM_PCH_OFFSET);
=20
 	return 0;
 }
@@ -150,62 +230,106 @@ static int pmc_ssram_telemetry_pci_init(struct pci_d=
ev *pcidev)
  * @pmc_idx:               Index of the PMC
  * @pmc_ssram_telemetry:   pmc_ssram_telemetry structure to store the PMC =
information
  *
+ * State flow per PMC index:
+ * - PMC_SSRAM_UNPROBED: Probe has not started for this index.
+ * - PMC_SSRAM_PROBING:  Probe is currently discovering data for this inde=
x.
+ * - PMC_SSRAM_PRESENT:  base_addr/devid were published and can be read.
+ * - PMC_SSRAM_ABSENT:   No data is available for this index.
+ *
+ * Readers use an acquire load of the state. If state is PRESENT, reads of
+ * base_addr/devid are ordered after the state observation and pair with t=
he
+ * writer's release-store when publishing PRESENT.
+ *
  * Return:
  * * 0           - Success
  * * -EAGAIN     - Probe function has not finished yet. Try again.
  * * -EINVAL     - Invalid pmc_idx
- * * -ENODEV     - PMC device is not available
+ * * -ENODEV     - PMC device is not available (hardware absent or driver =
failed to initialize)
  */
 int pmc_ssram_telemetry_get_pmc_info(unsigned int pmc_idx,
 				     struct pmc_ssram_telemetry *pmc_ssram_telemetry)
 {
+	enum pmc_ssram_state state;
+
+	if (pmc_idx >=3D MAX_NUM_PMC)
+		return -EINVAL;
+
 	/*
 	 * PMCs are discovered in probe function. If this function is called befo=
re
-	 * probe function complete, the result would be invalid. Use device_probed
-	 * variable to avoid this case. Return -EAGAIN to inform the consumer to =
call
-	 * again later.
+	 * probe function complete, the result would be invalid. Use per-PMC state
+	 * to inform the consumer to call again later.
 	 */
-	if (!device_probed)
+	state =3D smp_load_acquire(&pmc_ssram_state[pmc_idx]);
+	if (state =3D=3D PMC_SSRAM_UNPROBED || state =3D=3D PMC_SSRAM_PROBING)
 		return -EAGAIN;
=20
-	/*
-	 * Memory barrier is used to ensure the correct read order between
-	 * device_probed variable and PMC info.
-	 */
-	smp_rmb();
-	if (pmc_idx >=3D MAX_NUM_PMC)
-		return -EINVAL;
-
-	if (!pmc_ssram_telems || !pmc_ssram_telems[pmc_idx].devid)
+	if (state =3D=3D PMC_SSRAM_ABSENT)
 		return -ENODEV;
=20
+	/*
+	 * Acquire semantics order reads of devid and base_addr after observing
+	 * PRESENT and pair with the writer's release-store.
+	 */
 	pmc_ssram_telemetry->devid =3D pmc_ssram_telems[pmc_idx].devid;
 	pmc_ssram_telemetry->base_addr =3D pmc_ssram_telems[pmc_idx].base_addr;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pmc_ssram_telemetry_get_pmc_info);
=20
+static void pmc_ssram_publish_absent_mask(unsigned long mask)
+{
+	unsigned long bit;
+
+	for_each_set_bit(bit, &mask, MAX_NUM_PMC)
+		pmc_ssram_publish_absent(bit);
+}
+
+static void pmc_ssram_publish_telems(struct pmc_ssram_probe_cache *probe_c=
ache, int ret)
+{
+	unsigned long bit;
+
+	/* If probe failed, all owned indexes become absent for readers. */
+	if (ret) {
+		pmc_ssram_publish_absent_mask(probe_cache->owned_mask);
+		return;
+	}
+
+	/* Publish each owned index independently based on discovery result. */
+	for_each_set_bit(bit, &probe_cache->owned_mask, MAX_NUM_PMC) {
+		if (probe_cache->valid_mask & BIT(bit))
+			pmc_ssram_publish_present(probe_cache, bit);
+		else
+			pmc_ssram_publish_absent(bit);
+	}
+}
+
 static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct =
pci_device_id *id)
 {
+	struct pmc_ssram_probe_cache probe_cache =3D {};
+	struct pmc_ssram_drvdata *drvdata;
 	const struct ssram_type *ssram_type;
 	enum resource_method method;
 	int ret;
=20
-	pmc_ssram_telems =3D devm_kzalloc(&pcidev->dev, sizeof(*pmc_ssram_telems)=
 * MAX_NUM_PMC,
-					GFP_KERNEL);
-	if (!pmc_ssram_telems) {
-		ret =3D -ENOMEM;
-		goto probe_finish;
-	}
-
 	ssram_type =3D (const struct ssram_type *)id->driver_data;
 	if (!ssram_type) {
 		dev_dbg(&pcidev->dev, "missing driver data\n");
-		ret =3D -EINVAL;
-		goto probe_finish;
+		return -EINVAL;
 	}
=20
 	method =3D ssram_type->method;
+	if (method =3D=3D RES_METHOD_PCI)
+		probe_cache.owned_mask =3D SSRAM_PCI_PMC_MASK;
+	else
+		return -EINVAL;
+
+	pmc_ssram_mark_probing(probe_cache.owned_mask);
+
+	drvdata =3D devm_kzalloc(&pcidev->dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata) {
+		ret =3D -ENOMEM;
+		goto probe_finish;
+	}
=20
 	ret =3D pcim_enable_device(pcidev);
 	if (ret) {
@@ -214,20 +338,29 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *=
pcidev, const struct pci_de
 	}
=20
 	if (method =3D=3D RES_METHOD_PCI)
-		ret =3D pmc_ssram_telemetry_pci_init(pcidev);
+		ret =3D pmc_ssram_telemetry_pci_init(pcidev, &probe_cache);
 	else
 		ret =3D -EINVAL;
=20
+	if (!ret) {
+		drvdata->owned_mask =3D probe_cache.owned_mask;
+		pci_set_drvdata(pcidev, drvdata);
+	}
+
 probe_finish:
-	/*
-	 * Memory barrier is used to ensure the correct write order between PMC i=
nfo
-	 * and device_probed variable.
-	 */
-	smp_wmb();
-	device_probed =3D true;
+	pmc_ssram_publish_telems(&probe_cache, ret);
+
 	return ret;
 }
=20
+static void pmc_ssram_telemetry_remove(struct pci_dev *pcidev)
+{
+	struct pmc_ssram_drvdata *drvdata =3D pci_get_drvdata(pcidev);
+
+	if (drvdata)
+		pmc_ssram_publish_absent_mask(drvdata->owned_mask);
+}
+
 static const struct pci_device_id pmc_ssram_telemetry_pci_ids[] =3D {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_MTL_SOCM),
 		.driver_data =3D (kernel_ulong_t)&pci_main },
@@ -251,6 +384,7 @@ static struct pci_driver pmc_ssram_telemetry_driver =3D=
 {
 	.name =3D "intel_pmc_ssram_telemetry",
 	.id_table =3D pmc_ssram_telemetry_pci_ids,
 	.probe =3D pmc_ssram_telemetry_probe,
+	.remove =3D pmc_ssram_telemetry_remove,
 };
 module_pci_driver(pmc_ssram_telemetry_driver);
=20
--=20
2.43.0

