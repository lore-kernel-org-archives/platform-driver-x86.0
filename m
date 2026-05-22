Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F562EC081;
	Fri, 22 May 2026 02:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416536; cv=none; b=skNzjBhoYt77hIwF7ut/OEl5dH2cZF9LENTA91alOAXO8AL7KdF+fy054px6RgQx7GaGC93dt6Ip8k0Ho0o9+N03rm03pykn216fccrQE47D2vm19jnobcQMb8uwkaKIv+t918+X4ylFSRoUXnaylb/aCAJu/fK1Fm+8ezQHmts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416536; c=relaxed/simple;
	bh=V30rpEqrHapXUVMTqhSdw/4Mp5eMrHyDNKl/2BvIMFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X2WapvYw9N9t4bE8iGps2bMBGvLA0uYZTSK6wQgSFG+2swHoqqAyOPIpvwLqiqqXMSrkqhnUJgvYxUUhEaRDAwkwoguoAKF7+8EPPwMzmHPUegb5k+fK0S0hpUq5F9p9AwmenOKmux+gzlPsCTc5QDrJyLcIYXSiapI/PiIMO0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HcoXBaR+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HcoXBaR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779416532; x=1810952532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V30rpEqrHapXUVMTqhSdw/4Mp5eMrHyDNKl/2BvIMFM=;
  b=HcoXBaR+gA4Yzuy9Safv09/vVbVTXSR1ToCKdjc0UA1mphczpwJfFQNu
   OycQRf+rs4v46twCEyiBZ7pgINhh/7Mrz3DbYKCakFSJb0CT5h1inQ0t8
   xd60E4iwEqIsMYxnv3N9l4sLsSOrEHqka5c9VEiZPBG/OYRMS7nHZht2P
   ve4NmdnrdaEFK86A3cAFoG2s18IopdCUj6/nhpWesq/nFUjAzWpRwNwRZ
   KXzpJyVUPfGbWPuOQLBmn6EvfG+d3nFp6hLsHMrBpfduwAYIxFzh63K+u
   C4UYtpcR9yp+97VCElyHki97Runtk4Qp26ij4+aq/FKwsuEEAU4lYI9g8
   Q==;
X-CSE-ConnectionGUID: S+/iI6hcThGsuVsCHZsHsw==
X-CSE-MsgGUID: muUi66IBTUK2oaImYtXbSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80400551"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80400551"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:22:00 -0700
X-CSE-ConnectionGUID: nYRH0blfSaaJnph3ARriHg==
X-CSE-MsgGUID: EUUWsgXySU+rzoK6HRhlyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236335385"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:22:00 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v5 11/16] platform/x86/intel/pmc/ssram: Refactor DEVID/PWRMBASE extraction into helper
Date: Thu, 21 May 2026 19:21:41 -0700
Message-ID: <20260522022147.4137494-12-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522022147.4137494-1-david.e.box@linux.intel.com>
References: <20260522022147.4137494-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Move DEVID/PWRMBASE extraction into pmc_ssram_get_devid_pwrmbase().

This is a preparatory refactor to place functionality in a common helper
for reuse by a subsequent patch. Additionally add missing bits.h
include and define SSRAM_BASE_ADDR_MASK for the address extraction mask.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
V5 - No changes

V4 - No changes

V3 - No changes

V2 changes:
  - Added missing <linux/bits.h> include for GENMASK_ULL() used in get_base=
()
  - Defined SSRAM_BASE_ADDR_MASK macro to replace magic mask constant
    GENMASK_ULL(63, 3)

 .../platform/x86/intel/pmc/ssram_telemetry.c  | 33 ++++++++++++-------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 4bfe60ee55ca..779e84c724ac 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2023, Intel Corporation.
  */
=20
+#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/intel_vsec.h>
 #include <linux/pci.h>
@@ -21,12 +22,30 @@
 #define SSRAM_PCH_OFFSET	0x60
 #define SSRAM_IOE_OFFSET	0x68
 #define SSRAM_DEVID_OFFSET	0x70
+#define SSRAM_BASE_ADDR_MASK	GENMASK_ULL(63, 3)
=20
 DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_=
T))
=20
 static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
 static bool device_probed;
=20
+static inline u64 get_base(void __iomem *addr, u32 offset)
+{
+	return lo_hi_readq(addr + offset) & SSRAM_BASE_ADDR_MASK;
+}
+
+static void pmc_ssram_get_devid_pwrmbase(void __iomem *ssram, unsigned int=
 pmc_idx)
+{
+	u64 pwrm_base;
+	u16 devid;
+
+	pwrm_base =3D get_base(ssram, SSRAM_PWRM_OFFSET);
+	devid =3D readw(ssram + SSRAM_DEVID_OFFSET);
+
+	pmc_ssram_telems[pmc_idx].devid =3D devid;
+	pmc_ssram_telems[pmc_idx].base_addr =3D pwrm_base;
+}
+
 static int
 pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u64 ssram_base, void _=
_iomem *ssram)
 {
@@ -63,18 +82,12 @@ pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u64=
 ssram_base, void __iomem
 	return intel_vsec_register(&pcidev->dev, &info);
 }
=20
-static inline u64 get_base(void __iomem *addr, u32 offset)
-{
-	return lo_hi_readq(addr + offset) & GENMASK_ULL(63, 3);
-}
-
 static int
 pmc_ssram_telemetry_get_pmc(struct pci_dev *pcidev, unsigned int pmc_idx, =
u32 offset)
 {
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram =3D NULL;
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =3D NULL;
-	u64 ssram_base, pwrm_base;
-	u16 devid;
+	u64 ssram_base;
=20
 	ssram_base =3D pci_resource_start(pcidev, 0);
 	tmp_ssram =3D ioremap(ssram_base, SSRAM_HDR_SIZE);
@@ -99,11 +112,7 @@ pmc_ssram_telemetry_get_pmc(struct pci_dev *pcidev, uns=
igned int pmc_idx, u32 of
 		ssram =3D no_free_ptr(tmp_ssram);
 	}
=20
-	pwrm_base =3D get_base(ssram, SSRAM_PWRM_OFFSET);
-	devid =3D readw(ssram + SSRAM_DEVID_OFFSET);
-
-	pmc_ssram_telems[pmc_idx].devid =3D devid;
-	pmc_ssram_telems[pmc_idx].base_addr =3D pwrm_base;
+	pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
=20
 	/* Find and register and PMC telemetry entries */
 	return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
--=20
2.43.0

