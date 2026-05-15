Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AB72F28EA;
	Fri, 15 May 2026 00:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778804517; cv=none; b=TPMgR0Q2XjpHUvDWE1FVERcGTFsrUlPD293eToAYHKPTR3D+T1YYP2oY8pPBeIxMwDlp69nZKtQfG4bmO+5dAlWRiB+Qz4x/nDv5qKOHHDfookvZwck98R6XBJKz3XcEH92lN3xIqtU7WHAQ/5AIj5yze8Nojr8gIy7UX8VrM+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778804517; c=relaxed/simple;
	bh=JF6Gs/mM72ClYaF1DzTtV3rctVB7AuoDc+dCzAoHxIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sfb/+8K3y1uVbYP3pzvEGGKMX4HQgLpYeEIJIgMZ6AlVjE1BuwI8tYKzsnAwBnm6DyPJqwDf/Xa8zzywJ1l4TRr4e47ZLag86RIV0vkp48wUHu3K8Jjrm/+dAxpaqVXQvgNrZp1YQEDzUGpwKNy//czxDb7drf4W+48Snk4f3nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7zUKzc2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7zUKzc2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778804516; x=1810340516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JF6Gs/mM72ClYaF1DzTtV3rctVB7AuoDc+dCzAoHxIQ=;
  b=e7zUKzc2p7AMTM3hSrpdwYyAY0hoFjnPp2SEZUWQ2TE53wybfjnDHtRX
   ZOQVhHeE2g6lpO7mhEbDXf/a5mJNuX6mP6/dIPKS30FuqRV/PvBtGLXRy
   5M/dbPHN/VYQucDGE/4h+XiBb4b3c6L7+9IH0wdRxJHcHP9UY88yoaeml
   2u+cndTJnTPe+4dkbAXLMrrWDTIAXrQFEHOSrCW38tj3Sf2i79IKWzQs1
   gzmSVB3D7w+xfsp1LU8KJDpH/VdowycYgQZ1ScPlOKKvGiE4nkZCATa70
   1zln7tmJHRD51J9p0Ss9NI/DIQb8csKAfRiEzqf/0FRcCGrAthuBQWbfN
   g==;
X-CSE-ConnectionGUID: yp+5VpYARWaRdEXfdhyeKg==
X-CSE-MsgGUID: XnZzYvRWRFGQji7Y0QJjMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78895186"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="78895186"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
X-CSE-ConnectionGUID: W6n6WLCTQle9Hq29yl5Umg==
X-CSE-MsgGUID: O3D1mDwcRHGMRJPyiNJdVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242879091"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: y,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 16/16] platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery
Date: Thu, 14 May 2026 17:21:23 -0700
Message-ID: <20260515002130.701457-17-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515002130.701457-1-david.e.box@linux.intel.com>
References: <20260515002130.701457-1-david.e.box@linux.intel.com>
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
V4 - No changes

V3 - No changes

V2 - No changes

 drivers/platform/x86/intel/pmc/core.h            |  5 +++++
 drivers/platform/x86/intel/pmc/ssram_telemetry.c | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/i=
ntel/pmc/core.h
index f458eb908c07..eb2e1030dbf3 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -334,6 +334,11 @@ enum ppfear_regs {
 #define PMC_DEVID_MTL_IOEP	0x7ecf
 #define PMC_DEVID_MTL_IOEM	0x7ebf
=20
+/* NVL */
+#define PMC_DEVID_NVL_PCDH	0xd37e
+#define PMC_DEVID_NVL_PCDS	0xd47e
+#define PMC_DEVID_NVL_PCHS	0x6e27
+
 extern const char *pmc_lpm_modes[];
=20
 struct pmc_bit_map {
diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 8a9c947761b1..f8fb39e9f205 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -43,6 +43,16 @@ static const struct ssram_type pci_main =3D {
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
 static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
=20
 static inline u64 get_base(void __iomem *addr, u32 offset)
@@ -301,6 +311,12 @@ static const struct pci_device_id pmc_ssram_telemetry_=
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

