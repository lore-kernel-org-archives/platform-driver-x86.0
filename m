Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6D8205ABD;
	Fri, 10 Jan 2025 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736519137; cv=none; b=TU/Vda9zwAWPPBRy6FtHqTr0gSkUu3vHmHMVOswJ3/4P+1vN2psu4q/KoREtB3Zd1pRIWTutX5vmrZh6Vmks5eyGBDNxhgLSYvxyDZnITGUOZMwebRboEy+FxkZBiHXpvIVZzIBD3V59lgspUbQ67Hpy4hEj8L5cyCW7BW2JehQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736519137; c=relaxed/simple;
	bh=Wd6Dnz9BDwYHxMWmkv+YY/i+fctmykA5dc8YapYx1sM=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=TSwN0JTVEYaRZeekoUQ12P6/GvL873MIkBhP3u4XSRAd3yJmWPph+DasGxUfqF0XL3TQBafz5iEHYjUtcsmfdW59N/tUFLvC2lQQyPlYJXv5vBB8hCq7DoAZsdloWTzA6yNPinvWEX2g+F6Bmr045ZTWlHVMu7aERJK7CbotsXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZOrWb/3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZOrWb/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736519135; x=1768055135;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Wd6Dnz9BDwYHxMWmkv+YY/i+fctmykA5dc8YapYx1sM=;
  b=GZOrWb/3H2+rXcxlB48djUML7xXnU9VoXuiduEZVr8gKRjBV+UZ45HM0
   M9mPK9WpELf/Am7Lo93PHhdapklri2+3/OCZntjfpx6wYBRh2TrYks6Fo
   M4DcCnxD00xZQgtXaide6zYWd5AAG85MRgcKZULN6a/k3ceXs16uRQVR/
   xkhUYfTGt0hdl8F+S2JUnCIZCQyr58cTJ4bVtEZoOqKT1D3a0aIB7nAuH
   DXYm16cSwTSy0LZWPoZqUPIR5HUeD7c9+9gwTBdTNqoZF2HxTY+SWIsD4
   onmjzo2Jf0VPIraXjykasNFJ7N5nlmE5B9B3e2BDV+KeVnIVlSdHMKFZI
   A==;
X-CSE-ConnectionGUID: 7Y6hUa1KSE2CBQgFUKvKew==
X-CSE-MsgGUID: Zy4LJhWoSVS5pZo/Ur5tqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36922366"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36922366"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 06:25:35 -0800
X-CSE-ConnectionGUID: ozFKWr6yToyoP1MGevlGVA==
X-CSE-MsgGUID: A3yJ49FzR1qu0WrdIlHFuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104260763"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO localhost) ([10.245.244.158])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 06:25:33 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Date: Fri, 10 Jan 2025 16:23:13 +0200
Subject: [GIT PULL] platform-drivers-x86 for v6.13-5
Message-ID: <pdx86-pr-20250110162313-1507428@linux.intel.com>
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

 - amd/pmc: Match IRQ1 wakeup disable with the enable on i8042 side

 - intel: power-domains: Clearwater Forest support

 - intel/pmc: Skip SSRAM setup when no additional devices are present

 - ISST: Clearwater Forest support

Regards, i.


The following changes since commit 7e16ae558a87ac9099b6a93a43f19b42d809fd78:

  platform/x86: thinkpad-acpi: Add support for hotkey 0x1401 (2024-12-29 16:55:10 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.13-5

for you to fetch changes up to 1d7461d0c8330689117286169106af6531a747ed:

  platform/x86: intel/pmc: Fix ioremap() of bad address (2025-01-07 17:30:11 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.13-5

Fixes and new HW support:

 - amd/pmc: Match IRQ1 wakeup disable with the enable on i8042 side

 - intel: power-domains: Clearwater Forest support

 - intel/pmc: Skip SSRAM setup when no additional devices are present

 - ISST: Clearwater Forest support

The following is an automated shortlog grouped by driver:

amd/pmc:
 -  Only disable IRQ1 wakeup where i8042 actually enabled it

intel/pmc:
 -  Fix ioremap() of bad address

intel: power-domains:
 -  Add Clearwater Forest support

ISST:
 -  Add Clearwater Forest to support list

----------------------------------------------------------------
David E. Box (1):
      platform/x86: intel/pmc: Fix ioremap() of bad address

Maciej S. Szmigiero (1):
      platform/x86/amd/pmc: Only disable IRQ1 wakeup where i8042 actually enabled it

Srinivas Pandruvada (2):
      platform/x86/intel: power-domains: Add Clearwater Forest support
      platform/x86: ISST: Add Clearwater Forest to support list

 drivers/platform/x86/amd/pmc/pmc.c                          | 8 +++++++-
 drivers/platform/x86/intel/pmc/core_ssram.c                 | 4 ++++
 drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 1 +
 drivers/platform/x86/intel/tpmi_power_domains.c             | 1 +
 4 files changed, 13 insertions(+), 1 deletion(-)
