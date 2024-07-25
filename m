Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017B4199EA4
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jul 2024 12:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721910243; cv=none; b=Kx3hVlXiMWjErFs0LLMeFbLYrdaV42z85ubjECSpgtB39hKgPGS7W9PbuLgRUS5SWALoa6exLG/asXgyWM9J6n22Rh5ocIRlgh3M4n/7Gb3KxQds5YbQ+HsOkRoYolyeQ5rr9kGgLbCEN5FpuRnlIFxvXO8RGV9p9ptpkkpHjNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721910243; c=relaxed/simple;
	bh=neOhFOn+xG1toDh0HK+a7uIG1wSFkpvcedJKJXcuBEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WYzrftWpfk+yilgBOQjk+/68jnhPxvulZ0ZZNgsGul0IsKlkSK46jrCopwTbTbTnfxnIEeQHrC34E7N8NMWR93bqNNDAaXeyS4KR/5eEiqy9bPjL5G1QlA8ZEdB9YPmCML8UB8Q34vOs5KyzC9EVN8rOJFXGgvo72l84DxhL754=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXhAuVDs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXhAuVDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721910242; x=1753446242;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=neOhFOn+xG1toDh0HK+a7uIG1wSFkpvcedJKJXcuBEg=;
  b=IXhAuVDsZfXStgcxhXsb/ix+dD+z/jBq8Vq6cao2Zj1L4AYARCfPbW/3
   qvRUepOasP+NaPpL67wMT5uME5HNIaPTAiEU0jHTw8AiW2QyBBmKcvJiY
   ve5lusJ3LFqvoRN+lXlidDC1vBf5W0ot8nrVi79J540UcfxJranVJ5tNV
   qKqeYDsKepYYHKQBYuGd9VkwA2t3VhIP1p9BNjKcjzuVjekxJe+I+MJsF
   wlIqabQy2kcMW3bFpmmlpFlRLnAHxkwW2GelhKE1WDzrkydxGC7kV/Wlt
   rzmF8LggVcsBOcaQWFOGx9QHxHDl9M5Xn8IWb0H2CV6AX6t4yx+87V2Vw
   A==;
X-CSE-ConnectionGUID: LhSfhjiES1eX2xOM1+Ydzw==
X-CSE-MsgGUID: xwOoNHFuQ/i5BDw867ZxmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19493156"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="19493156"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:24:01 -0700
X-CSE-ConnectionGUID: M8RXydNxQC+VkbMoGdzFow==
X-CSE-MsgGUID: 7meGmohaRUKPgfg7Bcs9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="53153587"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:24:01 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v9 0/6] Support PMT features in Xe
Date: Thu, 25 Jul 2024 08:23:39 -0400
Message-ID: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
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
v9:
  Add r/b for the Xe driver patches

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

