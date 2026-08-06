Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F5637AA78
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 13:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024716; cv=none; b=cXQMoDwsWadtSvpow9SvIWXv45rYlDbmksAFIDePeymuLz06lffHXYfRO13nuZZoB1bz1XwXNdHJaeIyL0ZS2zkXFDYiBk7O8WH5FAJOpCnlLXRIw2nqa6pziDOddq+pXIgcgVzrNPb8x9WqUywHlPbAKYOhYeGVDmEX5VTw1Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024716; c=relaxed/simple;
	bh=zQCckXH33vp4f7OnMpxoDD21Nh552lB0BErDJ5o5jSE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=C9kFae20lDy1yjBT2e19kJIyfVQtdnnJsvl5Euja5vDPL1SfmW7k33CffryJNl4u/7lVsBPEM9KYdg4mlRpdykdieseX2/Ge3pw4dviTKiuHLn7HMhhJ6nEdmH1Dkx2+Hri+BF5Vm5qCDAGMMS2W5nyg6W/uPaybjgnIMzmwkcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=in6l9sPJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="in6l9sPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786024713; x=1817560713;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zQCckXH33vp4f7OnMpxoDD21Nh552lB0BErDJ5o5jSE=;
  b=in6l9sPJOS63oYWogwF4KeM3d4WL+2xphWDHHuZDOp1nUxmro2eMJVlX
   5+4i2ER3Q0uEXH/Psvtcl9pFp5nAGWxGp9jKr9C6p5XKk4X+M/VkZtPEo
   5/AUMg00iE+lKMuRsoyBk3Ko0twG847RjytdmZLwqWXIsyKHkL52DppNv
   RshVVM/3hGz6Ab2xB0KGup4eZnuuyKnZtzYhrU9YAUGLdwXpiobWN6LxN
   cVh8mRYLA8c/UYmz6Vn8vn5TlXyryOPFpvQYSwEkMQuskYVM2RSnvrGgI
   1ivkPSe7Lk++XsFkuHB+BOnQOgkTEuPWnWllU2RidTom4RRQ36/xiQHWx
   Q==;
X-CSE-ConnectionGUID: /yesXafBSO6l9nqWYO+8Kg==
X-CSE-MsgGUID: HR+u9JB/T1Ou/DDYZKrKyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89141300"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="89141300"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:58:31 -0700
X-CSE-ConnectionGUID: dpYy+SOVS5iTEP8fk7BlYA==
X-CSE-MsgGUID: wCAS15fZQsGPPj/euWlFQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="265594897"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:58:31 -0700
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
Subject: [PATCH 0/7] Crescent Island PMT support
Date: Thu,  6 Aug 2026 06:58:20 -0700
Message-ID: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
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

Michael J. Ruhl (7):
  platform/x86/intel/pmt: complete pcidev to device update
  platform/x86/intel/pmt: Add register access callbacks
  drm/xe/vsec: Use correct pm state get
  drm/xe/vsec: Support Crescent Island PMT
  drm/xe/vsec: Crescent Island PMT decode
  drm/xe/vsec: Crescent Island PMT callbacks
  drm/xe/vsec: support late bind fw information

 drivers/gpu/drm/xe/regs/xe_pmt.h           |   5 +
 drivers/gpu/drm/xe/xe_device.c             |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_vsec.c               | 417 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h               |   2 +-
 drivers/platform/x86/intel/pmt/class.c     |   5 +-
 drivers/platform/x86/intel/pmt/class.h     |   3 +-
 drivers/platform/x86/intel/pmt/crashlog.c  |  39 +-
 drivers/platform/x86/intel/pmt/discovery.c |   2 +-
 include/linux/intel_vsec.h                 |  12 +
 10 files changed, 448 insertions(+), 45 deletions(-)

-- 
2.43.0

