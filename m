Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C552F616B
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 08:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767082107; cv=none; b=u9ycvbNYy6LKMXnpQ+HFNZbdOjEaoW5BoJG37t53MJHmzOK52lPyt8jpidmZPCSIfAUoZ0hSiE0I3PndqYOdRpKVY4YbxtQ1Z6+S/eVXdCINWYFJa/DEuBIslbPs2Ipq2zpOqpsZEELCog3nAbYK1d/3uWg9VIeIXzIG8q1H+4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767082107; c=relaxed/simple;
	bh=n4uHIsm7Xwz9GJIzzKF35HDZgxm88UzD/GGXHBoId1w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HA4Vo1gwlAXShSE4daRDhmioyfrhgHI0HGBVg5TQDT2FOXz3Lhi5X5dpWScVjf/ohCuvzbmHB4um6OXlejyDtNLSyDjWPlH2N7yRQwLbaM2H3eGoqAVHjLrMagBNFAImh6tw+Hi6+eIp+0qmLbkpT42PiZsSc0QPHAHG8TArQqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2ctn/dQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2ctn/dQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767082106; x=1798618106;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n4uHIsm7Xwz9GJIzzKF35HDZgxm88UzD/GGXHBoId1w=;
  b=L2ctn/dQ+pYKnDcrG/JK5Pwu0H13fE3J9aRCORQC4Jsj5jIsfdw98Un/
   zBFNmQ1ljXtuEgmQSBLpxPJFCPg1hIIrm3CNUUcrPExRh5+vqVQvCtyK+
   Ho5K4WSwynvsXa9v6TY4CbJfiwd8JdAmtnS3/TAkco4JKkdb+1XHMxVEa
   W0QmfxoiIJVgDvWzG40/0hy72fRG8RYnv3CwWVZp1coDunRkeR0lIiw2r
   XJYprJYASP+B7n4Mjrx/P+nDaubEmceylLjZ/HBdLJAMZds6fSOMznskT
   +oxGL/Tmu1PH6eb137s5d5UF83SZ/h3jfVS5obPZbLPUExEMzYRUFc1jR
   g==;
X-CSE-ConnectionGUID: tLMaW51VRKiBI4iE6knPaw==
X-CSE-MsgGUID: FmYXmEyRQl+iAuTqAgN2zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80043971"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="80043971"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 00:08:26 -0800
X-CSE-ConnectionGUID: PzTaT0WxRLWE58jEHSTztA==
X-CSE-MsgGUID: L4IpvEwwTY+LTuQXhD9g5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="206050435"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
  by fmviesa004.fm.intel.com with ESMTP; 30 Dec 2025 00:08:23 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: srinivas.pandruvada@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH 0/2] platform/x86/intel/uncore-freq: String handling improvements
Date: Tue, 30 Dec 2025 13:35:43 +0530
Message-Id: <20251230080545.224954-1-kaushlendra.kumar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces unsafe/deprecated string formatting functions in
the Intel uncore frequency driver with their safer alternatives.

Patch 1 replaces sprintf() with sysfs_emit() in sysfs show functions
for proper buffer bounds checking.

Patch 2 replaces sprintf() with snprintf() in device name formatting
to follow kernel best practices.

Kaushlendra Kumar (2):
  platform/x86/intel/uncore-freq: Replace sprintf() with snprintf()
  platform/x86/intel/uncore-freq: Replace sprintf() with sysfs_emit()

 .../uncore-frequency/uncore-frequency-common.c      | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.34.1

