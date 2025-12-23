Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A567F179A3
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 08:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766479400; cv=none; b=fwcjT08a9Q4GLXcEie5mma9QoitVXUx5LFVeEluV+FA5R/Yhrf7/fhrMRR1Qz35Q3uyp9wQKjhJ3VGnFlDwUTfN5AdqltMgCU1SfxiSaz5ZNH9CqbEo90IX+78pNaQlB9ENn2xZ2GqkaB90UwTkfu57s2kzF3zDJtS9+kfFN/VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766479400; c=relaxed/simple;
	bh=g7xTPp6HQ3FJwecml41dFfffDZTOf86RWi1XVEAxR0U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MFoG0GY8BeyZem+YjXh6pI/zbkyVBqlW1IUgayxHat7vzrL+fkqCfleVGFiC053mcvxyCveC+aioZATg4K198nX1p1Hn08qi+0iryf4akO5s0sR6jXJj+cpF9YY/necjDmSbl8m//V8sM9hRqViEaikczfGFjpqFHsl+MiQ7hUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOCgduZn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOCgduZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766479398; x=1798015398;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g7xTPp6HQ3FJwecml41dFfffDZTOf86RWi1XVEAxR0U=;
  b=hOCgduZnADPLEBA0ql61npt87RPr5F4u19Sad7epIglkxQ6hkJZ58byy
   0e8sNAjy7zsHAj2QfIc2nxz//ggvwhdRGU4RQrp1cO/gzLRjNgr6L/JUA
   LBy5juwFmiHLuFeKTS/xHbFma9g9he/ihdArqK/rEt4L6xxO1riX0Xkga
   9tzNWEkfhEWp3lzWxLJT9svESR1caiAcQxb0vs9p9efqbtL7eYU1sdAWS
   CTVsU1R7lKhzKPJaKrANNz3uZp15pgka6gH6dhCPiFxxk04LNzpvgrU/H
   5VsPBIDTiPQK7BmU9e7PpoAKPK/+RbqbyD+9eqaCZJ3+xnPR2zWVk+ICn
   A==;
X-CSE-ConnectionGUID: nd8a6LLAT6mtO9jdaOyZ6Q==
X-CSE-MsgGUID: GxAYxeuvR1yYvy8i6qshdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68210385"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68210385"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 00:43:18 -0800
X-CSE-ConnectionGUID: vXAXngD1QWqis6M//Z3Krw==
X-CSE-MsgGUID: hVcomHvrRz+tsD1e/cojJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="204782122"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Dec 2025 00:43:16 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: david.e.box@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH] platform/x86/intel/pmt: Fix kobject memory leak on init failure
Date: Tue, 23 Dec 2025 14:10:41 +0530
Message-Id: <20251223084041.3832933-1-kaushlendra.kumar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When kobject_init_and_add() fails in pmt_features_discovery(), the
function returns without calling kobject_put(). This violates the
kobject API contract where kobject_put() must be called even on
initialization failure to properly release allocated resources.

Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 drivers/platform/x86/intel/pmt/discovery.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/x86/intel/pmt/discovery.c
index 32713a194a55..9c5b4d0e1fae 100644
--- a/drivers/platform/x86/intel/pmt/discovery.c
+++ b/drivers/platform/x86/intel/pmt/discovery.c
@@ -503,8 +503,10 @@ static int pmt_features_discovery(struct pmt_features_priv *priv,
 
 	ret = kobject_init_and_add(&feature->kobj, ktype, &priv->dev->kobj,
 				   "%s", pmt_feature_names[feature->id]);
-	if (ret)
+	if (ret) {
+		kobject_put(&feature->kobj);
 		return ret;
+	}
 
 	kobject_uevent(&feature->kobj, KOBJ_ADD);
 	pmt_features_add_feat(feature);
-- 
2.34.1

