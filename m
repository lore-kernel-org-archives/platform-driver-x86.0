Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BA12BEFEF;
	Wed, 25 Mar 2026 01:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403316; cv=none; b=JbWDGAaJPHz2NkeLepbunIOR+avyjn+ORdLlQ/WygYIQLNB8TJDiGQYiaJ9ta3x14WGS7zpAig6eknSEnHg9Ao9qbHVF1Ogje3Q68i6ifuN+sBelw4YDKkwZJn1KDHnpRErNO30mdCXI55kl55xzvoIE2msI54HCpJlzwMn1rGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403316; c=relaxed/simple;
	bh=pEArcwsZYW3P0P26IVOxZ/ecMmII56u1mrbltB4oOLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnAVx0ONlOoA0cEOxU9LqG0xpf3UGvh9Y/dChYJ2zMt1ELZml9SRTW7P9WYBZjrKJfojd8GW+I1IdUdnPybkcl9FOO/PEC0VFLCggZTOuiF5D4uo3I+2v3+Dy9u63l0945KISnMZQEJqTUgNmrk1f8qDWepakHl3oG0E6oOhcEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dr3z2Ncf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dr3z2Ncf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774403314; x=1805939314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pEArcwsZYW3P0P26IVOxZ/ecMmII56u1mrbltB4oOLk=;
  b=Dr3z2Ncfy4wDvqAtsg1IGlujHCAWNCSp5PI8nAJVHLeY1KheITO/9Rr5
   aqJrMMwd1A7J5pA85u7bzvwfBUeN3z2T/En/HXMC88xJwMaCH6zT2LpfJ
   Hdf/9uOeDEboLjYvRNhsht50cQaKJZi2o/Y6taPy4m87ZuVO1zlgpKv3I
   SwAPPZURpuLDOLnK0pAxJOEIEFbcVUb4NEdtraXK4pU3KEBayCYnU/Del
   dsUO7N08hQjvHNLKq1Vi6tc7PN+6pto0Lh243l2/FTGbTEm61SEOhDG0F
   IGjSBW3k1DkRObAd+vAY+FRowLg9tOyj0oW/tJEEPazASyuijRFq4RSxf
   Q==;
X-CSE-ConnectionGUID: fPlfQI8XQ8K+SmX0SQSZ1w==
X-CSE-MsgGUID: F6SkhDsAQgCGKLDc8AL1Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75317528"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75317528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:33 -0700
X-CSE-ConnectionGUID: e9Loo5r7TQyZjD0ACPaSYA==
X-CSE-MsgGUID: bu34OkDETs2kO5Nsnvb/wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221190798"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2 14/17] platform/x86/intel/pmc/ssram_telemetry: Fix cleanup pattern for __free() variables
Date: Tue, 24 Mar 2026 18:48:16 -0700
Message-ID: <20260325014819.1283566-15-david.e.box@linux.intel.com>
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

Fix improper cleanup.h usage where __free() variables were initialized to
NULL and then assigned later. Move ssram variable declarations into the
if/else branches where they're actually assigned to follow the safer
pattern recommended in cleanup.h.  This change requires also moving the
pmc_ssram_get_devid_pwrmbase() and add_pmt calls into both if/else branches
to keep operations within the scope of the local ssram variables.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

V2 changes:
- New patch addressing Ilpo's review of cleanup.h patterns

 .../platform/x86/intel/pmc/ssram_telemetry.c  | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index b329e0c0080b..b1ba17f18ea5 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -102,12 +102,11 @@ pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u=
64 ssram_base, void __iomem
 static int
 pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_i=
dx, u32 offset)
 {
-	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram =3D NULL;
-	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =3D NULL;
 	u64 ssram_base;
=20
 	ssram_base =3D pci_resource_start(pcidev, 0);
-	tmp_ssram =3D ioremap(ssram_base, SSRAM_HDR_SIZE);
+	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram =3D
+		ioremap(ssram_base, SSRAM_HDR_SIZE);
 	if (!tmp_ssram)
 		return -ENOMEM;
=20
@@ -121,18 +120,24 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcide=
v, unsigned int pmc_idx, u3
 		if (!ssram_base)
 			return 0;
=20
-		ssram =3D ioremap(ssram_base, SSRAM_HDR_SIZE);
+		void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =3D
+			ioremap(ssram_base, SSRAM_HDR_SIZE);
 		if (!ssram)
 			return -ENOMEM;
=20
+		pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
+
+		/* Find and register and PMC telemetry entries */
+		return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
 	} else {
-		ssram =3D no_free_ptr(tmp_ssram);
+		void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =3D
+			no_free_ptr(tmp_ssram);
+
+		pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
+
+		/* Find and register and PMC telemetry entries */
+		return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
 	}
-
-	pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
-
-	/* Find and register and PMC telemetry entries */
-	return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
 }
=20
 static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
--=20
2.43.0

