Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC83239099;
	Wed, 25 Feb 2026 01:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771984225; cv=none; b=Vh6jbEsP7ZcMM3goaxvRD1BZbnwOhihBZTOvs3WCkh4hP67EwT0iOcD5zjrhx+WzIKmglJdi+O7pveii4F4rWp0ljg4GDAz3pGyVYDKJueKqpKEVzCDhWcy6ihlfthDSPEgx8Ry1THjDDUNGvj7NMAUxQoEwKwcVePox4Wpu+Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771984225; c=relaxed/simple;
	bh=ToM1AWpnOkAnrFR4PhXPIyPZqBXaSP+ujBoibchazBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JHkxWa5qM0jsmjZ18T8ZMhIRlI8FhVQ+ZRxKBoSTl4fcVz/aGK2NnvviY7oXmLSDK0UvX/tAK2kHpiVRZrFP2xDLK5Ern6j9INqaYE9YFI0iBn8Wp0SlnvohBq/uDS+9/YGf+gcX5CqxdLlO2MQoTWDvMLDicQ+wE0sZPDOE9vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiCgkjMq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiCgkjMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771984225; x=1803520225;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ToM1AWpnOkAnrFR4PhXPIyPZqBXaSP+ujBoibchazBk=;
  b=EiCgkjMqxpdjI8EV+4XSm4WAUiVOe1ThsvBFdTnmbTzec+U6rt7/BZgF
   doeBeSYaSb51bz7yVlpI0Y3kbDl9zH9a+TjA7B4jfDiM/Ny9fEY0FF4z5
   sbIWlKR+AwK+FvOj1N+ZILni729GZ89DhU214nK+D5r3GyvvvF3lwb/0+
   6cZP9gPo1VWsY99KeOqHd7WaCg+c4WChnSANHT5tsc+avExKHLmymTF+B
   agE2kOaFPhDuguOa++hEIR/ulk9I5L0RkvmJgdfrD2DxKpOVucRb+ypvO
   8TAIj7/uHMesDRv0WGd8nLdA1dHvFGd37ZOXz32gmJX41o3MGvUqEjpl3
   A==;
X-CSE-ConnectionGUID: LcHyyUnzRFO5BD1RMcIcYQ==
X-CSE-MsgGUID: /43t10NiRoO/5yzoKAmKsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76622898"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="76622898"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 17:50:21 -0800
X-CSE-ConnectionGUID: LkH3MAMCTYqyBVWbaT0u/g==
X-CSE-MsgGUID: qDsATcnZQ4OvGznHE1A2nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="216096171"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 17:50:20 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 0/6] platform/x86/intel/vsec: Prep for ACPI PMT discovery
Date: Tue, 24 Feb 2026 17:50:06 -0800
Message-ID: <20260224-upstream-pmt-acpi-v5-v5-0-8dd73bcf049c@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This series updates intel_vsec to improve const-correctness, decouple
helper APIs from PCI, enhance error handling, and plumb ACPI-based Intel
Platform Monitoring Technology (PMT) discovery through the vsec layer. It
is preparatory infrastructure for follow-on PMT core/telemetry and
PMC/SSRAM series that add ACPI discovery and support for new platforms.

The series is organized as follows:

Patches 1-2 refactor and improve const-correctness of base_addr handling.
Patch 1 makes base_addr an explicit parameter throughout the call chain,
clarifying ownership and removing conditional logic. Patch 2 then makes the
platform info data structure read-only, preventing unintended modifications
to shared driver data.

Patches 3-4 decouple the vsec layer from PCI-specific types, updating
helper APIs and data structures to use generic struct device instead of
struct pci_dev.  This enables vsec to work with both PCI and ACPI parent
devices.

Patch 5 enhances error visibility by returning meaningful error codes from
the registration path instead of collapsing to boolean success/failure.

Patch 6 adds infrastructure for ACPI-based PMT discovery, allowing client
drivers to consume discovery data from either PCI or ACPI sources.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>

David E. Box (6):
      platform/x86/intel/vsec: Refactor base_addr handling
      platform/x86/intel/vsec: Make driver_data info const
      platform/x86/intel/vsec: Decouple add/link helpers from PCI
      platform/x86/intel/vsec: Switch exported helpers from pci_dev to devi=
ce
      platform/x86/intel/vsec: Return real error codes from registration pa=
th
      platform/x86/intel/vsec: Plumb ACPI PMT discovery tables through vsec

 drivers/gpu/drm/xe/xe_debugfs.c                  |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                    |   2 +-
 drivers/gpu/drm/xe/xe_vsec.c                     |   7 +-
 drivers/gpu/drm/xe/xe_vsec.h                     |   4 +-
 drivers/platform/x86/intel/pmc/core.c            |   4 +-
 drivers/platform/x86/intel/pmc/ssram_telemetry.c |   2 +-
 drivers/platform/x86/intel/pmt/class.c           |   8 +-
 drivers/platform/x86/intel/pmt/class.h           |   5 +-
 drivers/platform/x86/intel/pmt/discovery.c       |   4 +-
 drivers/platform/x86/intel/pmt/telemetry.c       |  13 +--
 drivers/platform/x86/intel/pmt/telemetry.h       |  12 +--
 drivers/platform/x86/intel/sdsi.c                |   5 +-
 drivers/platform/x86/intel/vsec.c                | 121 ++++++++++++++-----=
----
 drivers/platform/x86/intel/vsec_tpmi.c           |  10 +-
 include/linux/intel_vsec.h                       |  39 ++++++--
 15 files changed, 144 insertions(+), 94 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
--=20
