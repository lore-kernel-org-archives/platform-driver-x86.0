Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DB976C61
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Jul 2025 21:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751577128; cv=none; b=KJ2YkQR4p67NwG3V1X01AGfY0UIzmeIaOXMhryzDbjmBSaprhZZ4raGrENzuDSY6Z3wc/TALbSc0gGcgqd+23bRo253haWfZppGY0Q6t9AXuq20A7D3wtoyivP4OSXAuqkSusQvaS1V1/CYiCpT1l0Ax89XBRzLw7W9gW4RY8aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751577128; c=relaxed/simple;
	bh=7nlMjw7H8hSxEdfDjFEIrQC309p4JKNAFPclsELo/Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OWP9oX7oug0vxbIrvIMmFf5RJaK+YWtOkhmHo7et1Gnu1MIc89co/JVWtwgVc+QJJn8+8Kg6gTnaroznWhMFZm5nJDTSFU0wy0J1pjqsg4IcLYmWV/9jntxm/eWNCFD3dYMAlvKM3kH+516ZgKgK22OEfJu4XobTZQpphi+UyC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mu5Vx7RO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mu5Vx7RO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751577127; x=1783113127;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7nlMjw7H8hSxEdfDjFEIrQC309p4JKNAFPclsELo/Cg=;
  b=mu5Vx7ROTxkNNwkAu0DCGoSNT65SP0te6Phzx9v8sDr7F+ZXWOeoHi2A
   PRnCX6swSpPq1etQq1G8VdfqQ/uIQUmOFT3LtRYnVppXEmlnvAE+dbQQs
   JIpknRBWh7YCSxIcURmV7f1L3xI+1IWgruLIiolKTbMdeMwvm0Fs5NtN7
   f4fK17tXJgowzu6rkTeSNgP+tUxZNbQ8i3gg9zouVtp4IUk333UAQVQpd
   SODnVBaGBoGuFtiRZ95jSTpdS+HNxZ4FVsD7QGTQBjCt1/vXwIuplBwXt
   WDO7wCuHZ0lO8j4ACWPXV1KLBiilzJNXtL9vav+W18FtWSfUOgH0iVGop
   w==;
X-CSE-ConnectionGUID: OEmr8J4rSwO/tBNQOHvesw==
X-CSE-MsgGUID: I0VhV7LNRm+Ft/2fB7LuEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79352980"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="79352980"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:07 -0700
X-CSE-ConnectionGUID: 5Xo5l61WQY6K7+hJP3z3Cw==
X-CSE-MsgGUID: N5HMfXQURjy92Sp9MRW16w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154239966"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.97])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:06 -0700
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
Subject: [PATCH v6 00/12] Crashlog Type1 Version2 support
Date: Thu,  3 Jul 2025 17:11:38 -0400
Message-ID: <20250703211150.135320-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
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

Michael J. Ruhl (12):
  platform/x86/intel/pmt: fix a crashlog NULL pointer access
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
 drivers/platform/x86/intel/pmt/crashlog.c | 468 ++++++++++++++++++----
 4 files changed, 394 insertions(+), 112 deletions(-)

-- 
2.49.0

