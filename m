Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071CB55894
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 21:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721164096; cv=none; b=HLfS4sea7aUAO2fSB8oErPYvR9bICS1Z9Ip0kmaf4+ImN/bjmIaZuJHaNjdFp4e5Ico38l5psfF+DEZgVh8Vtet6UVXxezjNa81EqDsFuJP/kAAHxBl6LLkSRytfIM4HmJ/0fuAOwHoH4xrXLcP5ZMlyWrG5ZYYZuGCrYykqO1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721164096; c=relaxed/simple;
	bh=5KornmEAf5kl0PDvjCkHFEC9MX4Ry9jlDgg7sDF9D94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FCStN5T2bLC9AVJdckPxZyID7tvmGoXndoKrQ9qIN5lB2V3VDDKWbltp9ebpFozti+rDAkFhQWH/4eejXPZWm9jl2KahJ7OVYgObro/l4uEtSqYsZ6ys8kHEHrAdgJizIEAdy5klVZGAoY7fhVVLodL3wRmEzG8jtxUMC9LB1w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmydJvXi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmydJvXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721164093; x=1752700093;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5KornmEAf5kl0PDvjCkHFEC9MX4Ry9jlDgg7sDF9D94=;
  b=XmydJvXiDVEO0rNHXU25pI2ZmOevPAL3GhNXDDAnwby4fie02cCa6MTC
   K5KKR8zF2r9Lw7jHmMUB40mPpVesdqlrE5etaMVqfZ4P6oIkbOwV69/wU
   dP04Xz+Q0b2sldxjRfBjv45ssTKmX61Euv54Cm3aYc3dsTDM+85QOp8Qs
   rvtHke8n0HJwLv6X8FhNaE4kWaqPXC6VphiMmFVcc5s+aujZpvzEL1DId
   vLcKYH0LT0jyZ2aNnSw6iLUKDJMwCxvteu0P9kIAhWnb0d1sWZPW1tEOE
   ZKtmuZpUOda5VWYSWg81CdqtylL3rGj+ruBNtCGwM4WdnP9hkhkgZUecn
   A==;
X-CSE-ConnectionGUID: v+Qx9oCaTUKFPj1IHR86QQ==
X-CSE-MsgGUID: tFyo/VLxSmWwoipMifzvbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18772984"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="18772984"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 14:08:13 -0700
X-CSE-ConnectionGUID: bw1M60+4QGCbwej+qNQ3Rg==
X-CSE-MsgGUID: mOA0XeCgQc61XltGvlB4xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="87638652"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 14:08:13 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v8 0/6] Support PMT features in Xe
Date: Tue, 16 Jul 2024 17:07:57 -0400
Message-ID: <20240716210805.4012517-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

DG2 and Battlemage have the Intel Platform Monitoring Technology (PMT)
feature available, but not in the "standard" (pci endpoint) way.

Add support to the vsec and Xe drivers to allow access to the PMT space
for the DG2 and BMG devices.

The intel_vsec_register() function allows drivers to provide telemetry
header information (usually found at probe time), to allow the PMT
driver to probe the telemetry features.

Battlemage has a shared memory area (selected by index), so a callback
function is required to access the appropriate PMT data.

V2:
  Re-worked DG2 support patches using a base_adjust rather than a
  quirk.
  Updated GUID decode, for correct decode.
v3:
  Fixed a documentation issue for the pmt struct.
v4:
  Fixed a documentation issue in the xe_vsec.c module
v5:
  Addressed review comments for patch 4 (Xe driver)
  Add r/b for the first three patches
v6:
  Added kernel doc to moved data structure
  Added required include files
  Correct usage for FIELD_PREP()/FIELD_GET()
  Whitespace clean up
  Removed unnecessary type cast
v7:
  Commit message updates
v8:
  Added some r/b (patch 2 and 3).
  Updated kernel doc patch 2 (priv_data) patch 5 (base_adjust)

David E. Box (3):
  platform/x86/intel/vsec.h: Move to include/linux
  platform/x86/intel/vsec: Add PMT read callbacks
  platform/x86/intel/pmt: Use PMT callbacks

Michael J. Ruhl (3):
  drm/xe/vsec: Support BMG devices
  platform/x86/intel/pmt: Add support for PMT base adjust
  drm/xe/vsec: Add support for DG2

 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_vsec.c                  | 300 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h                  |  13 +
 drivers/platform/x86/intel/pmc/core_ssram.c   |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |  28 +-
 drivers/platform/x86/intel/pmt/class.h        |  11 +-
 drivers/platform/x86/intel/pmt/crashlog.c     |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  21 +-
 drivers/platform/x86/intel/sdsi.c             |   3 +-
 drivers/platform/x86/intel/tpmi.c             |   3 +-
 drivers/platform/x86/intel/vsec.c             |   9 +-
 .../vsec.h => include/linux/intel_vsec.h      |  50 ++-
 15 files changed, 428 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (61%)

-- 
2.44.0

