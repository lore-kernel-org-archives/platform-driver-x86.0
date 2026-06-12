Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2003D5674;
	Fri, 12 Jun 2026 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298142; cv=none; b=LNsZRXnLSDZoe6hTT5BxwgL2F27nT5yzdreMs2TWsUQpsfHFIT5UHs9Ntuwe9AXnhHvrZ1Fr4yJDXKtov6QgGaeDKL+QbtsA7JDHiiNh9ZtmRL+TkKNplXS0P+Zwl7wPSxNTECz8v6CT68BIy3mBGKDmgQvtXkh4IFh7254000w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298142; c=relaxed/simple;
	bh=2LyoUp/u3z2V0L3Fugc+0ZewYUnR19ZCFL5d4L8X1Co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pl7O1Nl0jNVAs7E6EcN/BKMVTdLepQLRMlzVdH+QttIPpzF8KYdrlRtkpmbE9NVsXZ8tjB6IjtFUYq5V3tTz+iRQ7lNuB3wnEQcuhFlkZDlnf2Q/0yWRAk0buaF7fDS8iPAY4Iu4pj4TFPSYSttXY1FGJ0sUYlBGye1eWcsyT4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YK9qUo0e; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YK9qUo0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781298142; x=1812834142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2LyoUp/u3z2V0L3Fugc+0ZewYUnR19ZCFL5d4L8X1Co=;
  b=YK9qUo0ecCWVhAhlP+iPIsuqecTs7JKuudvTNC7RqQrzep4lGoYiSimJ
   y93sZju1wvfG0Fa49V9/WFxnaCtbD0F+h04GIxM6kQ8s6R9jP1oSXnosf
   Z83qV4r8zcOdAxZ0+Mnxer9Q518SFuCeU0B+SR+jKDyRM8W2Vl4C/Lt3P
   t+MQ+kYVxlMj7rYvueVDPd07G3sAnUJop+FKE6+L8AJY1woq1O7imj9iG
   t1rZWP4pF/1Bp8FZVtgmaSsn+ymqH2agSCcWtlZ0XOpYr2FHJJAMqJkDr
   qT0JhypfYey3FrIJUhtQEN0xB0vQf2vsgR595hORvsBm82Jr2IlmQKp4t
   w==;
X-CSE-ConnectionGUID: fN2qVLVFQemP+nhce4mumA==
X-CSE-MsgGUID: dqha8QONSFCMcoRfeYtKAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86038014"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="86038014"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:13 -0700
X-CSE-ConnectionGUID: QsBCz5uTRwmMLZQ0UaH8hQ==
X-CSE-MsgGUID: Kgg+gzFPTCa6vl2Oq9QmQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="250832872"
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
Subject: [PATCH v8 14/15] platform/x86/intel/pmc/ssram: Make PMT registration optional
Date: Fri, 12 Jun 2026 14:01:55 -0700
Message-ID: <4f4c324977951f6082bf2218c8b911e1ae7e0a7b.1781294741.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781294741.git.david.e.box@linux.intel.com>
References: <cover.1781294741.git.david.e.box@linux.intel.com>
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
V8 - No changes

V7 - No changes

V6 - No changes

V5 - No changes

V4 - No changes

V3 changes:
  - Dropped the standalone cleanup-pattern patch from this refreshed
    series retaining the simpler ssram pointer flow requested in review.
  - Folded PMT-registration-optional handling onto that simpler flow
    with no intended functional change.

V2 changes:
  - Update commit message for clarity
  - Also apply the PCI telemetry path

 drivers/platform/x86/intel/pmc/ssram_telemetry.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 10462fa7ebbf..9a8922045ab7 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -198,7 +198,7 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev,
 	/* Find and register and PMC telemetry entries */
 	ret =3D pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
 	if (ret)
-		return ret;
+		dev_warn(&pcidev->dev, "could not register PMT\n");
=20
 	probe_cache->valid_mask |=3D BIT(pmc_idx);
=20
@@ -291,7 +291,7 @@ static int pmc_ssram_telemetry_acpi_init(struct pci_dev=
 *pcidev,
=20
 	ret =3D intel_vsec_register(&pcidev->dev, &info);
 	if (ret)
-		return ret;
+		dev_warn(&pcidev->dev, "could not register PMT\n");
=20
 	return pmc_ssram_telemetry_get_pmc_acpi(pcidev, probe_cache, index);
 }
--=20
2.43.0

