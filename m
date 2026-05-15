Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C5F258EE9;
	Fri, 15 May 2026 00:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778804511; cv=none; b=hHSJgroDxiCPcWwIZ3s2/1JkQtqYJos8/E1/T7SUKTugxx04oXxVzISr2Tevzc1GAQZK8LGsnORMs6E8oL4GRH6g5O966JDwoMDpqUYIZ01MBBIb+wvQlkgE4JxIwilNCz9u5SQ0FAv+g1wZILOBrmnkNMkB0tkHFFN37GGgMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778804511; c=relaxed/simple;
	bh=Gp3B1Z7ppa3wkxrYXJtya14Kl7G0mknyX9vN4uOSnMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sRI9DJs46PIdHcP8/PmNR9dU2XamO8Iiy8x2s0/Jo4hCRiG92Yx7Jog3S8UP0tBS5WMGcZpnbePjeglmuXaf9cEDbM2MrwbhN18fGMPwAmZCe2yW8hOdEFiF+Gv/NtD9jNwB8tAD5RNugbFfPu4gI3JM8nGDSnsZXLAoxXp0hzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3L0YJMz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3L0YJMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778804510; x=1810340510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gp3B1Z7ppa3wkxrYXJtya14Kl7G0mknyX9vN4uOSnMM=;
  b=j3L0YJMzmfAEWHT0m1YpIj+zWDV3bHjrLc6tiTni/LArxBQDfDEINqwo
   3Tsf8mU4DRkGAN3u8JazfQ/DQN2CLXmiz3/HWWTocwRdRQOBvb9R97gT8
   M0MNQm0LGqDiD6Owoir419VMSHgmwImGba816PuZVYM8LToHDI9YMlM0T
   K0bgTkgzHjdNbd1+LKBb9bQ3QJXi+7ZXm1wFtV6MZKGV2n46e+QgScTwy
   /ESXyasPav0yjUZaHUPR8YRB5YgHF6mXIsUlr2QlT6jaQfOMSF5iYsMnA
   N4cWFt3qfptQqdmBWJfKOkWxz1Kx7x4TUNbc91IzW+9c9lr6W2sjNgARX
   g==;
X-CSE-ConnectionGUID: ethuJZFkR5SGtKfsK7vt6A==
X-CSE-MsgGUID: zY9n7xlfQ72xAmAFaW528g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78895165"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="78895165"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
X-CSE-ConnectionGUID: jlVFc9PkR2Wd2+eEn1i94A==
X-CSE-MsgGUID: Z0o7qSytRNiU6KIsdgZAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242879072"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: y,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 07/16] platform/x86/intel/pmc: Add PMC SSRAM Kconfig description
Date: Thu, 14 May 2026 17:21:14 -0700
Message-ID: <20260515002130.701457-8-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515002130.701457-1-david.e.box@linux.intel.com>
References: <20260515002130.701457-1-david.e.box@linux.intel.com>
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

