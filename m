Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADFE27BF80
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149119; cv=none; b=V8tl8MW1xZkSHHXJNHkGEp6JslUxYHxhl2U55hk/iJeXdFz5yEtGjhqeeWN/EtacgpPB5/HUUXjUBeyAyr51wVPKTwLnQHyCldG31WI+VLKxjJiDyQJIBf6NgKSRrekp9ykwAFBSvP97rTJV+04y5gxgQD+orRthBClxONE5NqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149119; c=relaxed/simple;
	bh=7rwPpLw0SheicDklStm9qNsxPp3vZKCENvPajTfBhyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WRFdPENLuQiGR3ayG+SNCFsallvRB5wbYgwvCpVCUBzexBcU6LkF9JXJ36vP6pLMMPuZxCCQn51WAI6yGQ1jb+13+LB1kOuO2eoDGYt4+A1pt1zFj9J0HsFRcFN9ti0wR/pm4iHTE0VSevYip5HTacWqBxeaTiCLD8VTCYSZwjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrS1QOMu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrS1QOMu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749149117; x=1780685117;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7rwPpLw0SheicDklStm9qNsxPp3vZKCENvPajTfBhyo=;
  b=RrS1QOMu2aEwp7A1eg9WNTmDyI7mAM6HQj1RUgP2Qm6Dnmj7ThPHxwhG
   OgsOXc6PUop71T7+lpWiTh039TLjWSo7duw+eG2f4IXKMa5vzYoL/MFUp
   ouu0IQCodSwhDhkCa5Kp3l6E2cXobsJ25TVEi0HQfAZEazYcaFFXV0WMC
   sZSiuFio9FJlTocpLrXyY9uGcgQ9XzsmVcR+irV2w4qe2EtSN2jnEGenO
   J9/ErwqAoGuYUDGYgFQpf7O/gtIT/39o65C7UF8BjxlKVwOnuYqX+Nf9i
   4WkaS723+bKNsmgwCdIIXCu95Ncswkgwriir88kDNEsB7RMJq3sjH/93t
   Q==;
X-CSE-ConnectionGUID: xbXcClNrQu+VD/a8qaIdpg==
X-CSE-MsgGUID: YTCcbYeCSh+C2zWRokYMGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38916566"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="38916566"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:45:14 -0700
X-CSE-ConnectionGUID: xC6G3ZGxScCRORcAM+xE2Q==
X-CSE-MsgGUID: VUffQyUDQDKcqd6+yrYMeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="182782413"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.222.42])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:45:13 -0700
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
Subject: [PATCH v3 00/11] Crashlog Type1 Version2 support
Date: Thu,  5 Jun 2025 14:44:33 -0400
Message-ID: <20250605184444.515556-1-michael.j.ruhl@intel.com>
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

Michael J. Ruhl (11):
  platform/x86/intel: refactor endpoint usage
  platform/x86/intel/pmt: crashlog binary file endpoint
  drm/xe: Correct BMG VSEC header sizing
  platform/x86/intel/pmt: white space cleanup
  platform/x86/intel/pmt: use guard(mutex)
  platform/x86/intel/pmt: re-order trigger logic
  platform/x86/intel/pmt: correct types
  platform/x86/intel/pmt: decouple sysfs and namespace
  platform/x86/intel/pmt: add register access helpers
  platform/x86/intel/pmt: use a version struct
  platform/x86/intel/pmt: support BMG crashlog

 drivers/gpu/drm/xe/xe_vsec.c                |  20 +-
 drivers/platform/x86/intel/pmc/core.c       |   3 +-
 drivers/platform/x86/intel/pmc/core.h       |   4 +-
 drivers/platform/x86/intel/pmc/core_ssram.c |   2 +-
 drivers/platform/x86/intel/pmt/class.c      |  57 ++-
 drivers/platform/x86/intel/pmt/class.h      |  23 +-
 drivers/platform/x86/intel/pmt/crashlog.c   | 477 ++++++++++++++++----
 drivers/platform/x86/intel/pmt/telemetry.c  |  51 +--
 drivers/platform/x86/intel/pmt/telemetry.h  |  23 +-
 9 files changed, 483 insertions(+), 177 deletions(-)

-- 
2.49.0

