Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8410F413D82;
	Fri, 10 Jul 2026 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682734; cv=none; b=TIkoNVwbv30d7wxKHxaEcwsZ42fXgl1qOfcgwLcDLjkfGQo6I5tLTifeNeez4mVLNlb2PUNmb0H2Qgjhtg4tQOvZg3XQVuni5j1giLKVUjC+WSq6GAcjsdKIHd4/+ku4gJoMaGuuzGQUplI1CW7tiP7f/5tegtupcGhFhajolQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682734; c=relaxed/simple;
	bh=QaHilCBaPuolbGUw8eHOc3xddWsXl8QFXDSCvH9BLIY=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=U4Xxevb5ovji8CrGXCK01Ypd86uhE+Qj4hS726XnZ29qVYOxhGxCwWD2hJRpzNFNIEb/8kUUuffy/R02wJGIh5Vp+Axq/sjuFwBh0zImqGYV+nhE4NkvijteInNUcTWg/CmPcYC3oG2yfRnSm5R4hDeatcAWwYzIkNg419IYr4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8mhiNHA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8mhiNHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783682727; x=1815218727;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QaHilCBaPuolbGUw8eHOc3xddWsXl8QFXDSCvH9BLIY=;
  b=X8mhiNHAWYmwtsObLBKwoLz9RseHzulWgOYnXFR5Y/UIRVNDX+yDtCmo
   ZFM64Sz3yA6Vd3zZRYndreytsygxg2wMRHdIwxnCmOFCXbBm+gCRgCeYJ
   9Wrdm4gQMpVKSSNUVIU3FgE0Gfl+Act+CWSoCAGlQHOCJoy0NvhyQBNh7
   g9QtyiSB9eIoEBx/m8OErndP19mIvdmayLxieY833HW/r7bLzeU4j8+UW
   8CadaQKDGywbAAmn31N1iCyluPZJx1W3huoWCY4UIjIN8cfa3KmrV81oL
   GRrV4yqBDurpbVadFFXiWIr3qlvov7wovBoaPBXK3q1/39dVICJSRzrTz
   Q==;
X-CSE-ConnectionGUID: IsYwl/z0RdK3wBmycHAd0w==
X-CSE-MsgGUID: I72JD4s1TciQJ7uCMAn1nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84431811"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84431811"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 04:25:22 -0700
X-CSE-ConnectionGUID: hUt/OGJ1S9ifOurzNhXqLg==
X-CSE-MsgGUID: E6iaGNhhSneGqFkBbv8OtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259758053"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 04:25:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Fri, 10 Jul 2026 14:23:57 +0300
Subject: [GIT PULL] platform-drivers-x86 for v7.2-2
Message-ID: <pdx86-pr-20260710142357-1409422743@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v7.2.

Fixes

- amd/pmc:
  - Use correct IP block table for AMD 1Ah M80H SoC
  - Avoid logging "(null)" for missing DMI values

- asus-armoury: update power limits for G614PR

- bitland-mifs-wmi: Fix NULL pointer dereference during suspend/resume

Regards, i.


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.2-2

for you to fetch changes up to 2726b5758f80a546a4ddeec5019e72035a7fa166:

  platform/x86: amd-pmc: Use correct IP block table for AMD 1Ah M80H SoC (2026-07-07 20:10:13 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v7.2-2

Fixes

- amd/pmc:
  - Use correct IP block table for AMD 1Ah M80H SoC
  - Avoid logging "(null)" for missing DMI values

- asus-armoury: update power limits for G614PR

- bitland-mifs-wmi: Fix NULL pointer dereference during suspend/resume

The following is an automated shortlog grouped by driver:

amd/pmc:
 -  Avoid logging "(null)" for DMI values

amd-pmc:
 -  Use correct IP block table for AMD 1Ah M80H SoC

asus-armoury:
 -  update power limits for G614PR

bitland-mifs-wmi:
 -  Fix NULL pointer dereference during suspend/resume

----------------------------------------------------------------
Daniel Gibson (1):
      platform/x86/amd/pmc: Avoid logging "(null)" for DMI values

Marco Scardovi (1):
      platform/x86: asus-armoury: update power limits for G614PR

Mingyou Chen (1):
      platform/x86: bitland-mifs-wmi: Fix NULL pointer dereference during suspend/resume

Shyam Sundar S K (1):
      platform/x86: amd-pmc: Use correct IP block table for AMD 1Ah M80H SoC

 drivers/platform/x86/amd/pmc/pmc.c      | 36 ++++++++++++++++++++++++++-------
 drivers/platform/x86/asus-armoury.h     | 10 ++++-----
 drivers/platform/x86/bitland-mifs-wmi.c |  8 ++++++++
 3 files changed, 42 insertions(+), 12 deletions(-)
