Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90D6288C2D;
	Fri, 15 May 2026 00:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778804513; cv=none; b=kBH9cHL55DlH8t7nAYPsaJr7tJAG4zE+gSX59+wF2BVCkHCIjgj8ZMVkbzmaGcxHc4MboQeD4bQiuxGXKJN6968slTB693UQLbgC4eucy1Zy8lJgxWRdCH2EuwK97+p4EnvmN/TfO6fcVaRQieBDtlOgUCnXe0anc45v0x6eP3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778804513; c=relaxed/simple;
	bh=QTWx2bDGLwwSqQQhLgj0CW+ngdldhRTswyq93m/Lj2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KTPu2/U4oPs1doLu2fccNrBXn++8CKy52lvXLVdI6PLX80dyQlt7wDZjQGmlqwOtt+tR3RbpPaZSv7HPdzy3ORUPmGyny5EFZBjWK3nG/IX+HQ0VWfoBjItdOqdEdmK5ZYh+eoSLEDR/hh2ZF6uJ8buAcEGFvOd4Wtjv16wzKLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KcfnH3XW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcfnH3XW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778804511; x=1810340511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QTWx2bDGLwwSqQQhLgj0CW+ngdldhRTswyq93m/Lj2A=;
  b=KcfnH3XWUQj61rsoE0zC8w8WP2FhNwIBqH3yupZHV9iOTTIuhlN/EQ8A
   eGegPzq9PWhtnyHJ/py242YtLd4qD12wWG2s4ImBmzdoOHLqNeBY10+a6
   W0KPNJ7qPQzg1MXQnexZavFHCJpRzy5uKCzFIUrtZ5/4N6LUZ/ZkZKgGt
   8EKCHLfuGd/Rpb5dK5cOZ4Q/gEvvCcBPS4wAMHZudOGtPIalr1BrDLFvd
   tRvaRUs2XiL1U8FyQDK/nNl4uPrT7Tc5h7j+U6vIxqCaORgJlZ/H4WZ+l
   skwJpa4stSHGq8T0kDras1FsGbpMgjs9IS8orUChOdLGya56TwbQ203li
   A==;
X-CSE-ConnectionGUID: j5qA8u/mQMaQtG3ALpTiog==
X-CSE-MsgGUID: 2bjz75AoQpOIWGKySJKd/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78895174"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="78895174"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
X-CSE-ConnectionGUID: LQ+OgmfMRZy2TitprW3KLQ==
X-CSE-MsgGUID: j2r3hIcdTB2NXPs30IK3cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242879079"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: y,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Xi Pardee <xi.pardee@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David E . Box" <david.e.box@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 10/16] platform/x86/intel/pmc/ssram: Use fixed-size static pmc array
Date: Thu, 14 May 2026 17:21:17 -0700
Message-ID: <20260515002130.701457-11-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515002130.701457-1-david.e.box@linux.intel.com>
References: <20260515002130.701457-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Xi Pardee <xi.pardee@linux.intel.com>

Switch pmc_ssram_telems from a devm-allocated pointer to a fixed-size
static array, eliminating per-probe allocation overhead and simplifying
lifetime management.

Correspondingly simplify pmc_ssram_telemetry_get_pmc_info() validation to
check devid availability and tighten input bounds checking. Drop
null-pointer checks now that the storage is static.

Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
V4 - No changes

V3 - No changes

V2 changes:
  - Replaced hardcoded array size [3] with MAX_NUM_PMC constant

 drivers/platform/x86/intel/pmc/ssram_telemetry.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 1deb4d71da3f..4bfe60ee55ca 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -24,7 +24,7 @@
=20
 DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_=
T))
=20
-static struct pmc_ssram_telemetry *pmc_ssram_telems;
+static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
 static bool device_probed;
=20
 static int
@@ -140,7 +140,7 @@ int pmc_ssram_telemetry_get_pmc_info(unsigned int pmc_i=
dx,
 	if (pmc_idx >=3D MAX_NUM_PMC)
 		return -EINVAL;
=20
-	if (!pmc_ssram_telems || !pmc_ssram_telems[pmc_idx].devid)
+	if (!pmc_ssram_telems[pmc_idx].devid)
 		return -ENODEV;
=20
 	pmc_ssram_telemetry->devid =3D pmc_ssram_telems[pmc_idx].devid;
@@ -153,12 +153,6 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *p=
cidev, const struct pci_de
 {
 	int ret;
=20
-	pmc_ssram_telems =3D devm_kzalloc(&pcidev->dev, sizeof(*pmc_ssram_telems)=
 * MAX_NUM_PMC,
-					GFP_KERNEL);
-	if (!pmc_ssram_telems) {
-		ret =3D -ENOMEM;
-		goto probe_finish;
-	}
=20
 	ret =3D pcim_enable_device(pcidev);
 	if (ret) {
--=20
2.43.0

