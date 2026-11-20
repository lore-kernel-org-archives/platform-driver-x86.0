Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208156;
	b=e5qb6HIeyIXCSda9MrW4AWeSQkhRVYYm4lJuO2ClZTPdu4IJxhYsxme55oBth8gjuqoi
	 exjjlzrW0VYQdC7TIWema/WNzHx8kziXV8pH52bGB81PVzCRAChHDv53hKMMO3SOjpqVU
	 EIhBVg+eRoLiH+gCrD6t/pJMAL0r+Wluw8MtDZj8/wS5NNYgPaxAvAjjxyXVv5bxis5mh
	 cNI2Ig+OorWZME84cCu+5VEjqvD///He78Ef5y5dkGrTCXS6J5XBGMRLcYotIZB64K/em
	 GQwCbkg1Hph5GYZvmqPVe7gKNn1XmfzWS2AAlJYuqAY5kmv23DEmPYO8QRvcd/t8Yvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208156;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WmCRnPyQcqGAmc/KbyZJiRmgyIXqLORtIwWeIT6hugs=;
	b=Q8UJLYj7Q3KUnT0DsUVE3i/+8rv5Dw1QvcPI6G3cEFRsmJYHa8JVdrnH4R7dCzwKbxBQ
	 A0c8HeaQFN3okAzMX3jjGAQpk+EQ+Mb/4WpS7aKG31X0hpzjjdmLDmf05x+imUyLzfXa5
	 2AbX75T/9LSdDL0Q7eXiEjiUHQG6KceFyNVdkTXouNfP1PpCKJ3kUB8mSxN/bGPz4dZGE
	 wj7tIfUX+tigs1Lwasg4kRjt+S31149tXslV1j9R0/aX5cTOqeaMNpihFbLbpor4NIuwf
	 KiVbp7kEy+1b+PAPaBo0wdFPoXbOIPuVaVVrWLqURABK6sqXGhtSQK0Qza0mq8rZFTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fVtuepPB;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42360606A689
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42360606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fVtuepPB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208155; x=1826744155;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NuDV/lqBLFYg5Wc4D4u773Li/GKPyfBWlL8alEGMaRM=;
  b=fVtuepPBVpfUtBl+n9u8gyc2TBWc2FjXKYkMKCNkwoGH8BPJ5Ic69hgW
   scRecj/pQtw8aorlFjS8Fx2bjyT5Fj1eHcwrz6DZIKUkVqSa3+yqNHtUD
   LV+s4jy6Ky5CeUlXP3qk02/8iO6j0LxhPpMyXNOHQ/hu8jJuADeywMgYE
   5Df3i67oZdYbKTVgZXOkLmYIpk+1MauTnaeyUblvKHFb6a64RCwVTVMkl
   3qgce0kBnNiF1xfkZsIHc2c/3asBMt+ij8rsIAcSFkcD8+ORB/dI7LdUa
   JEotmqMQIYNEzUXA6DlTo/okfOPVbhQ4zbZp0NlKUml9CdAq2p9XmwYsZ
   A==;
X-CSE-ConnectionGUID: 1IGJiHLcTA2hHHTGxXbiRA==
X-CSE-MsgGUID: qTWj+YKIQXmH37VFKsDrDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136354"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136354"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:50 -0800
X-CSE-ConnectionGUID: ZHv7/7vdScCJwWD5/oTyqA==
X-CSE-MsgGUID: yNlK6AURQmCc7+6QhmkuTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10908695"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:48 -0800
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
Subject: [PATCH v21 03/19] drm/xe/vsec: VSEC requires soc-remapper
Date: Fri, 20 Nov 2026 12:55:43 -0800
Message-ID: <20261120205540.1220643-24-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
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

