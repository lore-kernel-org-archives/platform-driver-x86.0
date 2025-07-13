Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA99F278142
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jul 2025 17:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752427796; cv=none; b=rISHo5vTsmJGQoN0Adtq15AQf7G8jpnqP9aBMN6a+VoMoqw3AWTb5e0cm1lQJVSxcvMPSWyQW25jf+wwNhJiGH6blbCgkdwVbH6QFghs4l7V8VvsWXW2/wSoc9MM16V+INXxnK7xfYUgr4dtYgO2W5AbmEAmq3iRHS9h3WeAor8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752427796; c=relaxed/simple;
	bh=6YimU3vqq3FVLXAdeDOg2m6awGi2KDj9n1FxoPePrLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gctmVSh6nbQEbiV7KfrhE+FZIWfD+EekRLF4QNFl9jzxW8acDyiifvUBpRyJJQ712Zi6y3hXncq4qlQKKsg587izcCEg8rimTQMbDSSYyoXrQvt47fI0ntfybtxqzO9st1GpOFGa01fGFJiBDvRWYFlx0iW5hU7DqnsEL3dYCAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8oZzKJK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8oZzKJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752427794; x=1783963794;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6YimU3vqq3FVLXAdeDOg2m6awGi2KDj9n1FxoPePrLE=;
  b=a8oZzKJK/k7r0p4kRShd9oae3kjraN7Y0lkQXNHXbvdGLebMoBUciKgt
   7g7fn20itgArZxCceReJDLgtj7Mm4NzW96Ujwd0MAzbHKcFsuurxnLLnK
   G3c53jQ46T6L2+XPqF3ErDpiglghtSqrxilAO9/l7RUOQeVWirvTgohUx
   JYg3mLQGuplaYvd8q/1yD9uAF3fgOVGV4kG6zjsIQhXkE2iSbOg6CMm0J
   7VRA7isem9mU7/Ihwr0aeKeU+FgQ1HUy0JlCeloPhwXeMOHMqpEK2NT98
   FiC4ItPHj15EA624R4OT38JwAqUxIPpvzKwrw6j6+uENsjDwT24qAWFoU
   w==;
X-CSE-ConnectionGUID: Rzvw7UQyTNK+5gEaG2Howw==
X-CSE-MsgGUID: /fGUtmmcSYmUb1mSRWwb/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65334105"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="65334105"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:29:53 -0700
X-CSE-ConnectionGUID: XYr3+YPYRZqhZt3z03U1XQ==
X-CSE-MsgGUID: oYaxCcDaSLOryqpUuIBibw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="161069156"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.19])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:29:51 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v8 00/13] Crashlog Type1 Version2 support
Date: Sun, 13 Jul 2025 13:29:30 -0400
Message-ID: <20250713172943.7335-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Intel BMG GPU device supports the crashlog feature, which was
exposed in an Xe driver patch (drm/xe/vsec: Support BMG devices),
however the version of crashlog used by the BMG GPU does not have
a supporing PMT driver.

Update the PMT crashlog driver to support the BMG crashlog feature.

v2:
 - fix a misconfig for the crashlog DVSEC info in the xe driver
 - address review comments
v3:
 - re-order bug fix patches for stable
 - added re-order trigger logic patch
 - added helper patch to address repeated code patterns
 - address review comments
v4:
 - added pcidev to intel_pmt_entry to address null issue
 - dropped endpoint update patches
 - patch cleanup and address review comments
v5:
 - renamed helpers to avoid namespace issues
 - separate mutex cleanup from gaurd usage
 - refactor base paramters to a separate patch (from version struct)
 - add r/b reviewed patches
v6:
 - use correct fixes tag for NULL pointer patch
 - added ack to Xe driver patch
 - bug fix for access helpers patch
v7:
 - added r/b to mutex clean up, refactor, and version struct patches
 - removed redundant comments
 - cleaned up and improved some commit message text
 - include attr_grp in crashlog info
v8:
 - add r/b to NULL pointer patch
 - new patch to address incorrect revision usage
 - use correct DVSEC length value in header update patch
 
Michael J. Ruhl (13):
  platform/x86/intel/pmt: fix a crashlog NULL pointer access
  drm/xe: Correct the rev value for the DVSEC entries
  drm/xe: Correct BMG VSEC header sizing
  platform/x86/intel/pmt: white space cleanup
  platform/x86/intel/pmt: mutex clean up
  platform/x86/intel/pmt: use guard(mutex)
  platform/x86/intel/pmt: re-order trigger logic
  platform/x86/intel/pmt: correct types
  platform/x86/intel/pmt: decouple sysfs and namespace
  platform/x86/intel/pmt: add register access helpers
  platform/x86/intel/pmt: refactor base parameter
  platform/x86/intel/pmt: use a version struct
  platform/x86/intel/pmt: support BMG crashlog

 drivers/gpu/drm/xe/xe_vsec.c              |  20 +-
 drivers/platform/x86/intel/pmt/class.c    |  15 +-
 drivers/platform/x86/intel/pmt/class.h    |   3 +-
 drivers/platform/x86/intel/pmt/crashlog.c | 459 +++++++++++++++++-----
 4 files changed, 387 insertions(+), 110 deletions(-)

-- 
2.50.0

