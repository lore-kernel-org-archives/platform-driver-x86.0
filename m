Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2899424DCF9;
	Fri, 27 Feb 2026 02:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772159238; cv=none; b=Vm15FuFG+1xBPm/XBcQFYoyJ7YNl1XjYuXa3dlaCk/DdGlDo8HuV3Rlw6CgvVURSzbRhSHJtrGSNdDjgo/lPkyTQhUhn/9ycUvRSqGu9SapY7YpQYmMSWa/qx4qrfujkpSlgdDicJJiHDwOIsO7SQyCA17CBwNbW0WCdCwNP84w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772159238; c=relaxed/simple;
	bh=Ksgdc+NUmkZkuiUvB6+41BW7LFIPmkTAFcSJACtuSdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LSKZA6u7T9qsZCtYCnYZCogYHNWzpK9dab/RTjiPOiM/iy07JR9tc6GxSY1e6lWG9wNzWXN8Py2a0g/K9P9CYAbyPAdCThRJytp+tbh3zNa3mBw1ucE2cRP2+KbVbj6AIrSbNENKswaNKKm4u4tJesSYUl0BW6PHzEo94Om7Zjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4IR8iFH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4IR8iFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772159238; x=1803695238;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ksgdc+NUmkZkuiUvB6+41BW7LFIPmkTAFcSJACtuSdg=;
  b=c4IR8iFH3DMh5ovrg1ReoPQZvwL8m8Wr0lN26inuO7IWGLp6GK5WGqiX
   Fc6i6PoJe3qmYocvmFD43fOmNpSolJxxTKvhtqQhluYldGaZB8Wjm7bw3
   X++dKGgtOd+RzVAM31KnFJh3BCa2kuzBJ9L7Jxz6wq7RRx1+Ao4SYwcjU
   Y3lI1PNWAZ6getbZ3X7ahfE5nXydO19rlvokzKTixD1JxXzlY9HNBFvMR
   gCgnjifuPNfkXZjufjd3UjPBnXu1yKFh9ULtzQxLeGlblqiwcKrjfDrYk
   Zt3Tsk38P/P27RvBtrByZZhnOAcWryT9xr6v/wa5VOuqGpxhF/u2A1ZgP
   A==;
X-CSE-ConnectionGUID: qOxUNd4tQqGUtBhSqdv+Kg==
X-CSE-MsgGUID: pr0yblniQt6uVI7F6kGKIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73283304"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73283304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 18:27:17 -0800
X-CSE-ConnectionGUID: aPYbL5+ZREGrxP6D6rH1jw==
X-CSE-MsgGUID: c278hO2cTJCjVMPFRX0mOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="214662249"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 18:27:16 -0800
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
Subject: [PATCH v6 0/6] platform/x86/intel/vsec: Prep for ACPI PMT discovery
Date: Thu, 26 Feb 2026 18:27:04 -0800
Message-ID: <20260227022711.3513663-1-david.e.box@linux.intel.com>
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

Signed-off-by: David E. Box <david.e.box@linux.intel.com>

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
 drivers/gpu/drm/xe/xe_vsec.h                  |   4 +-
 drivers/platform/x86/intel/pmc/core.c         |   4 +-
 .../platform/x86/intel/pmc/ssram_telemetry.c  |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |   8 +-
 drivers/platform/x86/intel/pmt/class.h        |   5 +-
 drivers/platform/x86/intel/pmt/discovery.c    |   4 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  13 +-
 drivers/platform/x86/intel/pmt/telemetry.h    |  12 +-
 drivers/platform/x86/intel/sdsi.c             |   5 +-
 drivers/platform/x86/intel/vsec.c             | 121 +++++++++++-------
 drivers/platform/x86/intel/vsec_tpmi.c        |  10 +-
 include/linux/intel_vsec.h                    |  39 ++++--
 15 files changed, 144 insertions(+), 94 deletions(-)

--=20
2.43.0

