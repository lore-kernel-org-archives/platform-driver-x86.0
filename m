Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D5337C924;
	Fri,  1 May 2026 23:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677083; cv=none; b=gMOE/dKwu67XCP9fPTJ0Z82J1snKn3kfDjyzDF4AltsSwFnjOcK/hX5z+WfgNdOwlctBiYug/Ro1xa25eDm1uHlr1pcrB1caozsDMDDU6me0OaIFyeZBZh1BitbJwARf6nQa6+kwy48YCBAmV7jN55zo+bD3hyzaXELyn0LCEy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677083; c=relaxed/simple;
	bh=8XXYoMVmBfpEr07SvmsDBTfMlJdKLBDFfiMJh82pq4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKsC5JiyCQU07ypDJyB0NbgFBU29N4KpQ7hcppQ50ZcjpMyr3NNRCP8mGZ3bvXm/VefbdCiOIMjU+9kN397+X4cqFYKD8VP8PJxRP0r1RYk0QbLG6BIulvUASEdbtfVBfJTGDCtf41TzyWuu7ZSC1DgXbfm0HPr5aqUBcZrov/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCzjI8Uv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCzjI8Uv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677078; x=1809213078;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8XXYoMVmBfpEr07SvmsDBTfMlJdKLBDFfiMJh82pq4M=;
  b=bCzjI8Uvz8TD1vbAmw8qGtzcvxAu7gtgZC1PN9FdFKP88LNrd1I6wzZb
   Vm3fw0hfdWJWxNDBLOLRc/H4Ex4dG+MymmKNxK8OSTSRjSS7OMQ3MJ9H2
   vDbkkZRvhGlTi8Ysx8pKRC7mYh6pkkQ0+T4EBtziweKizZuCrnEhfoetZ
   ut3cXXyEOnJiQlueZxn/7HozzW7DzkfJOImbQfzj58ypLKflPAEl5zZvW
   uqaGjLIhALxOiKapRNE2iY0nRq7tztkNJeXo4wLRRwjEONrQM/HfJBEPp
   rkInKcVBfrzJ4n6NC7h12jtTs0WFar+Tagrm0+2IpR0dTqvjIyAwZcZrw
   A==;
X-CSE-ConnectionGUID: i5ZP1tDrRjyruLBp/x3ljg==
X-CSE-MsgGUID: 2XgQDoDTSgCKPQh/Y69//Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740154"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740154"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:01 -0700
X-CSE-ConnectionGUID: kPszHKYJR7Sl//qAknhQiw==
X-CSE-MsgGUID: j9Ac5B70R6yuq3r0Qyw5WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948968"
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
Subject: [PATCH V3 13/16] platform/x86/intel/pmc/ssram: Refactor memory barrier for reentrant probe
Date: Fri,  1 May 2026 16:10:50 -0700
Message-ID: <20260501231054.3890305-14-david.e.box@linux.intel.com>
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
before reading base_addr. This per-index approach allows multiple probes to
work independently while maintaining the same memory ordering guarantees.

Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V3 - No changes

V2 changes:
  - Expanded commit message to explain synchronization rationale
  - Remove unused probe_finish label associated with the old global flag

 .../platform/x86/intel/pmc/ssram_telemetry.c  | 40 ++++++++-----------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 6917a10cbc80..597bfb7ad822 100644
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

