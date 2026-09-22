Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EAF357CF3;
	Tue, 22 Sep 2026 18:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101996; cv=none; b=IzCa1CO0KHRXK4wYS5rt7v8KLmnqkfO1FGGocj7fvVCIA6j81G3k0jl4vcnPTRQPlENBa+qC5qxCayaf0mQ/tOplAM319xnnMhhgDZg8TIx+p1f+n4TW7SnW2Mto4i5+qywLr+M4GB9noKcqXcr5500KQpT6IIou0jDB/Pz0yzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101996; c=relaxed/simple;
	bh=EWK0Fg9OGyTtfZoYBVubHZO30uy1G0NgVqMSNwssdsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SzWX45pXVvX6hj71ghzjWWu3qtnDw1VWJR24kDUlVX3V9IlhghakAhKo6DJ5NZram4WmwgtzbfUkfXU2UHxI8YY9BzCqixsZlqp4wpWv2Q1zLbdc4ewX8t0U83xvYYn7LyWfe8TIPvvqPRmAm/BwtqD9Il4RXunzKjmvRUPtbsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgmSqSCQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgmSqSCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790101995; x=1821637995;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EWK0Fg9OGyTtfZoYBVubHZO30uy1G0NgVqMSNwssdsE=;
  b=UgmSqSCQjBfcL4vwZN0tjmIbgW/76cJk6ac0T/+1897NjW0PiMrmqL35
   gh2PZVST5Vvt5qO74ZcPBKZ4Inar0CESxoAEEdaSPE9Rk3Dq5fw2tpyTk
   2nMzlEhGeQBqE0+zGuHfTod9vf2kOQf7bes3y68EdBMyVEnrHDVeuIieN
   cfpneon8RkM7WHeYcEwS1bIQNxvAEh6mU5DUxLnhuEzD1WnQ9YPRfoN+M
   CL5OQ0J8sVDTHID8mGyW0X9NbqSFBWncHucSFpi2Kw5+3V2rL9PASw/QR
   B4eOl+3vH7twsv212yMfrBP2oOZMIg+LrhgQ8+ydUQrjXZ07FAz4Y1FoA
   A==;
X-CSE-ConnectionGUID: H1OHdiz2ScKoI1xTUFMTqg==
X-CSE-MsgGUID: hilV6Kk6Toml5ZtD1sdB7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94564882"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="94564882"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:33:14 -0700
X-CSE-ConnectionGUID: y3AnCF9yQHabIeBcl4y87Q==
X-CSE-MsgGUID: Ii9HvqSjTcGp3Xt8gt5hAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="271827951"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:33:14 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/10] Decouple PCI and auxbus details from Intel TPMI driver
Date: Tue, 22 Sep 2026 11:33:01 -0700
Message-ID: <20260922183311.3783010-1-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

This series is a no functional change refactor of the TPMI driver
(vsec_tpmi.c). It separates the code that does not care how TPMI was
discovered from the code that does.

TPMI is discovered today through a PCIe VSEC capability, with the PFS
table address computed relative to a PCI BAR. BARs are relocatable at
runtime by resource rebalancing, hot plug or error recovery, which ties
a platform wide register window to the lifecycle of one PCI function
and to an address an untrusted VMM can influence. That is a concern in
secure VM environments like TDX.

Newer Intel platforms will support ACPI table based TPMI enumeration.
The related ACPI spec is not public yet, so this series prepares the
driver ahead of it. Several places in vsec_tpmi.c assume the
enumerating device is a PCI device, or reach through a struct
intel_vsec_device just to get at a struct device, and neither holds
for an ACPI backend.

The series comes in three parts.

Patch 1 is a standalone cleanup. The feature device name was built in an
on-stack buffer and handed to the auxiliary bus, which stores the
pointer without copying the string.

Patches 2 to 8 each remove one PCI or intel_vsec_device dependency and
leave the code in place, so they are small and can be read on their own.

Patches 9 and 10 do the split. tpmi_probe() and tpmi_remove() become
intel_tpmi_init() and intel_tpmi_deinit(), which is the interface an
enumeration backend implements against, and the enumeration independent
code moves to a new intel-tpmi_common module. That leaves vsec_tpmi.c
with just the auxiliary driver binding to the "intel_vsec.tpmi" device
created by the Intel VSEC driver.

Tested on a GNR platform. TPMI feature enumeration, the debugfs
interface and the client drivers behave as before.

This series is based on v7.3-rc1.

Kuppuswamy Sathyanarayanan (10):
  platform/x86/intel/tpmi: Use static strings for the feature device
    names
  platform/x86/intel/vsec: Pass a struct device to
    intel_vsec_set_mapping()
  platform/x86/intel/tpmi: Remove unused vsec_dev from
    intel_tpmi_pm_feature
  platform/x86/intel/tpmi: Get tpmi_info directly from the parent device
  platform/x86/intel/tpmi: Keep the feature resources in intel_tpmi_info
  platform/x86/intel/tpmi: Describe a TPMI instance by its two devices
  platform/x86/intel/tpmi: Drop unused arg from tpmi_set_control_base()
  platform/x86/intel/tpmi: Do not assume TPMI is enumerated from PCI
  platform/x86/intel/tpmi: Split out enumeration independent init and
    exit
  platform/x86/intel/tpmi: Split off the PCI VSEC enumeration

 MAINTAINERS                              |   1 +
 drivers/platform/x86/intel/Kconfig       |   4 +
 drivers/platform/x86/intel/Makefile      |   1 +
 drivers/platform/x86/intel/tpmi_common.c | 829 +++++++++++++++++++++++
 drivers/platform/x86/intel/tpmi_common.h |  52 ++
 drivers/platform/x86/intel/vsec.c        |   7 +-
 drivers/platform/x86/intel/vsec_tpmi.c   | 822 +---------------------
 include/linux/intel_vsec.h               |   5 +-
 8 files changed, 905 insertions(+), 816 deletions(-)
 create mode 100644 drivers/platform/x86/intel/tpmi_common.c
 create mode 100644 drivers/platform/x86/intel/tpmi_common.h

-- 
2.43.0

