Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D9135CB8D;
	Thu, 22 Jan 2026 01:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046606; cv=none; b=ZrbtQ24b+M/U+OSDk4Lm+Gq/rBE7/SwrOyWgWCnPp7/HHcE4A/y0aYEFAU25Ey9ENz9w59Am4c7IvSOIdwR3OuhIjcikqHHxDvHwp25HOGBtYzg4QiSxjD0SuK8oj23o+9c+CNg48E4NJ0fiXHd+SQDNAZl0xi6YJZosESlrVtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046606; c=relaxed/simple;
	bh=LW3yUApuoWtfWVu47vyMLiTiq/x590rOGlRdxQt+wmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cALmJhbJJgLkZSf261pdTEbapsY0MxuXhEd0ixGLcagkLBIUqiwWOC6ulPCohOkPhf9YXpdEbiJleMsRUDSlvXD2rvIVQzLfZKUfZxLBBy/02pbojwLxHJ2STJrGCSbRigl1r4zVIjVr2Z+zy+vonsCBrhcFt6j3wetwsfSHO/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCke4sQ5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCke4sQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769046604; x=1800582604;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LW3yUApuoWtfWVu47vyMLiTiq/x590rOGlRdxQt+wmo=;
  b=GCke4sQ57ZkOl22ctqFkcE2e6tZUr0EcYIdLPV3N/CbdeAAPBgrCFu8o
   qvqOnNDX9SkqSJSRkX12b1umYvJvgaotsaJTk2dNGzDHgxKLdbB0CuxS3
   ydFH8nLN1GkNAL7LhRaBAeeYn4kD6XbsflR6CkO6wYXfZsAy8UmNTYTwi
   lXWE49lkPcoIt0vUpBptRjITD8pU/AsBfww/nO3bCgpVlnpGnPs3uG9M3
   fSNYltgFeL2G+vssto+FeimpDfo4KWdVZXMuEa7LOsvFaGxFZ513bxcTm
   OZlyTMH7dZk0pvecaKDav/K0IFXsimzLl4L9xnRfabEESE7Ef2UlAiUIv
   g==;
X-CSE-ConnectionGUID: RNno9rhnRUua+UpzSzzSPA==
X-CSE-MsgGUID: /3aVHbhcSQicSedCR4V64Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="73910924"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="73910924"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:49:56 -0800
X-CSE-ConnectionGUID: OWEAG8HHSz6hDHsN/3WG8A==
X-CSE-MsgGUID: LMcSqRa4TFmUgY+jTpn1qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="211616417"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:49:56 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/6] platform/x86/intel/vsec: Prep for ACPI PMT discovery
Date: Wed, 21 Jan 2026 17:49:41 -0800
Message-ID: <20260122014948.3158069-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

David E. Box (6):
  platform/x86/intel/vsec: Refactor base_addr handling
  platform/x86/intel/vsec: Make driver_data info const
  platform/x86/intel/vsec: Decouple add/link helpers from PCI
  platform/x86/intel/vsec: Switch exported helpers from pci_dev to
    device
  platform/x86/intel/vsec: Return real error codes from registration
    path
  platform/x86/intel/vsec: Plumb ACPI PMT discovery tables through vsec

 drivers/gpu/drm/xe/xe_debugfs.c               |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                 |   2 +-
 drivers/gpu/drm/xe/xe_vsec.c                  |   7 +-
 drivers/gpu/drm/xe/xe_vsec.h                  |   2 +-
 drivers/platform/x86/intel/pmc/core.c         |   4 +-
 .../platform/x86/intel/pmc/ssram_telemetry.c  |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |   8 +-
 drivers/platform/x86/intel/pmt/class.h        |   5 +-
 drivers/platform/x86/intel/pmt/discovery.c    |   4 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  13 +-
 drivers/platform/x86/intel/pmt/telemetry.h    |  12 +-
 drivers/platform/x86/intel/sdsi.c             |   5 +-
 drivers/platform/x86/intel/vsec.c             | 114 +++++++++++-------
 drivers/platform/x86/intel/vsec_tpmi.c        |  10 +-
 include/linux/intel_vsec.h                    |  39 ++++--
 15 files changed, 136 insertions(+), 93 deletions(-)


base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
--=20
2.43.0

