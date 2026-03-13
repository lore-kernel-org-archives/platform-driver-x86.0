Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A6C33DEC8;
	Fri, 13 Mar 2026 01:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773366761; cv=none; b=MPWas0pSQb4uJyZygd5i7ni1hBj7AHFB6olXbSV6WdARu1owwinRJQYH9Tz4xRusLo8eHfUU5jS56BPb1onepmhW8gycYhjJI8zuD6ZtKrMaesY6ifo8fjdf4005l1gIJQEpT/5UR3/yF3F9W+YZ6wQ4N5gPXOx4MhBlfdFsoOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773366761; c=relaxed/simple;
	bh=e1S8raHL6U6wBJ8ruzzvM0H21MrzxEn6TFDGtuGpeH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YbnyXfhth84UMLViTSEJJE8J8oAdgCJXNHyjo618DOAbFb6oD8H1jkgcWtU+VdpBAkRedDiHAjGrGLFdJTZRN/8rZPTGUTD1I7HmhRffvRDaFA8g8D2XGYfnZka52qJcgoscBcf15pPg2xLIM9Ip3Q0N7VwFNtwcuMGtG6CeSWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFiKFv6K; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFiKFv6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773366754; x=1804902754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e1S8raHL6U6wBJ8ruzzvM0H21MrzxEn6TFDGtuGpeH4=;
  b=YFiKFv6KqSXau/Tk2v8x+AYJ4gb/mBInLasxJG2COKexszA2/sbrVPFr
   65pQ+kZWaERfKlCrAk3yJDU3cM/y2J6ozaSM9rtKxPqNArXulv238lZ3m
   b0UFxw6w/W4IPG+V6bS8Ny9+1n+SJJZOpi4Bfkr7/FVzbDCWNeWPcQ0SZ
   oxAWtmzikTElBcmNwwykvFDKnzbrGhtVQdEkZ/eoQs0jBk9xf1raNOjHA
   qP5du2GNnqPTKQvBHFoaZ28jIv4YnSUbOPyM5atJMLgDL6g6xm+Wj/w6x
   EVUWdeRzF2c0iafP8x6mL+QI/Z7TF711K6u/fnMuQd0qzllynAL2Gzvq+
   w==;
X-CSE-ConnectionGUID: oL21l9OLQY+v2UZeWuhh9A==
X-CSE-MsgGUID: 6XIG89YxRc6k+QYteB8Vqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74354603"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74354603"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
X-CSE-ConnectionGUID: 89UbklxMTcKhw/hQkw800g==
X-CSE-MsgGUID: W7Ipz7btQ3Oexz/az466tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220108518"
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
Subject: [PATCH 17/22] platform/x86/intel/pmc/ssram: Refactor DEVID/PWRMBASE extraction into helper
Date: Thu, 12 Mar 2026 18:51:56 -0700
Message-ID: <20260313015202.3660072-18-david.e.box@linux.intel.com>
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

Move DEVID/PWRMBASE extraction into pmc_ssram_get_devid_pwrmbase().

This is a preparatory refactor to place functionality in a common helper
for reuse by a subsequent patch, while keeping behavior unchanged in this
step.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 .../platform/x86/intel/pmc/ssram_telemetry.c  | 31 ++++++++++++-------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 9c3d7ba2fd52..75a80a74a069 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -27,6 +27,23 @@ DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *,=
 if (_T) iounmap(_T))
 static struct pmc_ssram_telemetry pmc_ssram_telems[3];
 static bool device_probed;
=20
+static inline u64 get_base(void __iomem *addr, u32 offset)
+{
+	return lo_hi_readq(addr + offset) & GENMASK_ULL(63, 3);
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
@@ -63,18 +80,12 @@ pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u64=
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
@@ -99,11 +110,7 @@ pmc_ssram_telemetry_get_pmc(struct pci_dev *pcidev, uns=
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

