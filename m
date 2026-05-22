Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180730ACF0;
	Fri, 22 May 2026 02:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416538; cv=none; b=N3XcQcAvF7cA5ona+BN1E/8sfXSEGrfk5dS4qfi0xRKPAvpBvWFn9OGEFWtOKC0bWmh1m1OV9AjtxlSA3lzLkPNLLG2c/5QtyPEUoAVwXJ+YaAXcY4lQQUOPC9QInP/cMEnF5q6obSXDneg79P7fEubfc60q1sFQIMw6/Gy/8VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416538; c=relaxed/simple;
	bh=oknUfrrsvhjlI2wS0WGt5lQDxEja8y1+dwcnUHq234c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sd40QoCT9WIk0fa6p1/bSk42HgESuw/GsuxsiJYpErwxDXDfu86F6ReBaW+8btgnSdAPMlTBBmUzvBCHMVd/mFAG5chxf1OYF2rYmZUyfCLsGnGQ2Co4O77eYrRO4qXuZBL/RUjPAdO1VVYeUX1NFdiDc6+BVcFQYmz+mYA2xsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IaxEX2CE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaxEX2CE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779416537; x=1810952537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oknUfrrsvhjlI2wS0WGt5lQDxEja8y1+dwcnUHq234c=;
  b=IaxEX2CE8R61HsDVVcVKlRPXEsCVNTQ6phhoNGbX5xaE45EMQfHu1RqU
   AvVwzHbqzR3zqJcjRCF44OP7664EEktEGa6a/UZuluNNOLl2SQRpOL8K1
   MUC56S+uWxd0G893o1QUHOR3X794ACz5IqDH9Ovf4pMoqytgACcacmqGy
   1Pmqbh8LCZVXhQ5Us8ubLWesPEpw2gifFZYdU3tOIx2IGgwBikuW4ncRU
   RjzywcFyeexMXYDtx4WloOiyWHWqQ7A77ldI954LHUKDMWoFdhI6A05kt
   LtFtgrhlJ06ak1Z+aFzgYQUuh/OQUR7mQmpS72EEvVmKa88rVxFyM48qR
   Q==;
X-CSE-ConnectionGUID: jl2UOG0cTL+dHSCxHBFVsw==
X-CSE-MsgGUID: vfdTdB4PT2KLtMpfrFgu6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80400565"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80400565"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:22:01 -0700
X-CSE-ConnectionGUID: ZXIZiS/3Q4uiyuXEwikZ3Q==
X-CSE-MsgGUID: Fe5INISLR2yAjA2wCRndvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236335393"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:22:01 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v5 15/16] platform/x86/intel/pmc/ssram: Make PMT registration optional
Date: Thu, 21 May 2026 19:21:45 -0700
Message-ID: <20260522022147.4137494-16-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522022147.4137494-1-david.e.box@linux.intel.com>
References: <20260522022147.4137494-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The SSRAM telemetry driver extracts essential PMC device ID and power
management base address information that intel_pmc_core depends on for core
functionality. If PMT registration failure prevents this critical data from
being available, intel_pmc_core operation would break entirely. Therefore,
PMT registration failures must not block access to this data.

Change the behavior to log a warning when PMT registration fails but
continue with successful driver initialization, ensuring the primary
telemetry data remains accessible to dependent drivers.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V5 - No changes

V4 - No changes

V3 changes:
  - Dropped the standalone cleanup-pattern patch from this refreshed
    series retaining the simpler ssram pointer flow requested in review.
  - Folded PMT-registration-optional handling onto that simpler flow
    with no intended functional change.

V2 changes:
  - Update commit message for clarity
  - Also apply the PCI telemetry path

 drivers/platform/x86/intel/pmc/ssram_telemetry.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index ac330f7df649..7bb699116bd0 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -109,6 +109,7 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev,=
 unsigned int pmc_idx, u3
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram =3D NULL;
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =3D NULL;
 	u64 ssram_base;
+	int ret;
=20
 	ssram_base =3D pci_resource_start(pcidev, 0);
 	tmp_ssram =3D ioremap(ssram_base, SSRAM_HDR_SIZE);
@@ -128,7 +129,6 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev,=
 unsigned int pmc_idx, u3
 		ssram =3D ioremap(ssram_base, SSRAM_HDR_SIZE);
 		if (!ssram)
 			return -ENOMEM;
-
 	} else {
 		ssram =3D no_free_ptr(tmp_ssram);
 	}
@@ -136,7 +136,11 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev=
, unsigned int pmc_idx, u3
 	pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
=20
 	/* Find and register and PMC telemetry entries */
-	return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
+	ret =3D pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
+	if (ret)
+		dev_warn(&pcidev->dev, "could not register PMT\n");
+
+	return 0;
 }
=20
 static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
@@ -211,7 +215,7 @@ static int pmc_ssram_telemetry_acpi_init(struct pci_dev=
 *pcidev,
=20
 	ret =3D intel_vsec_register(&pcidev->dev, &info);
 	if (ret)
-		return ret;
+		dev_warn(&pcidev->dev, "could not register PMT\n");
=20
 	return pmc_ssram_telemetry_get_pmc_acpi(pcidev, index);
 }
--=20
2.43.0

