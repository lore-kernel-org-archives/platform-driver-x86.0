Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33F42D29C7;
	Tue, 26 May 2026 01:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760056; cv=none; b=K+CblSW24H/xOGtpxaqAs7rX2FZ14q3JpS4kdya90sNZDlVKXT6yIJ1FCTL/YEi63gsb6qSurHUtWAcIkFP0q3vMp9suklnKU0CLiLAiVQXstdQxaDVVZZPi1IxbD4Eo/R7d6hyzucYZ0tvj00qqbUKiJkP90Uigzt+an/X8AQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760056; c=relaxed/simple;
	bh=7PnYQXX3hysJdgU/mjlvXvlnJYvCFAbTj3vnguVIKHc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RAExq/2G5Z/si8kEVLniaD3W+g5sNSBCI3lNnrxif8Ugn9mwT6i6y/nsWXXD+KA/iRVBiGOF92sGaipFZAdviLgWSYeQkzNdH3hGS13MaOjWf/Whc75feXg1E1w/wsVdCOUt7/mFd6Z4wFITHKmbVBQiK+gQaEjH5AhjUkF7IiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVcuUp15; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVcuUp15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760054; x=1811296054;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7PnYQXX3hysJdgU/mjlvXvlnJYvCFAbTj3vnguVIKHc=;
  b=eVcuUp15+Yo7lchidI7SIPN++6pmtVo3X/ERLRNLn/B4+y4ZRFe0N97i
   l+L888wP9OPr8mmXYeJIDP//odtbK9rh2aIV2nRnjWCM+x73kJ3ABmImh
   6ub3AgVWHs693P3eFRZERXJuC/nqHe7/vHmnkcDXAa9m1qj1803ECJVJ0
   g+GDIoVeUhIdnHPq2aEducZOVpTwJmAgYo7LK91lfaFNG5Yx3IZvuO46A
   WAfT6FonTDk5ECIQeA75poACWw10gQaYkXYmHKbezEZwmUD1W3dDVuA1q
   3ODuAAtjeeZld0kiQME29G+8CsAxEz5J7KrkPQJWWtf1wM5ykcAg7TMqg
   w==;
X-CSE-ConnectionGUID: K0RlrcsCQDGy2sBqhG12BQ==
X-CSE-MsgGUID: E4vmZW6+SNuqlqicn8bIaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539886"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539886"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
X-CSE-ConnectionGUID: k2prdb7wQwu4mBdpcarEng==
X-CSE-MsgGUID: hHNZNZj+Q7KESomGxw9XnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074968"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 01/17] tools/arch/x86/pmtctl: Add MAINTAINERS entry
Date: Mon, 25 May 2026 18:46:59 -0700
Message-ID: <20260526014719.2248380-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526014719.2248380-1-david.e.box@linux.intel.com>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add tools/arch/x86/pmtctl/ to the INTEL PLATFORM MONITORING TECHNOLOGY
(PMT) MAINTAINERS section so patches against the pmtctl userspace tool
and its libpmtctl_core library are routed alongside the kernel PMT
driver.

Assisted-by: GitHub-Copilot:claude-opus-4.7
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2c6d79275c6..5bd59c044676 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13198,6 +13198,7 @@ S:	Supported
 F:	Documentation/ABI/testing/sysfs-class-intel_pmt
 F:	Documentation/ABI/testing/sysfs-class-intel_pmt-features
 F:	drivers/platform/x86/intel/pmt/
+F:	tools/arch/x86/pmtctl/
=20
 INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
 M:	Stanislav Yakovlev <stas.yakovlev@gmail.com>
--=20
2.43.0

