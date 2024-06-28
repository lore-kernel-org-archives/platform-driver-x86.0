Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9755D1DDE9
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587424; cv=none; b=uBdhyMM3h5Uemyd5maG+HvPrdqiWFp7bijxkCbPLCs55gmr+253g4ScK539R538+YPZ2CQgqYFLM4s+6tvAA3obkt6cY8hURtDKGxMlGrTe0Uu4u9VnjlLwau8TYjUz5C2tkEz9PBquSgOl4F/tYK0OOW0QvZRG9sTDNBi1GfFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587424; c=relaxed/simple;
	bh=rS7+SSUtzj+FbNrJwN0w9vOL1SB7cEMv1j2v6Y/p8s4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iq/gWlJmvjSeR994HZt/xLeSoG/KTsH639HXk2DrBLwzqnRy+GCKQTXTOhAodr4MPDOoKkf3/mTQOr8tdleFsHB0q2ekZQJgUEVlPC8iwc0MEsXFVh4GLK+ean6UWO38Y512vhqTCFlU98/ffX+hqKB4JjA4vtFw+SMeivRp5y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7TE+ZKN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7TE+ZKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719587423; x=1751123423;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rS7+SSUtzj+FbNrJwN0w9vOL1SB7cEMv1j2v6Y/p8s4=;
  b=d7TE+ZKNMp+OyzslpQUghl3yrDvLhVEOF1svNgEmacTO0C/f85cCeeQf
   vD5gIQVlwoNtH9QQiLqxUt4lnFWPXg3YpvRaMQC++sxXh6RByWJ/vC1SW
   V9lqKde2X1PDcOGQC9hWXlaYp5vcFeVaSvwbzU9xMmgq7HXqhOsQLMb6g
   oEppWNetxa8y+sPb0LhpDa7UNILCllwmmhM3WeNV8m6D9h5QPwV+XYgrQ
   i9LpgTWpt28xONvIWDJk4g30G6dsL3cYPvqUydmwgXS8YXbwndYuZg6T5
   moLdAanDPvXO0A0VjA17USTbFN25Fsu9sf61sAHczhLnMwfUzqz82CS8m
   g==;
X-CSE-ConnectionGUID: rLLLYx7XT0abFKEO+DmfHg==
X-CSE-MsgGUID: uV/SfhwdSjSBnAE4MhMqYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27460804"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="27460804"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:10:22 -0700
X-CSE-ConnectionGUID: pyzN21acSvedS3KmI8CbgQ==
X-CSE-MsgGUID: 4GMmIuMKTkSQQWb26mfxrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44848103"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:10:21 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v4 0/6] Support PMT features in Xe
Date: Fri, 28 Jun 2024 11:09:38 -0400
Message-ID: <20240628150945.3363575-1-michael.j.ruhl@intel.com>
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

