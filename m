Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6612356BD
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 20:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057014; cv=none; b=lriMsDpyjuUv/TQP5jqWGg5KxJFbVBqjock2vM7BKhWZca8LKapnH052YF4v/Pc1KWv9MWkCAQPlUQNqYk0ZWd91O5I4ROfAn0eg7yVwaXaG7fGpaLBDl2w38kBsiIL1A2N04l4Tpy3bX5aOIR5euXtR5LCAH5A6IHu/0DSqIJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057014; c=relaxed/simple;
	bh=sl2Azysv1/Px8ZOg98nYDyMUQP6arrHPnLRgrQf3HyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=avSFykZ86xGm5hg+Ajipd79lh9ZbxmkE21EgiA+5hhP37FaV9fPhXDD/LzjtyWG47ZY2WG5cmuwOE+Zz+sIF1VZMw/B4OKuLStC5WO61yymgDijwH/VpLCiEn1Sezx9xbd1gS/1Vw9uD2ELQFOdXLl1vjvkIk8txUHYYt/j6k68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sya8QNlh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sya8QNlh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751057013; x=1782593013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sl2Azysv1/Px8ZOg98nYDyMUQP6arrHPnLRgrQf3HyU=;
  b=Sya8QNlh22dIc0uprdQE5pra5fR2RRbV3c1ovS6noadVqBQUAv8Iurww
   i/GbnlBiuo1SLC+mrpMzrfcrht+hnjRSUdVY8FhHsNEYdPrnVogbs3KCV
   kKsr6TpIkdx3x9dYueYu6LJ7+Wrz5FQUfS5RZqwkdapLDTQvOWK214Epa
   Pnr7YitES7VPxABLEaE0t9u/6tWdTj5vDazBFhZo8w46ypGlT/R5IIhcv
   JWLKG/hvcrywd90qFvdPnIMgNt656xlcn+rIyMSR7UAvdHxTK+pq0EjMQ
   oJSPdOhiPvR0WXwlJYjgGthWmx7OXUT9Ap2QZ0vWrvktTjW5JTC8MgCP0
   g==;
X-CSE-ConnectionGUID: 9E8ah7TBQ1KZdHBLr8ekYQ==
X-CSE-MsgGUID: u1Y76jGOT4+O9gZclfTtVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="41003153"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="41003153"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:32 -0700
X-CSE-ConnectionGUID: fOiVdfbOQbeGD9qf9kkTSQ==
X-CSE-MsgGUID: gKLQ1d3DTDWb3XtsF55iLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="156938963"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.252])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:31 -0700
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
Subject: [PATCH v5 00/12] Crashlog Type1 Version2 support
Date: Fri, 27 Jun 2025 16:43:09 -0400
Message-ID: <20250627204321.521628-1-michael.j.ruhl@intel.com>
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

