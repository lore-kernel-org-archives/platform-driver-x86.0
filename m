Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9693019D9;
	Fri, 22 May 2026 02:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416533; cv=none; b=tMA2E9PkCvqeILV8YpGBLApbRzrLUNXlxN9cS7EpHpSt/2OarYUPTmEYWyDTyRFAV8/IJoR1ONwOfL/2wSvwTDjPHd328v4ournQeTpTtKeVgl7ad2MJ73snAP137Vw24ZE9YdZvYabZPZZAGa3b4WzznSeGhr6IzlyFDeoh/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416533; c=relaxed/simple;
	bh=zjzXbIHNOWZng9yQ1UK8cJuv+EXXjtOrbbCaFES1hFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jx1RYdjNxNMd1kSYkbUGcna6ZE8crS9nK8qvCn8UHrEFVp8PqQbAd5mirMkHPxm0l9f+6nuRCZpUNfSzIsT7pa5E4icuu30PetBbeuUGq07TUAYRF1jrKUG3AxtMubmP7IfPEI5xdy+rqR/AwghUxIF7wOaumalNZ+0MCBhwRxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xm9tjEek; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xm9tjEek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779416527; x=1810952527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zjzXbIHNOWZng9yQ1UK8cJuv+EXXjtOrbbCaFES1hFc=;
  b=Xm9tjEekxQErLa6HmoIp5M4llyjTeRaY051VzvtR7bTIWCGREE/VwHUR
   gkXxRz3Oaphh0mnoc1J5af+gIHeUIbfuaxluQ0ezlhmhpOWUdYOU142aW
   As14tP80FALSKc5bTvPN2Fi0Ahyi+ZOLPzjjde/b9XIQmuizsgkHMCAdY
   GFmcxMTJAhmSHaafdJ9JR+r6qAueS+D+p++IGsbk9/F7ybYZ8k54Hm0ZB
   KmtWAmYGcMrTKY//nBzaBBMCiKhWLQfGuSBgHKyG9JRsu6g3VuxHFIrcl
   kfP5LEFRnRKZKvKvGjLPYq5sv2DnpnuYOYoqMkUQfW4s8mXVEIGDt02iO
   g==;
X-CSE-ConnectionGUID: jgbGgfJeSg2AgJDeRbwoQw==
X-CSE-MsgGUID: FSL46ljgSQqlRtk4xnQEUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80400547"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80400547"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:22:00 -0700
X-CSE-ConnectionGUID: qKhWAkhLTkSAQHOvtbVb4A==
X-CSE-MsgGUID: IRCgm1LxQP+AER2kgX3Ipw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236335381"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:22:00 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Xi Pardee <xi.pardee@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David E . Box" <david.e.box@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v5 10/16] platform/x86/intel/pmc/ssram: Use fixed-size static pmc array
Date: Thu, 21 May 2026 19:21:40 -0700
Message-ID: <20260522022147.4137494-11-david.e.box@linux.intel.com>
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
V5 - No changes

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

