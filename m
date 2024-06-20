Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACEF42AA0
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jun 2024 21:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718918471; cv=none; b=VLGqu3NeTrtfEP69c7E60vwXGiyST/FRpOeQsMdDf16+Oi0LcZUTp8nj1tG2Bk+ShD1fcz2NDK5gfmb2QATaDVUnnJ8/RRNgiX+W/bKS11sfgXGtmTq3yXK641KqXiFnbteSILL5znNplCBb0MlpyCdCgQz2JlT4sKSXMx3beYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718918471; c=relaxed/simple;
	bh=a2vGsPJlVB7qrnNj6dyYpn2W+BRLldAGt+PJodvPRw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iR/NmQhykjlsw8pyuyASf9XGSBqPlZ+qEEgXrhkEHfnuprbxA+EvUacKmx3ZaT/CIx98n3+3sx1nwIoqJkrzTvEJc4J3Mj+aKH4JckNMlWCqunVoQXH56xoB8ZpuWopdCEZvVr/YdKa5tVN1yc5rNCPYPsg99pWHmzjNeD9gmf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRN50O5M; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRN50O5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718918470; x=1750454470;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a2vGsPJlVB7qrnNj6dyYpn2W+BRLldAGt+PJodvPRw8=;
  b=eRN50O5MPTylzr+WzubzlvCIExakVEfGFCTD1GbUYvbjIfjnBG0g+BOD
   5dndI4sQPiG/Q9VX09nasqJU0JMx+BPM2XDD5+4SZalkIOOF23WvrHl6Z
   R/7W0gncDEBv0QnCjcF1oZaeOgFJmQfUPN/R+R039LdmV/vcBJtLnxR83
   bXChvFZ4JrEhFTDqGJ/qdQhoYd079yZKfPjygE2ZvC2tTEQMNYa3FYkz0
   gPjdJYTnq9U9zDf3bBZVgnqTloAXhgX4m/SfofJdx0dDUlzUX13zEuzYN
   ysGfljvvCHPwsPjGvglmYZ65Im7pyuphVaSsr7q54TM/aEz1RK47ToUdx
   Q==;
X-CSE-ConnectionGUID: OuD9KgORQkmm8pzOVsnUCA==
X-CSE-MsgGUID: zwW8bHKBTz6thyBIZsNdgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19811209"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="19811209"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 14:21:09 -0700
X-CSE-ConnectionGUID: 8MOhQ6d+R4SQOCIHqLqJew==
X-CSE-MsgGUID: 1ZgJ0dg9RzyHsMLS8Hd0aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="79883651"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 14:21:08 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	pavel.e.popov@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v2 0/6] Support PMT features in Xe
Date: Thu, 20 Jun 2024 17:20:44 -0400
Message-ID: <20240620212055.3314064-1-michael.j.ruhl@intel.com>
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
 drivers/gpu/drm/xe/xe_device_types.h          |   5 +
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
 15 files changed, 390 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (88%)

-- 
2.44.0

