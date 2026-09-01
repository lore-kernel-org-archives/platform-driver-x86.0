Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80F8374E6D
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 19:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290870; cv=none; b=ppdyk1kXU10H8mHsvoEn1sgbGy9V1rfEK3y/ANkZQnt+U/d4r1/UGUL8E7dy8mpkm2EoJohgrWGm4rkOYqFi/cEcl0LhKIQwU4TgmdS7GNU6imDnc2rbhv3j9XLIvsTOk1qSv7TeYfiaAv7l1bv8joAqLIlHc0vOVw0g4GX26zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290870; c=relaxed/simple;
	bh=NmH2ownu5WpQJmNzIMrbJULOLMZ2DEH7NHK3j+sn69s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=gjUc40oQRTraTmtEoolUSWt2qJgKzWNCHKaRsLkXVHJ1Wr+FwTksBJy7ZtpAM/j2s9opazFxKseVDsjYViMxiTpc9HSM7GQKXIVz0bnzFZsDk3TQfxm2JuYVu5WbDBGA+VVOKAgIU2pFFevkg7HyxyU0W8Z9puu5rXXIgTv7o70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjMU6idm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjMU6idm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788290869; x=1819826869;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NmH2ownu5WpQJmNzIMrbJULOLMZ2DEH7NHK3j+sn69s=;
  b=gjMU6idmhcAtQy23QLBb+/EOvdrGK13gkO8jeN4Ipdu5ynqzwd1Iifqn
   EHBc2sqs0OnLGJ3Xj1//nYQhBIUtAjV2HAM/ou4HoRGVwqDEVGK/Dtjyg
   TY2y+qX7zUCxHhG3ffwZN47x+L7hoBKSLQHtMiDWsTeDWqfErINbpfJcZ
   5Ow0iE7iGaTYyXzyEMuBYy7s8Y8F05/N+G70oUIh8qimkhpme7Cby4LYX
   R78zxs7Cqzps6zZ/es/GspYuk9OPcIcHa/Pv+pdSrYxYmR8TiB/P+tWf6
   Og2Oge9cIBD4WHi8oS8zMI2yRaCiN8l5KZ6CHj8dwkxkpnvMolU/d+Nqd
   Q==;
X-CSE-ConnectionGUID: YGfXHJSaRfe6u+B6418qPQ==
X-CSE-MsgGUID: uzp7Tl+QQceQzchKrUcPyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762442"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88762442"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:48 -0700
X-CSE-ConnectionGUID: qUjpjBFsQy+tE6xdTZbDGw==
X-CSE-MsgGUID: ClVLa4imRnu0pBXT0pyF1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="269776700"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:48 -0700
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
Subject: [PATCH v4 00/18] Crescent Island PMT support
Date: Tue,  1 Sep 2026 12:27:35 -0700
Message-ID: <20260901192736.626777-20-michael.j.ruhl@intel.com>
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

Michael J. Ruhl (18):
  platform/x86/intel/pmt: complete pcidev to device update
  platform/x86/intel/pmt: refactor rmw with a return value
  platform/x86/intel/pmt: refactor rc with a return value
  platform/x86/intel/pmt: Add register access callbacks
  platform/x86/intel/pmt: Add helpers for callback info
  platform/x86/intel/pmt: Do not remap when using callbacks
  drm/xe/vsec: Do not register BMG PMT for VF
  drm/xe/vsec: Correct locking order
  drm/xe/vsec: Use correct pm state get
  drm/xe/vsec: Support possible hotplug exit
  drm/xe/vsec: Support Crescent Island PMT
  drm/xe/vsec: Refactor BattleMage PMT defines
  drm/xe/vsec: Crescent Island PMT decode
  drm/xe/vsec: Crescent Island PMT callbacks
  drm/xe/vsec: Support late bind fw information
  drm/xe/vsec: Add PMT GUID internal access
  drm/xe/vsec: Update PMT internal access
  drm/xe/vsec: Refactor platform check

 drivers/gpu/drm/xe/regs/xe_pmt.h           |  12 +-
 drivers/gpu/drm/xe/xe_debugfs.c            |  45 +-
 drivers/gpu/drm/xe/xe_device.c             |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h       |   9 +
 drivers/gpu/drm/xe/xe_hwmon.c              |  10 +-
 drivers/gpu/drm/xe/xe_pcode.c              |  10 +-
 drivers/gpu/drm/xe/xe_vsec.c               | 515 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h               |   3 +-
 drivers/platform/x86/intel/pmt/class.c     |  26 +-
 drivers/platform/x86/intel/pmt/class.h     |  18 +-
 drivers/platform/x86/intel/pmt/crashlog.c  | 243 ++++++----
 drivers/platform/x86/intel/pmt/discovery.c |   2 +-
 include/linux/intel_vsec.h                 |  14 +-
 13 files changed, 743 insertions(+), 168 deletions(-)

-- 
2.43.0

