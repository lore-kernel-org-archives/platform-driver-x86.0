Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAEB598BEF
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 20:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157542; cv=none; b=V5jjpVtb8V2pt5iDP7P28cLPq0vj+iqZuo8Wq6uWMciY+mhwgBpkEgNwlQlcEt93BrBQvndx7VmYmUZCRg4HaSNduEswFlO7Na+O6tDfx4653LcL8Uy9lh26nnSt1JT4kYHrm499NOTAtq3cqM9sw/wbBS0EAiFJh07fzyaNCQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157542; c=relaxed/simple;
	bh=DBKLN8FmLqkvBBAF+LqMH6CGh96m/3rHcRJHazJBsRA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kvzslYxKhphK8Vx3aHRlzgEcw403J4d3GTo/qnGCDxVWA89hhRBCDI+LQJXvyXLH4KGPSZDRcZJSTpL4EoeTDTo73oXqu9TV1+ZlP0rpnLVxo9QQsS/eMfQSue8lZF6FNGgMA1ptcFKlJklZG9HW6YH9R+8gLRJV+sME8qd1adA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IALWbHrQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IALWbHrQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789157538; x=1820693538;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=DBKLN8FmLqkvBBAF+LqMH6CGh96m/3rHcRJHazJBsRA=;
  b=IALWbHrQyikxusXHdV0bZTmB0U+12NTXAu3qvEXLmc6BdhqdnevQZzca
   g+LxCUCzQ85csMGNE9OXTdLswcmI/GZ8eQmue7Z6HDDiYnYeFcQ+lRG17
   NI3ANYeTW74tATv5Km+WsOXfYY4Yr4IWr9BexA3VNTBWfJlezSlCq+BwD
   um3A9fq1U+EMWZOu73TbxGGayI6CVWLmKu0G2GPtYXTJYyjNDNGrbs0oG
   8YvDGVPccMUG7/3SwIOsykmGZHGzKZGc4/C9u37mRz3wrmUfoJXmq9MVU
   mUREqmAdKIt5C7+QFhj79BEGqsskyL3rTgEacVru8cXHcsBXNgl80Ky8H
   g==;
X-CSE-ConnectionGUID: TlU+iooYST63Dwa2msE+xw==
X-CSE-MsgGUID: O37vg4thRlOrpr7AT/eWdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115162409"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="115162409"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
X-CSE-ConnectionGUID: m4u4whtPSh+cbulg4D/r4w==
X-CSE-MsgGUID: YsUzVbUoRemJfAdYbN5ORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="277272103"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
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
	james.ausmus@intel.com,
	karthik.poosa@intel.com
Subject: [PATCH v8 12/20] drm/xe/vsec: Update VSEC probe order
Date: Fri, 11 Sep 2026 13:12:00 -0700
Message-ID: <20260911201148.1610547-34-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both debugfs and hwmon access the PMT data area before PMT is
initialized.

Hardwired offset usage allows this to work by accident.
Upcoming changes will break this usage.

Re-order the probe steps to initialize VSEC before the other
features are initialized.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 205cb4e7f9e8..3ec950606e67 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1053,6 +1053,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_vsec_init(xe);
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
@@ -1066,8 +1068,6 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
-	xe_vsec_init(xe);
-
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_display;
-- 
2.43.0

