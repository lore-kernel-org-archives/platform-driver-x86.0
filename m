Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCEF29D267;
	Tue,  3 Mar 2026 05:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772515206; cv=none; b=RMpAMnEBh9HGWDL+b9nOrPAXqWaYEG2uGxznC/SVX3dZkC+WQQuxhR0woF4I4YhfUpaJ2Ltg0DZ3ZfUF/iPw1LKU5KYB+i/o32vL0PTXfRtCxO2z8g5GdUyatKYkFKojssXxcTQaPTtC19o7xyRdtolf2tgOrdbODrgYbrDQK5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772515206; c=relaxed/simple;
	bh=MzCLSMJtQYqsgVxKoCNu4SFvLJd6PlQw8eK71bvCWes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fqKG3e1PfKXXgxuC1f6ui6NA7uEq42kZ+IBTleHIxWHlEj/hgLAqQsIGGPqJdgcVV2ZCbkWRAzSvQ4GE1JyEsX17daRWu1aRpbhOidHXDg76QEict8SSooPWNRHX0e4xqVBOjLmSCmiUtVD+ocGhlAdeM8NwcdXtaQ8kqSZAzGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxUZz78y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxUZz78y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772515205; x=1804051205;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MzCLSMJtQYqsgVxKoCNu4SFvLJd6PlQw8eK71bvCWes=;
  b=UxUZz78y+Zclemm961Z1QGpLIc7oThGOTWVj5pY/XQsyu4X1Iu5wH4hn
   xtLA0bHr/bjgWl6ee1GRafICyxsou0tVnAT634WZ71UELPqeQyH11LKS9
   A38ENQ7v28+Pj0SeU0W0U56V/yz/YLRzeFKLHiR84KZcQfUGDgc86MJZh
   PZfh9rgAQigSwNsgFQnUkXHbWWIGwXvEAU4qHdXv7ssbfC9w/JQ4CeICU
   3nkF0ZNMJiDN4CYq9aLgKEp6YDxxs1FfVA9CTca6OO1hTJI2GSqsHY9cR
   gD/JqfPaBKHtK7v+bvSHn+N0MtSdxa/1XsOWTZyZz7C8zkcPCqyU9Cf9Z
   Q==;
X-CSE-ConnectionGUID: lf8DbYfAQEyRxhfIZoyXeQ==
X-CSE-MsgGUID: FTLeQbz/RqqsgjGttldwwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73445404"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73445404"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 21:20:01 -0800
X-CSE-ConnectionGUID: hMIJemb1RYCBYB9ozCdpuA==
X-CSE-MsgGUID: n5LwjUV5Sta+ipDUdt3wbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="217110163"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 21:20:01 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v7 0/6] platform/x86/intel/vsec: Prep for ACPI PMT discovery
Date: Mon,  2 Mar 2026 21:19:47 -0800
Message-ID: <20260303051953.1453372-1-david.e.box@linux.intel.com>
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

Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Changes in v7:

Fix but found from incorrect struct device * passed to
intel_vsec_add_aux().  When the unused first parameter was originally
removed, the remaining device argument was inadvertently changed from the
aux device to the PCI device. Patch 3 restores &vsec_dev->auxdev.dev, and
patch 4 drops a follow-on change that would have reverted it back to the
PCI device.

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
 drivers/gpu/drm/xe/xe_vsec.h                  |   4 +-
 drivers/platform/x86/intel/pmc/core.c         |   4 +-
 .../platform/x86/intel/pmc/ssram_telemetry.c  |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |   8 +-
 drivers/platform/x86/intel/pmt/class.h        |   5 +-
 drivers/platform/x86/intel/pmt/discovery.c    |   4 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  13 +-
 drivers/platform/x86/intel/pmt/telemetry.h    |  12 +-
 drivers/platform/x86/intel/sdsi.c             |   5 +-
 drivers/platform/x86/intel/vsec.c             | 121 +++++++++++-------
 drivers/platform/x86/intel/vsec_tpmi.c        |   8 +-
 include/linux/intel_vsec.h                    |  39 ++++--
 15 files changed, 143 insertions(+), 93 deletions(-)

--=20
2.43.0

