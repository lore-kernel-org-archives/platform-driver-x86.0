Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D03345ED4;
	Thu,  1 Oct 2026 22:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892244; cv=none; b=J9OPhhiN2IBAxNoinUH3Ec2Xk+Nk5wVtx03cZCyIpMK5lfpP1LMiCw1AoKAUxLBnFzstFrZ3hGj2m30EXXSCQJtpBp3cManRATV3Vnfx+0TAIoi+KRzyzmsPr0iBESvJVFa2AV/0S4rkM1FS5jaPgbmeTqOmOO9um4JfH53IHPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892244; c=relaxed/simple;
	bh=AaqA5fX2akCAlJWHbihGsXcccdQSzdobI+ZWIFUMTac=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=LCwHyqb1QgKy2pFnGHKDZ2FdLhJ7GXHGJjzcMJTv2sHh3IvwfLYoyoLElfF6izqpzXGnDhmLvCt0hC8J/PP3rV+wR8eXMzqxiIp9hUv6nVDs4NMP6XBExuUcfBN0Jdf68T3vPhnHuxXV8xB+frpuCNv6WT5bidu2cgGhnpqSFmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbihvGa3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbihvGa3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790892242; x=1822428242;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AaqA5fX2akCAlJWHbihGsXcccdQSzdobI+ZWIFUMTac=;
  b=PbihvGa3HqKJZjeYtzd3IcHzbTm9y2vCtTUAe9jsYfM6/rD1bSp7Sh5y
   AARnuAmbrp/NRBBZRofyVYXpwZ9JLerNFaN9kAx6NUaRyAOVgnNMgcnaf
   n79pH3Ec4qVLkfSbPJSd7LvL44TFDUE5uuPoGFsEuyumt9RBpk3ByUKpM
   zxxuVwsk610SVwFAnSV+hwOb/IBGamx6Lo7UO29OAKLIkg2soU7JFQpP/
   Ndf0vzLwyYm1dXuuzFX4/Fv+TUe6aUdGKzRjpmbY1U4f/pNDz29tvPV8S
   71HCLmXVMqY+hy4AJMk0LIVwdjQJjGbO+sQpCEoqRP4YtNvX/GgQyhnGK
   g==;
X-CSE-ConnectionGUID: BFaRniU0RnaWURnahxWZ/w==
X-CSE-MsgGUID: ZETNB4xzQDOfPFY1GikBtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91684101"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91684101"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:04:02 -0700
X-CSE-ConnectionGUID: IGU8XJUBRk6tt94psPjqUw==
X-CSE-MsgGUID: Ar/Tk+tfTQueZmV353LiLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="276206241"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:04:01 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com,
	david.e.box@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	rodrigo.vivi@intel.com,
	michael.j.ruhl@intel.com,
	ayaz.siddiqui@intel.com,
	syed.abdul.muqthyar.ahmed@intel.com,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org
Subject: [PATCH 0/3] platform/x86/intel/pmt: Fix crashlog regressions and add completion uevent
Date: Thu,  1 Oct 2026 15:03:45 -0700
Message-ID: <20261001220351.1592138-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series adds a uevent so userspace can find out when an Intel PMT
crashlog is available without polling. It also fixes two regressions
from the v7.1 vsec rework that prevent the crashlog path from being
used at all.

Patches 1 and 2 are fixes, tagged for stable:

 - Patch 1 fixes a NULL pointer dereference on any read of a crashlog
   sysfs data file. Commit 353042d54d82 ("platform/x86/intel/vsec:
   Switch exported helpers from pci_dev to device") started using
   entry->ep->dev, but only telemetry entries allocate an endpoint.

 - Patch 2 fixes an inverted return value test of
   intel_vsec_walk_header() in intel_vsec_get_features(). On devices
   without DVSEC/VSEC capabilities that describe their features through
   device_data, probe fails with -ENODEV and the auxiliary devices it
   created are torn down again.

Patch 3 is the new feature. It emits a KOBJ_CHANGE uevent on the
crashlog<x> device when a completed crashlog is found at probe, or when
a manually triggered capture completes. The event carries
INTEL_PMT_CRASHLOG_EVENT=3DPRESENT and INTEL_PMT_CRASHLOG_COMPLETE=3D1, and
the ABI documentation is updated to match.

The fixes are sent together with the feature because patch 3 cannot be
tested without them. Crashlog data cannot be read without patch 1.
Upcoming hardware with crashlog support has no DVSEC/VSEC capabilities
and describes its features through device_data, so it hits the bug
fixed by patch 2. Patches 1 and 2 do not depend on patch 3 and can be
applied to the fixes branch on their own if preferred.

Testing: the series was tested in an emulated (QEMU) environment,
covering both the probe-time uevent with a completed crashlog present
and the uevent after a manual trigger completes. Hardware with this
crashlog support is available, but testing on it is still pending.

David E. Box (3):
  platform/x86/intel/pmt: Fix NULL dereference when reading crashlog
    data
  platform/x86/intel/vsec: Fix inverted walk_header() test in
    get_features()
  platform/x86/intel/pmt: Notify userspace when crashlogs complete

 .../ABI/testing/sysfs-class-intel_pmt         | 14 ++++
 drivers/platform/x86/intel/pmt/class.c        |  4 +-
 drivers/platform/x86/intel/pmt/crashlog.c     | 84 ++++++++++++++++++-
 drivers/platform/x86/intel/vsec.c             |  2 +-
 4 files changed, 99 insertions(+), 5 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
--=20
2.43.0

