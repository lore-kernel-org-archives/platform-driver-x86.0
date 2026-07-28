Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EF23CF694;
	Tue, 28 Jul 2026 20:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785270369; cv=none; b=Au3p2qlENgi58bLehHCmgx57JHippBQdJ9GLxhdv8x+6E7/TViQL/x8nAYqFNOQWdO+d63M97zaGoWxxTfnPNfcou6ncihP/F4qzhj4MD4bdHdeDq43Rfu2UMPTWPCZXQ7PdMqj+9Z/5VobOgI+T+HZ3G/huwJO0vqVG7CZbyd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785270369; c=relaxed/simple;
	bh=s2rxbhO9rmWxGNbgIkfys5JHvJ8I6R/SMrETV0e1dFU=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=Mb5CCnlidXfjnPZCTG495wkuJ6Al/ijarjE9RqbqqBiLr/2tBswYvuDJ4gSD5VQfTXE/SKddoPqdbEYCFtgYS0n34SpDGHIRzfo10tEudOAS+Dckv5cCLLggGzwM90E9E/YcboWNKTP8NP87Y39zvbbLjzFXl4N68lzsDGhgSNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2zFZUj0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2zFZUj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785270368; x=1816806368;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=s2rxbhO9rmWxGNbgIkfys5JHvJ8I6R/SMrETV0e1dFU=;
  b=X2zFZUj0OEddSueleBeikhtoLOcGr4Nko1oXz42H5Zncw++Dv+pVSmym
   pCEobbgdQEnB7LeCM7IeUsOg6ySmyc/n112o/VVQ43Fjs00hG/gqK34PS
   qSKGecZDWjH/Bdx/S8rW31IfR4k1vM5bvatsGeAwIZmQ0qidzFUKfqXAQ
   yjB9IgXH/gmCHc/o87aMSBKfa11KOOy4ntu7yiIJA66/WcWNcsLDMOyGC
   86lBm17gjR0SUsoHWLeA6bU1bp0F1V/DjNJP1PRatDPqCDr9GEKOpbcDt
   iZLIl8txn2sbPp3A9JXaDY+dy9BPj1MeGdF/ULcxDIU/98Euri7UXOV+Q
   g==;
X-CSE-ConnectionGUID: JIRU1Qr7T7W5bN2zubL41w==
X-CSE-MsgGUID: 2knDVdykRQmxf1XiLdZSmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89691241"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="89691241"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 13:26:07 -0700
X-CSE-ConnectionGUID: gJTWDM8zQg6d/atELMgIzA==
X-CSE-MsgGUID: Yia36kz9Scu2aSP4Qh8nYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="298027555"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 13:26:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Tue, 28 Jul 2026 23:25:15 +0300
Subject: [GIT PULL] platform-drivers-x86 for v7.2-4
Message-ID: <pdx86-pr-20260728232515-162813849@linux.intel.com>
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

- dell-dw5826e: Fix ACPI _DSM function index and bitmask usage

Regards, i.


The following changes since commit 78bf392ba77dd8b2a25656e489449d2f91cfd1eb:

  platform/x86: asus-wmi: temporarily revert to setting a charge limit (2026-07-10 20:32:00 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.2-4

for you to fetch changes up to 39490ec6063d9dc3d995b7b48fc5106cd361a547:

  platform/x86: dell-dw5826e: fix ACPI _DSM function index and bitmask usage (2026-07-24 19:21:39 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v7.2-4

Fixes

- dell-dw5826e: Fix ACPI _DSM function index and bitmask usage

The following is an automated shortlog grouped by driver:

dell-dw5826e:
 -  fix ACPI _DSM function index and bitmask usage

----------------------------------------------------------------
Surendra Singh Chouhan (1):
      platform/x86: dell-dw5826e: fix ACPI _DSM function index and bitmask usage

 drivers/platform/x86/dell/dell-dw5826e-reset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
