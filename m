Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE58225B09F;
	Fri, 22 May 2026 02:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416520; cv=none; b=JftTKsVx6MlphF3+NMDSj0zTMlNTtd83ZjQa8RJ79sBloLGpH9a75cVf8xW0/VtfI+Xs2rsLw+ECyOqyeu+6gKgypF6Uhv1VzV59hsxjZyrYKGanZNrrmlVT8kKOspP9G5UQ64uGZ2+o1luDLO3rrs9eBMFgsEz7NoCf3efXAP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416520; c=relaxed/simple;
	bh=/kBjUfR9qjj2URGZSmHS31TAcE9B1aWJVLHfqr6Bq8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s5mFG/Zo9UOkUJZbVJz96BP/+G06AB5O1pXfweofUfKzkXK966KUmlNJOG17Qsr88TNBHvkt4OQoJziL6MX0JNuqPmMyEkTdc7U2iV61uO9bWJXA3LSYubheOWMIhGJkm02bml5EgoISVUd2zMxTlYffoGQgvn8xq2Exjofsf9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3cSoaTR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3cSoaTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779416518; x=1810952518;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/kBjUfR9qjj2URGZSmHS31TAcE9B1aWJVLHfqr6Bq8A=;
  b=i3cSoaTRDYzM47Gc6AjQckoFuMab049Zmc7f5P/dMlgeAwlMamXagmtf
   1pGgtOewkd4Tv+6ofbbv6xKpOcAVoqvh7Ov+AEHLBy3nFPW+43Cx9fSgM
   GxbWrey2+M6Z85qPcQT1fOBXyK1qmStYomjX730kTrolZRyNps6qqyXM2
   A5S1P0etCj8sIzqxMR+dFxcebXtbRmUurl9gqnpiePdwZYZKj5OXYma7D
   ACUh6Dt42XIsGVpipnRs3L8Z246pGNZ0g0rEGslxhFgvszp0STvu396pQ
   TQliE8AmE6oqV2JCcNaQL4mZY7MR0UcGLxfyWPhW0mlziGZgx5qVaaU4l
   g==;
X-CSE-ConnectionGUID: OYGatoFlT3+UObYz8s9rsA==
X-CSE-MsgGUID: 4KB5oVuiROy0WWJKHojAZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80400512"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80400512"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:21:58 -0700
X-CSE-ConnectionGUID: 7Deac9/fTjeIVME4gH3JeQ==
X-CSE-MsgGUID: skSwVGLUSWWzcuu9Ztf2XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236335362"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:21:57 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v5 00/16] Add ACPI-based PMT discovery support for Intel PMC
Date: Thu, 21 May 2026 19:21:30 -0700
Message-ID: <20260522022147.4137494-1-david.e.box@linux.intel.com>
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

Patches for step 1 were previously accepted. V4 includes the remaining
integration patches.

V5 changes:
- Addressed Ilpo J=C3=A4rvinen's review feedback on patches 08 and 14:
  - Added #include <linux/limits.h> for U16_MAX in pwrm_telemetry.c.
  - Split acpi_handle declaration from ACPI_HANDLE() assignment in both
    pmc_pwrm_acpi_probe() and pmc_ssram_telemetry_acpi_init(). The
    assignment now sits immediately above its !handle check.
  - Reordered local variables in those two functions in reverse-xmas-tree
    order.
- Patch 14: fixed a __free(pmc_acpi_free) ordering bug that caused
  buf.pointer to leak. The cleanup variable is now declared after
  acpi_evaluate_object() populates buf.pointer, and the GUID search
  operates on the cleanup variable so its current value tracks the
  actual allocation.
- Patches 05 and 06: bounded the new discovery-header memcpy_fromio()
  to resource_size() of the mapped DVSEC entry. The cache introduced in
  patch 05 (and the unified PCI header fetch in patch 06) would otherwise
  read 16 bytes from namespaces whose DVSEC entry_size is only 3 dwords
  (telemetry).
- Patch 06: documented in the ACPI branch that entry->disc_table =3D NULL
  is intentional, so consumers that dereference disc_table must only be
  wired to INTEL_VSEC_DISC_PCI namespaces.
- Remaining patches unchanged from v4.

V4 changes:
- Bound PMT discovery-header sizing to shared canonical definitions:
  - Added INTEL_VSEC_ACPI_DISC_DWORDS in intel_vsec API.
  - Added PMT_DISC_HEADER_DWORDS in PMT class, derived from the shared=20
    definition.
  - Replaced literal header copy sizes in PMT header fetch with size bound=
=20
    to entry->disc_header.
- Updated PMC ACPI discovery typing to use shared acpi_disc_t consistently:
  - acpi_disc_t now references INTEL_VSEC_ACPI_DISC_DWORDS.
  - pmc_parse_telem_dsd() uses acpi_disc_t return type and=20
    declaration-site allocation with __free(kfree).
  - Included intel_vsec header in PMC core declarations to align type=20
    ownership.
- In SSRAM ACPI scaffolding, switched temporary discovery pointer from raw=
=20
  u32 (*)[4] to acpi_disc_t for consistency with exported PMC helper types.
- Remaining patches unchanged from v3.

V3 changes:
- Dropped "platform/x86/intel/pmt: Move header decode into common helper"
- The dropped patch caused a crashlog regression because disc_res was
  accessed before assignment
- Updated the surrounding PMT patches to keep the needed ACPI header-fetch
  work without the dropped helper
- Added "platform/x86/intel/pmt: Cache the telemetry discovery header"
  to carry the post-v3 bug fix cleanly
- Dropped the standalone cleanup-pattern patch to keep the simpler
  ssram pointer flow requested in review

David E. Box (14):
  platform/x86/intel/pmt: Add pre/post decode hooks around header
    parsing
  platform/x86/intel/pmt/crashlog: Split init into pre-decode
  platform/x86/intel/pmt/telemetry: Move overlap check to post-decode
    hook
  platform/x86/intel/pmt: Pass discovery index instead of resource
  platform/x86/intel/pmt: Cache the telemetry discovery header
  platform/x86/intel/pmt: Unify header fetch and add ACPI source
  platform/x86/intel/pmc: Add PMC SSRAM Kconfig description
  platform/x86/intel/pmc: Add ACPI PWRM telemetry driver for Nova Lake S
  platform/x86/intel/pmc/ssram: Rename probe and PCI ID table for
    consistency
  platform/x86/intel/pmc/ssram: Refactor DEVID/PWRMBASE extraction into
    helper
  platform/x86/intel/pmc/ssram: Add PCI platform data
  platform/x86/intel/pmc/ssram: Add ACPI discovery scaffolding
  platform/x86/intel/pmc/ssram: Make PMT registration optional
  platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery

Xi Pardee (2):
  platform/x86/intel/pmc/ssram: Use fixed-size static pmc array
  platform/x86/intel/pmc/ssram: Refactor memory barrier for reentrant
    probe

 drivers/platform/x86/intel/pmc/Kconfig        |  25 ++
 drivers/platform/x86/intel/pmc/Makefile       |   2 +
 drivers/platform/x86/intel/pmc/core.h         |  21 ++
 .../platform/x86/intel/pmc/pwrm_telemetry.c   | 216 +++++++++++++++
 .../platform/x86/intel/pmc/ssram_telemetry.c  | 253 +++++++++++++-----
 drivers/platform/x86/intel/pmt/class.c        | 160 ++++++++++-
 drivers/platform/x86/intel/pmt/class.h        |   7 +
 drivers/platform/x86/intel/pmt/crashlog.c     |  19 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  34 ++-
 include/linux/intel_vsec.h                    |   5 +-
 10 files changed, 649 insertions(+), 93 deletions(-)
 create mode 100644 drivers/platform/x86/intel/pmc/pwrm_telemetry.c


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
--=20
2.43.0

