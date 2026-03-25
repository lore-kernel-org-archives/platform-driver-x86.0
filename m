Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C9029ACDD;
	Wed, 25 Mar 2026 01:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403315; cv=none; b=Va0ImGh36xQHjSsq2Ym1MhYbFRhaQGFWYPoyEa3kOw4oCrkcxZ5CRHh4nE9r2paiaRo3hofKrsWfSvTE0ee500PR9s0sDR9T/Dfz2xf0uTg7ZVRV7qNluuLLqsBDDXh07HJr3Vh2f+ZKEnyJ1Y0tmkf/d0MRrFvuSaMCwtHCMWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403315; c=relaxed/simple;
	bh=7V3cMpy/T5CdDDTun+KHak8IaEqoIlJBsue1FgaOixI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6EQ+Jls10IeZS1eMkh9vjY/AOcuxzec6uAsAbjJPnVtw3siXI767/8eqMBkRUazzJENuI7JGh7cBshgXtl7xetPxT8OCUHrt6uw6BLlQC6Ca5MnWzcTizQ3bc9Lg/AM1e1BotJt9MTRcTy1HF+oUl0WpmGxPcWXm4vWpj4am1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpYURxaO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpYURxaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774403313; x=1805939313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7V3cMpy/T5CdDDTun+KHak8IaEqoIlJBsue1FgaOixI=;
  b=XpYURxaOplm4f6XqQE4dUVKAPo7ZdyAjtgwvQCdQlylpZs1y2KOYOdz4
   vsBN21YSIcnbQKo3DP/Ruye4g12O2knULk69BFfzP6SCc7IbTr5bPCvSz
   wAdhk5Gq4ONthQvmfUrDYREjQ1HNSaXKowJp+5U3OOF5FH+LZ3Mih3QgO
   bI0qpFcDBVVRNxR9Qi1+5jVQ8wPJak7nEnaJCFFX1LVcJnRXoORUoNBCB
   hR8d6FuMvsruHvQEqEov95W2f52AU+Th7w5CNFuTpbBGMHOD6rRUDYnF7
   0txRyDmUGdHzyIY2JH+U8R/xkavf5AUguBa+FP2amehn+hupxgAr05DJY
   w==;
X-CSE-ConnectionGUID: lD6wRe+4R4Wh1Yj7s+uFzQ==
X-CSE-MsgGUID: B0LqKYNTR3SKOpfkRggaAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75317525"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75317525"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:33 -0700
X-CSE-ConnectionGUID: hvOU+cNZQ9qjGcVp1nhE6w==
X-CSE-MsgGUID: omnewSckRdy0erGbvuziwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221190796"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:32 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2 13/17] platform/x86/intel/pmc/ssram: Refactor memory barrier for reentrant probe
Date: Tue, 24 Mar 2026 18:48:15 -0700
Message-ID: <20260325014819.1283566-14-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325014819.1283566-1-david.e.box@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Xi Pardee <xi.pardee@linux.intel.com>

Previously, a single global 'device_probed' flag with memory barriers was
used to prevent callers from reading PMC info before probe completion.  The
write barrier in probe ensured all data, devid and base_addr, was visible
before signaling completion, and the read barrier in callers ensured they
checked the flag before reading data.

A following commit will make probe reentrant, requiring that a different
synchronization flag be used since a single global flag cannot coordinate
multiple concurrent probes.

Switch to per-index devid publication. Each probe instance writes base_addr
first, then a write barrier ensures visibility before devid is written as
the completion signal. Callers check devid first, then use a read barrier
before reading base_addr. This per-index approach allows multiple probes
to work independently while maintaining the same memory ordering guarantees.

Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

V2 changes:
- Expanded commit message to explain synchronization rationale
- Remove unused probe_finish label associated with the old global flag

 .../platform/x86/intel/pmc/ssram_telemetry.c  | 40 ++++++++-----------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 6917a10cbc80..b329e0c0080b 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -40,7 +40,6 @@ static const struct ssram_type pci_main =3D {
 };
=20
 static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
-static bool device_probed;
=20
 static inline u64 get_base(void __iomem *addr, u32 offset)
 {
@@ -55,8 +54,13 @@ static void pmc_ssram_get_devid_pwrmbase(void __iomem *s=
sram, unsigned int pmc_i
 	pwrm_base =3D get_base(ssram, SSRAM_PWRM_OFFSET);
 	devid =3D readw(ssram + SSRAM_DEVID_OFFSET);
=20
-	pmc_ssram_telems[pmc_idx].devid =3D devid;
 	pmc_ssram_telems[pmc_idx].base_addr =3D pwrm_base;
+	/*
+	 * Memory barrier is used to ensure the correct write order between base_=
addr
+	 * and devid.
+	 */
+	smp_wmb();
+	pmc_ssram_telems[pmc_idx].devid =3D devid;
 }
=20
 static int
@@ -154,32 +158,28 @@ static int pmc_ssram_telemetry_pci_init(struct pci_de=
v *pcidev)
  * * 0           - Success
  * * -EAGAIN     - Probe function has not finished yet. Try again.
  * * -EINVAL     - Invalid pmc_idx
- * * -ENODEV     - PMC device is not available
  */
 int pmc_ssram_telemetry_get_pmc_info(unsigned int pmc_idx,
 				     struct pmc_ssram_telemetry *pmc_ssram_telemetry)
 {
+	if (pmc_idx >=3D MAX_NUM_PMC)
+		return -EINVAL;
+
 	/*
 	 * PMCs are discovered in probe function. If this function is called befo=
re
-	 * probe function complete, the result would be invalid. Use device_probed
-	 * variable to avoid this case. Return -EAGAIN to inform the consumer to =
call
+	 * probe function complete, the result would be invalid. Use devid to avo=
id
+	 * this case. Return -EAGAIN to inform the consumer to call
 	 * again later.
 	 */
-	if (!device_probed)
+	if (!pmc_ssram_telems[pmc_idx].devid)
 		return -EAGAIN;
=20
+	pmc_ssram_telemetry->devid =3D pmc_ssram_telems[pmc_idx].devid;
 	/*
 	 * Memory barrier is used to ensure the correct read order between
-	 * device_probed variable and PMC info.
+	 * devid variable and base_addr.
 	 */
 	smp_rmb();
-	if (pmc_idx >=3D MAX_NUM_PMC)
-		return -EINVAL;
-
-	if (!pmc_ssram_telems[pmc_idx].devid)
-		return -ENODEV;
-
-	pmc_ssram_telemetry->devid =3D pmc_ssram_telems[pmc_idx].devid;
 	pmc_ssram_telemetry->base_addr =3D pmc_ssram_telems[pmc_idx].base_addr;
 	return 0;
 }
@@ -194,8 +194,7 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pc=
idev, const struct pci_de
 	ssram_type =3D (const struct ssram_type *)id->driver_data;
 	if (!ssram_type) {
 		dev_dbg(&pcidev->dev, "missing driver data\n");
-		ret =3D -EINVAL;
-		goto probe_finish;
+		return -EINVAL;
 	}
=20
 	method =3D ssram_type->method;
@@ -203,7 +202,7 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pc=
idev, const struct pci_de
 	ret =3D pcim_enable_device(pcidev);
 	if (ret) {
 		dev_dbg(&pcidev->dev, "failed to enable PMC SSRAM device\n");
-		goto probe_finish;
+		return ret;
 	}
=20
 	if (method =3D=3D RES_METHOD_PCI)
@@ -211,13 +210,6 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *p=
cidev, const struct pci_de
 	else
 		ret =3D -EINVAL;
=20
-probe_finish:
-	/*
-	 * Memory barrier is used to ensure the correct write order between PMC i=
nfo
-	 * and device_probed variable.
-	 */
-	smp_wmb();
-	device_probed =3D true;
 	return ret;
 }
=20
--=20
2.43.0

