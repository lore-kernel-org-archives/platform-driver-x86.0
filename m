Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59951349CC2;
	Thu, 11 Jun 2026 04:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152493; cv=none; b=gVljqclm0xNmbltPICg0VDwllK3P2b00CrO7NxDm8baKYGNZblmLIi59cxo5ohk8aEqlsNIjwcNJv8IssT2nCyS6BYw/+VpoMEXonnO+twoMBpwbmwYM8ZoP9vMPqvApRHu89occNJbbQEGddQJ3MI9DB0xf86lGsNCskuIzdsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152493; c=relaxed/simple;
	bh=A6thFlfAezoEq7LOv7GAbIplEk1wQJwAWRx/aUJcyVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iQ+j0LU5ol5cE6BhvGS3cJ4k+jrsaj4RcYHhbHL2JIUvjuTCJ8SXEubGrLN27GQzvMwWQUoA4s+Zt7Nh6R6u5Px2DvhZ0+D2yT/L0BvbAcOKfDVB2Pc7XRkKrO6i7aRja5IjB7sJ/++nRfIP8WkFDsN2XATk/l7dOEQzTwAsu+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4CKfxhv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4CKfxhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781152491; x=1812688491;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A6thFlfAezoEq7LOv7GAbIplEk1wQJwAWRx/aUJcyVM=;
  b=A4CKfxhv/paRi+glDnB5sht00UpV9pWe1RB9RVXTsDFFFipdVOCBCJN9
   loVYoK0SNl4Uk7lyHvSh3q+J9X/+cV45FKP0x5Dj8Hmbwd/TzU4K0q59J
   1XxGEL18VDWUMjjdJBpGmbsw6EeWQfnDh0yRoiXTFitpe1FX3AXaAyPz2
   KNewdQeFbqd8xsOgNMvjCOpw2tbCq11gsF3eILfxp32h9Y2hxcLqTTHfR
   qYqAhiyi3J5amLGm1HJIgnUs4y4kAj12DvutYVW9hJQa3wR7tFW3r/gG/
   J+q3we4HQypS0Xm4F22rraOlpgPmQQb/+LSiliNtkvEPEN54VnOLVBvpb
   Q==;
X-CSE-ConnectionGUID: uN7V03PlQpWwkySD98WI6Q==
X-CSE-MsgGUID: +Rat8pJ7Qp6hO7GlELlAqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84530980"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="84530980"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:51 -0700
X-CSE-ConnectionGUID: NESxTiJLRXSeLQARRWVZMw==
X-CSE-MsgGUID: YhZhxtCLQjCrnpslMqYN2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251468339"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:50 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v7 00/15] Add ACPI-based PMT discovery support for Intel PMC
Date: Wed, 10 Jun 2026 21:34:28 -0700
Message-ID: <cover.1781146840.git.david.e.box@linux.intel.com>
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

Patches for step 1 were previously accepted. V4 onward includes the
remaining integration patches.

Testing:
Tested on Nova Lake S system and confirmed enumeration from both PCI and
ACPI enumerated PCD and PCH telemetry endpoints. Existing telemetry from
NVL CPU and an add-on Battlemage card also continued to work.

---
V7 changes:
- Addressed Ilpo J=C3=A4rvinen's review feedback:
  - Patch 05/15: switched min_t(size_t, ...) to min() for size_t operands.
  - Patch 06/15: aligned local assignment style and kept min() usage in
    header copy sizing.
  - Patch 08/15: fixed ACPI DISC_TBL offset parsing to preserve masked
    (unshifted) encoding consistent with DVSEC handling.
  - Patch 10/15: simplified pmc_ssram_telemetry_pci_init() tail return to
    return 0.
  - Patch 12/15: made PMC_SSRAM_UNPROBED explicitly =3D 0 and replaced
    barrier pairing with smp_store_release()/smp_load_acquire().
- No patch reordering, squashing, or drops from v6.

V6 changes:
- Squashed Xi Pardee's two patches (v5 patches 10 and 13) into a single
  patch (v6 patch 12). The two patches logically belonged together as
  they both addressed per-index probe state tracking and reentrant probe
  protection.
- Reordered v5 patch 12 ("Add PCI platform data") to v6 patch 10 to
  maintain better logical flow before the squashed probe state patch.
- Address other style and cleanup comments.

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
  - Added PMT_DISC_HEADER_DWORDS in PMT class, derived from the shared
    definition.
  - Replaced literal header copy sizes in PMT header fetch with size bound
    to entry->disc_header.
- Updated PMC ACPI discovery typing to use shared acpi_disc_t consistently:
  - acpi_disc_t now references INTEL_VSEC_ACPI_DISC_DWORDS.
  - pmc_parse_telem_dsd() uses acpi_disc_t return type and
    declaration-site allocation with __free(kfree).
  - Included intel_vsec header in PMC core declarations to align type
    ownership.
- In SSRAM ACPI scaffolding, switched temporary discovery pointer from raw
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
  platform/x86/intel/pmc/ssram: Add PCI platform data
  platform/x86/intel/pmc/ssram: Refactor DEVID/PWRMBASE extraction into
    helper
  platform/x86/intel/pmc/ssram: Add ACPI discovery scaffolding
  platform/x86/intel/pmc/ssram: Make PMT registration optional
  platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery

Xi Pardee (1):
  platform/x86/intel/pmc/ssram: Switch to static array with per-index
    probe state
 drivers/platform/x86/intel/pmc/Kconfig        |  25 ++
 drivers/platform/x86/intel/pmc/Makefile       |   2 +
 drivers/platform/x86/intel/pmc/core.h         |  16 +
 .../platform/x86/intel/pmc/pwrm_telemetry.c   | 216 ++++++++++
 .../platform/x86/intel/pmc/ssram_telemetry.c  | 380 +++++++++++++++---
 drivers/platform/x86/intel/pmt/class.c        | 156 ++++++-
 drivers/platform/x86/intel/pmt/class.h        |   6 +
 drivers/platform/x86/intel/pmt/crashlog.c     |  19 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  34 +-
 include/linux/intel_vsec.h                    |   5 +-
 10 files changed, 770 insertions(+), 89 deletions(-)
 create mode 100644 drivers/platform/x86/intel/pmc/pwrm_telemetry.c

base-commit: 2565a28cdcdcb035e151d285efcba26bccb3726e
--=20
2.43.0

