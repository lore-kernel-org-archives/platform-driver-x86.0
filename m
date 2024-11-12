Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64A0206E99
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 16:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731429055; cv=none; b=fwHGb/zfqn5rSvGy0Xml6qdyvb76xXrhSe4QKSSVRBtlp9IiNCm17om+Y3RMYbgOfwZiyad3A3Yk9AujtI5dGAABsBH3wvymACqJ4ZlSGEHKgkU68pxbTTP4VG8KQ3JrDVKC2kvYhNtWm31hMjQR4dOlzkoDuhQRjUYVVOAxt1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731429055; c=relaxed/simple;
	bh=yYBgaqHrJ1nCXTp+W09rPDJjxKsccKPKr9zCpUEa4hc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bXHktZjM+yfN8EajFfzZ8ukrofojpxiQ/Ecrd9hkhPQCwHzZgY6oxz1ZbtP0iqBUG0B6ofJ4Uru4gZpcbBmKZDhMjpNZG1lYz0EeCVbCuD6p5R2oYfQY2lHKo/+MW4wTqcw7KYFKKSVdan1U7C90QcMbX9i9bnWMUPvZ9760DOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D86Bw5ry; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D86Bw5ry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731429054; x=1762965054;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yYBgaqHrJ1nCXTp+W09rPDJjxKsccKPKr9zCpUEa4hc=;
  b=D86Bw5ryURwQQFaOLi6O5blOhffD0lIlYtIBHVMPT3CQ746VNOk3BJx8
   u4pkL4qJp/UNUHxxieA5pJ2Cd410oHLm5SxZcHggwXX38e0jZ60WG2Uxr
   diVFIfFGqyrMv6uDhKTbKonfBek0JLMsVdpSQAOauBqBSUVBU4Sl+Wlhu
   zI4U2SGe1GYUXbSIfhmuZuJSdITRJxm6Bw4+POqkqBYXWiDJBZ8ifUanV
   obLrp8Ql3NJMPWw1DphgAjiE4NZAYsdmt+J0Vi2nR696ty/M57NZjkW3t
   4hrJci8wVOWmb0XjUqlT3LUPQ0ntUN1ifGKT3edr0wdc17CLV7APZVN4d
   w==;
X-CSE-ConnectionGUID: yNakhyAdSa27GxA0H7YEGw==
X-CSE-MsgGUID: iyXNylGzT7q/t4pmOnLluQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31446437"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31446437"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 08:30:51 -0800
X-CSE-ConnectionGUID: XrkiueLGSwCKbCTQVvWMFA==
X-CSE-MsgGUID: 4F+XVfZBS/6ubuWAftuxxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92495814"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 08:30:49 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	rodrigo.vivi@intel.com,
	lucas.demarchi@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v2 0/2] Support BMG PMT features for Xe
Date: Tue, 12 Nov 2024 11:30:33 -0500
Message-ID: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Updates for PMT to support user offsets from the sysfs API.

Addressed review comments for the Xe driver udpates.

Michael J. Ruhl (2):
  platform/x86/intel/pmt: allow user offset for PMT callbacks
  drm/xe/vsec: Support BMG devices

 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h           |  19 ++
 drivers/gpu/drm/xe/xe_device.c             |   7 +
 drivers/gpu/drm/xe/xe_device_types.h       |   6 +
 drivers/gpu/drm/xe/xe_vsec.c               | 232 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h               |  11 +
 drivers/platform/x86/intel/pmt/class.c     |  10 +-
 drivers/platform/x86/intel/pmt/class.h     |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c |   2 +-
 include/linux/intel_vsec.h                 |   3 +-
 10 files changed, 285 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pmt.h
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h

-- 
2.44.0

