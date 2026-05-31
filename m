Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9DD33D4E9;
	Sun, 31 May 2026 19:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780256808; cv=none; b=tFrGRpncT9nzGA/zDxxjLtVz20tXwrkNOL3odLUAdvLhE6OZ07HKohZaWOhQpsDmWo9++HYYIACiK7tJ0ufKHc1BqOpmriUsoGoyASi+j3l6b74eNj+2BtradDv13cvwRDziPj33jazZrIB2NFJNqiRKTWMtag6Rmwp3HXV4i6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780256808; c=relaxed/simple;
	bh=IE1sSmfcIxO9481gahp4PuqraUK7jxPb3qtDfuWSWOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fAAwf3BWgMVB5DrxLZ7m/G9PoucslqMTZhKPv8ql/i/3Pr2DHdGSxukbbAvLUY4aU+0dd3ElAyZGouqcnwpVAYwhc4Xm5Bn16PmSyR3YiV1Mb1uo1NJoIk2/VuO/XdV3lOMtzaYY0XiJfV/gVeQQEPfmCkXLww+hKVaPeQuBcvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqbsg7QN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqbsg7QN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780256796; x=1811792796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IE1sSmfcIxO9481gahp4PuqraUK7jxPb3qtDfuWSWOk=;
  b=eqbsg7QNXfPoNNLGF3QYXFXPkHpix+g5AcazxbbPuBTXbZ4SwTlaDSdq
   PpFk3xH43vVMQGiekVvWnmp9pl/pxKATz5YowE4HGsmVQffQm+pNHGEua
   3+bjgeKJoj/zYremK4VLFonUqEFW4PPvND5QSsfzSH5PXDFPN7kgFm0gq
   qYYGh1ymsyZM1RtzjHsxkiavmtzAuRgeBz0a/r4c5a8/eDQqvqo3sS8E7
   ix1BIEbKdouY80d24FUPcqiR72byGumjIOc0zs+UsRQyPYyNlxY98aBXX
   xCSsicXPRQLVAqt/z0Eqsa1dlkoW/D6hqz9jHhE8dWqt6yIKFZfo9U4yZ
   w==;
X-CSE-ConnectionGUID: cDcxl2IsQHCCH9w3Xc6a8w==
X-CSE-MsgGUID: lUJCGRxORTmyQXmpGrPAzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80751297"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="80751297"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:25 -0700
X-CSE-ConnectionGUID: V6aNpT0JTVaEd/SWzQY4Yg==
X-CSE-MsgGUID: KnsUSj4nQp+kIPs6e5DLLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="247363899"
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
Subject: [PATCH v6 09/15] platform/x86/intel/pmc/ssram: Rename probe and PCI ID table for consistency
Date: Sun, 31 May 2026 12:46:11 -0700
Message-ID: <75a186c976dce5800ed1905414af6ad6c793de33.1780248804.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780248804.git.david.e.box@linux.intel.com>
References: <cover.1780248804.git.david.e.box@linux.intel.com>
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

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V6 - No changes

V5 - No changes

V4 - No changes

V3 - No changes

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

