Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103695;
	b=WW2ilRwE+aycW4yn7cpxMAEofqYWvvW/pksq0YrE1QAVO5MKbkBKBjZdjbPcHi7f8tDd
	 16U93xbyUxafuunjpysetSEiG3zo++V7X4OH6HGC8O3n8Zvijv6Wdrq9+E+pkCYp9xCPT
	 haLL/pBIwuAykr6xSXU1Sjk8B1tuwBR9HoilUCmee6y9KHHn1ixQLIzmwyXLHz3lUNivM
	 m3QdHE7pXNW2MmeV8xtUCiAliG+7CVbHtbtGcjddMNjeiAuAnY4ooz2eRCPr/4AfilUwz
	 A/uY6xcJX3I4c2GReNbcULsF9f+oxAKOVzYbPDReouZQwBP2QeEqoK6axJXfbfA3yww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103695;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yzmrwzYS7dV3aOhrOjjG4hDT4PSPUDedyuRpM8nsd8o=;
	b=USAoXd4y6ogW1r1rUYRf4G0wt87QEr1H00NrT9pvm6YlePqhV8C7gkJwSDSTLEASJEBA
	 4aaZB06BrH7em20qEz7/eUvmNjhF7EwhoxMeR0rt2l/B3og++9WsnRH8HZwBCnFNVBDaP
	 MnFpuqxgYSooFRfmF5I+U46Sk7EvSlSnnr23OCWTNyFGfh3eiUZEf1hPxUfGUTbxWN43Z
	 crxgAEXx+j89gNdXXNOkB9YQoOYMqyQjPdUozzFiImP8FFlCm1+8iYFpf/+U1AU/nZ4xQ
	 hUlbZqRs7ZE+tftqAdFfCzuF5f5uhSlA9mYq/lIsTUE8njhJuWTofav/9ee7vkCU+RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nAkrUDk2;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC08C606A334
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC08C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nAkrUDk2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103694; x=1826639694;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=prgSxi1FX+nYoYm0BCX8xny5QzKp079AhJ6Rq9zOB9k=;
  b=nAkrUDk23boiju8ueChYFzULZtEpMPyFtHKPx81B78p15kpH0luFTEJM
   RVqlKcUlwhUSHbw8zy3qHbt8m/KDsylv1zjDVHKl44T+SlY6YeHwFgc/z
   VMQjFCJZpBRqrTS/giPLDdA+p+ZBL/FviPPJfskt9m9a+ykBdDDyKROYh
   kMCp8R3Gvlza+B50W9oeF64anarmdrH+8Mp9DJo8ykvQKwIq5ij9edvRH
   WDlJ0mCVb2vpkW1kEPJkjGpNSJ8jLb82xrwzuQSoPSwDl2g4lyNAAYf30
   o/J6S/HxgyMxvBtYOLcqb7SitYKIlnTS8iG71sFFj5GZqDGbrG3YOtDOm
   g==;
X-CSE-ConnectionGUID: idjCdBIjRw2IDggEQ6WFLw==
X-CSE-MsgGUID: WUVo/xxsSBavJZ/krnszQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3848945"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3848945"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:52 -0800
X-CSE-ConnectionGUID: kMyEgcPQRJW6t7AEWyVNHQ==
X-CSE-MsgGUID: /TQYlpUJS7OkMDW9eNfxeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263379"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:50 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com,
	anoop.c.vijay@intel.com,
	badal.nilawar@intel.com,
	matthew.d.roper@intel.com,
	james.ausmus@intel.com
Subject: [PATCH v19 03/19] drm/xe/vsec: VSEC requires soc-remapper
Date: Thu, 19 Nov 2026 07:54:41 -0800
Message-ID: <20261119155438.40762-24-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119155438.40762-21-michael.j.ruhl@intel.com>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Survivability mode includes xe_vsec_init().  VSEC requires
the soc remapper to be initialized.

Add the correct init to allow correct VSEC behavior.

Fixes: 32eab46a6160 ("drm/xe/soc_remapper: Use SoC remapper helper from VSEC code")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 91a0680e449b..10f9de4eb03b 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -21,6 +21,7 @@
 #include "xe_nvm.h"
 #include "xe_pcode_api.h"
 #include "xe_printk.h"
+#include "xe_soc_remapper.h"
 #include "xe_vsec.h"
 #include "xe_wedge.h"
 
@@ -354,6 +355,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 
 	xe_heci_gsc_init(xe);
 
+	xe_soc_remapper_init(xe);
 	xe_vsec_init(xe);
 
 	if (survivability->fdo_mode) {
-- 
2.43.0

