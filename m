Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF13036BCCC;
	Wed, 22 Jul 2026 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723057; cv=none; b=B/V8Jdjf3QD5D0CHqVPSkAFwE1fGp3ieWMUxvvNahQodX59pw0K7UkW9xUzY4a1lAAL1wmUR0qFJCjDsUu6mCoTOdQM32flC6QulKHsRMo12NFt2z1Dt2e8shhUc9ib+lkyWYvHiQif7glbrF6sD4EmNHCxWGZ2ahIbCOG1MRAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723057; c=relaxed/simple;
	bh=z9tgZJ21PfhU7zFtF5eJzm+8vbEsC5DvMnaFHP5ise8=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=ngeUSXmiVUdZqHRILf1XIyOZ7eS/ylpY57hefMNcAmLB4i1OyzJ78283tfCssSTFnKmooUPfDcXnEnBbUyQ0Olb7sxkG6sK44e4XtyrVZh5PnV67I+831B0YFPma0ATZ8N15Stq8HxW2hbBY9ShfJKsK+iEbOiydLERaN+Z5oG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+NFcwYJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+NFcwYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784723051; x=1816259051;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z9tgZJ21PfhU7zFtF5eJzm+8vbEsC5DvMnaFHP5ise8=;
  b=Q+NFcwYJ2Rf9PnRYDCqx0+CPsOhy90727Vdro5dcjGxHepgYPSU8S7YJ
   cWdoq3jQfylekkTxmvFWlgq0+ugc7rW2mESArHDOYcjlMELO1I3vtYLoj
   uMq1iaAx2D86sayPYsxZbLFZJNuWVMK9MXE1YjXM1Ardsn3fJAL2WOrba
   /Rh3df+8TKdrbDx8iSjAm7IIgbUG/ruMD4yOJi9Cr9BSezA2Ji/BNsFR2
   jjIeRMsZ2YuxFHN1wsKxakBHGu5YgaJEy7Ra2jX5KCrmK4158L/WRU2iP
   KdBSP0bMhHa7spWBMXgMQDRIARbG78WhPkuiJoPmRuqD75Ui1/zrHtmtw
   Q==;
X-CSE-ConnectionGUID: 2cv8ZbNKT2q/BPfuT+WyXQ==
X-CSE-MsgGUID: /iQDzqPQQBe6lGI81G0yxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85118192"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="85118192"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 05:24:09 -0700
X-CSE-ConnectionGUID: nQwk/peYQGWiC1K2/p1Dkg==
X-CSE-MsgGUID: 0eMp6scZR6yybtQkdEhEag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="254678243"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.200])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 05:24:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Wed, 22 Jul 2026 15:23:07 +0300
Subject: [GIT PULL] platform-drivers-x86 for v7.2-3
Message-ID: <pdx86-pr-20260722152307-1841517800@linux.intel.com>
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

- asus-wmi: Revert retaining battery charge threshold on boot due to
            userspace regression. Userspace assumed (errorneously) a
            non-zero return code from sysfs read implies feature is not
            supported but the correct way would be to check file
            visibility instead. This results in the kernel change
            breaking the functionality completely. Thus, we are taking
            timeout on the kernel side to allow userspace to sort their
            problem first.

- intel/vsec: Free ACPI discovery data allocation on error paths

Regards, i.


The following changes since commit 2726b5758f80a546a4ddeec5019e72035a7fa166:

  platform/x86: amd-pmc: Use correct IP block table for AMD 1Ah M80H SoC (2026-07-07 20:10:13 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.2-3

for you to fetch changes up to 78bf392ba77dd8b2a25656e489449d2f91cfd1eb:

  platform/x86: asus-wmi: temporarily revert to setting a charge limit (2026-07-10 20:32:00 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v7.2-3

Fixes

- asus-wmi: Revert retaining battery charge threshold on boot due to
            userspace regression. Userspace assumed (errorneously) a
            non-zero return code from sysfs read implies feature is not
            supported but the correct way would be to check file
            visibility instead. This results in the kernel change
            breaking the functionality completely. Thus, we are taking
            timeout on the kernel side to allow userspace to sort their
            problem first.

- intel/vsec: Free ACPI discovery data allocation on error paths

The following is an automated shortlog grouped by driver:

asus-wmi:
 -  temporarily revert to setting a charge limit

intel/vsec:
 -  free ACPI discovery data on early errors

----------------------------------------------------------------
Denis Benato (1):
      platform/x86: asus-wmi: temporarily revert to setting a charge limit

Yousef Alhouseen (1):
      platform/x86/intel/vsec: free ACPI discovery data on early errors

 drivers/platform/x86/asus-wmi.c   | 26 +++++++++++++++++++++++---
 drivers/platform/x86/intel/vsec.c | 17 ++++++++++++-----
 2 files changed, 35 insertions(+), 8 deletions(-)
