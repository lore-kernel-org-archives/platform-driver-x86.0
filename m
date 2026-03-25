Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051D433E7;
	Wed, 25 Mar 2026 01:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403307; cv=none; b=SavpRmYYucLdDOWn1yL8XZa9N0C7dt72XqAusZQ09Exe3iXSB0xm04QBo/59lHeoAtUxo/V1/yXVl57adcJT/JytKHlgKS0IRxqgrNGQKyps97haUocT2KYtjONJJBTU4DdzLJnoq5QxSxBAUlEkvYubS96rXDqWTa4331egF7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403307; c=relaxed/simple;
	bh=AClVN+mTaQ5qLKpdLKlMX6yQlZYs5cEcV59ScoOGZkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XHp+hkBr1agGWR6S+/v2A2r1ZIJrgRZkBFEhmFm2UPv9mxbE1rpRHxqLwJZJ2Zgz0ZY2GfJl6EJsHptjyOWY1r5qIGEPrFosS5UYxJ9MdWKw1yTNPytJf+kAvGPu/TCDnoNyRPgQmn9BuM88bgmmDOcPkozCmXlGp+1CcWn8lYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SR3GwfBi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SR3GwfBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774403306; x=1805939306;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AClVN+mTaQ5qLKpdLKlMX6yQlZYs5cEcV59ScoOGZkk=;
  b=SR3GwfBidDZceOpPIgc0Ad+842lmYCPM3bZOTJKDkUMccwuyzmi3FBA7
   2C97taGumzUnDCjjow3sZ/gFkIZz91R2qwmydqelE6Xgrby9Mq8GBwwsx
   tgIV64zlqGlK0BSoHp6pq3Uy4yWTboumTsu2OHsym5b4HCYoMxdwVUBHZ
   QkaSQ6yiEmOcvjls0WhW63e3Q8VM11F/aVYcPDEOqKKRgMeH21F1tfymu
   uOFU9rtblQ7AwGqCxZEMTDO0yD2i0AWf5mKyvCq2ZURa2RN2QbnXADMcx
   Xrww/R/z6YmOGgRdvip4VdJ8LHVQTqu9UvMSzcp7NVfBoY7SMf9fwny+w
   w==;
X-CSE-ConnectionGUID: 3w5m2ELpSF2CJ1vgeEFbtQ==
X-CSE-MsgGUID: lHBQ2ZQqTSGKCq6aTXm5yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75317482"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75317482"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:25 -0700
X-CSE-ConnectionGUID: NZ3U2xkGTTuZHvTpoM+w6A==
X-CSE-MsgGUID: MVVMK+nvRrekZsh4TxIcHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221190775"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:25 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2 00/17] Add ACPI-based PMT discovery support for Intel PMC
Date: Tue, 24 Mar 2026 18:48:02 -0700
Message-ID: <20260325014819.1283566-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This series adds ACPI-based PMT discovery support and wires it into the
Intel PMC telemetry stack for Nova Lake S.

Today, PMT discovery flow is primarily PCI-oriented. Some platforms expose
PMT discovery via ACPI _DSD, and PMC telemetry needs to consume that path
for both standalone and companion-device cases. This series addresses that
in three logical steps:

    1. Prepare intel_vsec for ACPI-backed discovery
    2. Refactor PMT class handling so discovery source is
       abstracted (PCI or ACPI)
    3. Add/enable PMC consumers using ACPI discovery, including NVL
       SSRAM support

Patches for step 1 were previously accepted. V2 includes the remaining
integration patches plus a new patch addressing review feedback on
cleanup.h patterns in ssram_telemetry.c.

Series layout

    01-06: intel_vsec cleanup/generalization for ACPI-capable discovery
           plumbing. Previously posted and accepted.

    07-12: PMT class refactor and ACPI discovery-source support
           Major patches:
           Patch 12 - adds ACPI support in PMT driver

    13-17: PMC driver integration
           Major patches:
           Patch 15 - adds ACPI discovery support in ssram driver
           Patch 17 - adds NVL IDs for SSRAM discovery

           Notable changes in V2:
           Patch 14 - new commit fixing __free() cleanup patterns per Ilpo'=
s review

David E. Box (15):
  platform/x86/intel/pmt: Add pre/post decode hooks around header
    parsing
  platform/x86/intel/pmt/crashlog: Split init into pre-decode
  platform/x86/intel/pmt/telemetry: Move overlap check to post-decode
    hook
  platform/x86/intel/pmt: Move header decode into common helper
  platform/x86/intel/pmt: Pass discovery index instead of resource
  platform/x86/intel/pmt: Unify header fetch and add ACPI source
  platform/x86/intel/pmc: Add PMC SSRAM Kconfig description
  platform/x86/intel/pmc: Add ACPI PWRM telemetry driver for Nova Lake S
  platform/x86/intel/pmc/ssram: Rename probe and PCI ID table for
    consistency
  platform/x86/intel/pmc/ssram: Refactor DEVID/PWRMBASE extraction into
    helper
  platform/x86/intel/pmc/ssram: Add PCI platform data
  platform/x86/intel/pmc/ssram_telemetry: Fix cleanup pattern for
    __free() variables
  platform/x86/intel/pmc/ssram: Add ACPI discovery scaffolding
  platform/x86/intel/pmc/ssram: Make PMT registration optional
  platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery

Xi Pardee (2):
  platform/x86/intel/pmc/ssram: Use fixed-size static pmc array
  platform/x86/intel/pmc/ssram: Refactor memory barrier for reentrant
    probe

 drivers/platform/x86/intel/pmc/Kconfig        |  25 ++
 drivers/platform/x86/intel/pmc/Makefile       |   2 +
 drivers/platform/x86/intel/pmc/core.h         |  20 ++
 .../platform/x86/intel/pmc/pwrm_telemetry.c   | 214 ++++++++++++++
 .../platform/x86/intel/pmc/ssram_telemetry.c  | 267 +++++++++++++-----
 drivers/platform/x86/intel/pmt/class.c        | 160 ++++++++++-
 drivers/platform/x86/intel/pmt/class.h        |  20 +-
 drivers/platform/x86/intel/pmt/crashlog.c     |  22 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  32 +--
 9 files changed, 636 insertions(+), 126 deletions(-)
 create mode 100644 drivers/platform/x86/intel/pmc/pwrm_telemetry.c


base-commit: a5877e921389178f994a5ec15a145d7e7ba3ec65
--
2.43.0

