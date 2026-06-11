Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCA7364E89;
	Thu, 11 Jun 2026 04:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152504; cv=none; b=ilR9VQgXMv6XH0TQrqiQZAT76JRt6aZkOEqdh26Q5DyvxbpWqv8hn9X+cRzeX+hieaCNelinhfCFrM37DVsEFkVbqLfLvpZN4+uPcPHrXAtaWPf3vOLrNpxGI7Bv/EMTu7RGkusAg+xpqMScZ4iJ3TGMBIUf+VmbrOJ7qaI4Oi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152504; c=relaxed/simple;
	bh=3KpxF3J7XCmuAo4iEeERTk5piuUIg0wIC7lQgX0yEVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rpSZK1j/1hBWBOedVMf/qR8z+kR0SSa5pEh61cZQovLkNUnX7Pgo0DrHM4dBQWYrBdJCTIS9/fAtMS7LyzQLXUjwxTVQuFyexAJlV2Eao/jljkUqixwpqER9huZXcX+v4eSDv+W3LhExQh+h/JNdFamtN33rz/N6WLd5NhjEopU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNd7xH2h; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNd7xH2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781152502; x=1812688502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3KpxF3J7XCmuAo4iEeERTk5piuUIg0wIC7lQgX0yEVU=;
  b=XNd7xH2hWL08qLS9FQ1I+dULSAUtN+vrvnkcfi9L14S9YZQJUoYzTMOP
   z8OTdTAffPuAkHyMWBJQ8eyi6rffuOKcYjsb/zDKyGMgpBuS4vaEB4PFI
   AtvWUP0b09IBy227HYgoU/yNu0r+LkIW45bQF1pRU1OnYJnSxm10Nx6/B
   2wTqaiYExGbEFRnoxyMgs0up0wiFz7TnoWoFNhkxtxjYEMRgtng84JRiD
   3Zl+jxJfjQHVREZAhLlRhbPkEJsVEmctPK4mT7/rT/Rpt6CppA/VT9meT
   ywotg6sIw4ZWQDuELM3jkPyS8J7OwTHax0fplVS66ZVGk24QVQgcaB04m
   A==;
X-CSE-ConnectionGUID: J4MKV+2RR42VytPZeUyMmQ==
X-CSE-MsgGUID: xS99OtERS6+LipRrYZxJrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84531025"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="84531025"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:56 -0700
X-CSE-ConnectionGUID: jLfkhQ62RXiYxkJyYWdJ+Q==
X-CSE-MsgGUID: mDdm2yikS6OG1Vp5L3/1IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251468355"
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
Subject: [PATCH v7 14/15] platform/x86/intel/pmc/ssram: Make PMT registration optional
Date: Wed, 10 Jun 2026 21:34:42 -0700
Message-ID: <7e3dfe5c626db0bbba2885bbec6f1b223094d0e1.1781146840.git.david.e.box@linux.intel.com>
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
index 35c6f0261567..2095df6a42b2 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -194,7 +194,7 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev,
 	/* Find and register and PMC telemetry entries */
 	ret =3D pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
 	if (ret)
-		return ret;
+		dev_warn(&pcidev->dev, "could not register PMT\n");
=20
 	probe_cache->valid_mask |=3D BIT(pmc_idx);
=20
@@ -287,7 +287,7 @@ static int pmc_ssram_telemetry_acpi_init(struct pci_dev=
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

