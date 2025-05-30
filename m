Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897E6C133
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 May 2025 20:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637494; cv=none; b=B8//eWT3K7eqWAFgwgZBFQQ94g72biWPQ5DSbARgbSgaLqGFa3RjoeUuhbzsrThCus/EO9cMdfOhQhKO80VbGI/F4ZEsOxZLguYblsAhqYSCYKq68kX0fVZl+TjALOAjhVPLYDm2Nl2R8Wwk7VSzxexkEBcokCtay5UhKqexq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637494; c=relaxed/simple;
	bh=X2T6/ikAozhJHRbTcneZ9gphT23f/xYf7x2oazwx2NA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hLMbSBbcc1avVT/6XFYE+6f8onlYZqpmYSQfJYMpLwncSyvOjv6L524BgeLcHrY4TcisuaHfclw9lC0jt8vQJQmyVrADtQn7em+ATVmYRZDQmy7hta0jHsC66OQqXIuHO1ld1KHvsYsFbbQib7thb3WBUr8vO+iHGAb0i/hOiOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLgjVhTc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLgjVhTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748637492; x=1780173492;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X2T6/ikAozhJHRbTcneZ9gphT23f/xYf7x2oazwx2NA=;
  b=hLgjVhTcAC5KnUhR6HeNCctzv0l7JlchKtN9OVN/rZZWDSaF1jRDzeH7
   wRjl4Qh0hXQd7mY+2YLQyiwKN/x4M85ToXINGOA9R8AsH5vVaLveYN8iK
   KvYKNU0m2skMgZqwUv8vlaSh4sLUSccarPQtkczUcG2leahseqD6u55OK
   H4NenIHjFEb7tjsKcAaobsACKv7TOunFNlTPox8lZmoLkvHNyY1JEkSZF
   LeAiTzltG0siTTtbm9GV9V9CT3ApZLTNMKjWUBNVvzqCVT77M39jCUu3z
   rR8pki/txaz4WYCimCZuKgQJQq+/NEXlNXhz+Sc8RF60VWdikCtuTwlWD
   w==;
X-CSE-ConnectionGUID: V0/GAy1aRiqElhrOkjGIGA==
X-CSE-MsgGUID: 3q6cIGY5TwyC0i5erOVpHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54405989"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54405989"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:38:12 -0700
X-CSE-ConnectionGUID: 0nGvPDCtRVCCwIjtaxLSxQ==
X-CSE-MsgGUID: QwbVC4f+THGe4ct0dOCEug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="143824156"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.23])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:38:11 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2 0/8] Crashlog Type1 Version2 support
Date: Fri, 30 May 2025 16:37:49 -0400
Message-ID: <20250530203757.190853-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Intel BMG GPU device supports the crashlog feature,
which was exposed in an Xe driver patch
(drm/xe/vsec: Support BMG devices), however the version
of crashlog used by the BMG GPU does not have a supporing
PMT driver.

Update the PMT crashlog driver to support the BMG crashlog
feature.

v2:
 - fix a misconfig for the crashlog DVSEC info in the xe
   driver
 - address review comments

Michael J. Ruhl (8):
  drm/xe: Correct BMG VSEC header sizing
  platform/x86/intel/pmt: white space cleanup
  platform/x86/intel/pmt: use guard(mutex)
  platform/x86/intel: refactor endpoint usage
  platform/x86/intel/pmt: crashlog binary file endpoint
  platform/x86/intel/pmt: decouple sysfs and namespace
  platform/x86/intel/pmt: use a version struct
  platform/x86/intel/pmt: support BMG crashlog

 drivers/gpu/drm/xe/xe_vsec.c                |  20 +-
 drivers/platform/x86/intel/pmc/core.c       |   3 +-
 drivers/platform/x86/intel/pmc/core.h       |   4 +-
 drivers/platform/x86/intel/pmc/core_ssram.c |   2 +-
 drivers/platform/x86/intel/pmt/class.c      |  57 ++-
 drivers/platform/x86/intel/pmt/class.h      |  23 +-
 drivers/platform/x86/intel/pmt/crashlog.c   | 467 ++++++++++++++++----
 drivers/platform/x86/intel/pmt/telemetry.c  |  51 +--
 drivers/platform/x86/intel/pmt/telemetry.h  |  23 +-
 9 files changed, 478 insertions(+), 172 deletions(-)

-- 
2.49.0

