Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1A11D47AD
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 May 2025 15:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407865; cv=none; b=YEymx5vXFYyz5QAlDhOpBG1QiJwpQaz0LrWLn7MoChM9KI3zAZ+A7pD9hAEQgTrjhCoXoZ/bn33nWaRrsHMq83slGkWBxolWKXBHrJ/QThjTzk+ygFdC895CUZiFOvxkcBw1Is69WnJL1l+kIUSby77zwIgAVWKXK5g+6xajMUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407865; c=relaxed/simple;
	bh=+Ty8uy4zljBRVZsRl1PtuioILiG+mgp0nGhE0UnpPCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W9Gp+VzE0WvYd+KMEq2npNZKWfizPriRBkqNUZyjk+NLZEtghDE4/gwYSY6+epZgybtY8NgFXDbUK1UvhTPhxWJLCCpgKootm9VS8KLEvkmEDDqboK6DUkaS2oKeFpkvdqdTgNRomkz1nCtC49YTPnkD6rSphi+lBME3IZ1d8xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntPjOJIZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntPjOJIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747407864; x=1778943864;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+Ty8uy4zljBRVZsRl1PtuioILiG+mgp0nGhE0UnpPCI=;
  b=ntPjOJIZISpwH5ai0zzB4F4yZ0zmL5dSq2gAh9YkY2uwilOhFJT2okCa
   9e3SyS9FAsUH1inluLEDHFznAyPg2W1ij4Tjb1k9rZOyoCjsmr72REB1k
   Ya2uPIrJgsPwINyg09zWzcSwVBk0cMeIIyfO9FrK/FlpqSiQ2BNZx2x+Q
   +SjQ5Y5XhmzOEgNQF0x6X8seTwRU9HItTxZvgXJe9tpY14wejMgEuTP7H
   QhkWn38KWljc9dB3/EtZ+OQBGiwgC21gSjQ2p2feHZMV4HDxiWtarouFb
   cey6bnQ2pcmwkChCdL18OJJdf4YYKSLIJfNU5PJZU3FL3afcLvaxlAwCO
   w==;
X-CSE-ConnectionGUID: u6NxMH1EQyCIlOFWyHLptQ==
X-CSE-MsgGUID: /A78QTJ4SquVMpcLGscaUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="59612910"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="59612910"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:04:23 -0700
X-CSE-ConnectionGUID: Y96jaGZyT+6AVelNFK9CWQ==
X-CSE-MsgGUID: UjG2aQwoQg+rSyE+ZvMYZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="139202913"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.225])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:04:22 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 0/4] Crashlog Type1 Version2 support
Date: Fri, 16 May 2025 11:04:12 -0400
Message-ID: <20250516150416.210625-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Intel BMG GPU device supports the crashlog feature,
which was exposed in an Xe driver patch
(drm/xe/vsec: Support BMG devices), however the version
of crashlog used by the BMG GPU does not have a supporing
PMT driver.

Update the PMT crashlog driver to support the BMG crashlog
feature.

Michael J. Ruhl (4):
  platform/x86/intel/pmt: crashlog binary file endpoint
  platform/x86/intel/pmt: update to bit access
  platform/x86/intel/pmt: decouple sysfs and namespace
  platform/x86/intel/pmt: support BMG crashlog

 drivers/platform/x86/intel/pmt/class.c    |  12 +-
 drivers/platform/x86/intel/pmt/class.h    |   4 +-
 drivers/platform/x86/intel/pmt/crashlog.c | 429 +++++++++++++++++++---
 3 files changed, 382 insertions(+), 63 deletions(-)

-- 
2.49.0

