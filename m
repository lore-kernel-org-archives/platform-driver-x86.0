Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871523;
	b=UWOGHanmqd6fEjldiiwGuMFAXp69M+HDrlTXIF/ucauYp4qMbsEaOXwPo3nuVL+s6K/0
	 77ANdfI7/xqpKl6691S+Q1T2jCPUkFHGEIuhpZOHOTKL0shfPnlj02sYstTOZXIynspa4
	 usEMuYshDdET3AEWxJjdluDTr2BJuymr3iAx70PccuhNHoMI2onc4Ed8enfFmcV9jEWC1
	 XcLe2PgfpQeh1OklkbMEtrduPMJOfXdTXH6lJLIQMSnjKBLCZDFWYQnAsacLX1dosZ/z0
	 Evr4G6hI8ivjky1IKomBWOBLwy/BM2JUDSXodhvN0p+tjsVdTrwBFR34r1o8Hdofwxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871523;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Date:
	 Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/dGhVSuKdi1xxVlq9dPWbCRgclwBGEMzplmWMZ8WGuA=;
	b=f80W8W/kHpQ5Lv3GSMkjNwtyriWFJbLzPTaSkkyVpO/HqAy0pit4I0/OR2wcWQyzViSg
	 gIGybRxdM2NF5h28MrDedhlTaad7JgTjqMSoguV7Ae7p5ydqqmFUsOtc79gH6nzsZbB8L
	 ZRx9gbnHvCXqS4cNOwMaJjuMCpMwvutP4euhG7k4Mk04PQuTVt6RZx6YzmC8gVOvU72t/
	 3RSOnYfkHzG4tVKSY4dac+0nF+TAJon2f7C49tsGCCwGUoI8wPm70e5RHUNpjIQhhFM3Z
	 RJMERGz8z61tA2Ah/SM9ojEaRaYcBjV3DDY7n4sMulhbEmV6h8mlRZ++PKKES/VPczg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ed3yBm8m;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607C606A32E;
	Thu,  5 Nov 2026 09:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3607C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ed3yBm8m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793871523; x=1825407523;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a+Xyx8JLtkZ+MrWZaTAqeyRXz1o1vzVa2SXdbydeRYU=;
  b=Ed3yBm8mpRZ+p5Mu8PkZqxKTLeuMYq41VilEXfklQMaBzWUkLxeUppyv
   FH1k/KEu2V7FOMdDQkx9XsbS6paQmR0JEHWNVQ00xTqCW33sPB3HrwTfI
   ABH3B640UgteZVc6qIZUcvD8WwDGwX5nWUasdQYWRU7TNr2Fv+qWB4433
   jJiTSEQKN9bMg5uEOZDTW7WDAAlYsnmh59JApXDx774yI79ucJcbHFy2H
   9Jlr0HO7aVisYSgvjYh5hGdZ+gSvtJsoFzz2wpLIJlwpxmzRAieM21yhD
   TYKSUV1PbCH6WlVsZdKAP8AfaI4cBvKpOaFIk0SRHomAZJ53gqlOAyKDa
   Q==;
X-CSE-ConnectionGUID: 8hHyMHdXSFyFsZgTWjuXLg==
X-CSE-MsgGUID: ZHdVHQ+bQ3eNrCbTYu3RfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2682436"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2682436"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:38:42 -0800
X-CSE-ConnectionGUID: KrrS9f3oT+WeN1PXqmOPHQ==
X-CSE-MsgGUID: pC4xApMeQyCDbFf34+WYNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6845781"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.191])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:38:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Thu, 05 Nov 2026 11:34:41 +0200
Subject: [GIT PULL] platform-drivers-x86 for v7.4-2
Message-ID: <pdx86-pr-20261105113441-239427279@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v7.4.

Fixes

- arm64: asus-glymur-ec: Resolve config loop due to THERMAL symbol

- uniwill-laptop: Add .hw_offloaded() to avoid leds subsystem warning
                  about missing callback

Regards, i.


The following changes since commit c339f4010dea8b0d754f84ace70cd1b089878ef8:

  Merge tag 'platform-drivers-x86-v7.4-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86 (2026-10-28 07:36:32 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.4-2

for you to fetch changes up to 086aeca907789bd2604f16f07bfc073b19015015:

  platform/x86: uniwill-laptop: Implement .hw_offloaded trigger callback (2026-11-02 13:32:40 +0200)

----------------------------------------------------------------
The following is an automated shortlog grouped by driver:

arm64:
 -  drop the vacuous THERMAL dependency from EC_ASUS_GLYMUR

uniwill-laptop:
 -  Implement .hw_offloaded trigger callback

----------------------------------------------------------------

 drivers/platform/arm64/Kconfig              | 1 -
 drivers/platform/x86/uniwill/uniwill-acpi.c | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)
