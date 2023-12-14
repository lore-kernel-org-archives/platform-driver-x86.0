Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zfoz0l3Z"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5D7123;
	Thu, 14 Dec 2023 08:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702569853; x=1734105853;
  h=message-id:from:to:cc:date:subject:mime-version:
   content-transfer-encoding;
  bh=l5WezQ4o+i/K7M7JIibngu66sNFZqkUEm5v4/5O/tF0=;
  b=Zfoz0l3Z2rE7Ae0HXE4kSd6ZQrkj9ivS9eYnwTbtoSGCNkKVPZJ2dANb
   ScshdGgJF/vywbGUptuNAGarbQ0GqwCY8yZ0/OYU1A9vCIra3QUSeF5Ca
   a+TvTCVOyrTjFyr+i/Ce0k99Eqh9ZcyqDTEG4MGs2GiRw+tZgTGu92MsX
   xyv3RrLxDarugCv0Kk17JoddmJ1hBmVqd/S1yCMnPGTPVTwKaaq736XlB
   BNyDuaDmviMGze8vKHSC96+sI193PGT58F+O8sJzaWkWPYJjGhjgi5+3M
   2MYKc9vn4lEkQ5boHu40scV6dmNixCmBvGQXB65xmDeZp+b1g9ELdmUfi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="375294417"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="375294417"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 08:04:11 -0800
Message-Id: <cdf76a$lddk7@smtpauth.intel.com>
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="22460039"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.49.39])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 08:03:43 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Date: Thu, 14 Dec 2023 17:59:36 +0200
Subject: [GIT PULL] platform-drivers-x86 for v6.7-4
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a fixes PR for platform-drivers-x86 for v6.7.

Changes:
- tablet-mode-switch events fix
- kernel-doc warning fixes

Regards, i.


The following changes since commit 3494a594315b56516988afb6854d75dee5b501db:

  platform/mellanox: Check devm_hwmon_device_register_with_groups() return value (2023-12-04 15:01:46 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.7-4

for you to fetch changes up to 7bcd032370f88fd4022b6926d101403e96a86309:

  platform/x86: intel_ips: fix kernel-doc formatting (2023-12-08 13:21:49 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.7-4

Changes:
- tablet-mode-switch events fix
- kernel-doc warning fixes

The following is an automated shortlog grouped by driver:

intel_ips:
 -  fix kernel-doc formatting

intel-vbtn:
 -  Fix missing tablet-mode-switch events

thinkpad_acpi:
 -  fix kernel-doc warnings

----------------------------------------------------------------
Hans de Goede (1):
      platform/x86: intel-vbtn: Fix missing tablet-mode-switch events

Randy Dunlap (2):
      platform/x86: thinkpad_acpi: fix kernel-doc warnings
      platform/x86: intel_ips: fix kernel-doc formatting

 drivers/platform/x86/intel/vbtn.c    | 19 +++++++++++++++----
 drivers/platform/x86/intel_ips.c     | 30 +++++++++++++++++++++++-------
 drivers/platform/x86/thinkpad_acpi.c |  6 +++---
 3 files changed, 41 insertions(+), 14 deletions(-)
