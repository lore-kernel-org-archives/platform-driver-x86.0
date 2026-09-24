Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CA84A260B;
	Thu, 24 Sep 2026 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274240; cv=none; b=uB+lxgj80QmPW9E52VPLhpkCMonZxtJd4Ks/FfuAL4MujCEDbO4U5sKnfZ6c3D+NT94l0Bhgk6ZNndcGZxlH40JBqjWBSYnjg+gk5ikMxCXHlMjmMAD/ZE+sDcMy+D/rkn6vzTpuLwHC3aoG+3E24RbpEv+/Wi3tXQWPGRbsLlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274240; c=relaxed/simple;
	bh=ikGedobOvwz1lNfQIzMR2wgpjnhV10nMaIkwSDRV3Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jQ3jVjAscOcZUII0gRQephGZyUzGGTA3aOprozT2J6DvjxjeInIjzheLBcEcNHkJbxOdpZMTy3x+71r9z7bhtN7pSndCLgagQxdf333Pj48+VyjNgmlepwjgzODDTPaclRxUSuPDx2MnKKndpr6a+j0JAbNNLTWh1Wg6iypT30g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoXOhVgV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoXOhVgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274238; x=1821810238;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ikGedobOvwz1lNfQIzMR2wgpjnhV10nMaIkwSDRV3Tk=;
  b=FoXOhVgVf+/rLOkoDAHp7XY6aGZbSxpsbYt0o5ZwIn03GWcEcY3QTDy8
   /hJvmUoeZLNcO/O6f2Lo5QfHFvRePE4wAb7yP8f197EQWMpzLdjRs6/hG
   7DIebJm9vp9jxwkVpMQlQOi1WmFrlKr1WrwGuCoTH/moomBsAlL700gZb
   U4sZfIPJP4yehaVX8LPpR4XJ3LxNBK0N5FbG+4NUrbPX0/fWCt5nWRECj
   G1S7cEmQmxoRPc/uVWHTmXVdUhjFrvJ+P6MiQLHezcE0qG7UAqhAC8SLM
   haFl1nt/+gJtqY4gh6Lmo34cwqBrTlseMEbRHWMBGlSEl3qj1gDGWGK0a
   g==;
X-CSE-ConnectionGUID: H5ZjLCplSmKYVvPa8GI7tg==
X-CSE-MsgGUID: ndZ6rjGtT6CSgDFtPFxqSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164251"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164251"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:44 -0700
X-CSE-ConnectionGUID: mzOBtqURTzmoZQqqMXhrHQ==
X-CSE-MsgGUID: K6CmSXopQgKWldH+qlVnQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229906"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/19] Decouple PCI and auxbus details from Intel TPMI driver
Date: Thu, 24 Sep 2026 11:23:22 -0700
Message-ID: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The series comes in four parts.

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

Patches 11 to 19 are code improvements to tpmi_common.c. Some of them
come from Ilpo's review of v1. Others were suggested by Andy in an
internal review of this series, and since they touch the same code I
have included them here as well. Each patch carries a Suggested-by tag
for whoever suggested it.

They are separate patches on top of the move in patch 10, as Ilpo asked,
so that patch 10 stays a pure code move and can still be reviewed with a
diff-of-diffs against the original vsec_tpmi.c. Each of them does one
thing to tpmi_common.c and nothing else.

Tested on a GNR platform. TPMI feature enumeration, the debugfs
interface and the client drivers behave as before.

Changes since v1:
 - Added patches 11 to 19, from Ilpo's review of v1 and Andy's internal
   review. Patches 1 to 10 are unchanged and carry the Reviewed-by tags
   they collected.
 - Patch 11: include the headers tpmi_common.c uses directly instead of
   relying on other headers to pull them in, drop the redundant io.h and
   sort the block.
 - Patch 12: turn TPMI_GET_SINGLE_ENTRY_SIZE() into a function, so the
   u32 to byte conversion reads as a multiply by sizeof(u32), the
   statement expression goes away and the argument is evaluated once.
 - Patch 13: take tpmi_dev_lock with guard() in
   tpmi_read_feature_status() and drop the unlock label.
 - Patch 14: use __free(kfree) and guard() in tpmi_mem_dump_show() so the
   ioremap() failure can return from the loop.
 - Patch 15: build each TPMI control mailbox word in one expression.
 - Patch 16: use DEFINE_SHOW_STORE_ATTRIBUTE() for the mem_write debugfs
   file.
 - Patch 17: scnprintf() instead of snprintf().
 - Patch 18: declare the loop counters in their loops.
 - Patch 19: make the device creation policy a comment on
   tpmi_create_devices() and split the condition it described.

This series is based on v7.3-rc1.

Kuppuswamy Sathyanarayanan (19):
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
  platform/x86/intel/tpmi: Include the headers tpmi_common.c relies on
  platform/x86/intel/tpmi: Turn TPMI_GET_SINGLE_ENTRY_SIZE() into a
    function
  platform/x86/intel/tpmi: Use guard() for tpmi_dev_lock in the status
    read
  platform/x86/intel/tpmi: Use scope based cleanup in the memory dump
  platform/x86/intel/tpmi: Build the TPMI control words in one
    expression
  platform/x86/intel/tpmi: Use DEFINE_SHOW_STORE_ATTRIBUTE() for
    mem_write
  platform/x86/intel/tpmi: Use scnprintf() to build the debugfs names
  platform/x86/intel/tpmi: Declare the loop counters in their loops
  platform/x86/intel/tpmi: Describe the device creation policy on the
    function

 MAINTAINERS                              |   1 +
 drivers/platform/x86/intel/Kconfig       |   4 +
 drivers/platform/x86/intel/Makefile      |   1 +
 drivers/platform/x86/intel/tpmi_common.c | 824 +++++++++++++++++++++++
 drivers/platform/x86/intel/tpmi_common.h |  52 ++
 drivers/platform/x86/intel/vsec.c        |   7 +-
 drivers/platform/x86/intel/vsec_tpmi.c   | 822 +---------------------
 include/linux/intel_vsec.h               |   5 +-
 8 files changed, 900 insertions(+), 816 deletions(-)
 create mode 100644 drivers/platform/x86/intel/tpmi_common.c
 create mode 100644 drivers/platform/x86/intel/tpmi_common.h

-- 
2.43.0

