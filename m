Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486084;
	b=WwOTb4cPqj+zutFJaq51Vs45vNW2fGbmAvWdmjL0bbgQGybYcN/TJMvOxzRpAbz9u9Xj
	 wBuUx3l8Jp4tKd4yz0KCpofPNOL2BHI7oJBgFfp+JGtlMfz//tfxtGmMDdLKUdj4nFNe6
	 +GPLHG+ZN7H7qBrsIoyfRKV/696534/YuiL68XaI5X1oYjchv8RKxUDs/c6lMMv7F8Yd0
	 BxdRsPldEn6Pdv6nzMsEwpHbnHM/vH6O/MPL8aDZx/NYTxpSReDwxXIJc69ewomtbXyoa
	 OHn+uE3mw3alvBUnNKCrkBH7hGKl9wCxRAX51VeO0YynRPE6Bshm6ctuWu+jcuO3/lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486084;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WmCRnPyQcqGAmc/KbyZJiRmgyIXqLORtIwWeIT6hugs=;
	b=eIz5waGpwbnw1Zep3pHR43pF+aYhYVHhxQ8Q3s6TjreisIuwOHl0nZ++pq2SBnnAi0fd
	 bytUJdZU1ULYacMNgTLbnJsFjRc43V6I5q7R+YxCMOoivfAZYThZvsSkE/rPP5uhsyQSX
	 B7crPvc63lZ3uhyfRwyUesgSjT6S8GC7wzngQXCaS2JP6P9JcFKYkeuExWRAeqSRuW4MD
	 n7dkYVxLehpxtjckf6IfZ5qT0QwRgdPuI1bcafqm9jjRbi1P3otMAJdZBo01lDxhDjfYq
	 ln/ZEBt3JFACTFnJNhOjkuNTCXsV9i/m2ulmMIgk4Rbvc+q86Ta5mnWKnpP+qI4nl+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L9tro2q8;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DABB606A322
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DABB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L9tro2q8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486085; x=1827022085;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NuDV/lqBLFYg5Wc4D4u773Li/GKPyfBWlL8alEGMaRM=;
  b=L9tro2q8uWsjkY6udzbAC7kDZ3KZEw0QDPvyhprW7jtH3/2mXrbh9DuE
   qRfiB+KPfOkhGtsvRVwnq4VDnIdOw2zSx9FmLA5BEeg6p5TkDeZ4p0bPU
   X8igdi6XNum+ofKazoxzK4bxd9eiHuS8uP2z7LoDFCw38WQHfLCBgshdY
   TnAAn9r7ljlKPwVSBuKBSeZWpG8G1n6vyWds1x7iYU9M/3UqbZo8vRb3p
   xeYbX0pIzka2JZiAqXmchlRjUEqshSbzu9B+B8c5691UmP/GvsMmJJQAH
   p9qqgS+1yiJFKI84asbZLWm5mJEfZCh8i7XCb2sHU3Y5kJ88XpMpngodp
   w==;
X-CSE-ConnectionGUID: 3w1jB4UQSQ+yJDVcfHKuvQ==
X-CSE-MsgGUID: +M4yVvssTNG83KC0r04hOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153495"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4153495"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:03 -0800
X-CSE-ConnectionGUID: 9N84iV3BRtihHRp32RVc4Q==
X-CSE-MsgGUID: XRAyc0hiS5e778DKHgANCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11621412"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:01 -0800
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
Subject: [PATCH v23 03/19] drm/xe/vsec: VSEC requires soc-remapper
Date: Mon, 23 Nov 2026 18:07:55 -0800
Message-ID: <20261124020752.30551-24-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124020752.30551-21-michael.j.ruhl@intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

