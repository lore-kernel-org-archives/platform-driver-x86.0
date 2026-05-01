Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D3C37E30B;
	Fri,  1 May 2026 23:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677086; cv=none; b=P8ICj3WiWuPYtctfMVqA33g52/KLJe7Fw5ar66eH9Jij5pJYbkt3fUu04fDuQn17vxYxzIJpzWD5h3/VJBpede/PDnFjZhLxxahDSWVYqc9mqPgfU5qgSBPMFieqdTDP0bQik6z9H+fwvFle2rM26WXwpCjjw0nB6t1eA+NjQLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677086; c=relaxed/simple;
	bh=Hn6MjIQd8oplbuUGc8o6DVU2yfB9enktRHdmg6+uO10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTKr459p8T+8gIy36WI6HSD5Q7kDaQ0av5Lo4Tsi2dS1V+V/EAek6BiOu7KtOp4mBqp+tvllsorfZvuhN48f5uxAkc5K4QgQE+o/UOcobC3VrwgE5IzKwW+ib4pA+eanv+JOjqN6LaM+ZzXe/eE/es2FBrsx8pxEQLCp/Qh70s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMxWKI8I; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMxWKI8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677084; x=1809213084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hn6MjIQd8oplbuUGc8o6DVU2yfB9enktRHdmg6+uO10=;
  b=bMxWKI8I3smCXEck6n4bN58dyZhmj5cRJt3UE07fXBB6qndWT7qx5nOF
   g9DNU3NE84l1Y0zHxPPuWZe/b1UuvdABU4P1R9HgiHJXbXLqPZUhfvRDR
   /DEtUXmmLx17TOm/AvC7IVlbWpLwvGuuK7elMCSCyuSe9EunujH9oknFw
   841UTJRdKhG/ZFa1ntwvX9rGWF1KQZ607t8DwnVN29al+E2HCvzI5RueF
   hRMNsm2B2EXeI36g53apXVDzMhpPPO7MiQ04U1zNwFS4MOFWIBcABvR34
   VkgKvIrhmthoQE9ll7pt1Zu12xSsm+we4Ac7UZqnf/cGO2af5f+Zvpuaj
   Q==;
X-CSE-ConnectionGUID: CDmfdAQEQkykdKxRyNi1IQ==
X-CSE-MsgGUID: q23VahKgS+CtNgR0Fuu96A==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740159"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740159"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:01 -0700
X-CSE-ConnectionGUID: bzcJTEc2RWC245vwV9ONkg==
X-CSE-MsgGUID: jYFajDVjS7a+UatQTESPmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948971"
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
Subject: [PATCH V3 16/16] platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery
Date: Fri,  1 May 2026 16:10:53 -0700
Message-ID: <20260501231054.3890305-17-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501231054.3890305-1-david.e.box@linux.intel.com>
References: <20260501231054.3890305-1-david.e.box@linux.intel.com>
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
V3 - No changes

V2 - No changes

 drivers/platform/x86/intel/pmc/core.h            |  5 +++++
 drivers/platform/x86/intel/pmc/ssram_telemetry.c | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/i=
ntel/pmc/core.h
index 24406534c7fc..53927c4283f5 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -333,6 +333,11 @@ enum ppfear_regs {
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
index 9c3af822e262..6c9aa6acfd5d 100644
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

