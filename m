Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD18937CD4A;
	Fri,  1 May 2026 23:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677083; cv=none; b=NBUxeyLIKFROyWUpSdq0Qr3XYxTjAcP8wPpnHzomJZtlUWQTBIcn5GMmGO87WlB9hetppvO5bhM/kyAS6zWvo6LvLx/q4qiPhzGH2mJDwof+8lWE856FtEhUFIptH6KRytSJu4s60CcrXwsAkTvCCppFhXUNmwPb09M6LGcUOZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677083; c=relaxed/simple;
	bh=viTwgg4bOqsgEHALNKovzf0UJ95GvYX9BHE4yNYuknY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C2V3TQPu2jIhTv2WF3RzIdkmD4mPNr76/VibzALasNFXjBJLvGyZvkwSsJKkh6IJbkBx4zxJuaAgnXS5yCiU/L8epCGzBdO36zA+JAHnB1KJS+tjNGPCL52dmP/RTZWHBkrXg1lWMy/UjJViu3tJ1h50eun/Xqrfkzi6qmK0nE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxAcPE7D; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxAcPE7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677077; x=1809213077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=viTwgg4bOqsgEHALNKovzf0UJ95GvYX9BHE4yNYuknY=;
  b=TxAcPE7DuXSqPZn1vtZxQdWg2lPvv8oS9lTPdFbromfK/RbUil448nzt
   OwCrrLWIfbZYeLlzuyhRv89OUYzN0NjfBQofcpp9r9Z1noMBIVOXrbQBS
   RIE8j4Kdv8k0csIO1LuE6VlGAAyXiIFF4+IlYnrh5d/qvR7tBTTuo1muh
   FJFx0YVoHzs/OTLj8Ki+ZbZU/bzaMLWR5muPGquEFy+SGbnnIEEW+X2Cp
   LM6jGqKWKftFXpsLsfKx40D9pggCBMdjhdYHEJyjVPNEE9UlMoLVep2eq
   7o9gSQs/AXLAl4b2Ep7OKUpWqTZ1y92YEmkz5+Ln+jIY7zs1uaazNslTz
   g==;
X-CSE-ConnectionGUID: DjWXNTkHSo2jfctj7jTscA==
X-CSE-MsgGUID: 1PKFgpEbRTaPVzhaLL951w==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740150"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740150"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:01 -0700
X-CSE-ConnectionGUID: phc+Nl8wQQ6CkG6Md+ll6w==
X-CSE-MsgGUID: G5kvo+ToRneUOr3ced/UFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948966"
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
Subject: [PATCH V3 11/16] platform/x86/intel/pmc/ssram: Refactor DEVID/PWRMBASE extraction into helper
Date: Fri,  1 May 2026 16:10:48 -0700
Message-ID: <20260501231054.3890305-12-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501231054.3890305-1-david.e.box@linux.intel.com>
References: <20260501231054.3890305-1-david.e.box@linux.intel.com>
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

