Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630153D6463;
	Wed, 25 Mar 2026 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443524; cv=none; b=apya+qGcoUDExdksg9+2SgcC20/OLWF6kCnoRQNRmtW9plPQ0i0K2Fj2sSHYXwBesnrdtFeeUzTIqGcAFhAZWfoD/gGtQVazpX20gAEnm34R99pLio3ZJBUd91z7tnTsZRyQn6SZ6fmwz6rXudwS+3OPbu3Xlye8REF7UmsDAtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443524; c=relaxed/simple;
	bh=lBY2hd92BT6OGkKBukij+flNXI2mMe/oNMUU6w/j8w0=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=KyqJyTCxXYSZnr7NtAttwuHFZZ6xneKNYiycrgMPP4qs1PI2va7wZn+cm62MXRs3mnmNprWakxguoNZiTXOIdzDJ9AJBSfr6JWo64slxGNPWhGvsgZhWSdmWEJ4d2u/mK8jZUwRH1bQ8JYwjHjG+vSjqKLjikNWEu5/XVFrii+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6LDwUUY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6LDwUUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774443522; x=1805979522;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lBY2hd92BT6OGkKBukij+flNXI2mMe/oNMUU6w/j8w0=;
  b=n6LDwUUYTg7YAXidFocDCYuIcURMJ2xcdQhR6tzzBjKDM82SshLD4Ub8
   r0QVrEsD7zoJOCz9pSB28BlqkoDTfaYW8yoSlgrVHTYogEcqN+wA4gR90
   PEQwuK/baoIJO7/bGlTFyENE+uqwxs3HvlcXm8PJpdJVJ9n5xWQuBAeFl
   ep76oH7pXniTH0kG/qRVyALhp96APj/heNEPVLENVktpxsrWX+z3r+KqY
   eYRd8DskMHdW9ovLkWFgDKWhiyAkWtDJbMz0+0VdrUIxFHZoElmSPuCvy
   2xrTmdolMT+mhOahPD3SlSWW8nhLQhN/vtXenu1aLecpAFrunuFoBz7rv
   Q==;
X-CSE-ConnectionGUID: 9Z+1gC32TcOLq0oh+NBD1w==
X-CSE-MsgGUID: dPaU4hBWRHyYDrZOBRHp8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75365853"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75365853"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:58:42 -0700
X-CSE-ConnectionGUID: qYBnhGzlSLGSTjpqfxdsgw==
X-CSE-MsgGUID: RuPtSkUyR7mFZmhe328qwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="229450597"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:58:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Wed, 25 Mar 2026 14:53:45 +0200
Subject: [GIT PULL] platform-drivers-x86 for v7.0-3
Message-ID: <pdx86-pr-20260325145345-1794521387@linux.intel.com>
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

The trivial drop of unused gz_chain_head is not exactly fixes material
but it allows other work to avoid problems so I decided to take it in
along with the fixes.

Fixes and New HW Support

- amd/hsmp: Fix typo in error message

- asus-armoury: Add support for G614FP, GA503QM, GZ302EAC, and GZ302EAC

- asus-nb-wmi: Add DMI quirk for ASUS ROG Flow Z13-KJP GZ302EAC

- hp-wmi: Support for Omen 16-k0xxx, 16-wf1xxx, 16-xf0xxx

- intel-hid: Disable wakeup_mode during hibernation

- ISST:
  - Check HWP support before MSR access
  - Correct locked bit width

- lenovo: wmi-gamezone: Drop unused gz_chain_head

- olpc-xo175-ec: Fix overflow error message

Regards, i.


The following changes since commit d1a196e0a6dcddd03748468a0e9e3100790fc85c:

  platform/x86: dell-wmi-sysman: Don't hex dump plaintext password data (2026-03-03 14:45:17 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.0-3

for you to fetch changes up to fbddf68d7b4e1e6da7a78dd7fbd8ec376536584a:

  platform/x86: ISST: Correct locked bit width (2026-03-24 12:31:10 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v7.0-3

Fixes and New HW Support

- amd/hsmp: Fix typo in error message

- asus-armoury: Add support for G614FP, GA503QM, GZ302EAC, and GZ302EAC

- asus-nb-wmi: Add DMI quirk for ASUS ROG Flow Z13-KJP GZ302EAC

- hp-wmi: Support for Omen 16-k0xxx, 16-wf1xxx, 16-xf0xxx

- intel-hid: Disable wakeup_mode during hibernation

- ISST:
  - Check HWP support before MSR access
  - Correct locked bit width

- lenovo: wmi-gamezone: Drop unused gz_chain_head

- olpc-xo175-ec: Fix overflow error message

The following is an automated shortlog grouped by driver:

amd/hsmp:
 -  Fix typo in error message

asus-armoury:
 -  add support for G614FP
 -  add support for GA503QM
 -  add support for GZ302EA and GZ302EAC

asus-nb-wmi:
 -  add DMI quirk for ASUS ROG Flow Z13-KJP GZ302EAC

hp-wmi:
 -  Add Omen 16-xf0xxx (8BCA) support
 -  Add support for Omen 16-k0xxx (8A4D)
 -  Add support for Omen 16-wf1xxx (8C76)

intel-hid:
 -  disable wakeup_mode during hibernation

ISST:
 -  Check HWP support before MSR access
 -  Correct locked bit width

lenovo: wmi-gamezone:
 -  Drop gz_chain_head

MAINTAINERS:
 -  change email address of Denis Benato

olpc: olpc-xo175-ec:
 -  Fix overflow error message to print inlen

----------------------------------------------------------------
Alok Tiwari (2):
      platform/olpc: olpc-xo175-ec: Fix overflow error message to print inlen
      platform/x86/amd/hsmp: Fix typo in error message

David McFarland (1):
      platform/x86: intel-hid: disable wakeup_mode during hibernation

Denis Benato (3):
      MAINTAINERS: change email address of Denis Benato
      platform/x86: asus-armoury: add support for GA503QM
      platform/x86: asus-armoury: add support for G614FP

Krishna Chomal (2):
      platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C76)
      platform/x86: hp-wmi: Add support for Omen 16-k0xxx (8A4D)

Li RongQing (1):
      platform/x86: ISST: Check HWP support before MSR access

Matthew Schwartz (2):
      platform/x86: asus-nb-wmi: add DMI quirk for ASUS ROG Flow Z13-KJP GZ302EAC
      platform/x86: asus-armoury: add support for GZ302EA and GZ302EAC

Nathan Chancellor (1):
      platform/x86: lenovo: wmi-gamezone: Drop gz_chain_head

Raed (1):
      platform/x86: hp-wmi: Add Omen 16-xf0xxx (8BCA) support

Srinivas Pandruvada (1):
      platform/x86: ISST: Correct locked bit width

 MAINTAINERS                                        |  2 +-
 drivers/platform/olpc/olpc-xo175-ec.c              |  2 +-
 drivers/platform/x86/amd/hsmp/hsmp.c               |  2 +-
 drivers/platform/x86/asus-armoury.h                | 77 ++++++++++++++++++++++
 drivers/platform/x86/asus-nb-wmi.c                 |  2 +-
 drivers/platform/x86/hp/hp-wmi.c                   | 19 ++++++
 drivers/platform/x86/intel/hid.c                   | 10 ++-
 .../x86/intel/speed_select_if/isst_tpmi_core.c     |  5 +-
 drivers/platform/x86/lenovo/wmi-gamezone.c         |  2 -
 9 files changed, 113 insertions(+), 8 deletions(-)
