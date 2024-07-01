Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A81B15D5B4
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jul 2024 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719843466; cv=none; b=klwbUmSZAonydDW+b8hTlujDogQZt3oifsY3s4npvwfn1z8zI1c5zXDSQfb+yI3zLNXDn6luvzRDn8SNb83YTPUrxjbkwG8ESHz2kTL0gwRASxp1WFcjwZ0uXWnoJ6NdSn0L/umjdPBVD1r58xZaOnwPewOLbuK4FfDz9TwUrTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719843466; c=relaxed/simple;
	bh=TnYMKVteWWVAazTuP82kufmBz6thtWE6ORul0mxHA1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=igK7ZApceoEvBU04CiXqZvq0leTpgm+lQkw+PX+t5pwkgUwwvTZqpx9P/pU2M4fyqtZQ52ZUHLUaWgemaxXThmsfLhtOYwA7/3ijJHGwCn69UFo5riR9zYqwXIk6AKweduZQijdXwJjF6yoAP+Y2iofadzGYCN7OR294CMFKHcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMBU0JQY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMBU0JQY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719843464; x=1751379464;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TnYMKVteWWVAazTuP82kufmBz6thtWE6ORul0mxHA1Q=;
  b=TMBU0JQY0UwlMCFS1J29i+Pf1jhgZmc/HN2C7gVT1Dmvk/M/HX9ypd+O
   AewcKUOZwZSzsgYiMfXs/6pLcezOpwccD347LAbHwZNt5aTnNn5gTn0L5
   6OVWWYymGxHC4FdtH14A/jDVQdc/KtL8CTpKph6prN+wOuE7wYUUr90Mc
   YdFMxeB9MCw0bZG9sSvo5QOJhCVsqNc+c+O8Ls42rLr+bzF3m72pbEZh3
   MA9JClkjqf5nJUD8vzwUVVlT/vp1laHahtjQdI96PMK6tWlFf+ky7faRR
   fN8s2cdFspLcMb/AMq5nrrlJwcDMbJyFYikNkNG7OQjQm5oeJdmF24GXn
   A==;
X-CSE-ConnectionGUID: /oWNfnIdT/GLl0wbAPdY3w==
X-CSE-MsgGUID: TeWGi1a9Rs28XU8kXwIh2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="27566444"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; 
   d="scan'208";a="27566444"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 07:17:44 -0700
X-CSE-ConnectionGUID: D+pMuX9DTE28tL97QVK5XA==
X-CSE-MsgGUID: L55Ww8WHQaeuCSN+4wX0vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; 
   d="scan'208";a="49880705"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 07:17:42 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v5 0/6] Support PMT features in Xe
Date: Mon,  1 Jul 2024 10:17:21 -0400
Message-ID: <20240701141730.3585133-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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

David E. Box (3):
  platform/x86/intel/vsec.h: Move to include/linux
  platform/x86/intel/vsec: Add PMT read callbacks
  platform/x86/intel/pmt: Use PMT callbacks

Michael J. Ruhl (3):
  drm/xe/vsec: Support BMG devices
  platform/x86/intel/pmt: Add support for PMT base adjust
  drm/xe/vsec: Add support for DG2

 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_vsec.c                  | 302 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h                  |  13 +
 drivers/platform/x86/intel/pmc/core_ssram.c   |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |  28 +-
 drivers/platform/x86/intel/pmt/class.h        |  11 +-
 drivers/platform/x86/intel/pmt/crashlog.c     |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  21 +-
 drivers/platform/x86/intel/sdsi.c             |   3 +-
 drivers/platform/x86/intel/tpmi.c             |   3 +-
 drivers/platform/x86/intel/vsec.c             |   9 +-
 .../vsec.h => include/linux/intel_vsec.h      |  18 +-
 15 files changed, 398 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (88%)

-- 
2.44.0

