Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5084838E5D7;
	Wed, 29 Apr 2026 19:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777492345; cv=none; b=labENo89FUr6ShlEu/EfqeQGhK0f47FpcbJ8XMfvoMUbQS7TqI05cfaTsx0VMT9jwWmfVWQIiib233njUUGUgKYJCI8+mCguI0TWyjwy05vqoLvKrafr9g38vVDqq48P/TRi92UEfnqrRhPEL2MkM90UnHWPe0tGXdktsUa3Hp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777492345; c=relaxed/simple;
	bh=ok7v9q19xgzXnT7Dz8GK1RXCtFB3BNzyyAJ2gXnZPT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cbLePrAusZd/kgtumZHoMja66cKXejDWKhqvDw2py7Yw7CLlP9R1m/TmlvXqemi+YLCbz2Hc5MehFbLPxPfcK+futFqWAsapr7WSoE0bB4KNSoBz3QfSsMhsBYet6zQfrBpjtxfmLrJ/mVSY+UpnRWJ0ZcuYewcRdOUzSl/dHpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzNurkNe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzNurkNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777492344; x=1809028344;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ok7v9q19xgzXnT7Dz8GK1RXCtFB3BNzyyAJ2gXnZPT0=;
  b=TzNurkNesaFTKmLoPSGSDQqWpfi3mAGTmdVrVcIV402QmjAIritzS5fY
   d06SCwjJyfl+un1lZq4Fq/IyPDKU12kiWsiZfFeqblkgYhB8ohx9OjQDm
   WGsoQ6GgXW6MxZo57fp1qZyVY3ddYtn7XuWw1sK7BR4A1u/tO0e/YW2s8
   wX6V3aSiDL7SmTOJWyhLLtDTWHcy4Bo++cHHMtcyNP+DESKhvmU7PBAlw
   wTxNByb70ytu7XEYktc0HtIHfMezIcBKEpTGTQV/P6wFb4B2WuXF1+Yi0
   3qZwuWzEFJMRJkrUqrt2/d4goPD053Zt6HWoapCPiL0ONkUpE9XqFMM4q
   Q==;
X-CSE-ConnectionGUID: hmJk9kyAR4WT7eR6bwONmw==
X-CSE-MsgGUID: oXDTRQerT7W3lse4DERpmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78326731"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78326731"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 12:52:16 -0700
X-CSE-ConnectionGUID: NsARGqJfS5GMtvLhxNClWA==
X-CSE-MsgGUID: aoqLJMuiSQy9BTM6fnmUdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="239385672"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa005.jf.intel.com with ESMTP; 29 Apr 2026 12:52:16 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/3] platform/x86: intel: TPMI/PLR PCI unbind issue
Date: Wed, 29 Apr 2026 12:52:11 -0700
Message-ID: <20260429195214.1532711-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When VSEC PCI device is unbound from PCI driver interface, PLR driver
causes fault. This needs notifier support for proper cleanup.

First two patches are required for the fix in the patch 3/3. Hence they
also have Fixes and Cc:stable tag.

Srinivas Pandruvada (3):
  platform/x86: intel: Move debugfs register before creating devices
  platform/x86: intel: Add notifiers support
  platform/x86/intel/tpmi/plr: Prevent fault during unbind

 drivers/platform/x86/intel/plr_tpmi.c  | 43 ++++++++++++++++++++++++--
 drivers/platform/x86/intel/vsec_tpmi.c | 29 ++++++++++++++---
 include/linux/intel_tpmi.h             |  6 ++++
 3 files changed, 72 insertions(+), 6 deletions(-)

-- 
2.52.0

