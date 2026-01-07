Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0A0158535;
	Wed,  7 Jan 2026 00:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767745332; cv=none; b=jup/6x5tXCagbKfrH/lv0ahzM2LxC3+IvKpTQJ8oi1LG/d2H2ovBn8KRt0Stl5tYG0ibN/ZTPwzg0Ktvgc8P4Ar7+y6qbFvGoLH4R0PBSG1LB0+wlQqZFp+CZU5kAQ+mj1ljIxNc0xfYjyPkVn6Qb8AdcJG5n4XaIDVKPyuy2iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767745332; c=relaxed/simple;
	bh=NvyNXaAF2B9RxogMt35VloMFXHt6Ae4vqEsrkXyRxfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CCmSfMIyEZ1uXC9pDmDcDgIuxbg4iBH/O4N5rmT6bgO5WQl+Qtn30gcoy42X6MvKTLCGd/GyyTt6Y7H675hpV30dc8oNHQtKoH8JAtAA2vvz2s4pfgjfMH2JNuW8kUuRI7/wmOIMXRxNH5cOduvOD0+DmCjb7pAnGNN1ndooO4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwWYZRT3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwWYZRT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767745331; x=1799281331;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NvyNXaAF2B9RxogMt35VloMFXHt6Ae4vqEsrkXyRxfM=;
  b=NwWYZRT3AC/zNNUzJWJ4K3vYg9iuDJ7d7Dw1uUPSdTe+SlECWIp6hdMz
   hU0FGvr3Rspkl9YHjA/Y9OQq+Z1r5qNVW1F5CmAT6YlbTt10V/DLZtwMJ
   niVkV6Tu5/Ypje599CHANpxhYVZz8d8ar2cNgtCj75ztz1+1DAoADZ0Fh
   qtqJZY/XLm/UTU9VJMSAdhwdEZDuKHGNKfvDWKmLZxXqMFS9vXaZSiR7s
   5anQcxudSivYH5QqbFmmiZ0KsDCIWCYOdHZNyfRQh938naPwZoXnZoukq
   108jYH75u98pp+iEPDU5GOr7MRTpeg17UgGClFK/RlrXo4dqcy+jOEBaX
   Q==;
X-CSE-ConnectionGUID: mTIisOScQMuZ95qHtdyXvw==
X-CSE-MsgGUID: 7b1Pjr5RQIik5D3thMw2Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69164116"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69164116"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 16:22:09 -0800
X-CSE-ConnectionGUID: 2t//YsLMQlGnPko4Z79khQ==
X-CSE-MsgGUID: 14nhtsiDQL2YPo5VlCkReQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206931516"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 16:22:08 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.comn
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/4] platform/x86/intel/vsec: Prep for ACPI PMT discovery
Date: Tue,  6 Jan 2026 16:21:47 -0800
Message-ID: <20260107002153.63830-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This series updates intel_vsec to decouple helper APIs from PCI, clean up
error handling, and plumb ACPI=E2=80=91based Intel Platform Monitoring Tech=
nology
(PMT) discovery through the vsec layer.  It is preparatory infrastructure
for the follow=E2=80=91on PMT core/telemetry and PMC/SSRAM series that add =
ACPI
discovery and new platforms.

Highlights

  -- Decouple add/link helpers from PCI so users need only a struct device.
  -- Switch exported helpers from struct pci_dev to struct device.
  -- Return real error codes from the registration path.
  -- Carry ACPI PMT discovery tables through vsec.


David E. Box (4):
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
 drivers/platform/x86/intel/pmt/class.h        |   4 +-
 drivers/platform/x86/intel/pmt/discovery.c    |   4 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  13 +-
 drivers/platform/x86/intel/pmt/telemetry.h    |  11 +-
 drivers/platform/x86/intel/sdsi.c             |   5 +-
 drivers/platform/x86/intel/vsec.c             | 115 +++++++++++-------
 drivers/platform/x86/intel/vsec_tpmi.c        |   8 +-
 include/linux/intel_vsec.h                    |  40 ++++--
 15 files changed, 136 insertions(+), 91 deletions(-)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
--=20
2.43.0

