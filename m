Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617EC946A
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Jan 2026 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780215; cv=none; b=Op4RcFn7Zh5u7X3gcA2FCnkeDYYRvVLbhwbASLI9LfruM9O+uMzAF7HmuNRPCymjbBJ3rKwEMvsGl3mtnH5olbIp0lRc/kdWR7OCKFJSG7naHdW6WmkZTyUNDwu3kxSCLlSrE0bM25oujUV723wdYphXC6myNVzZ0HeWZ7m+64Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780215; c=relaxed/simple;
	bh=j/YljXsb0FmTcgaDqtS4qv/Ss9pENz4ZGh+3PWa6oPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zr6bsZgk9kgltUHo77MIRyrRfnm/vmlRqK3RzdLcB4qWyhJ09wvoUDE+fw8C8dwLcEcJQd1xUKz999xKUQaCUK5/O9L0pRrjgxKmp8PkabTdsPqW9ekEopZsi08/siyLxVpJyBB3VND3uYWwAffv6ODBfeHf3zfG7LN5cLF0C2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4iL4SWT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4iL4SWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769780214; x=1801316214;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j/YljXsb0FmTcgaDqtS4qv/Ss9pENz4ZGh+3PWa6oPQ=;
  b=D4iL4SWTuQKqfBoiV/3oaW5Z2M2aFDD6ZitCJ4L48wZWQrZh7tXi5EKd
   dT96YGhnAGN/hAaUOXZzhpb5fE2E/eKY5/yiFZMSqWLjjMhlpWeZsNF6d
   rp0RX0kAK97ZMZpms20pLCuVRIRQo3eDecjcmGxX1XEHoJfqndRKf1aiY
   KB78KrnUJJFoozFTm8J+mO2Wbd8JjOVh0WHOfT0ZGP5AkUbgvYUSzUUSa
   c5HiKr1oh0OjzBm63zk0arTtDI10rJwOYbCbRttjOHhKMXx07Yb0GCKPR
   Dj6kho4xRZahKIY81jSP61OYEpJhMeJmBqgvEI8dn2ygYZ1VDJY1Qtnbt
   w==;
X-CSE-ConnectionGUID: WoV5y/9aQsedDuyoxl/Cpw==
X-CSE-MsgGUID: lNBBAuMkT+mpkt2MGQxgtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71194373"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71194373"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 05:36:53 -0800
X-CSE-ConnectionGUID: 1JHUBTtBQEeStWewFsciaw==
X-CSE-MsgGUID: ty6/N1W7TlC679quscdmbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="207983227"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.170])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 05:36:51 -0800
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
	david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2 0/5]  Crescent Island PMT support
Date: Fri, 30 Jan 2026 08:36:40 -0500
Message-ID: <20260130133639.765378-7-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Crescent Island (CRI) GPU supports PMT from the via Xe driver
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

v2:
 - clean up commit messages (reflow and content)
 - remove debug usage of __func__
 - addressed kernel-doc issue
 - clean up some added lines 

Michael J. Ruhl (5):
  pmt: Add register access callbacks
  drm/xe/vsec: Use correct pm state get
  drm/xe/vsec: Support Crescent Island PMT
  drm/xe/vsec: Crescent Island PMT decode
  drm/xe/vsec: Crescent Island PMT callbacks

 drivers/gpu/drm/xe/regs/xe_pmt.h          |   5 +
 drivers/gpu/drm/xe/xe_vsec.c              | 255 +++++++++++++++++++---
 drivers/platform/x86/intel/pmt/crashlog.c |  39 +++-
 include/linux/intel_vsec.h                |  26 ++-
 4 files changed, 289 insertions(+), 36 deletions(-)

-- 
2.52.0

