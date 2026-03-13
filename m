Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658D133F5A4;
	Fri, 13 Mar 2026 01:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773366767; cv=none; b=ZJvk7PZLaCFFKmIJIY/gwFzX4VmnChR/zi1AwxGcGSdnpRB78UXRoBOjy1EiHqx8XitNHaGpz02vprIu8LqCEk2aRFH3vfdwar6peDEf5Nv5PC0QydhcuFL2Tirx0vVioMqMJMqcYYrPohqY8S9aU+G/Wqp6Q4HmCfBlePLY/EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773366767; c=relaxed/simple;
	bh=9EZCD23+p8RudnMdCZ4NNN4C1wB08jPQU64kU8m1jT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYfPj0HZvHVYcp9jCbC9abCX/WA4Zt1YACXvM/IG8KEASCXEnBrFGWvtswNZztyzIR2XIQFDhm1ROY/Eglw08I/tPiRpoDfTLlrstKukuUD17g3HhzzoyUijMj0n6Fi0ArMSvF0Fw5qrOXOcQ3uvRJDCXX8qLiBgR+VtzomMBpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/aVvTtz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/aVvTtz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773366761; x=1804902761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9EZCD23+p8RudnMdCZ4NNN4C1wB08jPQU64kU8m1jT0=;
  b=T/aVvTtzJbRXzwle3moAgyzF62QWW2Lgb2bGZrdGna2/jGwAnvdf+/iB
   NjoxR3Ww4Pthh5pZVdJHdzW/UCH0Yrr0kiqIGqUo9LUvXttLO69/Q4MbX
   tLQdJoh9lBVNwtZ46VAiwIyInfrbntefRwjuJO4lzoThCfXI1fwHy6kOa
   2zeWW2iYC5IRRJFwC3NsNsDMR5HvGsZpEsY/DijsBFf64pvPEDz3DxpLd
   aBQDUpDHSuPz7l2l5rDdf7GreeKd2nMOwTz+r0iD/2UFeFK9PxlL0aiXs
   8dMSGUKZpgHzrLD49jLfQwPVQevIvok4qnXV4eQvvEO40Y6iPBjxCLnvI
   w==;
X-CSE-ConnectionGUID: SXRqx+4oQa+0O9f1jn2GCw==
X-CSE-MsgGUID: fxO+iNRHQl6uarAqNgr7Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74354611"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74354611"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
X-CSE-ConnectionGUID: LJvuCfgKQWq/SleK9LG13Q==
X-CSE-MsgGUID: n86wPIh7RMiVY8p+4qan0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220108525"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:13 -0700
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
Subject: [PATCH 19/22] platform/x86/intel/pmc/ssram: Refactor memory barrier for reentrant probe
Date: Thu, 12 Mar 2026 18:51:58 -0700
Message-ID: <20260313015202.3660072-20-david.e.box@linux.intel.com>
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

From: Xi Pardee <xi.pardee@linux.intel.com>

Switch the readiness synchronization from a global device_probed flag to
per-index devid publication. This is required because a subsequent patch
makes probe reentrant, so a single global flag can no longer reliably
signal completion.

Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 .../platform/x86/intel/pmc/ssram_telemetry.c  | 34 ++++++++-----------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 7db98037c521..246efdcf6950 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -37,7 +37,6 @@ static const struct ssram_type pci_main =3D {
 };
=20
 static struct pmc_ssram_telemetry pmc_ssram_telems[3];
-static bool device_probed;
=20
 static inline u64 get_base(void __iomem *addr, u32 offset)
 {
@@ -52,8 +51,13 @@ static void pmc_ssram_get_devid_pwrmbase(void __iomem *s=
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
@@ -151,32 +155,28 @@ static int pmc_ssram_telemetry_pci_init(struct pci_de=
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
@@ -209,12 +209,6 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *p=
cidev, const struct pci_de
 		ret =3D -EINVAL;
=20
 probe_finish:
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

