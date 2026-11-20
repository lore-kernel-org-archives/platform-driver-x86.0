Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208154;
	b=l3pVgLONMbv/TFNyOBDO7vDyS4NKb995vzwqIurw2p+c4OueMhlNg9lrEf4KVHnIP7Ld
	 TQ7kVxy1YnszxxeXdOsK9P70T2Z4EYigcwyFHDNoV3VZiWD09nJhNZ41+LNM3ptpkd8hD
	 03zughI3TBtpkoUD8/tGeD6YkdI1Musg0yPo9J2FGj5juKuy40dxIN/Up0FtmBaVXVCPV
	 wNqbXdy8vQ5Vo/woYXkiHR77BehhyACaszSA17MQyUzYYtnckx0SejkV5AUN8eWjMpEof
	 sXMRudsYIx9mdWyclrDuTyHpRSvFdYlLLytvJIMRc3uKeObHQz3/Yh06BlYar0bdSAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208154;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0YZjC+YZOCPTN+uZcDCnytUsn1BUmmm1l8BRZnKOeyo=;
	b=ZtF58Mp/mCJVXdKSFUmTSdxFZZdxkkqfHWHnX4oTobNDstEUK6ChXIaY1IGlBaVnmBPI
	 p8KHeLYfQJL/fcc7bkZuqeTp2KDPn3ApLwIn7u6A6nIjd4KW4ne1uCio19I35BuRpy/H4
	 1xVx8lD5wlJlyHTmeB0w1sjSRDddnVjlWWMNRLQtlpMj84XfQ9SZ/IqSsLegnKgijqakX
	 CMiRrFcDYFAfateHrY4Bb7r1DSj91CC+VwDSh/LKhBspGbSKYw+tmmCUj2iI+vMgV45ha
	 ZSzn5lYysyABdB2Mu8t5RvQ1MMJMfZLiaVGHG9oeey53A4ae3jHXuU4X3jJu/KvMssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hrhRa+85;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B66606A69F
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7B66606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hrhRa+85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208150; x=1826744150;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MTfw3sEFOpxGgaKKLJ/u1jeJaVi8BR4IunXYswfMKGE=;
  b=hrhRa+85KC5XxhUPjqVCTw5QY9LqP9O/+RcL4FSfe1MrSlcX8NQMyDSe
   GHROt3MwCkReBIPCxnHwxlKwuHOiR4Ng9Ah6NPypKj7Jg1m4fzdV4HAN1
   zpYUDC1s5TOj4OJMQALsvDRx3cMO5GLUI1KInnTsVgJ7iur6iXv3Ysmum
   +HeFlUkRGlJdUBfhgLi+5exSmYPKQhKRFNl/+CmytugROhl6yVjwLdGfX
   1qdMYubHijHxwviM8DUJVzv/ub1WgYdehAzO/G4ZVVspFigAtXvclZxgh
   xs1UmxXY3jZsVp9ktETPec2SHmGwLDbGm71UE4apuixlBSP6PJI4Dd+PZ
   A==;
X-CSE-ConnectionGUID: YMR9BghpRCegBa3rJr083A==
X-CSE-MsgGUID: tA3Q9w0mQXO47TMwcYckxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136337"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136337"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:49 -0800
X-CSE-ConnectionGUID: 4HoRm8/WR8+1S3K1p70i7w==
X-CSE-MsgGUID: fha4l2LWQqeol4nejE9pGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10908686"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:48 -0800
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
	james.ausmus@intel.com
Subject: [PATCH v21 00/19] Crescent Island PMT support
Date: Fri, 20 Nov 2026 12:55:40 -0800
Message-ID: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
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

v12:
 - add survivability mode support
 - add reviewed-by

v13:
 - PMT patches (original commits 1 - 5) are merged upstream
 - resubmitting XeKMD patches

v14:
 - address AI review comments
 - init soc-remapper in survivability path
 - reset soc-remapper index to the discovery index after access
 - re-order read/write to eliminate need for goto
 - check for signals in wait_for_fw
 - add appropriate doc updates
 - use system_freezable_wq vs system_wq
 - cache survivability mode to avoid error path issues

v15:
 - add/correct fixes tags
 - replace devm_add with xe_vsec_remove() to avoid error path race

v16:
 - fix xe_vsec_remove path to verify CRI usage before cleanup

v17:
 - one last AI review fix
 - return error GUID == 0

v18:
 - use a callback to prefill discovery records
   this corrects a locking issue during probe
 - use the prefilled header for crashlog
 - setting the soc-remapper index now only occurs with the lock held

v19:
 - checkpatch issue
 - submit to the correct mailing lists

v20:
 - address review comments
 - augment commit messages
 - augment usage documentation
 - STATUS_IDX to ACCESS_IDX
 - return 0 for device hot unplug
 - fix guid error path

v21:
 - add reviewed-bys
 - return ENODEV for device hot unplug (bug was fixed)
 - check for power state active during discovery


Michael J. Ruhl (19):
  platform/x86/intel/pmt: Introduce a callback for discovery data
  platform/x86/intel/pmt: Use the pre-populated header info for crashlog
  drm/xe/vsec: VSEC requires soc-remapper
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
  drm/xe/vsec: Support survivability mode for CRI

 Documentation/gpu/xe/index.rst             |   1 +
 Documentation/gpu/xe/xe_vsec.rst           |  14 +
 drivers/gpu/drm/xe/regs/xe_pmt.h           |  12 +-
 drivers/gpu/drm/xe/xe_debugfs.c            |  45 +-
 drivers/gpu/drm/xe/xe_device.c             |   9 +-
 drivers/gpu/drm/xe/xe_device_types.h       |  11 +
 drivers/gpu/drm/xe/xe_hwmon.c              |  10 +-
 drivers/gpu/drm/xe/xe_pcode.c              |  10 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c |   2 +
 drivers/gpu/drm/xe/xe_vsec.c               | 656 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h               |   2 +
 drivers/platform/x86/intel/pmt/class.c     |  18 +-
 drivers/platform/x86/intel/pmt/crashlog.c  |  24 +-
 include/linux/intel_vsec.h                 |  10 +
 14 files changed, 730 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_vsec.rst

-- 
2.43.0

