Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CCF37FF45;
	Fri,  1 May 2026 23:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677078; cv=none; b=ZFOnwmIIPNRii2uFzlMev4QmpeK1jE0buS52S5ApxIaKDXp6wf7qDmVbEQVskbrB7/IXJ92Y27yeuXEcQsBVgbM8Ly6FqtlTGxuUe0SqFeB6KUcxal/gDaUxMGZUjt0bC6ylOhA2u/c1x8w8dKdKJsFCsHozhVZH3J6wv8xdC9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677078; c=relaxed/simple;
	bh=eM1rbwCVqgmmNqFgtEa0hjdXLVBKQVhXJA7D0RA0GHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pOOngV/LuTXSlzQh4OeznAzeA7kLjlRivPz6oejyZ4BDDlJvX93SRXbz5v3/FlenWoByq42QHbVb5O1dEShAwhfBRFxCtFlRd9pz6F+7yCoiCYk5VbRlBI4LiCeLTw5nhcg6yd8tYTuD8RosH7oRGaDO8MsUR5BVfi+wxiMo6zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KW/uIk2N; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KW/uIk2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677066; x=1809213066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eM1rbwCVqgmmNqFgtEa0hjdXLVBKQVhXJA7D0RA0GHo=;
  b=KW/uIk2NBBz8TSc/vEFuNcb++jkkp09EykpUrsuiXGPjqzDljf1ASkf6
   cFDiql8lb6hqzppmR/8FA9fEsLnYKoMOlxS8eIOf4bfexoV6W4daqMOrM
   6MMiTlJft7ikF/mMNTUpy5FNYYLYcyrcu5WC0Ig+O3EQ0zPwAEpXZdMsw
   KELP3bi2kjfKxg6Ev5iZTd8CvhNBzOvu0XB+VfTykpCLB5gT1zbZq+pQX
   +SmQ7i1IrDCGOmBtHEefB0qmm6cywvCt/q8xBLfbr7VQcBLVJIbjCIGbQ
   vddPfimRinq/iR88RWmq+JBaQwNRn2Kwdle3CIMZJR4bZPjHmi2IeqxsB
   A==;
X-CSE-ConnectionGUID: E6euYfBpQlKJpN4r01iDyA==
X-CSE-MsgGUID: bByh4JUqTR2HlrhyhQmxow==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740148"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740148"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:01 -0700
X-CSE-ConnectionGUID: j8zBq0q4Tvqcxinw+5TAnQ==
X-CSE-MsgGUID: AZfTAQkzTuOC7mt/p1Xc9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948965"
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
Subject: [PATCH V3 10/16] platform/x86/intel/pmc/ssram: Use fixed-size static pmc array
Date: Fri,  1 May 2026 16:10:47 -0700
Message-ID: <20260501231054.3890305-11-david.e.box@linux.intel.com>
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

