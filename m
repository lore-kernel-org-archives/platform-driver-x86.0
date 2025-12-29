Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97B8329376;
	Mon, 29 Dec 2025 18:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033298; cv=none; b=nfGWq9+zgROHPXtnVC8cxR68T2DnkA15xeN8M41+iQKO/HQrI/DrW4lsZ/+TpXpfWmV2prNcxNNXzcLwb/wgJX5ytxAa9YjVv6PkA63tGeYG5YXIRHRGp42q/Vjxwlj0X4tFwi+c80JJtuy9EqYDl68Vq6GfudkX9iodyWZG5i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033298; c=relaxed/simple;
	bh=4q1Jjqv8GO9z+Zu6jmtpMjrczwAgyLNQRsyarTm/BjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pOXvfB860lSnBITX16irY1BfiQFiyTnNaxyjy2UVxDyg86Hfs7VP4jD7xonepLvC/rMGReri+EKL3c8eRwu6gS8LS2s7vVPgn2eGG11f5EnrzWZxexQt8KLpbT/MnTRRlOckY4oJ+GtcDweEf0LZbgAa7KthYiiuTzCR9Wk56AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgSGyaYl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgSGyaYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767033297; x=1798569297;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4q1Jjqv8GO9z+Zu6jmtpMjrczwAgyLNQRsyarTm/BjE=;
  b=BgSGyaYl7CGXO68Bt1VbQFZejY6rzoQsCQcIOrqQisncJt1/2UaXGzoh
   Pl9185U3DtCH9FDmibIkPcJc6LkhHxd5mHrkn6jmKPwoHdP8yl9lb9LyN
   0ERdijoeAMc9CSUwKG8OnP0C3WCNxsdqgx8Lka+20WmzQbY17SlWtD2GS
   4jAJ1WfPJu/JPtyIiwCgxpwJpHflHGgUJqNB+LTcfWfOJmvBl0CIOH1yx
   427oVHXEGGC0IyEKMutgzlO7Tct6ISZkWMdQk8+Aa0dBAXnLc6G4q8hVF
   uOo/+7yOsM6bwffriRfrsxQvnkJDD14CODYAQRsnK3O+Qaw98d2eXIAIu
   g==;
X-CSE-ConnectionGUID: n7/Smz6XSU68iDktPrLR3Q==
X-CSE-MsgGUID: VAa9vt5URQuMfuKGJawnsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="86218717"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="86218717"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 10:34:56 -0800
X-CSE-ConnectionGUID: c+4tfYxNRImbThXgbV6tQA==
X-CSE-MsgGUID: d/N1BvNXTXO3bR/Y9Igquw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="205120422"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa003.jf.intel.com with ESMTP; 29 Dec 2025 10:34:56 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/2] platform/x86: ISST: Fix for write lock and suspend/resume
Date: Mon, 29 Dec 2025 10:34:48 -0800
Message-ID: <20251229183450.823244-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two issues, which are not urgent as the current deployed systems
don't support them, but need fixes:
- Write lock- Even if the TPMI is write locked it will still write to MMIO
- store-restore data during suspend/resume: Not storing and restoring data to
all power domains.

Srinivas Pandruvada (2):
  platform/x86: ISST: Add missing write block check
  platform/x86: ISST: Store and restore all domains data

 .../intel/speed_select_if/isst_tpmi_core.c    | 56 ++++++++++++-------
 1 file changed, 36 insertions(+), 20 deletions(-)

-- 
2.52.0

