Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480749;
	b=VOxRIdQYQ2amGaaDHPmERC6Xr73TOVJZNBiRNc3lbEn8sAcsyVH4ODM6QwHNA0DfFnq+
	 KMrk72wywK6F+HUGcsBozVvFTc7nmIZdjZuxuss9nxPNpeb7wR+eEcDfPjkEljfhQLe+q
	 kX+mdOV1R1WLNeaVjt1v+2GNZIh5bZzU08BIjQGsnA/ppLQJ7mWdsDfA2Krp7NHSh1TMm
	 btFoe/A8MlfwtGDuzyyO2kChDbZWGcKrrM2x6W3NLstyeT22Rkfl9IUdd7nGoZI21Jj+s
	 FWl7ATXMaktxj1cBVvXnhaSTCrqGf2aba+Ijge/lRPwPEsWyGTyOO6Vwe8X2bkGQn3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480749;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WmCRnPyQcqGAmc/KbyZJiRmgyIXqLORtIwWeIT6hugs=;
	b=AhPCIP/TLPhd00D057GhTzzOEflVusk90PdsQfMbintdNlgDgWDB29kvOJRsTAfPi0wq
	 n9HonZckJhZbfkYv/VlIenc6/FzUqA1og+us1ywrymG2lnO3UsiR6HfkI7XCZz+v83QXL
	 5sFzH9rzwqpQVWsx9SUsjbQtjepdtUOKWGdc6ab4v1iKede0CMd7Vf8P6542HFb1QoVb2
	 Y9QHv0mdC1B83sJCGPXLnp+GIHR8cKQFTlDrTZ0/i+l0klSo7EAYq4Azt/fLsdVehr2Br
	 EGyCQuUpmDHe3P4gdW17AtBDC9gkqXot2/hlfrwAwIsYljLkCbuCA5HgOTzyirrf1xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cMUG2jvT;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35BC606A330
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E35BC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cMUG2jvT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795480748; x=1827016748;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NuDV/lqBLFYg5Wc4D4u773Li/GKPyfBWlL8alEGMaRM=;
  b=cMUG2jvT/Nf+ybSPFeBkRO0SxC7NuoyINGSv4kFzooG5jUSBJzj6YxH2
   BVja9eKMtzxEXEGFe3JWM6oOQRerb0ELuKMQkp6+GQ5jY6mapkAaMF1b9
   1JlucajsJ1vpimG28/SKmMlHAiA0BmyX+1n37ghq7B6DObkxgfYWZaEYI
   cNp0ZTmYEAsBPLNm6v7BNRNTqOePelQRiFyhiA7mgfQwESQ06WTTgn1m9
   SPzeod4yRt3605ETb2GBXNTRGELMvtw3PDMuiQh5lRwwPA6Zlz6BkPhzH
   +9Vyfc8q6l2f3ay9jLcnpMopfiU1AYLMpympIaAwBVBLjjepWt4TRnT95
   Q==;
X-CSE-ConnectionGUID: NxGtCOBjT1eaQVN1hTrZYQ==
X-CSE-MsgGUID: GxXoNBEFRs2n0D0+WhBv/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4332832"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4332832"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:05 -0800
X-CSE-ConnectionGUID: nZOVbKWuS0ChNRQpziio7g==
X-CSE-MsgGUID: ApLMyS4ZQneVXDDKXjWwQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11805737"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:06 -0800
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
Subject: [PATCH v22 03/19] drm/xe/vsec: VSEC requires soc-remapper
Date: Mon, 23 Nov 2026 16:38:59 -0800
Message-ID: <20261124003856.4145635-24-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
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

