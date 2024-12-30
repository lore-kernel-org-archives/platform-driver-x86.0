Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0071ACEC4;
	Mon, 30 Dec 2024 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735582831; cv=none; b=LornfzzhdKM8xZwnW+zhxEh/KqJ5iuRIS3FB7Je2tadlwo+7Qldl5gNcAwk4suMjRM4QxwMo6az/U5/XrHiFCjuRignci+pfLgcHK/TaPEfjCCG/4lvKChdq8VAvOzlgMhaspN//izygtMWGIKzytclVrEDeXAmXSbtccDoK5II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735582831; c=relaxed/simple;
	bh=5DHofK4/tHV0Rqubqqdz9u71XwLgVPX229ADG0bZqQs=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=BzyiL+HZCcZZhOTCUL2OlInqyPc30uQatrPUc6fFkNhhYmIT/qUzoAhPals1HpqMMdziBaARpxSrqs4kWSO6gijfVpiPKium8dvgA7rZqrTlqObmEuhy0U4rHDZD7k01ckTbSNVBpHmRM9XU+4wDc4ugNmQpEFv9Vv1Hwh+8syM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXU812+6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXU812+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735582829; x=1767118829;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5DHofK4/tHV0Rqubqqdz9u71XwLgVPX229ADG0bZqQs=;
  b=LXU812+6M2H/bKfactbb31xYS/wGjO9A5V6I3MLueDL6XJPtUe9pU6Ot
   gTQw7/2SoPVSBhu9H8AQCvTSftU1BhW0h8h5cZVak5EsY5UvPZ26l6Kfy
   BpV0qBaVw+hRtD0eQTttw2+IAFH0wl+cIIZoU3cspaxf5b1HU7vUlJCfb
   YIFxhrP7QBHOXTAz1rCe20hRQ9epXsgI+oQtpmTAOYjo0bT7t2Ax4figW
   V/FBI5GgR9Oe5xGZkUhJsiI5RrF03r9uAJW4D1BtleCoJozmYHfzOOQzW
   2d41qzByo+pVhVasj240zss6hwOt5WYLfwMrs+p2N2H/S8D34F9qAMNFt
   w==;
X-CSE-ConnectionGUID: 6eFO9YIpQDuZXwYU+0TW+Q==
X-CSE-MsgGUID: 7YsG7XvXRnGRKsCpCURK+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35752986"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="35752986"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 10:20:29 -0800
X-CSE-ConnectionGUID: 0oZUobIRQ9KSjRpgDiMw8w==
X-CSE-MsgGUID: eXLlW3+4SHWpN27Wo6CSQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101704878"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.19])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 10:20:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Date: Mon, 30 Dec 2024 20:18:39 +0200
Subject: [GIT PULL] platform-drivers-x86 for v6.13-4
Message-ID: <pdx86-pr-20241230201839-1256110449@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v6.13.

Fixes and new HW support:

 - hp-wmi: Add HP OMEN 8 to thermal profile list and use timer quirk

 - mlx-platform: Fix PCI device refcount leaks

 - thinkpad-acpi: Support a new platform profile toggle hotkey

Regards, i.


The following changes since commit 83848e37f6ee80f60b04139fefdfa1bde4aaa826:

  platform/x86/intel/vsec: Add support for Panther Lake (2024-12-11 16:00:56 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.13-4

for you to fetch changes up to 7e16ae558a87ac9099b6a93a43f19b42d809fd78:

  platform/x86: thinkpad-acpi: Add support for hotkey 0x1401 (2024-12-29 16:55:10 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.13-4

Fixes and new HW support:

 - hp-wmi: Add HP OMEN 8 to thermal profile list and use timer quirk

 - mlx-platform: Fix PCI device refcount leaks

 - thinkpad-acpi: Support a new platform profile toggle hotkey

The following is an automated shortlog grouped by driver:

hp-wmi:
 -  mark 8A15 board for timed OMEN thermal profile

mlx-platform:
 -  call pci_dev_put() to balance the refcount

thinkpad-acpi:
 -  Add support for hotkey 0x1401

----------------------------------------------------------------
Joe Hattori (1):
      platform/x86: mlx-platform: call pci_dev_put() to balance the refcount

Mingcong Bai (1):
      platform/x86: hp-wmi: mark 8A15 board for timed OMEN thermal profile

Vishnu Sankar (1):
      platform/x86: thinkpad-acpi: Add support for hotkey 0x1401

 Documentation/admin-guide/laptops/thinkpad-acpi.rst | 10 +++++++---
 drivers/platform/x86/hp/hp-wmi.c                    |  4 ++--
 drivers/platform/x86/mlx-platform.c                 |  2 ++
 drivers/platform/x86/thinkpad_acpi.c                |  4 +++-
 4 files changed, 14 insertions(+), 6 deletions(-)
