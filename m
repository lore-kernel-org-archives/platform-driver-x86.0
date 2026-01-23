Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059B438735C;
	Fri, 23 Jan 2026 02:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769136688; cv=none; b=uFIcEo+LAbwi64wMLClB6oQY7athwZa8VNItM4xcOPenIe5m/Hv188PShlCgOtsoWry5OSZQPIlx54Mrd3DoQH2NkcZ2RPX+4vkiLEAsPtZvsBzCRyECHUV5vbqGHWxtkdPqgITxJzeKHrBmgz2/vF8K4uSr+A3xc9FPnJLQpcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769136688; c=relaxed/simple;
	bh=kYkrBV3y12sWkz8psJia5at7cYNKv3VHa7vF+hcQfZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i84vHxFsNFhX0ZTBSUQR8fviFzXX1Q89Z3b3onOcvKIrt9tgExw5VAfnYxMhnf4ehZ+V1d6Jgsz4rXYN8mghYNLQSEHlzuHCeEmNjfP0w2CeWANca/lWHADBcMcsbYRx9Ao8mfybe0ubVkgeGJZ6kncDvZZ8TLyTt49Wt0FPkTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ClkC2Zd4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClkC2Zd4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769136682; x=1800672682;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kYkrBV3y12sWkz8psJia5at7cYNKv3VHa7vF+hcQfZI=;
  b=ClkC2Zd4niI9i/JYYoRnd86b2DDt8MvcPXbnU1UC8ocTcgSXnOVRN2Bc
   Ku6W0nsvHZ7nbq3UilGJA9+n6UJrnqEi4SGl8CgiRmQ1EXuiw4ufEEIMn
   mN045K94qgl2HhelqrjP0JGPmpucWo1XDY8PZGMNkS9IvR7FKrExcRXY3
   6cW0pAmwm3pDl3mATmSrsuPpsC16kjNpntWOZ1yTFMjbSQU9Is5zRa2UJ
   NUrbdOH80VWXqle9QrUOwwyptURwjwB4c2lg+5TpLoiKBPX4oGXPGGiTv
   ujDWM5hjvP4lX/2t70iQKM8oLqar0Lz3iyHL0oUI7XTIPmIVuXEt7SOdM
   g==;
X-CSE-ConnectionGUID: gi53qNc/Tn6Ltu/5K9TjEg==
X-CSE-MsgGUID: bQm70khIS8GwkKNuVbdzxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81016447"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81016447"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 18:51:16 -0800
X-CSE-ConnectionGUID: sS1h9xVbTkazYlHhPVz5pw==
X-CSE-MsgGUID: ySo2gyYbRTqLktr+Wzai8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="211773085"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 18:51:16 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 0/6] platform/x86/intel/vsec: Prep for ACPI PMT discovery
Date: Thu, 22 Jan 2026 18:51:01 -0800
Message-ID: <20260123025108.3772255-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This series updates intel_vsec to improve const-correctness, decouple
helper APIs from PCI, enhance error handling, and plumb ACPI-based Intel
Platform Monitoring Technology (PMT) discovery through the vsec layer. It
is preparatory infrastructure for follow-on PMT core/telemetry and
PMC/SSRAM series that add ACPI discovery and support for new platforms.

The series is organized as follows:

Patches 1-2 refactor and improve const-correctness of base_addr handling.
Patch 1 makes base_addr an explicit parameter throughout the call chain,
clarifying ownership and removing conditional logic. Patch 2 then makes the
platform info data structure read-only, preventing unintended modifications
to shared driver data.

Patches 3-4 decouple the vsec layer from PCI-specific types, updating
helper APIs and data structures to use generic struct device instead of
struct pci_dev.  This enables vsec to work with both PCI and ACPI parent
devices.

Patch 5 enhances error visibility by returning meaningful error codes from
the registration path instead of collapsing to boolean success/failure.

Patch 6 adds infrastructure for ACPI-based PMT discovery, allowing client
drivers to consume discovery data from either PCI or ACPI sources.

David E. Box (6):
  platform/x86/intel/vsec: Refactor base_addr handling
  platform/x86/intel/vsec: Make driver_data info const
  platform/x86/intel/vsec: Decouple add/link helpers from PCI
  platform/x86/intel/vsec: Switch exported helpers from pci_dev to
    device
  platform/x86/intel/vsec: Return real error codes from registration
    path
  platform/x86/intel/vsec: Plumb ACPI PMT discovery tables through vsec

 drivers/gpu/drm/xe/xe_debugfs.c               |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                 |   2 +-
 drivers/gpu/drm/xe/xe_vsec.c                  |   7 +-
 drivers/gpu/drm/xe/xe_vsec.h                  |   2 +-
 drivers/platform/x86/intel/pmc/core.c         |   4 +-
 .../platform/x86/intel/pmc/ssram_telemetry.c  |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |   8 +-
 drivers/platform/x86/intel/pmt/class.h        |   5 +-
 drivers/platform/x86/intel/pmt/discovery.c    |   4 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  13 +-
 drivers/platform/x86/intel/pmt/telemetry.h    |  12 +-
 drivers/platform/x86/intel/sdsi.c             |   5 +-
 drivers/platform/x86/intel/vsec.c             | 121 +++++++++++-------
 drivers/platform/x86/intel/vsec_tpmi.c        |  10 +-
 include/linux/intel_vsec.h                    |  39 ++++--
 15 files changed, 143 insertions(+), 93 deletions(-)


base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
--=20
2.43.0

