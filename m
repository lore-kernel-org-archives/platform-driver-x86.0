Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D7023ED60;
	Wed, 25 Mar 2026 01:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403347; cv=none; b=tMQqEMt3oUR56Yi/+jFp4H6hdn7z2NtxgUppirUIjCoHj/3gf+nINepOzNb+1EB9PMPPeH8Uzuiyw0BXQpvQv/3IpQhHi2hP5xBU86nUlZzJ4ouXk8mrukcShCQWYRoUvqxJwUoq8fqTQkRrw5LJdrc/xYZ68xKO4BFKr1OwK2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403347; c=relaxed/simple;
	bh=rNg9tfNQtbmOtDhT3jnHqDXTiehG5vPa6LTF4KCJ57U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n5sF+MW+lB1sO86MMWlufPWBxXbKRtLiiOVIH3ZbGlKfM1d569/RxiYRrNnL0aOSvafgRGpx9cctVBKu4oEqj+vsEbqrotgIeVL5lLpbSy2V0z9BllooFGMt2w6e63bnke7gElI1YgG30DBTENC+v6md5/2snzmY7TpOhueCjCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRdeSg50; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRdeSg50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774403346; x=1805939346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rNg9tfNQtbmOtDhT3jnHqDXTiehG5vPa6LTF4KCJ57U=;
  b=jRdeSg50XnDKDE8ZUSwp3BXFIysHFE8SczFvOBmVKYKKiTp0kTMwp8jx
   k1YYBvQAhs1n+qk7Xj1IApRe2Fb3dQmay8fAg1mvV1KAZglggvvMn+zXW
   hA6iV7NJ5dSlqpeHUeDWDRLG54G5El6UAl/Efe8GkYZKhTlyJCi9wX+px
   7s6U6P6M4Gf85q6hflrAOpEp/tYRouObyE/eQ/UyFst6QCtTexa82njRD
   YOb0+gYnKILQADXTgYkiFGAxUSUWcBWV/BeUL2qmaoDckeUF9ZSYV+Fui
   qFfJiJWAzMHfH/djZGbDjrIFKzX3ybDE0z+6MazYCZ0JFAddvcxDHWEni
   A==;
X-CSE-ConnectionGUID: U4kvL1iiRJCC1fWN0zDYYg==
X-CSE-MsgGUID: sPW74PEyQyOe0PdK5jbd1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75317545"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75317545"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:49:06 -0700
X-CSE-ConnectionGUID: M50hhDTrSICs6joSIX+sjA==
X-CSE-MsgGUID: iTZHI3dzQs+UcOoE0o2WkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221190811"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:35 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2 17/17] platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery
Date: Tue, 24 Mar 2026 18:48:19 -0700
Message-ID: <20260325014819.1283566-18-david.e.box@linux.intel.com>
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

Add Nova Lake S PMC device IDs to enable binding of the SSRAM telemetry
driver on NVL platforms, and map them to the ACPI-based discovery policy.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

V2 - No changes

 drivers/platform/x86/intel/pmc/core.h            |  5 +++++
 drivers/platform/x86/intel/pmc/ssram_telemetry.c | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/i=
ntel/pmc/core.h
index 37ea1caf1817..c4c4a33f2e05 100644
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
index 74a2f56881c1..848e259a89cf 100644
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
@@ -309,6 +319,12 @@ static const struct pci_device_id pmc_ssram_telemetry_=
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

