Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719F122318
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jul 2024 17:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721066111; cv=none; b=VeL961c40qPoL8uFMX069exNFlT2kQj/abeNrFR3Fp6iJiVu/CXOl6qM5xFTZSy3tMbFqeUa+aDfojQFKVYZ/qQILEg1e+7tbeo3h5Y81SNMC4wUYHagP6vivcSCQfnNeVetdDqUnUUsd4HokjvyvkepGZKn/nQxADPE3kJShpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721066111; c=relaxed/simple;
	bh=DMQTGblEsiwPAvLn2WiyvbzXxTXlEOkd9IWbt9WjiuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R/CzojQi6HEEjdmClOvMn2mktb09tTEFXydU3f4hnSyAdBNbTAgpLTzuq+72I2ZVfVQJlpYHUkE2bz9xBk9ozxOmDS3d9KtN0TLVAs0OgrGxi9IDafOg7Jv+gnhHyjUxluxVEsRrWJCznmnJA2lDXv702da5WrYW0hkt5sN4Vdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CB9Odtc0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CB9Odtc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721066110; x=1752602110;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DMQTGblEsiwPAvLn2WiyvbzXxTXlEOkd9IWbt9WjiuI=;
  b=CB9Odtc0hwydH8vjV8vkbG9J0p9lCQG0rSJXUbXxX70KIYJGEVAy8tLA
   q1TboVUZFPQ1BcME/EycA89HKCZH+fgXH+YKMBwNk1nrcTssLPNgPuBpJ
   HCaDDrKEyLizb6+S1xIuIRRBsEqejM9nY/gG/IZiuHf+FzcxYRmc6Cp2i
   jOzfIZFOb3VhKO67h+laLFY+v7v+dNKwNXb7pki7S4FNiU47F7GuZ012b
   5/NR8CjrU/GPeXsodEu4XlvhGdktAFtQvBpTUuVJ/Q35hRL0J2y/PsAPH
   FF+7UzwIZ5YddHe4076PCSxNYXQ3HHVBejmP3ZN30pIU5tDa960jzSF3d
   A==;
X-CSE-ConnectionGUID: DrWs1HSSQNyAtYUdZJ7B5Q==
X-CSE-MsgGUID: eJ3UAO0lTBeHEZAY3MUG5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18077427"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="18077427"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 10:55:09 -0700
X-CSE-ConnectionGUID: /K3xsSAXRsCVc2EZNRrvrw==
X-CSE-MsgGUID: E8g7+/oWSZGn6UAcWP0j+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="49654306"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 10:55:08 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v7 0/6] Support PMT features in Xe
Date: Mon, 15 Jul 2024 13:54:44 -0400
Message-ID: <20240715175452.4010751-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 v7:
  Commit message updates

David E. Box (3):
  platform/x86/intel/vsec.h: Move to include/linux
  platform/x86/intel/vsec: Add PMT read callbacks
  platform/x86/intel/pmt: Use PMT callbacks

Michael J. Ruhl (3):
  drm/xe/vsec: Support BMG devices
  platform/x86/intel/pmt: Add support for PMT base adjust
  drm/xe/vsec: Add support for DG2

 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_vsec.c                  | 300 ++++++++++++++++++
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
 15 files changed, 426 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (63%)

-- 
2.44.0

