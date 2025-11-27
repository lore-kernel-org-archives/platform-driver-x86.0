Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69215329C6D;
	Thu, 27 Nov 2025 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236190; cv=none; b=hAADxT/3jiMNz4MES/LyfwqqwLHFnXhWgJsJ1sarIzvNwTLEAZeIYz7gHNkxPyvF0ZebSy9ZrWNjIAtDIQkaDwzuhOxKk6Og3JwmnzlmlFAw2iTYXO5wMCu+V77Q619bIJP/o6BjhCG+7tCj/LGcrWPTCCJX22jinyQ8pFxZisM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236190; c=relaxed/simple;
	bh=MphIfCT7q9hTfgHzDBS6FXRHHZe6RCy8DeimQHPL06I=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=VVqFmR4p1We5YmVf0AgRpV3V7RZpCj1RmdgVfJL0vqLFDZbGf7C40llhut1pFlwFMCsaIWW2+xkPNUnkwi0Fc8k+WmnnxRhvsFLlsWfQv+h9WBpQP58h6yCUB6TIDZT7BW+qqMBgTvIjAyOAqNKkmCl2CslM/mOHE4sj3eBdCx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HG4hABCx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HG4hABCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764236189; x=1795772189;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MphIfCT7q9hTfgHzDBS6FXRHHZe6RCy8DeimQHPL06I=;
  b=HG4hABCx43MW10aeQgtTYf6u6DTA5kQ1VXri31G6FVkAu4RBy9tc5ER8
   bih5X/V9Ff7yy/QytreslM6xkBRlR7nYfFqbKUfFge3ZHe78zRXBAVrJX
   iynJFp8qhOOB+lmKxly4I4yYqvdaCGfIpgJIFNU7i/ZXpczFZKmI1hwMP
   r+XiwNSV8DbVuCUtUR8DgD6j74jIxJz5rWa2ceA4EcLwn7JgNkUyi2XCL
   w4FUnjaMe8Yc/sbSjJqNYJRF6Jy6WKjjzcJMA2dtaigmCssJs5xFSavyy
   YGcQ6Mhkh7rRonv0Qb+IXeqFFMbXyb7Tgar26qQPFbzUy3yMArK99skW7
   w==;
X-CSE-ConnectionGUID: opr3ZUaDRymsKXXH5KwyvQ==
X-CSE-MsgGUID: 7FsceHLLQJCiQSgX9+/P8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70147947"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="70147947"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 01:36:29 -0800
X-CSE-ConnectionGUID: bj/5g9pWT3CXspztTJnm8A==
X-CSE-MsgGUID: B7ssRvniQR+3u2B20JK7lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193003009"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.27])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 01:36:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Thu, 27 Nov 2025 11:35:20 +0200
Subject: [GIT PULL] platform-drivers-x86 for v6.18-5
Message-ID: <pdx86-pr-20251127113520-199883@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v6.18.

Fixes:

- arm64/thinkpad-t14s-ec:

  - Fix IRQ race condition

  - Sleep after EC access

- intel/punit_ipc: Fix memory corruption

Regards, i.


The following changes since commit db30233361f94e1a84450c607989bdb671100fb6:

  platform/x86: intel-uncore-freq: fix all header kernel-doc warnings (2025-11-18 09:37:21 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.18-5

for you to fetch changes up to 9b9c0adbc3f8a524d291baccc9d0c04097fb4869:

  platform/x86: intel: punit_ipc: fix memory corruption (2025-11-24 15:03:22 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.18-5

Fixes:

- arm64/thinkpad-t14s-ec:

  - Fix IRQ race condition

  - Sleep after EC access

- intel/punit_ipc: Fix memory corruption

The following is an automated shortlog grouped by driver:

arm64: thinkpad-t14s-ec:
 -  fix IRQ race condition
 -  sleep after EC access

intel: punit_ipc:
 -  fix memory corruption

----------------------------------------------------------------
Dan Carpenter (1):
      platform/x86: intel: punit_ipc: fix memory corruption

Sebastian Reichel (2):
      platform: arm64: thinkpad-t14s-ec: fix IRQ race condition
      platform: arm64: thinkpad-t14s-ec: sleep after EC access

 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 16 ++++++++++------
 drivers/platform/x86/intel/punit_ipc.c        |  2 +-
 2 files changed, 11 insertions(+), 7 deletions(-)
