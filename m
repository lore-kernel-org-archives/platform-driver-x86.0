Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161891A23A6;
	Fri,  6 Mar 2026 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800510; cv=none; b=bG44qZ+yDhScuPmqqaaFjVQTNUpCS0yIjsYXn8Kj1oTpvXDYkWLEH4wx80SYMVADGZM/kS90FicuF/gE9HEO6uKKt4jgoFS0sAUiqLrQHWqjlDdK0FLVnrDUVWwWtotVY20us+g4zBOjH3Bfath7dvVC7ATxCpTZBPf6A3BiuXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800510; c=relaxed/simple;
	bh=VpOV32v7xOm2wEHhNSBphaIB2dZp8GDHq5H1POmezIM=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=rG1qD9/YbwMlQsrySzDuGIu849tbT7MLBAk3ltDNWaON63i6wMNwK5PMlE0fgxGqXVeuK4u10UgTrL5Btu/7ZHWZccq6K8sNgv70utdUSiBJkelvH0QcI6/fffUY2Z/9/qFTj5TSnhdvH/XFFl2LptdD156zT0IO9ohxa/ZYzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2qh6et+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2qh6et+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772800509; x=1804336509;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VpOV32v7xOm2wEHhNSBphaIB2dZp8GDHq5H1POmezIM=;
  b=g2qh6et+2TkLZFY5+psDNaGnMTQvU5dg+mlYsL721NXKjIEKIzRx6A1a
   tXDG/EGPEFnvY1qhhhIrJiFnxh96bcskeFCN/b0Tpokd0t4wcUOtKK7Al
   Am+5gLWCdmpCrapzYwxkUIQeMYzbNjnod7nsKBVQb+Yg84RjH/kOEQzVd
   uoIVK+edL9hhAV68sXHqMzw4gA8dDqf8EEtYuOH9loq9RS1gXr9VmP2+3
   Tlib08dl/jwdmkgrkA1YlD4uJnuR75kHYYDOv3IZStI0/17LTlkR7dogu
   tloHspWv04kWXQBD0HjbwI6ZGL8HbsUhNn1vm8lMDbejdGWGHt8f2ONrX
   A==;
X-CSE-ConnectionGUID: hCbg4j5sSdih2S1krGrxmg==
X-CSE-MsgGUID: onSWh4NGTyOkP7rdFMJ1xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84618061"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84618061"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 04:35:01 -0800
X-CSE-ConnectionGUID: 08m8G1kNSmq0YiNYRqTVSw==
X-CSE-MsgGUID: IGs0/4njRBOaZLhEjBRQTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218230707"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.235])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 04:34:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Fri, 06 Mar 2026 14:32:54 +0200
Subject: [GIT PULL] platform-drivers-x86 for v7.0-2
Message-ID: <pdx86-pr-20260306143254-1591623620@linux.intel.com>
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

Fixes and New HW Support

- alienware-wmi-wmax: Add G-Mode support to m18 laptops

- asus-armoury: Add support for FA401UM, G733QS, GX650RX

- dell-wmi-sysman: Don't hex dump plaintext password data

- hp-bioscfg: Support large number of enumeration attributes

- hp-wmi: Add support for Omen 14-fb1xxx, 16-xd0xxx and 16-wf0xxx,
          Victus-d0xxx

- int3472: Handle GPIO type 0x10 (DOVDD)

- intel-hid:
  - Add Dell 14 & 16 Plus 2-in-1 to dmi_vgbs_allow_list
  - Enable 5-button array on ThinkPad X1 Fold 16 Gen 1

- mellanox: mlxreg: Fix kernel-doc warnings

- oxpec: Add support for OneXPlayer X1 Air, X1z, APEX, and Aokzoe A2 Pro

- redmi-wmi: Add more Fn hotkey mappings

- thinkpad_acpi: Fix errors reading battery thresholds

- touchscreen_dmi: Add quirk for y-inverted Goodix touchscreen on SUPI S10

- uniwill-laptop:
  - FN lock/super key lock attributes rename
  - Fix crash on unexpected battery event
  - A special key combination can alter FN lock status so mark it volatile
  - Handle FN lock event

Regards, i.


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.0-2

for you to fetch changes up to d1a196e0a6dcddd03748468a0e9e3100790fc85c:

  platform/x86: dell-wmi-sysman: Don't hex dump plaintext password data (2026-03-03 14:45:17 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v7.0-2

Fixes and New HW Support

- alienware-wmi-wmax: Add G-Mode support to m18 laptops

- asus-armoury: Add support for FA401UM, G733QS, GX650RX

- dell-wmi-sysman: Don't hex dump plaintext password data

- hp-bioscfg: Support large number of enumeration attributes

- hp-wmi: Add support for Omen 14-fb1xxx, 16-xd0xxx and 16-wf0xxx,
          Victus-d0xxx

- int3472: Handle GPIO type 0x10 (DOVDD)

- intel-hid:
  - Add Dell 14 & 16 Plus 2-in-1 to dmi_vgbs_allow_list
  - Enable 5-button array on ThinkPad X1 Fold 16 Gen 1

- mellanox: mlxreg: Fix kernel-doc warnings

- oxpec: Add support for OneXPlayer X1 Air, X1z, APEX, and Aokzoe A2 Pro

- redmi-wmi: Add more Fn hotkey mappings

- thinkpad_acpi: Fix errors reading battery thresholds

- touchscreen_dmi: Add quirk for y-inverted Goodix touchscreen on SUPI S10

- uniwill-laptop:
  - FN lock/super key lock attributes rename
  - Fix crash on unexpected battery event
  - A special key combination can alter FN lock status so mark it volatile
  - Handle FN lock event

The following is an automated shortlog grouped by driver:

alienware-wmi-wmax:
 -  Add G-Mode support to m18 laptops

asus-armoury:
 -  add support for FA401UM
 -  add support for G733QS
 -  add support for GX650RX

dell-wmi:
 -  Add audio/mic mute key codes

dell-wmi-sysman:
 -  Don't hex dump plaintext password data

hp-bioscfg:
 -  Support allocations of larger data

hp-wmi:
 -  add Omen 14-fb1xxx (board 8E41) support
 -  Add Omen 16-wf0xxx fan and thermal support
 -  Add Omen 16-xd0xxx fan and thermal support
 -  Add Victus 16-d0xxx support

int3472:
 -  Handle GPIO type 0x10 (DOVDD)

intel-hid:
 -  Add Dell 14 Plus 2-in-1 to dmi_vgbs_allow_list
 -  Add Dell 16 Plus 2-in-1 to dmi_vgbs_allow_list
 -  Enable 5-button array on ThinkPad X1 Fold 16 Gen 1

oxpec:
 -  Add support for Aokzoe A2 Pro
 -  Add support for OneXPlayer APEX
 -  Add support for OneXPlayer X1 Air
 -  Add support for OneXPlayer X1z

platform_data/mlxreg: mlxreg.h:
 -  fix all kernel-doc warnings

redmi-wmi:
 -  Add more hotkey mappings

thinkpad_acpi:
 -  Fix errors reading battery thresholds

touchscreen_dmi:
 -  Add quirk for y-inverted Goodix touchscreen on SUPI S10

uniwill-laptop:
 -  Fix crash on unexpected battery event
 -  Handle FN lock event
 -  Mark FN lock status as being volatile
 -  Rename FN lock and super key lock attrs

----------------------------------------------------------------
Antheas Kapenekakis (4):
      platform/x86: oxpec: Add support for OneXPlayer APEX
      platform/x86: oxpec: Add support for OneXPlayer X1z
      platform/x86: oxpec: Add support for OneXPlayer X1 Air
      platform/x86: oxpec: Add support for Aokzoe A2 Pro

Anton Plotnikov (1):
      platform/x86: hp-wmi: add Omen 14-fb1xxx (board 8E41) support

Armin Wolf (4):
      platform/x86: uniwill-laptop: Rename FN lock and super key lock attrs
      platform/x86: uniwill-laptop: Fix crash on unexpected battery event
      platform/x86: uniwill-laptop: Mark FN lock status as being volatile
      platform/x86: uniwill-laptop: Handle FN lock event

Denis Benato (3):
      platform/x86: asus-armoury: add support for G733QS
      platform/x86: asus-armoury: add support for GX650RX
      platform/x86: asus-armoury: add support for FA401UM

Hans de Goede (1):
      platform/x86: touchscreen_dmi: Add quirk for y-inverted Goodix touchscreen on SUPI S10

Jesse Guo (1):
      platform/x86: redmi-wmi: Add more hotkey mappings

Jonathan Teh (1):
      platform/x86: thinkpad_acpi: Fix errors reading battery thresholds

Krishna Chomal (2):
      platform/x86: hp-wmi: Add Omen 16-xd0xxx fan and thermal support
      platform/x86: hp-wmi: Add Omen 16-wf0xxx fan and thermal support

Kurt Borja (2):
      platform/x86: dell-wmi: Add audio/mic mute key codes
      platform/x86: alienware-wmi-wmax: Add G-Mode support to m18 laptops

Leif Skunberg (2):
      platform/x86: int3472: Handle GPIO type 0x10 (DOVDD)
      platform/x86: intel-hid: Enable 5-button array on ThinkPad X1 Fold 16 Gen 1

Mario Limonciello (1):
      platform/x86: hp-bioscfg: Support allocations of larger data

Peter Metz (2):
      platform/x86: intel-hid: Add Dell 14 Plus 2-in-1 to dmi_vgbs_allow_list
      platform/x86: intel-hid: Add Dell 16 Plus 2-in-1 to dmi_vgbs_allow_list

Randy Dunlap (1):
      platform_data/mlxreg: mlxreg.h: fix all kernel-doc warnings

Thorsten Blum (1):
      platform/x86: dell-wmi-sysman: Don't hex dump plaintext password data

Victor Lattaro Volpini (1):
      platform/x86: hp-wmi: Add Victus 16-d0xxx support

 .../ABI/testing/sysfs-driver-uniwill-laptop        |  10 +-
 .../admin-guide/laptops/uniwill-laptop.rst         |   2 +-
 drivers/platform/x86/asus-armoury.h                |  75 ++++++++++++++
 drivers/platform/x86/dell/alienware-wmi-wmax.c     |   2 +-
 drivers/platform/x86/dell/dell-wmi-base.c          |   6 ++
 .../dell/dell-wmi-sysman/passwordattr-interface.c  |   1 -
 .../platform/x86/hp/hp-bioscfg/enum-attributes.c   |   9 +-
 drivers/platform/x86/hp/hp-wmi.c                   |  12 ++-
 drivers/platform/x86/intel/hid.c                   |  19 ++++
 drivers/platform/x86/intel/int3472/discrete.c      |   7 ++
 drivers/platform/x86/lenovo/thinkpad_acpi.c        |   6 +-
 drivers/platform/x86/oxpec.c                       |  30 +++++-
 drivers/platform/x86/redmi-wmi.c                   |  25 ++++-
 drivers/platform/x86/touchscreen_dmi.c             |  18 ++++
 drivers/platform/x86/uniwill/uniwill-acpi.c        | 110 ++++++++++++++-------
 drivers/platform/x86/uniwill/uniwill-wmi.h         |   6 +-
 include/linux/platform_data/mlxreg.h               |  14 +--
 include/linux/platform_data/x86/int3472.h          |   5 +-
 18 files changed, 294 insertions(+), 63 deletions(-)
