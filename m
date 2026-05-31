Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A340344DA8;
	Sun, 31 May 2026 19:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780256812; cv=none; b=mJQsh8CnH0sTGRRDbhucmYselH+m1xIbx11YtM0roeR5gpBvTKK9Y+v6qhiP8z6QXzoLHINI6b0iFqnt1PSsKcu7Heme+O8Vetj8mMBf8SBez++PvmWSkXjyuMGvzC3g4yC0x594wS0PO5+X/tBl6yP1YQLict32ML9TKg9FF5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780256812; c=relaxed/simple;
	bh=LqX6b1jX4VzxJoqs09JQuLu/U4vArpVNUDEjNrQgkMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRsUdZNELFXJn7op8m6Npz+/V5rz0qORvfqoo9QODxv6gTp7+ROhI02lIdq0weWB4WEHcxh5hIgLNbFycfIV0ilF1t9wEhwme4cQhnii5rW8/kqkS1tEpW6lJFXvTGZfjgXTBfpgptCkm4GVuI1umRzLNYFma7SFgAPaSwSK9qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwFM5clX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwFM5clX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780256811; x=1811792811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LqX6b1jX4VzxJoqs09JQuLu/U4vArpVNUDEjNrQgkMM=;
  b=fwFM5clXdCl36ylX2ycWqLX6m0nPgZ9LQAaFQ+z3D55YcmOm5vV+oXXq
   PkMQWfKxvLMyH2gvpKkmDXG8F4cx033wM8Lp1kEXV+JSRIF8SHyf5PJif
   Qi9YBx0EiWw6WSKuXz2nePmLqFuq6ij5LGKwady9VYgH41LIaeAyn7MeT
   pFO5G7wTXAjbYa3dltc/ypPDOSCAJRYuBFYfcDWmsaGwCvERXnfuDYyta
   fp8r/4A/G7y/9s4vShL8mn5OpRRYOqSiWWlony1lwdzWNDZj0TfyZz1A+
   cWy/HeAJic8K+d/a1ejcW22FvpnCiUq/EgUGzeItikr/DtwMdnkEbbW2F
   A==;
X-CSE-ConnectionGUID: iINlpfDyTxKUy0YfiwlWtg==
X-CSE-MsgGUID: 3/GcYY5uRhmgcZfYHHs+ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80751315"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="80751315"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:26 -0700
X-CSE-ConnectionGUID: fA1qHD3TRA+5pc38HY74Zw==
X-CSE-MsgGUID: ngdMOH9bQnG+srazn02Vrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="247363905"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:25 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v6 15/15] platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery
Date: Sun, 31 May 2026 12:46:17 -0700
Message-ID: <ff2a42a00eb0c03d90980b41074a6e05f545d730.1780248804.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780248804.git.david.e.box@linux.intel.com>
References: <cover.1780248804.git.david.e.box@linux.intel.com>
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
index b7cc4b540221..cf34964b4e47 100644
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
 	PMC_SSRAM_UNPROBED,
 	PMC_SSRAM_PROBING,
@@ -439,6 +449,12 @@ static const struct pci_device_id pmc_ssram_telemetry_=
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

