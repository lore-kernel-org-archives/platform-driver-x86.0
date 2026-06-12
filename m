Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDCF3D5C3C;
	Fri, 12 Jun 2026 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298143; cv=none; b=b2vwKj7MDhEPkfvKWG7kq0qmbWIBYHXxsIyAVHKRtLg1aGbpaiz/IpjzArLGmVogtTONhV4/z+obcQTPJ6uu+ey3Enkx0HzxAhhede8vSaa/ZUsKbsL22De4v6koS3ijsD8gbZGfBAsWVXysCAuLHnDczN88eCKTPThIROqltfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298143; c=relaxed/simple;
	bh=G1wrUpghchBD3EDcxxUZFLMd8LelWaadof/b4g6/DlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rzqko2paibeL6WmOGp2E17/lXqWOuaE5MUN7SeSeoxT/f/DzamSIIylWtyAzcAJLjs98YHdn9Cl65MDUFOfbv6XTto5d6i8cOrkgVXKpaoDv6O72PVjrqNpPTn546HY7zAuYmC7bgM4MGX2nU0zKTs4s3kTq5zj55pT7ka5JcR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxsFjHH4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxsFjHH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781298142; x=1812834142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G1wrUpghchBD3EDcxxUZFLMd8LelWaadof/b4g6/DlQ=;
  b=AxsFjHH4OWDf88MuOXzG5sAYJWu9KzpxC7Sk+HrJZ0Yus7Csgdb0Wd8Y
   o67K980MTuOAlj1mvakfetfKqbLTnbGt5XatIchSIiVASZ+yKtn/KY+QR
   dIt8GehgxggGSnpMA5l1+A83h9kpBYWI+BWQH8fEsq1XIbTDdhR4HVkeo
   s8wqpEZkjxmELlQ4bz4A3FKvlJybC06L6BM++KSabrUVIC3FDr0oyr0v2
   SHfCnEwYY6k0r+ri0RvjF8iZe+8kEsmVv6pZlcCmC1iLFhDsQcgoiInek
   wbDVDX5McRiZXhE4ilcF+QHq1kzmLt25R8T+dA1OeoMhGMkoiiVqsQRAH
   A==;
X-CSE-ConnectionGUID: kuwVahGqTLq0v7RhV0qUeg==
X-CSE-MsgGUID: bLVTqCJaTOaeMl0gvlnoJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86038015"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="86038015"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:13 -0700
X-CSE-ConnectionGUID: W6t+v9mQTFO2fq7rb6UfJQ==
X-CSE-MsgGUID: tCKceSaVR4q6ZYIBLv6F3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="250832874"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:12 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v8 15/15] platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery
Date: Fri, 12 Jun 2026 14:01:56 -0700
Message-ID: <fc0e8bb00e2765fb7d145fef2ed1b0236b935c08.1781294741.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781294741.git.david.e.box@linux.intel.com>
References: <cover.1781294741.git.david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add Nova Lake S PMC device IDs to enable binding of the SSRAM telemetry
driver on NVL platforms, and map them to the ACPI-based discovery policy.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V8 - No changes

V7 - No changes

V6 - Dropped NVL product defines in core.h as they we already included in
     a prior patch from Xi.

V5 - No changes

V4 - No changes

V3 - No changes

V2 - No changes

 drivers/platform/x86/intel/pmc/ssram_telemetry.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 9a8922045ab7..8e280ec525a6 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -45,6 +45,16 @@ static const struct ssram_type pci_main =3D {
 	.p_index =3D PMC_IDX_MAIN,
 };
=20
+static const struct ssram_type acpi_main =3D {
+	.method =3D RES_METHOD_ACPI,
+	.p_index =3D PMC_IDX_MAIN,
+};
+
+static const struct ssram_type acpi_pch =3D {
+	.method =3D RES_METHOD_ACPI,
+	.p_index =3D PMC_IDX_PCH,
+};
+
 enum pmc_ssram_state {
 	PMC_SSRAM_UNPROBED =3D 0,
 	PMC_SSRAM_PROBING,
@@ -453,6 +463,12 @@ static const struct pci_device_id pmc_ssram_telemetry_=
pci_ids[] =3D {
 		.driver_data =3D (kernel_ulong_t)&pci_main },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_WCL_PCDN),
 		.driver_data =3D (kernel_ulong_t)&pci_main },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_NVL_PCDH),
+		.driver_data =3D (kernel_ulong_t)&acpi_main },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_NVL_PCDS),
+		.driver_data =3D (kernel_ulong_t)&acpi_main },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_NVL_PCHS),
+		.driver_data =3D (kernel_ulong_t)&acpi_pch },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, pmc_ssram_telemetry_pci_ids);
--=20
2.43.0

