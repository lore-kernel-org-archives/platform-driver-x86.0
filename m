Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A82537EFEE;
	Fri, 12 Jun 2026 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298138; cv=none; b=rOyGnLBNq55DveSc/rSGeU3R7fJp2l073evk/+dqOSkt+U+zPnJi0+t/JGa9pK4lIrfO4hUyKwg5smOOM+h9Kot+hbFrCc0GZQnARyV7XDkkGHTrZ7CD8WoknuUzBI4G+f6QszECroVRPiVC7wVFxLKOLOIKV7bXrYSFJJoRq+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298138; c=relaxed/simple;
	bh=23FNr6jVvfK0ryQv1CWR6rz78krBF9LFVZXU0yprp/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=miK9wRK5R/EyPqa7hQNyuZVh4cHQWShLTUxRxiBkrKZFEF9Q5Q6CXpDtY4hSOjYuiLyq8oop97JReh1bOUkBOAVVSjWtUhqy3NLIOoBSTtr7kQpkOL0XojwW2DTGdPyuEQ8s/ppTOO6VYEE6H3MoN9aPiNHyPpdCuucFS4rAq6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8t154i+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8t154i+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781298138; x=1812834138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=23FNr6jVvfK0ryQv1CWR6rz78krBF9LFVZXU0yprp/k=;
  b=E8t154i+g3XwFww4KdXE32hEfgCq8IgYmiZYpEWjKoHKO79QJaE4Ou22
   IY6ORjBHM9AzNJBqoBBdINHtS13i4drLdct3dI3o53RprfV0wFUWHmzlx
   TZGkMJ+tOY2Q7ndgtxnxYEX+cwDqYfIOZwUJgXUh5EzV53LK08v5VQcm3
   h430wFZY27/22ql4QZU5zAfwgL9NShV1Xk91TSQ0BcoXRvsxPBStCawCQ
   iRG6bNT44q4qlNVsgtBfTaK4RZJu6o+kB93xkYtXDwtG9ZGCWLeqC5u8n
   zZWmfNhoLziiGAoUVFHpFpxtVl8/PZOU99kBwzBqgjePVeFHKIyk9+BsT
   w==;
X-CSE-ConnectionGUID: ZDdFPgMvR3S+vKfCKzwx1Q==
X-CSE-MsgGUID: qdaS7CzWS7eD+50EjEzcQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86037996"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="86037996"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:13 -0700
X-CSE-ConnectionGUID: Zjt3rAKlT4yjCT98qc9RHA==
X-CSE-MsgGUID: pAD+X2M8RMuva5Odu07ciA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="250832867"
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
Subject: [PATCH v8 09/15] platform/x86/intel/pmc/ssram: Rename probe and PCI ID table for consistency
Date: Fri, 12 Jun 2026 14:01:50 -0700
Message-ID: <6d3935858214fdd0f530f9a7c08a387fa4e5e8cd.1781294741.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781294741.git.david.e.box@linux.intel.com>
References: <cover.1781294741.git.david.e.box@linux.intel.com>
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
V8 - No changes

V7 - No changes

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

