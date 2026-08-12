Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617833537F8
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563476; cv=none; b=rooz1mlohrDQjDgnrnrj0/GYduLZGNBx2JdLWzAOKDE8n9ZNKioJHJqtBqaioHJlU55vGaTB6hl/lfzheurSXuJfnDN5qTFkAcFvbCI82D2wscG0tFt/03hey2XIYxYj3tzaIH4zHlS1ycgwuFQXaqKsJ1QltSA/pWyHZwZwy7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563476; c=relaxed/simple;
	bh=JTcQYnBITt3MzVv4+d7MjkqsyYiQbb4f2EgdzAGx/tw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nsFtSiHbRrAyf5dL15gH5/i0P3b3mVmr+iu2Wx8xd7LLi79cJFxITOu/DmJeOcRu2hkmfpuwkiWI9hH4lKqatHc2qeMuIBi6O5mdYgWH/OnzZvypGDMzaF183zJEHeOeqEjCMD/QsZbn037aoaMkO1/dOrdMagVNvkOv8eC8Lho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yl6gGmCH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yl6gGmCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786563474; x=1818099474;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JTcQYnBITt3MzVv4+d7MjkqsyYiQbb4f2EgdzAGx/tw=;
  b=Yl6gGmCH7Jj1F3s6UA5I22sI4rIvNuu5RCBnf11glcstWV36HvRZ5ZxZ
   985YqmBA68qhECtcZJ0nW11BXYyyZYfcUu8jjWhhEtoZNMyum4Gw6lpvG
   40GKu+t5kfFGJZV8vwAcScsjFHQlkyQ/MADzSO638cPOmuYACDLFPoTJV
   XyyZ8sXBgnntKvWx69DSnDsccT3QmM/Am0TbbgcUQV3Ze9h9hPA1o6Kfi
   uj76ihcHYXgPvyjt6THs+gySBLRsvfxvwNFQY+5DOU4GE6tVArMigLg8j
   XMlWi29ubKPX/Fusl2xdOQ0r91FxmYnAfR3tQnyjuMo/Ez0px9/iJiyGN
   A==;
X-CSE-ConnectionGUID: jS1B6X5qT5ysIP/7UzTeDQ==
X-CSE-MsgGUID: LwKFweLqSHuTWDUbXReUCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104515360"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="104515360"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:37:54 -0700
X-CSE-ConnectionGUID: kC4FqONSSca/nqaZ9qVfNg==
X-CSE-MsgGUID: D+X2rnkYTCiAMes2vY6a3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263779909"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:37:53 -0700
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
Subject: [PATCH v2 00/10] Crescent Island PMT support
Date: Wed, 12 Aug 2026 12:37:41 -0700
Message-ID: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
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


Michael J. Ruhl (10):
  platform/x86/intel/pmt: complete pcidev to device update
  platform/x86/intel/pmt: Add register access callbacks
  drm/xe/vsec: Protect against missing config
  drm/xe/vsec: Use correct pm state get
  drm/xe/vsec: Support possible hotplug exit
  drm/xe/vsec: Support Crescent Island PMT
  drm/xe/vsec: Crescent Island PMT decode
  drm/xe/vsec: Crescent Island PMT callbacks
  drm/xe/vsec: Support late bind fw information
  drm/xe/vsec: Update PMT internal access for CRI

 drivers/gpu/drm/xe/regs/xe_pmt.h           |   9 +-
 drivers/gpu/drm/xe/xe_debugfs.c            |  30 +-
 drivers/gpu/drm/xe/xe_device.c             |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h       |   6 +
 drivers/gpu/drm/xe/xe_hwmon.c              |  10 +-
 drivers/gpu/drm/xe/xe_pcode.c              |  10 +-
 drivers/gpu/drm/xe/xe_vsec.c               | 529 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h               |   3 +-
 drivers/platform/x86/intel/pmt/class.c     |   5 +-
 drivers/platform/x86/intel/pmt/class.h     |   3 +-
 drivers/platform/x86/intel/pmt/crashlog.c  |  39 +-
 drivers/platform/x86/intel/pmt/discovery.c |   2 +-
 include/linux/intel_vsec.h                 |  14 +-
 13 files changed, 593 insertions(+), 71 deletions(-)

-- 
2.43.0

