Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA6B2BCF6
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jun 2024 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719319582; cv=none; b=UfBZ450lfstXtSsTIDkv+4UQBmwgPPWsy0cR4A/3EM7qavi0gzEq2Chqe1tzRGKYOkDxkCRrm4IrnKvJgWdmqScWeMrH9mPLANjAwQ4d/ugl6weDVXIuKiLM6XwDgRD4v6DBKKo6AovS9pNJR3UGrhhoR7JaQmmKrYCceuv06VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719319582; c=relaxed/simple;
	bh=7lyoFOuBeyKz+ztgDIid7b/pLo00IS/mwzOWmgL+zkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i4CB6CW3HfBY5emSLnZ1FQvUwYrUMnvF29qbjXawNFO0i2ejYpMFQkZdMCMZXGLSQzSTa83k4M+QIIt8Kb/xPga/0wUx6MLHrbAD9UMW38GHPNyY4DYdOlzABxDmKiDrbxSnv5SxRedw3yBT1ApHrwEHuS2CxbMUUXYwhTw60bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SiUYw7C/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SiUYw7C/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719319580; x=1750855580;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7lyoFOuBeyKz+ztgDIid7b/pLo00IS/mwzOWmgL+zkA=;
  b=SiUYw7C/2/8VNY9MXLZFvRBZRnW9ep87YEDv1HkB2bkxiSJZ7VM6uq48
   w36eGl3YJKvB6M0EqzE/vbHP0bSI7XXagyeugIzTsH9J5JpDcAjGsS8PL
   AZWJaDLPR8nWE6CXRVl0s1wi2t4L+TFTCKvTBqzY5D6C6BzRupdQlboHQ
   3dmBx39pyafMIiLZv28i1O8qOMfxkvfNKmMazvlyJ8chwWkJuZkuqEiCg
   D9ASgNFMjuihz5wBjEmCKwSaOOwvZf/N1pW7DNWF9LwRIXAB5V9I4B0MJ
   EBCwudscNfFmDnQdBL+ZLNG4v0DGHsKktCHX7SfM6y/9fRKcsnvV2RTo1
   g==;
X-CSE-ConnectionGUID: kunqP+evRxecOr79WVf9Mw==
X-CSE-MsgGUID: tR/U44JcRy+1Av7/iVPDMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26955325"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="26955325"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 05:46:14 -0700
X-CSE-ConnectionGUID: NSH5aog2Rwiw2Kj5wBuc1Q==
X-CSE-MsgGUID: jjX4Wz1nSn+at7R9k4tBbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="48547059"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 05:46:13 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v3 0/6] Support PMT features in Xe
Date: Tue, 25 Jun 2024 08:45:46 -0400
Message-ID: <20240625124554.3358460-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DG2 and Battlemage have the Intel Platform Monitoring Technology (PMT)
feature available, but not in the "standard" (pci endpoint) way.

Add support to the vsec and Xe drivers to allow access to the PMT space
for the DG2 and BMG devices.

The intel_vsec_register() function allows drivers to provide telemetry
header information (usually found at probe time), to allow the PMT
driver to probe the telemetry features.

Battlemage has a shared memory area (selected by index), so a callback
function is required to access the appropriate PMT data.

V2:
  Re-worked DG2 support patches using a base_adjust rather than a
  quirk.
  Updated GUID decode, for correct decode.
v3:
  Fixed a documentation issue for the pmt struct.

David E. Box (3):
  platform/x86/intel/vsec.h: Move to include/linux
  platform/x86/intel/vsec: Add PMT read callbacks
  platform/x86/intel/pmt: Use PMT callbacks

Michael J. Ruhl (3):
  drm/xe/vsec: Support BMG devices
  platform/x86/intel/pmt: Add support for PMT base adjust
  drm/xe/vsec: Add support for DG2

 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_vsec.c                  | 295 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h                  |  13 +
 drivers/platform/x86/intel/pmc/core_ssram.c   |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |  28 +-
 drivers/platform/x86/intel/pmt/class.h        |  11 +-
 drivers/platform/x86/intel/pmt/crashlog.c     |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  21 +-
 drivers/platform/x86/intel/sdsi.c             |   3 +-
 drivers/platform/x86/intel/tpmi.c             |   3 +-
 drivers/platform/x86/intel/vsec.c             |   9 +-
 .../vsec.h => include/linux/intel_vsec.h      |  18 +-
 15 files changed, 391 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (88%)

-- 
2.44.0

