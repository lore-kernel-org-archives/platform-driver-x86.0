Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F01195FE0
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jul 2024 19:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720639381; cv=none; b=aLJ4JPMI2rnVyuWjfPl+OYmARtkMd90sNJ3KJkxzvnp9Lcd6YylIJaAQpOkV/3prRas+HyJSiJ7sr2SbY6VmbIFaGv5RaMV1vrTVlSmfOExhHLcLvRqp4tgiNxzUAIZ+6Yy0jb8k5JM8gA82iRC3YkxgAt6qrG/hLdzNy16QQ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720639381; c=relaxed/simple;
	bh=zzJtSB3tb7uOdchNK0WfbcEZq/ctoQc4AcvCKvrzHJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iDOHXBC9+CmzLS25b5fjnjfKrEumwR5axCDmLryUP+vhd5T4jiiGFFm7WoSHvJFa6MNJuBKuoNINY/vA9Gv5G87PIxQE4l9L/Nihk5CZ84vHtEKFcX7/qGvctU+XfV+eEu4bZHBZNmVmLGi8PeZHV7SMs64euB0joHAr4/J2BoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKdrYAdr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKdrYAdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720639379; x=1752175379;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zzJtSB3tb7uOdchNK0WfbcEZq/ctoQc4AcvCKvrzHJI=;
  b=lKdrYAdrPZGE/DLq63kYBBS2kkRAmBymMFZcjIyVXL+2jyiK2He98c2L
   TQff2j3g10k6+fr/z8A3zIZ4aV+0EzjqU6YD6fIhpHV8dATqmDVHsINNi
   HY0oLxBgA1QwMVzFQONMb3j87vrRcLgwpdnbaYpKcPllF6tfXjbIgKuBa
   /+LwEezuc5LvQgtyMCmUr2RCd5ZzrLAv+06V+Tj+aKrsQS/wFEDbbp0FN
   WqHyghzRbOL0CWs1rT6NDlwmm5TgobTyEHcFjsZWsbvJPSft1Kq3Drrpt
   /mUe6w5XxhuJVZtlJ7X39X3MK61CRGYf55fRs18cEkDAB/Bls96cIMype
   g==;
X-CSE-ConnectionGUID: pgTkyk7tQB6ZqF0EFfcs6w==
X-CSE-MsgGUID: JqmEWayQTDGrEF+1cLF2+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17856440"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17856440"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 12:22:58 -0700
X-CSE-ConnectionGUID: bzqCNTxORLGb7skYe1V0lw==
X-CSE-MsgGUID: AKBHmA5xTiKfHNyp52UIhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="53482998"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 12:22:58 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v6 0/6] Support PMT features in Xe
Date: Wed, 10 Jul 2024 15:22:41 -0400
Message-ID: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
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
v4:
  Fixed a documentation issue in the xe_vsec.c module
v5:
  Addressed review comments for patch 4 (Xe driver)
  Add r/b for the first three patches
v6:
  Added kernel doc to moved data structure
  Added required include files
  Correct usage for FIELD_PREP()/FIELD_GET()
  Whitespace clean up
  Removed unnecessary type cast
 

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
 drivers/gpu/drm/xe/xe_vsec.c                  | 303 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h                  |  13 +
 drivers/platform/x86/intel/pmc/core_ssram.c   |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |  28 +-
 drivers/platform/x86/intel/pmt/class.h        |  11 +-
 drivers/platform/x86/intel/pmt/crashlog.c     |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  21 +-
 drivers/platform/x86/intel/sdsi.c             |   3 +-
 drivers/platform/x86/intel/tpmi.c             |   3 +-
 drivers/platform/x86/intel/vsec.c             |   9 +-
 .../vsec.h => include/linux/intel_vsec.h      |  48 ++-
 15 files changed, 428 insertions(+), 28 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (63%)

-- 
2.44.0

