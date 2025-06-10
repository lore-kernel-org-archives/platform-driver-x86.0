Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E71D2641EA
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 21:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589958; cv=none; b=YGjnOWCCYSbl1JO8Uybr1Dd5M5B4Vm2QLMZ3Bacvq4HY92ebsabq+veiSk/Rw1sJ3L6PPAFAqpoga87MrUWbnsMO4lx7yQuuyvkmPK6+uo7kEY7pDQoq03MBELCQtl/njJLoNCkfcfYJugPkJjmAmCu/MvDMv3SjUWQDCJlxNBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589958; c=relaxed/simple;
	bh=5ZFA5lgkwdHhxgubRG9+PlfzQ/dNcOFYK5396NqK+nA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q4547tx3pIfsO4khW4ynddA3CKiMAajs4mSMbS45wn4CnxZinGQOU5pAycENu+rCr5tIQH42obShUiILSp9j+wJFRpfngqxFGgJYSqxskfieNCJUe0F3zvTpvFtQeRV40I9kJ99sqwQAUF3pEzw3r0Zj+WnqoZZQ0m1GjdI/YM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZV+aPVyd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZV+aPVyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749589956; x=1781125956;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5ZFA5lgkwdHhxgubRG9+PlfzQ/dNcOFYK5396NqK+nA=;
  b=ZV+aPVydAa2v2SSLj1c5m134lghL7A8jGjEpDfJ3Y4LTSs+c0W1r6rpV
   pmAC1GpTaRxo3KsuJmDFYmjpZTmGM2Jn2apbpMdKEhhrjRueY0dUFswPI
   x0D6/7OdcEsX2jg4VJmIkeXdpT+BlnTTPupaHuz72KRwp1Egwjf0JzWIC
   TRI39fUA8zQLZ8MCmvhaP2CA46Ec3ex6UA964Yb3SpO0SigxkFBcMLN7r
   jUX100w56Rc8LqGeH/pr9ITvKAHqS1lu3PjwS+xOomENDgF1p4BK/kMcW
   taqZYQWwLkGt/H4O3Ww9J/YkpKp13FyPTTm4yifmg5X0aVB8AM6MW1py8
   Q==;
X-CSE-ConnectionGUID: aQsnhI4ETq6Lr8QY4Srxxg==
X-CSE-MsgGUID: ddWtJKWbQua+NdYs7BkDGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51816872"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51816872"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:12:35 -0700
X-CSE-ConnectionGUID: BITiKN11T4eKnyvUYN+7oQ==
X-CSE-MsgGUID: KujN/xWpTdq3vHhL2X5/Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="146939654"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:12:32 -0700
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
Subject: [PATCH v4 00/10] Crashlog Type1 Version2 support
Date: Tue, 10 Jun 2025 17:12:15 -0400
Message-ID: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
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

Michael J. Ruhl (10):
  platform/x86/intel/pmt: fix a crashlog NULL pointer access
  drm/xe: Correct BMG VSEC header sizing
  platform/x86/intel/pmt: white space cleanup
  platform/x86/intel/pmt: use guard(mutex)
  platform/x86/intel/pmt: re-order trigger logic
  platform/x86/intel/pmt: correct types
  platform/x86/intel/pmt: decouple sysfs and namespace
  platform/x86/intel/pmt: add register access helpers
  platform/x86/intel/pmt: use a version struct
  platform/x86/intel/pmt: support BMG crashlog

 drivers/gpu/drm/xe/xe_vsec.c              |  20 +-
 drivers/platform/x86/intel/pmt/class.c    |  15 +-
 drivers/platform/x86/intel/pmt/class.h    |   3 +-
 drivers/platform/x86/intel/pmt/crashlog.c | 469 +++++++++++++++++-----
 4 files changed, 392 insertions(+), 115 deletions(-)

-- 
2.49.0

