Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7952F8EA2;
	Fri, 22 May 2026 02:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416527; cv=none; b=HBePOq85N0xsHmKKhcRYm48DR1jFUVyQYBnPtc2Eq/YEbE+6AFflemxt0zSGoYVoDs/mx8IUfDMipu7elh7lg/uJOnVJP9hwAUUBjlQXfkHidRwFgYbz8/lcTpJmFqjyPDHSWsZ2RZwnazLImnYcCgXENC3h2qGRJoL/UZcQRh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416527; c=relaxed/simple;
	bh=FdJ+h2vB/uOHV6zDaCYIeAKz9qw2H4PgMaK+DfZx5Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YScX1u0x3B+s0GQOVVZpZ0Ua3cd+woeu4XTQB3KxBtPZ0LJruQFO4wW0yeqiBltMxel/lsjYGR3+BbEGSMbFG+FH+Seu3G8PbHRTPqSK85WhMmvvekDgjUUV+By7lxdiz37RmnfGYwdNrnLaWpX6g+k9pbd/LcRGYvA2Kj6a9JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEn+9fiH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEn+9fiH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779416523; x=1810952523;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FdJ+h2vB/uOHV6zDaCYIeAKz9qw2H4PgMaK+DfZx5Cc=;
  b=cEn+9fiHzy+7GwEeTnJ2B88m37wCcD+eciNVGYXcfVBaR8ybsZGuqXX7
   7JHpFZTxI7gHGvwCgTx2dCMzl20j5mzpywv9Ne/cJ/Y59cDYsZlNkNp+i
   d4H4HBiIHI5o2Ri0oZ+PK2bueX7xzCxhk5GeniWw9x4IC2Tf5bz1kQoF/
   cDWw6flhKfOXy44nhGmN/zyYSYbbdzw9DAUY+tKJKUWpsJ0Q14IFtd85S
   /LrfOUykihBbWXyO+x5ErKTAY9KbYt+fNwM4WQbIu69LgAak+UKASDNhP
   iu6PaKw6sYLP0eUQQ5LftG+mtYHx0q5JR+y3pT5tas5RKsZ+XXHoha4A4
   w==;
X-CSE-ConnectionGUID: HlEIfl/yQESRqAcouwPFPA==
X-CSE-MsgGUID: 1a6gnVOOSJOkAhp41igiZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80400535"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80400535"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:21:59 -0700
X-CSE-ConnectionGUID: +H3JmM5NQHign+5MQkDg3g==
X-CSE-MsgGUID: qFF4oBWFSPaOZQJaKY1JLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236335376"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:21:59 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v5 07/16] platform/x86/intel/pmc: Add PMC SSRAM Kconfig description
Date: Thu, 21 May 2026 19:21:37 -0700
Message-ID: <20260522022147.4137494-8-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522022147.4137494-1-david.e.box@linux.intel.com>
References: <20260522022147.4137494-1-david.e.box@linux.intel.com>
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
V5 - No changes

V4 - No changes

V3 - No changes

V2 - No changes

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

