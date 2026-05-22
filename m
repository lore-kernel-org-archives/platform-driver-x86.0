Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3777330BB97;
	Fri, 22 May 2026 02:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416539; cv=none; b=s9ktKbVqD7YLtz0mu4Co6l2S12tFxbnBxq+oCltd/uyhdrP69u7WvQWGyJiuVN5ETMApcNv+KFjFfKUJPvx9TtcpSMaCipCdrQ5VzjOTuqTmxqEQOCaYdKCRUZ3okuX73XLC4Nr6bGzLHR8mjDAK6ehb++cmYHbKt3Olj69ejLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416539; c=relaxed/simple;
	bh=cQfS+I4QZv9Gn9FVk+M5JCg2z7p+A+zFXw+A6GIqIWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+QMNO/rxcPuMyHkxj+uK8ooRnW9e2OI3JIKs5U1xCBL/F1oAALMIDlShxFBFhICNY+L2a5TreHgsHmtfhiHH4AWYSPlMgpffGUxCrn7R9DI4gsKvKHntO5vBTxRALkfK7pX8w/XPDx5hfGAbc/376JpXPj2zgfatM7UHjEzvqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IY97ox0u; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IY97ox0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779416538; x=1810952538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cQfS+I4QZv9Gn9FVk+M5JCg2z7p+A+zFXw+A6GIqIWo=;
  b=IY97ox0uvibgamOxn3+FzBlKK4xoVc7iD6lKEnoFnjdihmeUy1VVfFc6
   ZgcfQ9/Ync8KjneJQwq6FJjwTrs8yPdSpAeq9nG0ISQL0o3QkJ6VHMsx5
   SddUpcwZL8Pt0d2sd+f9wseqA9f3C5nUYEJ1NfwrH0uZWfkrUNpnkHsUl
   O+hwCXDCKQkpMujJS6PlHwYs+kJkz/C+gWtNrBT62M83zLVxEz/W8EoAL
   l2LsHlM2stOoAlorDmhz+OKm0pfzMInvAA8k0BzUiLDny8zIgzJ3Mk82u
   NxLo44h477l1kpjKKGP/a7ePchm6GzKgou7q+I5gTtwKtFTFnLbpITEwq
   w==;
X-CSE-ConnectionGUID: z8m9EsCuRzuNDaVF1EB+zw==
X-CSE-MsgGUID: CC+CzwIRQMGnRNboDXJz6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80400569"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80400569"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:22:01 -0700
X-CSE-ConnectionGUID: kIPw94bpSk20fmD55yRcFg==
X-CSE-MsgGUID: h329mbXHS6q9QnDzK/eGGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236335395"
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
Subject: [PATCH v5 16/16] platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery
Date: Thu, 21 May 2026 19:21:46 -0700
Message-ID: <20260522022147.4137494-17-david.e.box@linux.intel.com>
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

Add Nova Lake S PMC device IDs to enable binding of the SSRAM telemetry
driver on NVL platforms, and map them to the ACPI-based discovery policy.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V5 - No changes

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
index 7bb699116bd0..3ca577fb0eb8 100644
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
@@ -303,6 +313,12 @@ static const struct pci_device_id pmc_ssram_telemetry_=
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

