Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A04235674C;
	Thu, 11 Jun 2026 04:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152498; cv=none; b=DALQPtarjGjnsHqtIMJTdNA3He9UZhQad6eHB/uxNwM6zL/N4tflTqCGwDeFksal5tDMCd9wPuIYBTXN1d6xO9uvkfg0Y6dWIWiBh/AV7FgGF8c/XvyXkI0DELntiW3uNLLGbzCRWRrZfFbpLdUyBTG3Qc/EHfEVNR/Y6TdGqhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152498; c=relaxed/simple;
	bh=gaRhXb5kRm/ds58KQZEuDWSj2ENkqt4I8V1TX60pFDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dsU7yODKeJRvbWuLQAEBuFRxCV0nEUOHmJMOWZq23ZpFGOFVGi/lZnhNBaZc9KgUMrWK3ASNVto1nuSEXT5hud8PJR75wMzw+U0heIMcg/JCPRUI9D7cHlJbZuP4d52UB1GbW4fQXnM0tHIE6Q81azaDnhNz10Y89iIoZ/QyScg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BT3ZjWir; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BT3ZjWir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781152496; x=1812688496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gaRhXb5kRm/ds58KQZEuDWSj2ENkqt4I8V1TX60pFDA=;
  b=BT3ZjWirycHJFXaJVp//9K1BzYImKArCqqxEQu3/69TgWva4mh4+4Wzf
   awdbCxtXLxejR2PYngn4ILZv9CnbYJceGByFS7fZ70DZcCgBcteGEE8ex
   SWjnGNC8dJM4vbGB9oq0CiX13UNevBv+7uHcgWPAJHlQzXCkG9/g8C4C0
   5t4YJN9qWkMGUUI1twErYCCeg0ZrDFZoeoLQh5FrS7EIT5C7CjTkvMZyc
   JT23BmCkOWQLaWEv6H0ssP36ravze4PZ01CF9RMkyZn+nNrvge5w6/Kg3
   DpFtDzOTeobCf0dYrBAHc3s/2ey1aG+vCRwVSaK2sPojpTKwps6FcZZPM
   Q==;
X-CSE-ConnectionGUID: guM3vFiETr2tBRf/Aoz1xw==
X-CSE-MsgGUID: TEsaGWlfTyOIhYbY6tPcyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84531003"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="84531003"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:53 -0700
X-CSE-ConnectionGUID: 6JAFs51aRR+kA9xUGiwOFg==
X-CSE-MsgGUID: m7np6hH8S++42OGKmF1vBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251468347"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:53 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v7 07/15] platform/x86/intel/pmc: Add PMC SSRAM Kconfig description
Date: Wed, 10 Jun 2026 21:34:35 -0700
Message-ID: <6688a5df5b30611673091793e7ab7af270fbfc5a.1781146840.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781146840.git.david.e.box@linux.intel.com>
References: <cover.1781146840.git.david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Add a proper description for the intel_pmc_ssram driver.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
V7 - No changes

V6 - No changes

V5 - No changes

V4 - No changes

V3 - No changes

V2 - No changes

 drivers/platform/x86/intel/pmc/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/Kconfig b/drivers/platform/x86/=
intel/pmc/Kconfig
index c6ef0bcf76af..e9012b703918 100644
--- a/drivers/platform/x86/intel/pmc/Kconfig
+++ b/drivers/platform/x86/intel/pmc/Kconfig
@@ -28,3 +28,14 @@ config INTEL_PMC_CORE
=20
 config INTEL_PMC_SSRAM_TELEMETRY
 	tristate
+	help
+	  This driver discovers PMC SSRAM telemetry regions through the PMC's
+	  MMIO interface (PCI) or ACPI _DSD properties and registers them with
+	  the Intel VSEC framework as Intel PMT telemetry devices.
+
+	  It probes the PMC SSRAM device, extracts DVSEC information from MMIO,
+	  reads device IDs and base addresses for multiple PMCs (main, IOE, PCH),
+	  and exposes the discovered telemetry through Intel PMT interfaces
+	  (including sysfs).
+
+	  This option is selected by INTEL_PMC_CORE.
--=20
2.43.0

