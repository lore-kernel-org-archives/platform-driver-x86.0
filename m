Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246FA3DCD84;
	Thu,  7 May 2026 11:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153755; cv=none; b=IIOHX9rQzH+DuZ+Up8ds9KxVznluTpPXu57ccM85QqxquWX8nkSYrcID6o23MVZCsEG3VhCJRrBS07EmpaXAucUVShwHiXvbKTmgRBLgWJGtFILeq0HhCDH7ucgrzFHvKOFm6E+JO5A1g3q+sDyvIzknhEvHAWmFEgcDUv8Qies=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153755; c=relaxed/simple;
	bh=gMa+R8VrzAL2rx0FjDlnuKTi/T5lt0P6fNfi52hL1jg=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=KCiS6eB9gMGx2F3hucT6ss8sVbRhsWg2ENLCW7AyqOG8N/FGEGeBVaE45owMI7gjkMfsxibr2uv6EYss+XIXFjQy8gutHLvncwa7XHgCGbo3cSr9wyV1TIop08ZVLEB77WmwHUGzPcPpYfHHng9f4k3e/EvxkfJftcagB3+DdZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtyIU7jk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtyIU7jk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778153754; x=1809689754;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gMa+R8VrzAL2rx0FjDlnuKTi/T5lt0P6fNfi52hL1jg=;
  b=OtyIU7jk9i3cbFgP4BOEWSFRzo1j6MCy4z7gfCGrp2gEIbo1Opd+xynQ
   GG86xddwcsjz+/VrNTPExoKofWBR6XLyrbt5IMjbnqPa5ugj6YAu1c1yO
   Jz2HgV+l3kullulJZSBNw9Vugrdvp3X0b9/MQz6We2BqM8R6CZ0WpkRvA
   Jh73bxJAYSec9mGbW8WUrIIIbmMS6PWsR9kbabqTPCE2X5LznyE8W1+Rg
   fvtsZ9tcPNPZLtWrHBAZbBNutNCG/JqiMIawJ+D7I+IpulJGqUVtZOmFa
   HGbi/vgHwNFMNYHLEV9Phk1HzIPVRrWLMRpSMQPREM5oWRWT11fOB4bbl
   g==;
X-CSE-ConnectionGUID: cfQcd3vASTiik3dFSxf7Nw==
X-CSE-MsgGUID: FyR7MoKRTHGCF6VaERtPhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="104558476"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="104558476"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 04:35:54 -0700
X-CSE-ConnectionGUID: JijRafLhReOxgHxDZwTAfg==
X-CSE-MsgGUID: Rep8hvTDSZelhX2WYtdh4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="233360923"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.116])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 04:35:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, Thorsten Leemhuis <regressions@leemhuis.info>, Krishna Chomal <krishna.chomal108@gmail.com>
Date: Thu, 07 May 2026 14:33:43 +0300
Subject: [GIT PULL] platform-drivers-x86 for v7.1-2
Message-ID: <pdx86-pr-20260507143343-184358751@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v7.1.

Fixes

- hp-wmi: silence unknown board warning for 8D41

- lenovo/wmi-other: Fix uninitialized variable in fan RPM handling

- wmi: Check min_size also when ACPI does not return an out object

Regards, i.


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.1-2

for you to fetch changes up to 863810d4985ad214f70c1623f24384ccc850f2a2:

  platform/x86: lenovo: wmi-other: Fix uninitialized variable in lwmi_om_hwmon_write() (2026-04-30 15:41:18 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v7.1-2

Fixes

- hp-wmi: silence unknown board warning for 8D41

- lenovo/wmi-other: Fix uninitialized variable in fan RPM handling

- wmi: Check min_size also when ACPI does not return an out object

----------------------------------------------------------------
Krishna Chomal (1):
      platform/x86: hp-wmi: silence unknown board warning for 8D41

Kurt Borja (1):
      platform/wmi: Fix unchecked min_size in wmidev_invoke_method()

Yufei CHENG (1):
      platform/x86: lenovo: wmi-other: Fix uninitialized variable in lwmi_om_hwmon_write()

 drivers/platform/wmi/core.c             | 3 +++
 drivers/platform/x86/hp/hp-wmi.c        | 2 +-
 drivers/platform/x86/lenovo/wmi-other.c | 2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)
