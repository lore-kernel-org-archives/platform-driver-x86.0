Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC011EEA3C;
	Fri, 15 May 2026 00:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778804507; cv=none; b=TjUuA8r9GpYzzUxq8It7MS7sg6qS31E1ZMyYOT8KAUqrvw7tmm5u7okDS7YZ/0YzKprKZP49cS7XwVwLzuIJcFqzt76++21vjvJ2iHIaHsTCGs1DwgysqAuMmCES0+JF1KOYT+tjQ+Q67Rbxa5+YNZEvBULvR/bWtNoPPkAL8sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778804507; c=relaxed/simple;
	bh=Jw+T61capOtGEmsEY9XVE4sYWy3xHjedZvKt6UVdKt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RDQd7sQiy8DhetvnOJqFgRoyef5cDjQxsbNhxSvuUCje9VOgkaFkxAyQwYYfj91tST7nxiwQX3SU5NcT1Ro30Y0bQIqYgL2IyOoUPy0L8cdteilwbgFEHls4QauYici4WSnAfwwtK/D1qqgMKfrqdzGcWnPabsenoEUDxKajh5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1VDFmTE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1VDFmTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778804505; x=1810340505;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Jw+T61capOtGEmsEY9XVE4sYWy3xHjedZvKt6UVdKt0=;
  b=P1VDFmTEU9T5S0cDAPSC0kG25byssuYJXO676tGs7A6n80M7TuHzIDTl
   bzQBGmpaI2T0dpZtltjUkxnvKP0K/jwiEaO1Yr04K+kyyDgLwYlLAFP9D
   MWuV/BVTbiN/mN/yurrtLx/+qjwmEraJzjOnTX3MhvppzvubEC4ZMmf7W
   OjY8O6IPI92LdQBhGW/SYkdlVT+zbtIK5clIRqZqZFaOcjUmZ+W2bcSrC
   uIIC5kRGWX6kShrROBwIgCruvL4t9FKATLqRQ389u2MgyqirOZ7QUqFHg
   C4H9d7EGI8A69Dwb79Pqrw0CQ51LjdhOa95Do80hqv0Z2KeZKqPr/Qh6/
   w==;
X-CSE-ConnectionGUID: zJsOl80/RTyRwvwqnzJVaQ==
X-CSE-MsgGUID: ZnEdWFjZTZ+2+W3CjZvL6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78895146"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="78895146"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:44 -0700
X-CSE-ConnectionGUID: k7VJX/ZaRjWnzeBZj7QYWQ==
X-CSE-MsgGUID: G2CAo42dT1mEC1Q+tkhWTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242879058"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: y,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 00/16] Add ACPI-based PMT discovery support for Intel PMC
Date: Thu, 14 May 2026 17:21:07 -0700
Message-ID: <20260515002130.701457-1-david.e.box@linux.intel.com>
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
 .../platform/x86/intel/pmc/pwrm_telemetry.c   | 214 +++++++++++++++
 .../platform/x86/intel/pmc/ssram_telemetry.c  | 251 +++++++++++++-----
 drivers/platform/x86/intel/pmt/class.c        | 143 +++++++++-
 drivers/platform/x86/intel/pmt/class.h        |   7 +
 drivers/platform/x86/intel/pmt/crashlog.c     |  19 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  34 ++-
 include/linux/intel_vsec.h                    |   5 +-
 10 files changed, 628 insertions(+), 93 deletions(-)
 create mode 100644 drivers/platform/x86/intel/pmc/pwrm_telemetry.c


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
--=20
2.43.0

