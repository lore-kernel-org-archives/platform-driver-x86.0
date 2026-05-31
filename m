Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A6342532;
	Sun, 31 May 2026 19:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780256811; cv=none; b=ewA7QkF+jng7Ht7wRA7CGU/Js0C0VCQ+tbYss6l84tT0F3nx/hMx2sX6KVMNyxuZnkY3+KJn+dqJDeheHFa/ueAeXg6WsxLBpvqWOvKTRIWzXbLF8XKW67i8lVJMEQ4AoPK04SpKgZBKD/dEO6H7f83ngOHW5mUV+GCfaEg2q6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780256811; c=relaxed/simple;
	bh=eummtBHJWZr+4kyo8IrQtTlGGaxS1Tt2BAi8273f5RU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r/B1tKvwfdUfGGhTXXvw5WjQ+T1B+zO7t0q0x6sonpxay52Tl/agN8jg2bi9/AqL+yhyPsK6fU8wZrj50paDkEiRre8iep2REo425T2rGZV27tHDuTs4fsFjGxqoikACQWuD1BeO35eajshTY/h2jNYePc37KX1JFmmWmas5+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MX45sIgo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MX45sIgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780256810; x=1811792810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eummtBHJWZr+4kyo8IrQtTlGGaxS1Tt2BAi8273f5RU=;
  b=MX45sIgoU2978T3h1hhW95g9RXuR0mYSKcHIUqb2l9kmOa9fIq7ypqpr
   2tvTVlHuB/Rbs+MKKiRigrfFvNCk/8wWV7HwQjyi1OH+WdpN+itE7rR1m
   XPCLpq/9R4tXwP35S1kF8LQ/XB3ChV4L5ff0suB7oSQdAIjXzCXzihXmT
   ZRzHXcXpLwEI06jv48WJPK2m4f1ZnfnWVEocr5Z5EOnTMcZU9AuKDO/EH
   s9IMgUp5sGpXyK/wOpxj1Gu/Rf4qQwlD9MGFd5fOoqy4crqIo3L+ObxVx
   tCnqPYDgYRfH11cDxF8RKrKYgPTi+Iuh5tfgTO5/bsdwQXWE1D/4c+357
   w==;
X-CSE-ConnectionGUID: aszQD9ocQv2kwe1Hw/ROow==
X-CSE-MsgGUID: rkXMIgUhTnGTE7UjoxlO+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80751314"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="80751314"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:26 -0700
X-CSE-ConnectionGUID: YQfj+QMiRiGOy2rgmN3W8g==
X-CSE-MsgGUID: /aK3vduRRNmz1axnGlYpdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="247363904"
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
Subject: [PATCH v6 14/15] platform/x86/intel/pmc/ssram: Make PMT registration optional
Date: Sun, 31 May 2026 12:46:16 -0700
Message-ID: <cbecca80bab147f5a299e30d1953549d5c7e704c.1780248804.git.david.e.box@linux.intel.com>
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
index 7ebfbb177499..b7cc4b540221 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -195,7 +195,7 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev,
 	/* Find and register and PMC telemetry entries */
 	ret =3D pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
 	if (ret)
-		return ret;
+		dev_warn(&pcidev->dev, "could not register PMT\n");
=20
 	probe_cache->valid_mask |=3D BIT(pmc_idx);
=20
@@ -288,7 +288,7 @@ static int pmc_ssram_telemetry_acpi_init(struct pci_dev=
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

