Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B572BDC0F;
	Thu, 30 Apr 2026 15:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777561874; cv=none; b=F0uvaK4xYpUqvzGaoBQVVOiIg2SILm2CAaPPUKCQa8vWnasaUTEb8EgtE0yIDtYosrAd3wk065Rbgu3sS8sVG5ns22k186uBm6luSyT5oyQYa9YxbB26YK4MmVRTjjhV5SNmiFTqs5IIudFaR8vz1jIxHG3ZKpL+Z8vrJPz0BAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777561874; c=relaxed/simple;
	bh=P11o9sO96W9YQyXy71f0dcGk6o5SxboE1hnskXg7Yd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hWFFVFt2UynQFDx//LysFQvae/n1cA04LfNXgxDKlAOxacBuI1Kbjirdf1a1iVxIBpBYNvOQ1sIeYw9es9Iw8ZJJt2Cm7/AljzJHTmi1U1NwdBT93LDzrnhZcAFW7PNjWnNKKMuAe7BKgZK5z64fXz55jWRSNfHZMZWnXtRdlYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSSTN8UX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSSTN8UX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777561873; x=1809097873;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P11o9sO96W9YQyXy71f0dcGk6o5SxboE1hnskXg7Yd4=;
  b=DSSTN8UXopelOVNqqVkpbe1BvJyZMFHpzhjVSjSYEhtwXBTFspGYQjFO
   TT5yzhyKTHOUzfKQocFA9XGZ8395fOkms/6eZrfiR9kBcSRhISFRBnZ67
   xJF9f5NDssiU7Id7F1jBLRS5cPHykkfjmuJbc3MGdE6KPBRSInusfKa6Y
   AIDM02kTPMMXw+70s/lxxIPNdq26DJPwXbBXrT9bcsZ2M4h9qrYfaIj9q
   /S6qD+bCSvv6VB4/DDCzU+DNla3SZ/0rfUJYkDmKhOdL/S2T8SXn+z4ZT
   IH/mgy3QX/KdXJ4qrzUZw0+g49Zldx3RJA8sp7zdToL0Kd93gD3kdqpiV
   A==;
X-CSE-ConnectionGUID: pG6dtW/KTX6VGQXcEVDXrg==
X-CSE-MsgGUID: 3rYELK4URDSWPiAqR02RZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="88828152"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="88828152"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 08:11:12 -0700
X-CSE-ConnectionGUID: CbmxOxEASzmELEWHcfR7+w==
X-CSE-MsgGUID: K8RFyOxnRxuBvagqqjhP1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="258194277"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by fmviesa001.fm.intel.com with ESMTP; 30 Apr 2026 08:11:12 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 0/3] platform/x86: intel: TPMI/PLR PCI unbind issue
Date: Thu, 30 Apr 2026 08:11:00 -0700
Message-ID: <20260430151103.1549733-1-srinivas.pandruvada@linux.intel.com>
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

 drivers/platform/x86/intel/plr_tpmi.c  | 45 ++++++++++++++++++++++++--
 drivers/platform/x86/intel/vsec_tpmi.c | 29 ++++++++++++++---
 include/linux/intel_tpmi.h             |  6 ++++
 3 files changed, 74 insertions(+), 6 deletions(-)

-- 
2.52.0

