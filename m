Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98693511184
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Sep 2026 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466221; cv=none; b=awH16INAFBuvu9O309QUU+K3VSRqKyy41v2Va0cqPdg20153hWAvNuXHl+y0VgrMequnQ0nQ4XmZGKgGWxhgwgrXE2z4Uo00uq9Ntl5VrAVnMcV1XWnocbgs50iuzXPAO6faIz2AmsTKS3mG3NNoSfXJf0OE/nRjPIqHkzZ9O9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466221; c=relaxed/simple;
	bh=W6fjqsJDwHaCZEZdYgoC77amcD2ZW34klntyOaQhPR4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=KQQT6tGmRrbB6nF+OSA1ieDRctfAtl2SALH1WLbtp1yM+XCDucB8sADQzOZgT9IJscWNZJHT4lOcqbh6mjervJr7B+BwFeEgYE4HT1ohWTwwSKeokn2ueMoiMQfVFme+tb54kOQqYAKEZJ5HzG6/EN8Sw3odWwRJ/G0vj6Gz6o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFmgC0L5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFmgC0L5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788466218; x=1820002218;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W6fjqsJDwHaCZEZdYgoC77amcD2ZW34klntyOaQhPR4=;
  b=dFmgC0L5VJJjkpXwNtef3X0K+mrEtI0yDYQaINVGozY7EYSbaimj0cfA
   Ld69XyC+0LjsWDl6E3diNMzB4Ol5x+u6hHHHhX+oM2ToEmm52jvW9xt98
   h2YosI+j+VQobdPuvIjFwkb0UIrYvPkB6hoLEVG+FcMjtaU/YHy3i8PuS
   MlNEAPHZMPYemlwCxtUnfmq3EzN0/SinIkAjyFqhOGwhRfH0ypbSC+ptv
   N7hVFUF1/flgILHee6iSmpAIwuZibU/jI/Cd5ELkgKK7o2X/ZwOJBg4PK
   mOyBBpVaNF7JTQIFniyMtpsKDTBfRCtWnc4XHq9CNo6vAkHTPAFCmS2Lh
   A==;
X-CSE-ConnectionGUID: Oo09ql1fSeaXSACAHMd7Yg==
X-CSE-MsgGUID: +GIDaLP/Qji4yp0+9nUWrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88994542"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88994542"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:13 -0700
X-CSE-ConnectionGUID: oIiwQ9LpSraTmA4adPtbAg==
X-CSE-MsgGUID: LZ117kLtRCOfXvQun/268A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273347996"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:12 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com,
	anoop.c.vijay@intel.com,
	badal.nilawar@intel.com,
	matthew.d.roper@intel.com,
	james.ausmus@intel.com,
	karthik.poosa@intel.com
Subject: [PATCH v5 00/18] Crescent Island PMT support
Date: Thu,  3 Sep 2026 13:10:02 -0700
Message-ID: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Crescent Island (CRI) GPU supports PMT via Xe driver
registration.

The CRI PMT MMIO mapping is shared for each PMT feature and it is
necessary to set an index register value to access the correct memory
space.

The PMT driver has a callback infrastructure to access data areas with
driver specific access. It is does not support the PMT control access.

CRI discovery/control spaces are part of the access window so a driver
callback is necessary to allow for the correct window to be exposed.

Add control path callback support to the PMT driver.

Add CRI PMT discovery information.

Update the Xe driver to support the CRI PMT access.

The crashlog access needs to be done with power enabled (telem is only
available when the device is powered).

Determine which access is requested, and do the appropriate power
request.

CRI FW is loaded at device power.  Support the late-binding API to
wait for FW readiness. (pending sysctl patch set implements the API).

v2:
  Address AI feedback:
  - add missing entry->cb check
  - address SRIOV VF concerns
  - use xe_pm_runtime_put instead of _get in error path

  Address review comments:
  - redo power/lock sequencing
  - support device hotplug events

v3:
  - cleanup power manangement flow
  - fixed an out of order power management locking issue
  - add a GUID caching mechanism, for GUID read
  - removed unused parameter (mmio)

v4:
 - address various review comments
 - refactor crashlog to allow for return values
 - for callback usage, decouple PMT remap of data areas
 - use IS_SRIOV_VF() rather than expose soc-remapper internals
 - separate locking fixes intos distinct steps
 - refactor define update patches to seperate BMG and CRI updates
 - separate internal GUID into separate steps

v5:
 - removed callback helpers
 - do not return error message with sysfs
 - fix missed return code check in trigger_store
 - return error value not false
 - use DEFINE_RES_MEM
 - document when base is unused
 - return error on invalid GUID request

Michael J. Ruhl (18):
  platform/x86/intel/pmt: complete pcidev to device update
  platform/x86/intel/pmt: refactor rmw with a return value
  platform/x86/intel/pmt: refactor rc with a return value
  platform/x86/intel/pmt: Add register access callbacks
  platform/x86/intel/pmt: Do not remap when using callbacks
  drm/xe/vsec: Do not register BMG PMT for VF
  drm/xe/vsec: Correct locking order
  drm/xe/vsec: Use correct pm state get
  drm/xe/vsec: Add DOC text for VSEC
  drm/xe/vsec: Support possible hotplug exit
  drm/xe/vsec: Support Crescent Island PMT
  drm/xe/vsec: Refactor BattleMage PMT defines
  drm/xe/vsec: Crescent Island PMT decode
  drm/xe/vsec: Crescent Island PMT callbacks
  drm/xe/vsec: Support late bind fw information
  drm/xe/vsec: Add PMT GUID internal access
  drm/xe/vsec: Update PMT internal access
  drm/xe/vsec: Refactor platform check

 Documentation/gpu/xe/xe_vsec.rst           |  14 +
 drivers/gpu/drm/xe/regs/xe_pmt.h           |  12 +-
 drivers/gpu/drm/xe/xe_debugfs.c            |  45 +-
 drivers/gpu/drm/xe/xe_device.c             |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h       |   9 +
 drivers/gpu/drm/xe/xe_hwmon.c              |  10 +-
 drivers/gpu/drm/xe/xe_pcode.c              |  10 +-
 drivers/gpu/drm/xe/xe_vsec.c               | 539 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h               |   3 +-
 drivers/platform/x86/intel/pmt/class.c     |  26 +-
 drivers/platform/x86/intel/pmt/class.h     |   5 +-
 drivers/platform/x86/intel/pmt/crashlog.c  | 237 ++++++---
 drivers/platform/x86/intel/pmt/discovery.c |   2 +-
 include/linux/intel_vsec.h                 |  14 +-
 14 files changed, 766 insertions(+), 164 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_vsec.rst

-- 
2.43.0

