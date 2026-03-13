Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8DF344DA8;
	Fri, 13 Mar 2026 01:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773366752; cv=none; b=C3UbDuoL2a4BPr8mMIX8idZjsXLpDpA9irko9Z4YmyN6TjCex5g7qtC5hUFUZ6AAa4T3r82s7ikGWN8kvWyUg2VFsDTqzeBb1C5cyK18x/ef6EzoSXka2ThilUGjqaRfRjYfkgpbvvSWM+krffnjg5B6Z137aGCERa6TRSTs7Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773366752; c=relaxed/simple;
	bh=R2x0PrfpKvjccrjzU758mRF9aDjoa62HI8fwlmFVWxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rr1mD1z+FSWOKNcPjCgLcFFa4wrfxN2cAXVjRDN2Wmw0IP8HmGYPf8cdLSx9XxiaxvoGiyrRoSC9YBGvHVwvavGZoWptM0SdxgW++eMd0fY9eCgpmGGYhh6ncDYNXEee7HgHvIy3c5cJq0u1vVqr+qqdiHWcRebcYqLep1XMudk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/JdzGZ0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/JdzGZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773366748; x=1804902748;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R2x0PrfpKvjccrjzU758mRF9aDjoa62HI8fwlmFVWxg=;
  b=R/JdzGZ0j6RW2rNbyuplI+mjCC9it8c14Rmmj1cXxBy1Kv2ax7AtJHjV
   r+JxIuhJEjMDypsk9jh5VpmAysaAvmYFBjmqfdJfXlh6a3u9Rz9EYgIL8
   1QsbQlTIvJ+XAtxHcrI4xnYrF64kqD5cR3mXqXXG8KVe7wIuJE88zR7Mc
   9OC+etvwYBmVoQ1uBb/oRks0I2v2FY2chp//SA6U1pXNh3ePYkDq403Uo
   39EHayEWEwPNBQeQIefLpjB9dNsk9kAFRnDKOKI0kzo0VivTKrpo/tpaB
   ECZhggxtqtHG3mtWc6+qi9qDQPJYsJwwVq2Ift8AaEsygBYKvMn/XP4xG
   g==;
X-CSE-ConnectionGUID: /fxvpvvuTGOq5z14ZPaPNA==
X-CSE-MsgGUID: cOukLhhuT+StPPO843iUiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74354594"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74354594"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
X-CSE-ConnectionGUID: bZ06CU6wQQ6R4H98Tk131g==
X-CSE-MsgGUID: lZVSM4EtRfC7GgGR0tVvsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220108512"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 15/22] platform/x86/intel/pmc/ssram: Rename probe and PCI ID table for consistency
Date: Thu, 12 Mar 2026 18:51:54 -0700
Message-ID: <20260313015202.3660072-16-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313015202.3660072-1-david.e.box@linux.intel.com>
References: <20260313015202.3660072-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Rename intel_pmc_ssram_telemetry_probe() to pmc_ssram_telemetry_probe() and
intel_pmc_ssram_telemetry_pci_ids[] to pmc_ssram_telemetry_pci_ids[],
updating the MODULE_DEVICE_TABLE() and pci_driver wiring accordingly.

This aligns the symbol names with the driver filename and module name,
reduces redundant intel_ prefixes, and improves readability. No functional
behavior changes are intended.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
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

