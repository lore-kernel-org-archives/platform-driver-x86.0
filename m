Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39041331A65;
	Fri, 13 Mar 2026 01:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773366767; cv=none; b=WJsFBFKXKfImFnH4fheBVWbQ2UOAaQJOEDYyIQBDfeAT31Z5QqkAus5+Bgo/oGb3f8k/ZovEyUaqXB4VBE2upd7mYcWn6C4E64yIQdkXEXy3XnsNV+raiFscVFkMAkv9jJbEK6Z9cLee1urNzlbtMM2mhyxUm5PryW8qUwrJorc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773366767; c=relaxed/simple;
	bh=B8JS8RQBRrQVr1GSRI9Lf2J0JExHYR/5c0SOq7MzXKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q4S6e9GIv/LB4kz/bL4kcUN/bpxdYgPZCOfhM1FCLRyXb/Ykuy6aj0F/Fk5wO8m5ASqi94W4CM8QzWyHwnzEDAHBMOcHK8zvgQgr+kFR+PXVaM3gXiG57+l5hnAXAyxSWtLXfomo5IVzwcVfTeQzKImwr55CcyjAt7iXyKVBU40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ou7iI46z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ou7iI46z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773366758; x=1804902758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B8JS8RQBRrQVr1GSRI9Lf2J0JExHYR/5c0SOq7MzXKg=;
  b=Ou7iI46zw4V6b9k1L5h+b/bKHyTiCP1i5hDPZgIF5NNyG6yLRhRaq2hv
   35GJqG1VMsmGeSLi6ERmpDxdqakp3NncWgRLVEgtpiPFKvEDhrbYMnQx4
   aWD4PWS+5cTeD+jNhzG0zmLpGEXBpJptMY8UlpJDfVEBYbxTYuag3+AvB
   efKkZsDMOx+GXsK3KpsX7zbCiMJF7hmbpTwbnkkyOxRlW/mHBzUZzW+32
   MvHLaiDw6PEDYZgIDkp5YcodDx+h+XQ5FCZOJXAk8DZcdzeKoLqCxDLaE
   OCk3Ao2/XawnF6ZvT7Ltxel2DDrGXh246coMwZRiziE+/mM+ShWKzLYUz
   A==;
X-CSE-ConnectionGUID: oey+hHs0Sry63pkNiYXI8A==
X-CSE-MsgGUID: +m2MyMu+RuaUEaDuOpWxOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74354617"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74354617"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
X-CSE-ConnectionGUID: Bfxnia9TQTyslxJwaFfbTA==
X-CSE-MsgGUID: OChU2o0pQYuVC2HLS/q5lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220108530"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:13 -0700
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
Subject: [PATCH 21/22] platform/x86/intel/pmc/ssram: Make PMT registration optional
Date: Thu, 12 Mar 2026 18:52:00 -0700
Message-ID: <20260313015202.3660072-22-david.e.box@linux.intel.com>
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

The SSRAM telemetry driver extracts essential PMC device ID and power
management base address information that intel_pmc_core depends on for core
functionality. PMT registration failure should not prevent this critical
data from being available, as it would break intel_pmc_core operation
entirely.

Change the behavior to log a warning when PMT registration fails but
continue with successful driver initialization, ensuring the primary
telemetry data remains accessible to dependent drivers.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmc/ssram_telemetry.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index b937ebb2322f..12b7c1299c2f 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -106,6 +106,7 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev,=
 unsigned int pmc_idx, u3
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram =3D NULL;
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =3D NULL;
 	u64 ssram_base;
+	int ret;
=20
 	ssram_base =3D pci_resource_start(pcidev, 0);
 	tmp_ssram =3D ioremap(ssram_base, SSRAM_HDR_SIZE);
@@ -133,7 +134,11 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev=
, unsigned int pmc_idx, u3
 	pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
=20
 	/* Find and register and PMC telemetry entries */
-	return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
+	ret =3D pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
+	if (ret)
+		dev_warn(&pcidev->dev, "could not register PMT\n");
+
+	return 0;
 }
=20
 static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
@@ -208,12 +213,12 @@ static int pmc_ssram_telemetry_acpi_init(struct pci_d=
ev *pcidev,
=20
 	ret =3D intel_vsec_register(&pcidev->dev, &info);
 	if (ret)
-		goto cleanup_acpi_disc;
+		dev_warn(&pcidev->dev, "could not register PMT\n");
=20
 	ret =3D pmc_ssram_telemetry_get_pmc_acpi(pcidev, index);
=20
-cleanup_acpi_disc:
 	kfree(acpi_disc);
+
 cleanup_acpi_buf:
 	ACPI_FREE(buf.pointer);
=20
--=20
2.43.0

