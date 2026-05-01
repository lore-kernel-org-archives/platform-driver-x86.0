Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B002326FDBF;
	Fri,  1 May 2026 23:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677062; cv=none; b=YO4qKHnU+VJ0lEZPWuXn/p/AQvootkxTHzO1HJ68N6JXdLXFlNrJMfwmHqobPWyKKc9F5y0FdeF1+CXxatpWqcbqbxCJ7I7r3WMQ21bjjnOovnXOPMioYTP1obD8P9pf8l3aXdRVtHjHBpIXBle4ZEbDS5uY3R5Kg+mrEZKAwcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677062; c=relaxed/simple;
	bh=px8m4H//Uvi9geAEywIz+bzxexy+o2ajZ296yDAjzUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cXDKIvYaq9ACbXfj8fCUjCvJnudg0ahKR/Jcs7xIgHgnDr11jyHlLmokEMdRTW1RqXg3O1YJOMBZ0hbAQAHRrrGByN9JoYcEe6DGmm77+Rg4SAQdLtE/YZ8rLVUs6UlQ1UT2vB9da8bPwhX6P2+AlmgnL27CXjAjTrO5BeRxTn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2+kse96; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2+kse96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677060; x=1809213060;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=px8m4H//Uvi9geAEywIz+bzxexy+o2ajZ296yDAjzUA=;
  b=N2+kse96Yepg69a5NAWfxfIs4euseyslO5A+GLEi67MFl/BE+lAH8Wpz
   4deWtUY2KI/VKyziQEvAZ4YHlqQEsgqz5J+5z0caoL7Cz3HIaCIIsXBHc
   GkxpxLNbf/GKxCumthBEHTMPhgFbXHJhGLloUPzz+xof0chu188E9dGiQ
   NObBSzako4x/CVm8jCo+MWhfSQ5cEjxAC8yvZv0RPXTdqATT5w+g/NOSl
   8dbZpNGBhXn5y4blgnJKrpQgAw14qMkNo3qlT28WGQBpCB6/appSxiNOu
   11wNJTgagHR31JK8zpWYnvGEQpcgaoA6F/qfsg1PujHJxAzs1hauT4Mpk
   A==;
X-CSE-ConnectionGUID: Zq6m3dDnRn2KRXY6lHQtTw==
X-CSE-MsgGUID: 5RwfZrNvTgOUhyFO4a7DTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740111"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740111"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:10:59 -0700
X-CSE-ConnectionGUID: caPfLIxZQZe0CxOExGMzYg==
X-CSE-MsgGUID: QlGRTyNCQl+2j/cqAoFe/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948951"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:00 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 00/16] Add ACPI-based PMT discovery support for Intel PMC
Date: Fri,  1 May 2026 16:10:37 -0700
Message-ID: <20260501231054.3890305-1-david.e.box@linux.intel.com>
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

Patches for step 1 were previously accepted. V3 includes the remaining
integration patches.

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

V2 changes:
- Added the remaining integration patches

Series layout

    01-06: PMT class refactor and ACPI discovery-source support
           Major patches:
           Patch 06 - adds ACPI support in PMT driver

    07-16: PMC driver integration
           Major patches:
           Patch 08 - adds ACPI PWRM telemetry driver for Nova Lake S
           Patch 14 - adds ACPI discovery support in ssram driver
           Patch 16 - adds NVL IDs for SSRAM discovery

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
 drivers/platform/x86/intel/pmc/core.h         |  20 ++
 .../platform/x86/intel/pmc/pwrm_telemetry.c   | 214 +++++++++++++++
 .../platform/x86/intel/pmc/ssram_telemetry.c  | 251 +++++++++++++-----
 drivers/platform/x86/intel/pmt/class.c        | 141 +++++++++-
 drivers/platform/x86/intel/pmt/class.h        |   6 +
 drivers/platform/x86/intel/pmt/crashlog.c     |  19 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  34 ++-
 9 files changed, 621 insertions(+), 91 deletions(-)
 create mode 100644 drivers/platform/x86/intel/pmc/pwrm_telemetry.c


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
--=20
2.43.0

