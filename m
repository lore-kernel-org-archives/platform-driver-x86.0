Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095242836BE;
	Thu, 22 Jan 2026 03:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769051354; cv=none; b=Dh9nNO5R2dv3BKivkvRFOhMoXkZOMCHklgYqrBD7mYbQ8qQA3ImSqF2JucD5++rbLJMS/1xdiJIWMigmZmf6dHwLib6Y+bkPOfGijjBW8ELr7Zyw8gQSJT5hgkyoFKo006CtNMw+jtPSGoWZm4etUlTfgsEr9nWzOpwd9oB1RbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769051354; c=relaxed/simple;
	bh=rpOou/GHq40Xxq50H3x2JsCD0p6Oz/B8KYtHFVgVWm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O6kCxYbZ5b5PploneYbLabNkjPqLdjslTjdm8OhmK5dfYTxDJeEoQQxbu0TgDAlKK4VqBtdw0qrTrsaMtDJ1kOC38Bp2797TUe7c71dmOraKf7m1QwKQEJunb05EWSiifH1xEiZS5uuDZEHIni0BGJwdGzZFfmkkuaJ4Dh76xik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLp6PlJS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLp6PlJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769051354; x=1800587354;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rpOou/GHq40Xxq50H3x2JsCD0p6Oz/B8KYtHFVgVWm8=;
  b=TLp6PlJSECBNkTdDyEYb1pEGKLzK7iRmu+NlXLwZbicQeNX1xMAh2Ivp
   77g66vWjov7Rx6eebJq4uV33QxzXx1nSVwQY07W/FpnnjS0MFPCqoVkvO
   urQawpHziqiH3TDgE3BIEUvMhmKLHxaaNbss0OHq4ay7caivgrpGuUSkV
   AS7lV7KDQXvb1JPO3kR/9K0UI7odRt5w+YIrILmG6a+lTidEKwJnjoiUo
   IiPnnIHT0Y3V3j1TDogvQFfHjEjG6IJoSB0DfsYBJQLUEZjvEHQhxG7i+
   6pN3hd9MzbLmiVYd74G4zqVINnpjPKj0yl40Sv8VRYFyomQDHbsjlCHtZ
   w==;
X-CSE-ConnectionGUID: Hkl7QU1MSwOHElvssToITw==
X-CSE-MsgGUID: b97Mwg1MQb26oe+guXH1Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81733089"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="81733089"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 19:09:12 -0800
X-CSE-ConnectionGUID: 0nuMA4sISDe9LenXzl7WlA==
X-CSE-MsgGUID: Xb4duWThTkSo4bXj8cMXzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="211058806"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 19:09:10 -0800
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
Subject: [PATCH v3 0/6] platform/x86/intel/vsec: Prep for ACPI PMT discovery
Date: Wed, 21 Jan 2026 19:08:55 -0800
Message-ID: <20260122030903.3247167-1-david.e.box@linux.intel.com>
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
 drivers/platform/x86/intel/vsec.c             | 122 +++++++++++-------
 drivers/platform/x86/intel/vsec_tpmi.c        |  10 +-
 include/linux/intel_vsec.h                    |  39 ++++--
 15 files changed, 144 insertions(+), 93 deletions(-)


base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
--=20
2.43.0

