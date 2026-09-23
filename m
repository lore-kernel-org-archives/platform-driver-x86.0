Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07404266B2
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187088; cv=none; b=iwPwNov/8Xr7pHNIcbOnJEbf139FH8zNcKLAztMhewffkHvjqiXAnLMICZ1R5CrpD1zWv+Ca/vGqIhWR6ecWFbyyu1mdnVdEbgdt0T8V+KFi78KRKdq72MTI42yVWGqoQ9lviiTF1Ylq4TeMCdMKB49v21CGmTLjCLZVIncKdeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187088; c=relaxed/simple;
	bh=NYLwPWcNDPGWHc0G5evRw3wsyFpaR2+pGML0l/mSAG4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=fQWOpQOJ4zbZwotRv29fPFbIpLqeuNMuyZsN9/jhKHeIHSymDLQIjnKjbifPzQdrOfIM9dztAUXCob0cPyDM8iDLz/WeAqed1AYoB8kAxz7kNyl9CVTAqMeouEv1GRFaRVZOO65i89iQTGsP0vkjPqZ2W511yC1SKuwsqhza5Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHxk31/F; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHxk31/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790187086; x=1821723086;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NYLwPWcNDPGWHc0G5evRw3wsyFpaR2+pGML0l/mSAG4=;
  b=FHxk31/FvUsUzq5nqvbitTavKBffVU69wloYAK5pa21Cq3kj3tqBTFVR
   U8O25xeihKqIoRnM+Q8/rcbdBGZSkqzwhva093B1tK/evNhuzrChr7m3v
   IZW5iRLkToR55WpTAtJKi5n02iuo+6VrD2Mk6AXGfaZwvrUHyMB1TKLiS
   3S0i1sXzeaIj6xguq1T7cIPGU/JTnNQMLq1zDubCG+1E8oG0dNxbenJHQ
   EUPYtCW0nc5M1MCahiSzjurv81i+/yJSwicra3tW976QHE6bpGlvr+ydY
   uTKixXaOj1n0XAWWSOU+JpKKHpwqDmnKvV/br37byEbFPlR/pApPotWuB
   w==;
X-CSE-ConnectionGUID: xSbUwOSxQwiOgpWqIyZ5cA==
X-CSE-MsgGUID: pUpipNa7TD6d4XUrSZ/2pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93415970"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="93415970"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:24 -0700
X-CSE-ConnectionGUID: EPm9kHiSTe+CA33qmdWlKg==
X-CSE-MsgGUID: a51rEC/tQ/qZc9RThDYSCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4980671"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:25 -0700
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
Subject: [PATCH v11 00/20] Crescent Island PMT support
Date: Wed, 23 Sep 2026 11:11:15 -0700
Message-ID: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
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

v6:
 - fix enabled/disabled inversion
 - fix missing DOC reference
 - change memcpy_to/fromio to readl/writel for register read
 - guid cache comment and update on valid guid

v7:
 - reordered to have BMG updates followed by CRI support
 - separate base_offset usage for clarity
 - added EAGAIN usage to block uninitialized use of the API

v8:
 - fix punit crashlog offset (should be 0xE60 not 0xE78)
 - remove EAGAIN support and re-order probe steps to initialize
   VSEC before other features use it

v9:
 - added appropriate reviewed-bys
 - use dev_err instead of pr_err
 - enforce defined base usage when callbacks are in plcace
 - move SRIOV check to get_platform_info
 - assert SRIOV for API check
 - use scoped_guard() where possible
 - update to use correct sysctrl helper

v10:
 - fix incorrect return type (broken in refactor, int -> bool)
 - fix incorrectly documented error return values
 - doc text cleanup

v11:
 - add reviewed-by
 - fix minor checkpatch issue
 - use xe_assert() for a consistent API check

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
  drm/xe/vsec: Refactor BattleMage PMT defines
  drm/xe/vsec: Update VSEC probe order
  drm/xe/vsec: Add base_offset to allow for more flexibilty
  drm/xe/vsec: Support Crescent Island PMT
  drm/xe/vsec: Crescent Island PMT decode
  drm/xe/vsec: Crescent Island PMT callbacks
  drm/xe/vsec: Support late bind fw information
  drm/xe/vsec: Add PMT GUID internal access
  drm/xe/vsec: Update PMT internal access
  drm/xe/vsec: Refactor platform check

 Documentation/gpu/xe/index.rst             |   1 +
 Documentation/gpu/xe/xe_vsec.rst           |  14 +
 drivers/gpu/drm/xe/regs/xe_pmt.h           |  12 +-
 drivers/gpu/drm/xe/xe_debugfs.c            |  45 +-
 drivers/gpu/drm/xe/xe_device.c             |   6 +-
 drivers/gpu/drm/xe/xe_device_types.h       |   9 +
 drivers/gpu/drm/xe/xe_hwmon.c              |  10 +-
 drivers/gpu/drm/xe/xe_pcode.c              |  10 +-
 drivers/gpu/drm/xe/xe_vsec.c               | 552 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h               |   3 +-
 drivers/platform/x86/intel/pmt/class.c     |  26 +-
 drivers/platform/x86/intel/pmt/class.h     |   5 +-
 drivers/platform/x86/intel/pmt/crashlog.c  | 235 ++++++---
 drivers/platform/x86/intel/pmt/discovery.c |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c |   3 +
 include/linux/intel_vsec.h                 |  14 +-
 16 files changed, 781 insertions(+), 166 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_vsec.rst

-- 
2.43.0

