Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7318D33F5AC;
	Fri, 13 Mar 2026 01:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773366748; cv=none; b=F1xuwAWNDT2aGGsRzHvhWKYukND4zeMt1MKR+1fomOIGZQlQ7+NWduU/KKnju1TroFBTStbOuqw/4J9aQJxiA5i+DCT71tyepGN0S47ZJt5nBg/2lyeuL1LxrMaXF+oG12URbV7xf8zXHQ+fEO3lQqBIdX8d6uvTJPMLgGEIucM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773366748; c=relaxed/simple;
	bh=oK62ziaWRZEeHdn6QKfZTdBWNMnudX7CnmBCvVF30Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUl7721P23lz9oGyi4RL2W2ey6a8GZY3t8CzeBUfZLdH5jtyLotGn61c3mUdPvzcn9NtifkcdeT/NvUz7Fn2EY4sEaD7HTC2SnjuGRrG/JO7Ihj3WMNxYK1ZIvqOqWbm2Wyj9WPLm4FRq7kOw3aEHOb8CEW811llmH3wLjNionE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H89JRZ1+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H89JRZ1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773366746; x=1804902746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oK62ziaWRZEeHdn6QKfZTdBWNMnudX7CnmBCvVF30Qc=;
  b=H89JRZ1+iNdiKl99xiUALg8G1L2Xcyjgpk+l5y7uoG6nT4nPaWcguCPZ
   F4wTaoreBKQgSqoooJIIx+pBXvLnV07Bg4BSfpH+W9LxMjQ/K6vDG0JcG
   W5xWZwVfecSrLCaY5YosHcByDrQ2DdsVeE0DZ+QqSipCQwTVFAh0KPaNU
   dxJ0qTuQ9L+7xm377o7jZelFvyiL37KhSW7nMdtfno7UpnPIuaizJuB6l
   7jA1zeGJQRpLveO5tNQ/1+njE+/vBmAf3xaLHOH5LrHDDuvMAYcjalvs4
   Hsb7J5z5VbSEpLhS4NbOo55t6mH6Wh4QGN8J1tBE4oSZZudGSvIytjKp3
   Q==;
X-CSE-ConnectionGUID: iDaBG+j8RLiVnlih0xkIpw==
X-CSE-MsgGUID: 2vgEw3HFQ8mY+s6OLcgy/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74354587"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74354587"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
X-CSE-ConnectionGUID: HWWsdKe5Sf+B6I1+K5IkcQ==
X-CSE-MsgGUID: dZ5ZPxUASR6KiXj/9Zy4Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220108506"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
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
Subject: [PATCH 13/22] platform/x86/intel/pmc: Add PMC SSRAM Kconfig description
Date: Thu, 12 Mar 2026 18:51:52 -0700
Message-ID: <20260313015202.3660072-14-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313015202.3660072-1-david.e.box@linux.intel.com>
References: <20260313015202.3660072-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a proper description for the intel_pmc_ssram driver.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmc/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/Kconfig b/drivers/platform/x86/=
intel/pmc/Kconfig
index c6ef0bcf76af..0f19dc7edcf9 100644
--- a/drivers/platform/x86/intel/pmc/Kconfig
+++ b/drivers/platform/x86/intel/pmc/Kconfig
@@ -28,3 +28,14 @@ config INTEL_PMC_CORE
=20
 config INTEL_PMC_SSRAM_TELEMETRY
 	tristate
+	help
+	  This PCI driver discovers PMC SSRAM telemetry regions through the
+	  PMC's MMIO interface and registers them with the Intel VSEC framework
+	  as Intel PMT telemetry devices.
+
+	  It probes the PMC SSRAM device, extracts DVSEC information from MMIO,
+	  reads device IDs and base addresses for multiple PMCs (main, IOE, PCH),
+	  and exposes the discovered telemetry through Intel PMT interfaces
+	  (including sysfs).
+
+	  This option is selected by INTEL_PMC_CORE.
--=20
2.43.0

