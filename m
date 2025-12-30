Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3AE18A6DB
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767098879; cv=none; b=mJRIOGmdXjkKMNx6dGx81yDHFGuxe3UvLZ4HJn4PdAKORz60dB1GVCbYrdM7MHqSOgHdn+q0pRMTZm8H30aU/yeWZhJPNwSg5E900g/mbRDiDaWx8pvePuHzx2Os/nY2iHDTtxbriAdl5yV4uY/VaRcWRBM3MyF0veK41rwdY80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767098879; c=relaxed/simple;
	bh=ajyHyDikxLKCeNBB92ciQ0J3DQRVJJqgmPnnGX7MVWw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GTpyT20HILQLgzldIwVmy0vLzkG/ssjsen5KhU73KbdAmIgJNyjKjqyT6s4o0kF+Eff7Byju6vcMSPBngxB6bbjHC9/zTQpWsEmFc3JyNqrSz+6cnn9l4sw5t5WurRqVLoisMNCPV++a7YGzf0iHQt+rx7kuIrJXJhOvRac4ieI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+VHvPKn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+VHvPKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767098878; x=1798634878;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ajyHyDikxLKCeNBB92ciQ0J3DQRVJJqgmPnnGX7MVWw=;
  b=h+VHvPKnAdaEjDW3O2x/+qoVSY9BNimbs44Ogcc71GU+gaJfFWRjGabl
   RdJJOdfsy+YzNrCRLq+epPSAKYOd0diaI6NeqoqK9kTghyM1UP3ZdmhXd
   kv3hwROkxZ0pGMopKDIXGJdxwiBA253VCFJF0TOWdhgRhE+Zw5u54okfx
   NgeTOocgXyFn9LXK4UCnDhWrAffwX9zQSIrYhftfSSzIMkDjACqhXZM26
   9g+K/TwzZ0ql/R0Q+CGaNPCYwpek9p1hTqHhYB1kvrKIMQfRas0wWzJ6m
   9AX7RAWeF6sEviT0PHoQFN7bFOHHK7BoRL2MJ1A0p2NFai/vovN5iFCnU
   Q==;
X-CSE-ConnectionGUID: Xnk8NWkXQ1OLqn8GwDyqhQ==
X-CSE-MsgGUID: iJAfD9dFS4uHvDD2ejaOnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79319819"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="79319819"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:47:57 -0800
X-CSE-ConnectionGUID: o+mNNjvESqOA2a20wLImZw==
X-CSE-MsgGUID: 8Wl/Nxn/QwelXt/ivPZWZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="206266965"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Dec 2025 04:47:55 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: srinivas.pandruvada@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH v2 0/2] platform/x86/intel/uncore-freq: String handling improvements
Date: Tue, 30 Dec 2025 18:15:14 +0530
Message-Id: <20251230124516.229125-1-kaushlendra.kumar@intel.com>
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

Patch 1 replaces sprintf() with scnprintf() in device name formatting
to follow kernel best practices.

Patch 2 replaces sprintf() with sysfs_emit() in sysfs show functions
for proper buffer bounds checking.

v2:
 - Patch 1/2: Use scnprintf() per reviewer suggestion

Kaushlendra Kumar (2):
  platform/x86/intel/uncore-freq: Replace sprintf() with scnprintf()
  platform/x86/intel/uncore-freq: Replace sprintf() with sysfs_emit()

 .../uncore-frequency/uncore-frequency-common.c      | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.34.1

