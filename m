Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAF635F190;
	Fri,  1 May 2026 23:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677077; cv=none; b=u7yJ2RwyNbiReN1/kWhwT8BagFsCBThHexXs9j9vH2W2jr15QybSjZExbS8yI3MjBhIjvxl5By7Rd3S8qiQB+QqESc1teBJO98lZfMD6rbqXMO0tHFZUnS4BmDX31QlHS3rjaxeBVXnM+wg+sGxRZ6EziCe2l37nc0zQRnE/iWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677077; c=relaxed/simple;
	bh=jDu7kWpRqKfzxlxCB23tsLrghdKDwn441nc0AZoEHx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cf5Lda3idlI0rkn6eMjUjnMXHaf7BO66xWBisvnpT0/a2FJd6l1h/lE+HofXYJbvJgWPTC1qrhMYwdcsVlWOZ34cmEiyB9Et0xlpr+XBn+MkwvzcdAoILZUB7Jo+hksZfDCgaveBOHaCIIkHQHiZi4DLoAFbZCW4mMJhLuedAIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JI1GCjJx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JI1GCjJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677066; x=1809213066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jDu7kWpRqKfzxlxCB23tsLrghdKDwn441nc0AZoEHx0=;
  b=JI1GCjJxkujE7CxIX0aJMoVLGKuQM2WPeN7I53XtTOE7NbfYkGnhXBk2
   BiHPObk0wiwuuSPBL43Iu7xJ6aWGSPVJ+mzyxUS6bcUTZLKjNF8hYOIt8
   j5jFc+ejQ4Rcl776R3mfAHN4P6MN54aZSzkAUS/VhMGUHuscgOkMzGY5G
   ROiGwJ8afBxVYDUr3Yi+A9mqbmTHR8hJBLNU2dUu7CRNEH3pcHy5qB/CZ
   jAfTTVfEthDCoJzgAwRD1I1NQioJGh3oMeGoXi00zi3tUouilJLex0nfz
   xav9UwTGBC5q9+LlKuESLqO1tKa0QRntVYaJpYXdbFOcL7TlAcOmNozwy
   A==;
X-CSE-ConnectionGUID: 7yIjYHrnSPOgsYIN9E45qA==
X-CSE-MsgGUID: MAy89/6XTfi/NYg8mlq1Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740146"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740146"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:01 -0700
X-CSE-ConnectionGUID: vZJDP+46Rf+iDP/hXCyi8w==
X-CSE-MsgGUID: jJzVwMrmRW+PubllOOUZsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948964"
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
Subject: [PATCH V3 09/16] platform/x86/intel/pmc/ssram: Rename probe and PCI ID table for consistency
Date: Fri,  1 May 2026 16:10:46 -0700
Message-ID: <20260501231054.3890305-10-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501231054.3890305-1-david.e.box@linux.intel.com>
References: <20260501231054.3890305-1-david.e.box@linux.intel.com>
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

