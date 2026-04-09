Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0458A27BF7C;
	Thu,  9 Apr 2026 11:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735161; cv=none; b=fVf7tOBxzhZbdeOBYjwlLarS8wl5cMa/At3xFT6cruSR0lH+hNGYTrcgZIaWXsASGjHfe4oxf7sDnediXFa2t5YyqKwX4Gv/zCi4Ca7BN446c3Ap6hgMcSJ6oYmDfY+tbaWJ7ySlme/dr3XwaBTzgqV8nAnoUZGlQB+ylhhtNGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735161; c=relaxed/simple;
	bh=h8++f52J1ZVf53xsU99RDIqW0KXJi+c06Hsl572nDBs=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=iiOrQfuTgiy1nRYVr8efOeaBZgMK2JtzikleL42lbVdF0Z9PcuvgXFvB4q4OPqNiaJzm5n/b2WBD6+BhMe+iYC4phvhltZhqFdAnwQGB05fKkPNOK6BWy+aZyIiu7K3JdxVNEgdTWKO6vE5quW7DMj3sfSucgp1JeUuHF6ISS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHf50SyD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHf50SyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775735160; x=1807271160;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=h8++f52J1ZVf53xsU99RDIqW0KXJi+c06Hsl572nDBs=;
  b=RHf50SyDaaR8NdjZGgq5bbi/N8WxRLVlaDDti43TiKKzX0wjV7REt94B
   7ninkphyBGausZGZW3JNwdgplu0gVk1oLh3doOXe+14n/Wi7J/jdcT0lU
   uvzkcxM4jOI4cQ0Kn5Gdcgf93Tf7KJMXHYuzK6VaBNo0aj6hg0bU2skw0
   bxvQ3/KfHTfEPDFDxu5WvxCi6A/XbtSs51QIzHVadpTRJltNM5yduHp2b
   YdETO0nhc4mBxvSziUYXTOyqLO+q7HCJUM5mzbEcvhIpmwHxQsTy5QoZO
   e8lLSycNQMjzKdBcSjlg6iJ3F4n8ePDoC/NrpujiG8CLATtctw/W1rAEd
   w==;
X-CSE-ConnectionGUID: emVEubjNQhu0078Fw4Ef9g==
X-CSE-MsgGUID: MmyLKnyQRRu8TJzNjuaL5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76640774"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76640774"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 04:45:59 -0700
X-CSE-ConnectionGUID: ZP9AloRuRO2BvfWc7SDIaA==
X-CSE-MsgGUID: +7jj62jwSq6t/E4YZoaZeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="228642214"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.197])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 04:45:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Thu, 09 Apr 2026 14:44:17 +0300
Subject: [GIT PULL] platform-drivers-x86 for v7.0-4
Message-ID: <pdx86-pr-20260409144417-2403128410@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v7.0.

New HW Support and Fixes:

- amd/pmc: Add Thinkpad L14 Gen3 to quirk_s2idle_bug

- asus-armoury: Add support for FA607NU, GU605MU, and GV302XU.

- intel-uncore-freq: Handle autonomous UFS status bit

- ISST: Handle cases with less than max buckets correctly

- intel-uncore-freq & ISST: Mark minor version 3 supported (no additional
			    driver changes required)

Regards, i.


The following changes since commit fbddf68d7b4e1e6da7a78dd7fbd8ec376536584a:

  platform/x86: ISST: Correct locked bit width (2026-03-24 12:31:10 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.0-4

for you to fetch changes up to 5d486669b3db11ccc2d1b9f4e42c11c2766f35ba:

  platform/x86: asus-armoury: add support for GU605MU (2026-03-31 17:22:28 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v7.0-4

New HW Support and Fixes:

- amd/pmc: Add Thinkpad L14 Gen3 to quirk_s2idle_bug

- asus-armoury: Add support for FA607NU, GU605MU, and GV302XU.

- intel-uncore-freq: Handle autonomous UFS status bit

- ISST: Handle cases with less than max buckets correctly

- intel-uncore-freq & ISST: Mark minor version 3 supported (no additional
			    driver changes required)

The following is an automated shortlog grouped by driver:

amd: pmc:
 -  Add Thinkpad L14 Gen3 to quirk_s2idle_bug

asus-armoury:
 -  add support for FA607NU
 -  add support for GU605MU
 -  add support for GV302XU

intel-uncore-freq:
 -  Handle autonomous UFS status bit
 -  Increase minor version

ISST:
 -  Increase minor version
 -  Reset core count to 0

----------------------------------------------------------------
Denis Benato (3):
      platform/x86: asus-armoury: add support for GV302XU
      platform/x86: asus-armoury: add support for FA607NU
      platform/x86: asus-armoury: add support for GU605MU

Mario Limonciello (1):
      platform/x86/amd: pmc: Add Thinkpad L14 Gen3 to quirk_s2idle_bug

Srinivas Pandruvada (4):
      platform/x86: ISST: Reset core count to 0
      platform/x86/intel-uncore-freq: Handle autonomous UFS status bit
      platform/x86: ISST: Increase minor version
      platform/x86/intel-uncore-freq: Increase minor version

 drivers/platform/x86/amd/pmc/pmc-quirks.c          |  9 +++
 drivers/platform/x86/asus-armoury.h                | 86 ++++++++++++++++++++++
 .../x86/intel/speed_select_if/isst_tpmi_core.c     |  4 +-
 .../intel/uncore-frequency/uncore-frequency-tpmi.c | 10 ++-
 4 files changed, 106 insertions(+), 3 deletions(-)
