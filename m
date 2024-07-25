Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F71199EA3
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jul 2024 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721910148; cv=none; b=WMj4+q+XvdHMHPDy0sK/dKlzhdkPoEFh298gjekjxkZoptAXK5NX8UXrcj2cerEbFm0wqR1rkycDWqgKG6zB/hAY8kM3l7v1vJcWqHC6COt4xMz4AK0WJJZcTuzMcXeqxMlz3q3a47PtyWL70C5Qm2MNicSeDr+WerfdHqCaCLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721910148; c=relaxed/simple;
	bh=5KornmEAf5kl0PDvjCkHFEC9MX4Ry9jlDgg7sDF9D94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dvfOH8JXdoMiGPrEBszmH9SQ6U30sLnBA08NtDKHZuZcMv61X+LsJc7i/zBK5uk5Pre5MQxpGzwW6VKErjF4IfKqC+cQX92DDUYet6esb2TGXFrxn6W/kJbyvZCK1OKaziqhioxbZB62I4NSmoe/OHjpWV9EHoxecHkdrT04fWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kbho/oE2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kbho/oE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721910146; x=1753446146;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5KornmEAf5kl0PDvjCkHFEC9MX4Ry9jlDgg7sDF9D94=;
  b=Kbho/oE2lHvznXT6IA3L/FY76Y5mK6ZARAeNTFo5PvLYvG6GlNd8R94c
   7yKKBTubPTCdlVQglJ1br2kbEsEzkNTBdMnKsLQUZXtOevETih66vKpGr
   oAslfHs1g/5I837XTsxsW2eu0ToW/bHvBSOYN6jfoh0IFCWmezJygP/rQ
   BQdTgD8R7+92FQDNhN6Hw90ym8Zo/r7Vc20/f4W2i9Xgd+0shrgaxo1dl
   igkn9O87461VnMVh40kVTR03tjTckWDY0BJs0sH+6iwztvTZr+br9oIIp
   JOyRC9cazek1ocLfAhg1aOoe3gtH0Hq9wUlE0iNoC0K+1oJH6S4Zb+7gB
   w==;
X-CSE-ConnectionGUID: yghVFTjiSbyDXiV6hE9bsA==
X-CSE-MsgGUID: E15BfAGgRhyiT8xDli3L5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="31060747"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="31060747"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:22:25 -0700
X-CSE-ConnectionGUID: sdILFKTpTnW2l/3OFJcLRg==
X-CSE-MsgGUID: tNtcVAH/QO+gbI7AF9108w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="52786136"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:22:24 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v8 0/6] Support PMT features in Xe
Date: Thu, 25 Jul 2024 08:22:07 -0400
Message-ID: <20240725122214.4063886-1-michael.j.ruhl@intel.com>
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

