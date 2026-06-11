Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB663655F6;
	Thu, 11 Jun 2026 04:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152505; cv=none; b=P8fYCJY9Wh5IPA+pP+j+xzHoqfgEm9P3UfaUWVPUdXU3SQchs+8y6LzVlfWppLfjg4Y31RvxBGAGiT954hacMqyK4377aRQFuomKbpdMTlCgqYvkOyzbeNaOLrp+/Ow8DfCE4bIcQVpmcJOAUIa8Q7MImGfAjzHxMEq4GIbEmjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152505; c=relaxed/simple;
	bh=7cDH1Iy8MnHQj7K3DhGs+r4IGl+hosl6lbE11tJTQpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGqOngiemB7YhNiEHEtpfe+NlbmE4hj935bFxwoJP3v6Tar9TsF0Xoe4BBOd9JPbGQt64X9nHvvlXegLQ7sdlIOFUHwNnzoKtm0n7CFjGVpA7BUoar8EykTagZnsMjZOIllgDxxZpLnILqtBUUe02e1Jz9CBw06uqvHhfCy3dbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFKybk54; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFKybk54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781152503; x=1812688503;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7cDH1Iy8MnHQj7K3DhGs+r4IGl+hosl6lbE11tJTQpo=;
  b=gFKybk54SZ2W4AzvyosIP1wgmfmlhAhfiy5w4vHBBqLLwQpMsUKZHSMI
   lM3KFtYbuiyZZ9Ns5aQxJGEVRn9EPuY67Y5oW27NNuT4tR7tfQMk/nz0C
   dE1w8esv7/1HlDEVMCouh29gF7hNlWJ/oaxih0a/UtbJkhgiYTbLQScmQ
   gUrs6O1DFi7Rf0crXBS3J1w5J1luJ3GUOBI/3zUjwYtSiAkkD2Ya+wNqd
   hLRzJRPPNo4gjLHbpIk522wdwumVRi3MpZeboTskIOhLftvbccciCtf/G
   VvMLXGDgQrC+pmU9gLtQ+nSlc/9NEFIm5lzJMUnjXQ65ZDTOsH5IvWOyd
   g==;
X-CSE-ConnectionGUID: IX0VBjQSSYu/ZTMMW4habA==
X-CSE-MsgGUID: uDNHyAhLQwKre4KEJyEGUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84531028"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="84531028"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:57 -0700
X-CSE-ConnectionGUID: ljNQbC72TlK/ZXzyzxWhdQ==
X-CSE-MsgGUID: hE4gsSajSS2JgPClO225Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251468356"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:56 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v7 15/15] platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery
Date: Wed, 10 Jun 2026 21:34:43 -0700
Message-ID: <45bed1e4b158778ae0fa8e3db0f020735e14f67c.1781146840.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781146840.git.david.e.box@linux.intel.com>
References: <cover.1781146840.git.david.e.box@linux.intel.com>
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
index 2095df6a42b2..2c9d47070f81 100644
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
@@ -437,6 +447,12 @@ static const struct pci_device_id pmc_ssram_telemetry_=
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

