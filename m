Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3A2284B2F;
	Wed, 25 Mar 2026 01:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403312; cv=none; b=LQmSodqb8MPG5FtPjX1lNmGY+D3cgKgzLS9dRsITQ+xUwDi2mVaNxEIsHEoVBGM/Q0dwyOfSQ5ReTTEEbDW+Oe9BUtwX7LYC21NUTaV7PYt9rzN04hEgfM1SQw3WW6g9HNeE9gY4zT8/fQaYoPYr+AOtsc7hy02Uuk+TwiRtsLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403312; c=relaxed/simple;
	bh=c9aRN+Z8HBx978nr9UB9cqHbnyIS7Ruq3oAI3qlGnpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=soHb/1bMBG8LZnk0rIbAoenCUxh1eloAEuvHRUYw5ea4GVErThDFEcqFEydJ8CDXrIrsQw7q3eaWNpE8a/MacH4HdnpBLGjk+Kinbvdi1lHn70BdtjohYNtqFKPnoa0cbEEBq8SyE2joPKUH1VF3R5JWDetmLNyweArsnjF0fqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTlg+IwX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTlg+IwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774403311; x=1805939311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c9aRN+Z8HBx978nr9UB9cqHbnyIS7Ruq3oAI3qlGnpk=;
  b=JTlg+IwXwZ9w+p9qdbyBBoqoPd009t7PsgMF75YGA2Dvycf8khGb00NW
   ZLTW0AkEAmoXBuRQmDwP5p3ruTizOgF4/dHVYNR4qwY8TbO2zwUorRABA
   OueoyM9oEM1O1Ym/raz9zl/W49t/pS4FfxR2PFFQlxbh0QOYjzjQ8PPBR
   M5Is7DHuQySYqAuJRAsrqxcxOQpAVg8TqP9g3yM7uE+YsjeDTKZxlK602
   oxc7IQj4f/IyyrtwkRQtIHGpJs8opzIY1ek8sUWAwopoT5yI7aLeHmnx4
   k5QPVZUuPw51bKZeAVBsarexrqlq6/LpJ0dSOsp9V/mBcAqLfwrORS/by
   Q==;
X-CSE-ConnectionGUID: jVhoXQK6R66T5JqvKwckPQ==
X-CSE-MsgGUID: wnp6JJEWRlWt+lC13lBp3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75317511"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75317511"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:30 -0700
X-CSE-ConnectionGUID: VXGK15DjTe68wTYPHyZpdA==
X-CSE-MsgGUID: eIqPRh8gREqP8OG/q658Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221190789"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:29 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2 09/17] platform/x86/intel/pmc/ssram: Rename probe and PCI ID table for consistency
Date: Tue, 24 Mar 2026 18:48:11 -0700
Message-ID: <20260325014819.1283566-10-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325014819.1283566-1-david.e.box@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Rename intel_pmc_ssram_telemetry_probe() to pmc_ssram_telemetry_probe() and
intel_pmc_ssram_telemetry_pci_ids[] to pmc_ssram_telemetry_pci_ids[],
updating the MODULE_DEVICE_TABLE() and pci_driver wiring accordingly.

This aligns the symbol names with the driver filename and module name,
reduces redundant intel_ prefixes, and improves readability. No functional
behavior changes are intended.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---

V2 - No changes

 drivers/platform/x86/intel/pmc/ssram_telemetry.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 6f6e83e70fc5..1deb4d71da3f 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -149,7 +149,7 @@ int pmc_ssram_telemetry_get_pmc_info(unsigned int pmc_i=
dx,
 }
 EXPORT_SYMBOL_GPL(pmc_ssram_telemetry_get_pmc_info);
=20
-static int intel_pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const s=
truct pci_device_id *id)
+static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct =
pci_device_id *id)
 {
 	int ret;
=20
@@ -183,7 +183,7 @@ static int intel_pmc_ssram_telemetry_probe(struct pci_d=
ev *pcidev, const struct
 	return ret;
 }
=20
-static const struct pci_device_id intel_pmc_ssram_telemetry_pci_ids[] =3D {
+static const struct pci_device_id pmc_ssram_telemetry_pci_ids[] =3D {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_MTL_SOCM) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCM) },
@@ -193,14 +193,14 @@ static const struct pci_device_id intel_pmc_ssram_tel=
emetry_pci_ids[] =3D {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_WCL_PCDN) },
 	{ }
 };
-MODULE_DEVICE_TABLE(pci, intel_pmc_ssram_telemetry_pci_ids);
+MODULE_DEVICE_TABLE(pci, pmc_ssram_telemetry_pci_ids);
=20
-static struct pci_driver intel_pmc_ssram_telemetry_driver =3D {
+static struct pci_driver pmc_ssram_telemetry_driver =3D {
 	.name =3D "intel_pmc_ssram_telemetry",
-	.id_table =3D intel_pmc_ssram_telemetry_pci_ids,
-	.probe =3D intel_pmc_ssram_telemetry_probe,
+	.id_table =3D pmc_ssram_telemetry_pci_ids,
+	.probe =3D pmc_ssram_telemetry_probe,
 };
-module_pci_driver(intel_pmc_ssram_telemetry_driver);
+module_pci_driver(pmc_ssram_telemetry_driver);
=20
 MODULE_IMPORT_NS("INTEL_VSEC");
 MODULE_AUTHOR("Xi Pardee <xi.pardee@intel.com>");
--=20
2.43.0

