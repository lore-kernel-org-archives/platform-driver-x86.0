Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A8C26FD93;
	Wed, 25 Mar 2026 01:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403316; cv=none; b=iOCszt30MKdp1x0zLo9xZkeYDihfVRgWF6k3z60OTaoyWuI8nZGfamS/zW+AYT4VPJeqx5VN3swULEoQvq1tr16V6pxwaWg5rxTmL8Uq6OuAI2+Y95U9PiEfS9iT0TnLTAbL3YZWoiSIaq5a8FcEqeRJlakYzP1I7VA1a8Uu2w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403316; c=relaxed/simple;
	bh=+CsvZzERkjsscfYNWRClK0GnEBLzm8MEvu/3dbeaJto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFMnBFkP7/sbMUNEv4N7bPaiJtPepwzgRdKFEYleqjff+mjlV3EUJZO0eYxsNob96euxNKDPb36d9tH3Yfzqk27h1n74atEhla+XqTmbRp4BRMWZ/WzmmB49eSFuGRyTO1NoKVwh4tQv+6TD4m0cJMY7HinykHJaRf/dP0sgavM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WN0SbHwL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WN0SbHwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774403315; x=1805939315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+CsvZzERkjsscfYNWRClK0GnEBLzm8MEvu/3dbeaJto=;
  b=WN0SbHwLUC/LiZ23lfwxmFRE0IARVwdbd9v3Yh9UwjZ3GFyBL9r4a1Eu
   Xmeh3kxzMwpIPwXI/jtPwvzYTLnYz2p3tW/ZzXj+Ttl+GH0im2sPbd2En
   HIKTieQFB5lnsu+N8J6dlqRfEmyBj5AAwV1+N8wGm+E0zWf9MQQ3dAEpw
   LdJTfqVJVnrQYnwt0YmoAUIjFO2WrChgi0jkKiNQDkBO8pUnpnC+nABj3
   9Shr9rDMebrB+ggVkfTv3+7LZ68HSQIONSMmcnLgAf0XKxJw7aatgfHzq
   m7HsH3OM4fnIqoZ6/ng4/ysmYELfcp+6AWMuAQp8YrmuTeRB+j5uHBPFz
   w==;
X-CSE-ConnectionGUID: qHWoepT2Q9mlfGKUn6ARww==
X-CSE-MsgGUID: gOuzK/0fS+WzXMEB6HldWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75317535"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75317535"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:35 -0700
X-CSE-ConnectionGUID: pZ2JGMFnSNKsslTNvpyt+g==
X-CSE-MsgGUID: 2xlCpw9dT+SnNHcxD8A2AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221190805"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:34 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2 16/17] platform/x86/intel/pmc/ssram: Make PMT registration optional
Date: Tue, 24 Mar 2026 18:48:18 -0700
Message-ID: <20260325014819.1283566-17-david.e.box@linux.intel.com>
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

The SSRAM telemetry driver extracts essential PMC device ID and power
management base address information that intel_pmc_core depends on for core
functionality. If PMT registration failure prevents this critical data from
being available, intel_pmc_core operation would break entirely. Therefore,
PMT registration failures must not block access to this data.

Change the behavior to log a warning when PMT registration fails but
continue with successful driver initialization, ensuring the primary
telemetry data remains accessible to dependent drivers.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

V2 changes:
- Update commit message for clarity
- Also apply the PCI telemetry path

 drivers/platform/x86/intel/pmc/ssram_telemetry.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 543f7d7c5049..74a2f56881c1 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -107,6 +107,7 @@ static int
 pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_i=
dx, u32 offset)
 {
 	u64 ssram_base;
+	int ret;
=20
 	ssram_base =3D pci_resource_start(pcidev, 0);
 	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram =3D
@@ -132,7 +133,9 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev,=
 unsigned int pmc_idx, u3
 		pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
=20
 		/* Find and register and PMC telemetry entries */
-		return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
+		ret =3D pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
+		if (ret)
+			dev_warn(&pcidev->dev, "could not register PMT\n");
 	} else {
 		void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =3D
 			no_free_ptr(tmp_ssram);
@@ -140,8 +143,12 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev=
, unsigned int pmc_idx, u3
 		pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
=20
 		/* Find and register and PMC telemetry entries */
-		return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
+		ret =3D pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
+		if (ret)
+			dev_warn(&pcidev->dev, "could not register PMT\n");
 	}
+
+	return 0;
 }
=20
 static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
@@ -214,7 +221,7 @@ static int pmc_ssram_telemetry_acpi_init(struct pci_dev=
 *pcidev,
=20
 	ret =3D intel_vsec_register(&pcidev->dev, &info);
 	if (ret)
-		return ret;
+		dev_warn(&pcidev->dev, "could not register PMT\n");
=20
 	return pmc_ssram_telemetry_get_pmc_acpi(pcidev, index);
 }
--=20
2.43.0

