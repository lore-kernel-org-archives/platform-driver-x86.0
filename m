Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7407813959D;
	Fri, 12 Jun 2026 21:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298134; cv=none; b=fw0xy/j8wmLjHYjv1TxF2zcBV4CY1Y8SY2bA3zSKFCl9XkgbMApjHgIKy9hO2RfmYKfisswAxTXDKPFBvp1ZYLmQtS0q0W/sBpYjmFjOFuaNio4gcUcGOZ+W/Eu3vIhQHXqkcQvYNgyvjm/eQzBCwE4Zmv3vxfrg4IaYYeGMtpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298134; c=relaxed/simple;
	bh=xb5HO+O8jpBGBDCEluD6Cb+SW+x9nI6I3XMiqoGoAUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UNECOfdefQGK2b83M1/MhEhrzvI36sQxoOZlKpPMjNOscJbSPq8ELFyhXwVs5ZMZbwa+Vua3LClBiTlsH3n8plLQ26H5azbP6HAf8RewpfUSSCZv4veto451YWwL+CFfDm/1h/WPOvnnSHlTp1YxIyUy+alSGbsRPrqLrfEa8II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KA4JsK77; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KA4JsK77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781298133; x=1812834133;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xb5HO+O8jpBGBDCEluD6Cb+SW+x9nI6I3XMiqoGoAUU=;
  b=KA4JsK77XkFx4tjXrefu4n9GaZc4st7JweCSw30mqHhBrCfXVlu8QExk
   ajPnkJp4xuTmsH3dGXXPkSy3RWn2Kc6PQxIDw9P/XoaEvI/1AvDT291Xl
   qpMjCBvvukYdBAWpm2a87GUE+QqvUQ/kcnrJghfmPAeJ255nGJc9P7aoG
   L7UkrOBECwIzq93A8boJ9yus9RKly3pETTV7ilxsPOqzuyD50SWORMCHN
   hK/ecMeGxfud1XiaGLAThIyU1KNa7v8dyGbx6GoT7gkr2bEHLcWuaUacF
   qTwa8E2hPVpuqwchO0S1nfyBLQyxD7kVOaNQUT10Msr3f3yb5LG+BuqVu
   g==;
X-CSE-ConnectionGUID: 5TdqR2JcToKAkNFQ/56vGQ==
X-CSE-MsgGUID: 8SRasPhIRgWCX2Qe7qDYMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86037965"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="86037965"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:12 -0700
X-CSE-ConnectionGUID: wL2d3adxRsqvlnRzwJ4sAQ==
X-CSE-MsgGUID: +AaDvEgDQwGk6A1LOE5hhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="250832857"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:11 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v8 00/15] Add ACPI-based PMT discovery support for Intel PMC
Date: Fri, 12 Jun 2026 14:01:41 -0700
Message-ID: <cover.1781294741.git.david.e.box@linux.intel.com>
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
V8 changes:
- Addressed Ilpo Jarvinen's review feedback for patch 12/15:
  - Added descriptive comments for per-index state tracking fields and
    publish logic in ssram_telemetry.c.
  - Added kernel-doc state-flow description for
    pmc_ssram_telemetry_get_pmc_info().
- Updated patch 12/15 attribution note to reflect substantial rerolling in
  later revisions while preserving acknowledgement of original v1 work.

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
 .../platform/x86/intel/pmc/ssram_telemetry.c  | 396 +++++++++++++++---
 drivers/platform/x86/intel/pmt/class.c        | 156 ++++++-
 drivers/platform/x86/intel/pmt/class.h        |   6 +
 drivers/platform/x86/intel/pmt/crashlog.c     |  19 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  34 +-
 include/linux/intel_vsec.h                    |   5 +-
 10 files changed, 786 insertions(+), 89 deletions(-)
 create mode 100644 drivers/platform/x86/intel/pmc/pwrm_telemetry.c


base-commit: 2565a28cdcdcb035e151d285efcba26bccb3726e
--=20
2.43.0

