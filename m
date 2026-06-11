Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE7A3546CD;
	Thu, 11 Jun 2026 04:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152501; cv=none; b=Y5E0wtFL+NPsHHKD62LmxAqk5XQNvuLBgj2aQsZ0Jne9cpj0XgsZWpiQVbEi2hMER9aMctdfZ29XkeY7LTYVLqQ15FVpWvnYvw2iMpTIZTRAitf49wASbIl/jwcOq7eQAApW6ouViUYNMkVFsS69JQyaXMMPF0WNpNfOnG7bKd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152501; c=relaxed/simple;
	bh=TwaeEyYXpdgbGuddhZKp38CPaCsW0miZtR3oHK9sC5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WwcDiIzZ7ag4ORTKAF+EWmIJ8EQsDMCPRMembTrQ9CNyl45a8q7tluFbsvUIPaEbQYa7q+Ma8Yj5603u8j0CYRIpbdShRhh1jUGw0BBcbPaKwckRC20iYSqIG7vlbXWPEXJCiZsTjUbUzW1RzPDaVdtZMVB4r658ROOVnRULRKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DP5QkhlK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DP5QkhlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781152500; x=1812688500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TwaeEyYXpdgbGuddhZKp38CPaCsW0miZtR3oHK9sC5A=;
  b=DP5QkhlKNW9ZP3uF6kRn+8FGGAswh3fNfmIR0Kr1azFGV8KfBWNNcy4s
   30+Zzo4q1pGouZ7fVmYxxnk8XtK9NHo6visoZJTd4CSP2iatDeFSBn7cW
   VcuYbddqj9JuYF0S7Wc8gfBEC4l9jEeuIsel720Lu+JoUTdW3hCFErkZl
   gI/T+otN50pEEDAiexpZs/UbKpIL+6vp6ADcfR/yVtltNY53zATxZ31w7
   0ThLvnaqDhdWJ0BTSWP8PJ6mEu7BYlcK2Se5ZGJZMk6xkZkYRfusgnByQ
   1rn2armPiBbSuOH5u9cVpULE/b9mRAcmcGSMjVFgznY0ZS+Y6VCURxrUC
   Q==;
X-CSE-ConnectionGUID: aTch0sMtTGeuRod0I5gj2Q==
X-CSE-MsgGUID: mc+xAguzS56LIqBrCxFd+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84531016"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="84531016"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:55 -0700
X-CSE-ConnectionGUID: y+ZDWpa5TeSM5aFnJNonZA==
X-CSE-MsgGUID: NqSMU+rtSX6TMIXN2t0euA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251468352"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:55 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v7 11/15] platform/x86/intel/pmc/ssram: Refactor DEVID/PWRMBASE extraction into helper
Date: Wed, 10 Jun 2026 21:34:39 -0700
Message-ID: <7e2acc7f8aa8940879c733d7924345bbcab3626d.1781146840.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781146840.git.david.e.box@linux.intel.com>
References: <cover.1781146840.git.david.e.box@linux.intel.com>
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
V7 - No changes

V6 - No changes

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
index 05f213aa108f..211d842df449 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2023, Intel Corporation.
  */
=20
+#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/intel_vsec.h>
@@ -22,6 +23,7 @@
 #define SSRAM_PCH_OFFSET	0x60
 #define SSRAM_IOE_OFFSET	0x68
 #define SSRAM_DEVID_OFFSET	0x70
+#define SSRAM_BASE_ADDR_MASK	GENMASK_ULL(63, 3)
=20
 DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_=
T))
=20
@@ -40,6 +42,23 @@ static const struct ssram_type pci_main =3D {
 static struct pmc_ssram_telemetry *pmc_ssram_telems;
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
@@ -76,18 +95,12 @@ pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u64=
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
 pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_i=
dx, u32 offset)
 {
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram =3D NULL;
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =3D NULL;
-	u64 ssram_base, pwrm_base;
-	u16 devid;
+	u64 ssram_base;
=20
 	ssram_base =3D pci_resource_start(pcidev, 0);
 	tmp_ssram =3D ioremap(ssram_base, SSRAM_HDR_SIZE);
@@ -112,11 +125,7 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev=
, unsigned int pmc_idx, u3
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

