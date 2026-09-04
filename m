Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F041494836
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Sep 2026 18:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546305; cv=none; b=avf1RZrboMaW3J0U9IR1tWP5j87cC3zNkxAGNctUw56/EY2Skl2Zz3KXNCsZznNjnEzvygcVPxD0lcAbGYoYfMlWrJ4UYuVwmY/bt1Fd0xmvI8owu6uf/rFZvicz0cTNN5GAroAY0mXeU43+ZfAycoNFj5RgdEAk7Sp9oBVrGUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546305; c=relaxed/simple;
	bh=mVKKFoxD+/jahQL/y9sz6eq729/iisufCT1clQ9Fum4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=CL1aQc/zADCq19mAoZ+gSeevYUXVHpNnNeYqFOQ2/GzwPUI7Y7aepf8Okopid8jY7qXaWUj/TBl3dpmfzePiM42PRj1GcB/qIO92B9QQTFjDkmLpzIfgAi7uxZ0/AQ5KunzxUok3NyRe4Zs5gQbPETQZ2fHl4cPPn8jMsZq9L6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdMfcctU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdMfcctU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788546303; x=1820082303;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mVKKFoxD+/jahQL/y9sz6eq729/iisufCT1clQ9Fum4=;
  b=mdMfcctUpxB6mgTvMaZr8fH5BwDBh4kddwWkqncg33gcSxXWIvRFcEmC
   pvCC9d62L3PU+phxn4CHaDG3xFCoZ3pIhGJUVu1r15Hm2x7SIle9Qofj0
   W+N1FTmWe81ll3PuFxNzLNkdMtb7vkbfJT3er6l4xe46t+cBB737Qd6vs
   z3/r41dBItrJkVuYorXRGp30/j2Dl5osaAGc+JOZ2tnVf2L+T8B+l3UN6
   +EdWYeXIA7MCKtU6bZUeStT0Rr+o/IaI2U22sAE4KF9dvxGPMIKGEitcs
   EbVtynpvRBGW4cGOvqXadpZ8XIDWM8aSXzwrOmtvbWCLYxnh2XihjnoXT
   g==;
X-CSE-ConnectionGUID: /xsLXWx3RnKCPLKl4PEwIg==
X-CSE-MsgGUID: qxCoAE7+Ru66NB6NIp4Btw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88932175"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88932175"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:25:02 -0700
X-CSE-ConnectionGUID: NLo0sAH5S6uPuMJ/ei1oag==
X-CSE-MsgGUID: C6Q8XKGDQzi62DfLMZi1FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="294992452"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:25:02 -0700
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
Subject: [PATCH v6 00/18] Crescent Island PMT support
Date: Fri,  4 Sep 2026 11:24:50 -0700
Message-ID: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
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

 Documentation/gpu/xe/index.rst             |   1 +
 Documentation/gpu/xe/xe_vsec.rst           |  14 +
 drivers/gpu/drm/xe/regs/xe_pmt.h           |  12 +-
 drivers/gpu/drm/xe/xe_debugfs.c            |  45 +-
 drivers/gpu/drm/xe/xe_device.c             |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h       |   9 +
 drivers/gpu/drm/xe/xe_hwmon.c              |  10 +-
 drivers/gpu/drm/xe/xe_pcode.c              |  10 +-
 drivers/gpu/drm/xe/xe_vsec.c               | 542 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h               |   3 +-
 drivers/platform/x86/intel/pmt/class.c     |  26 +-
 drivers/platform/x86/intel/pmt/class.h     |   5 +-
 drivers/platform/x86/intel/pmt/crashlog.c  | 237 ++++++---
 drivers/platform/x86/intel/pmt/discovery.c |   2 +-
 include/linux/intel_vsec.h                 |  14 +-
 15 files changed, 770 insertions(+), 164 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_vsec.rst

-- 
2.43.0

