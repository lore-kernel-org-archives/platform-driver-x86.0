Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9A113D897;
	Fri, 17 Jan 2025 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737128403; cv=none; b=MnQksgyMzTLVrcZV5Xlq8KMmIauz6DtN6MxTu1EPEo2DX6cJcahr8g5tHlWhCAUlsoh+iBS0fvKWU+OMdjjYU+NgBfpUjJvNjXFLUjoODDHCB//54uNKAWIsLZR1zi8aIFvlMYVNGbVCxLo2Z4vLwC3J1bZu/NlU9FWc9Mm9Fwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737128403; c=relaxed/simple;
	bh=vzosuO+PBp35NF3qcT9G/aPKAZei2LtqVukLeSr4bI4=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=XKPTGKeDJ9eFKm+lBsfFN50DaHK9QmcU3kl5qtFd2G1T8O30ADUwo5xPYGf2IuxMUaVa5T9bFzpDpEOGwuIowadkPgx+Ybw1JpxqyARYB47qiWYHYOo4z5Sn85+T04HXR7Fu6fk+f0OqIVa87xZBikHAoAb7mvNi+w+UEM2TMb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIMG9OSp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIMG9OSp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737128402; x=1768664402;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vzosuO+PBp35NF3qcT9G/aPKAZei2LtqVukLeSr4bI4=;
  b=kIMG9OSpvCQbCTutjFtH0D8az/C4S7e623wZdkCud9I/7zeVJAQ+1dC+
   VsrREchGh9ZAoohZLzI9aYcFlz4LtqBC7uc1IY1auZVO3g+B9NH8mEiw0
   ONjFY/RL6CsQwKl5DAVWvJEzjtgCrWB6T2g5dZvGFKcSkvTKVpHLpx8yy
   0KwhqkioPHebAjxipQpmNRH9ew7YJSr/I4f6HE66xW4wUaBh8XVTOEUPR
   eR39xdDxqvrFkTSEllVxJbfX5+7+Z9tQwkrgGAiOrkKZtyXlzoFchAZLd
   /MYe553bDkWMo/RncIIoJ6rgJtbomSswb5yX17hMwBCSkMNfOSlM+t+8E
   g==;
X-CSE-ConnectionGUID: zSEVWcpPQXiqHMT5TEnYWg==
X-CSE-MsgGUID: 2UYE/WUdSaClWs8k4UDSDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="55111620"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="55111620"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 07:40:01 -0800
X-CSE-ConnectionGUID: +bMmmPmERqu/0Nlx5mr1+Q==
X-CSE-MsgGUID: U4+0+KZCQpiiHFm5weMMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105881425"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.76])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 07:39:58 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Date: Fri, 17 Jan 2025 17:38:24 +0200
Subject: [GIT PULL] platform-drivers-x86 for v6.13-6
Message-ID: <pdx86-pr-20250117173824-132461248@linux.intel.com>
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

Fixes:

 - dell-uart-backlight: Fix serdev race

 - lenovo-yoga-tab2-pro-1380-fastcharger: Fix serdev race

Regards, i.


The following changes since commit 1d7461d0c8330689117286169106af6531a747ed:

  platform/x86: intel/pmc: Fix ioremap() of bad address (2025-01-07 17:30:11 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.13-6

for you to fetch changes up to 59616a91e5e74833b2008b56c66879857c616006:

  platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: fix serdev race (2025-01-14 18:30:33 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.13-6

Fixes:

 - dell-uart-backlight: Fix serdev race

 - lenovo-yoga-tab2-pro-1380-fastcharger: Fix serdev race

The following is an automated shortlog grouped by driver:

dell-uart-backlight:
 -  fix serdev race

lenovo-yoga-tab2-pro-1380-fastcharger:
 -  fix serdev race

----------------------------------------------------------------
Chenyuan Yang (2):
      platform/x86: dell-uart-backlight: fix serdev race
      platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: fix serdev race

 drivers/platform/x86/dell/dell-uart-backlight.c              | 5 +++--
 drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)
