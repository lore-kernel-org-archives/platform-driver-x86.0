Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB68521221;
	Wed, 30 Sep 2026 17:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789391; cv=none; b=uQzSmU3JAj3cy79MF84sYY9erb9/TeemOGmZ601bFHwwU9gvRrr9Dbt9XnmDd61bv1b+Rjuc6LnbevEapd8mVRLbKejxyVVqrHeQOJAEXP5F0TwePBosog+1ybjdrqTfH/tkaQI9VxVYdHJf4+Ung6RJh0r3Eg/18PqQliE73pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789391; c=relaxed/simple;
	bh=Rdez16SQNrnAsOBIs538ge2ufyICuhYPrKdvS7BaVd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t+FTy/V5zQj6E9X4c792hcxkFunA6/YBQj/vLusYWhqoWTSF9K3rqGDhRY/xyNKL5bnPfL6k52lmh1MjVXtgYnb2ZysbZwrRbsDKjmqYylO6vGrjlaXuM4SN4zYHWojaoSOi4CamvEXgBUQ8ij+J94+N+TEmvZnqoa87kNepLXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5pumsuo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5pumsuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789390; x=1822325390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rdez16SQNrnAsOBIs538ge2ufyICuhYPrKdvS7BaVd0=;
  b=g5pumsuowlFBUIaOQe9ZDXo0ovR49y2EmSHriN0QCmyfn/GzZGZRHet+
   +L3oPBaOCm4sxSgM9dhq4b2y7O8E+KmvMe2MyrC77dL7S2l3UFeEBZN/Z
   /FJ4v0v4YhhtoKrzNKU12l7iynd7tBot4Vmz3lriNEuMewmU+mojMlstq
   IJsakyyXEnCamJKcnOysitNrmUSE6BIj6nVKSXSHt2lqG00fm7xxdBnzA
   mnSEwtIiVetGa/oknFj3uM+UNqbgF1BQHQ8TjgN9jruItBlk0gw+O3gEA
   dj/tcobSJ7xF7TtDlV2XcclyM47L2gx2zgeDsQXAVJRxbjYuzkeNc34zq
   A==;
X-CSE-ConnectionGUID: 8+DNUM9xSMWELgpEve5iKg==
X-CSE-MsgGUID: CZzqjyqUTFu3ia2/+olluA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632087"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632087"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
X-CSE-ConnectionGUID: yQdoKeF+RJSIFNPXp1taMw==
X-CSE-MsgGUID: hssbAyfTQhe0488wTmXpUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959438"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/20] platform/x86/intel/tpmi: Use scnprintf() to build the debugfs names
Date: Wed, 30 Sep 2026 10:29:14 -0700
Message-ID: <20260930172918.743656-18-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

snprintf() is on its way out in favour of scnprintf(). Neither of the two
callers in tpmi_dbgfs_register() looks at the return value, so the
difference in what the two return does not matter here.

No functional change intended.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index b4d361f0ec44..097754365897 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -492,7 +492,7 @@ static void tpmi_dbgfs_register(struct intel_tpmi_info *tpmi_info)
 	char name[64];
 	int i;
 
-	snprintf(name, sizeof(name), "tpmi-%s", dev_name(tpmi_info->parent));
+	scnprintf(name, sizeof(name), "tpmi-%s", dev_name(tpmi_info->parent));
 	tpmi_info->dbgfs_dir = debugfs_create_dir(name, NULL);
 
 	debugfs_create_file("pfs_dump", 0444, tpmi_info->dbgfs_dir, tpmi_info, &tpmi_pfs_dbg_fops);
@@ -502,7 +502,7 @@ static void tpmi_dbgfs_register(struct intel_tpmi_info *tpmi_info)
 		struct dentry *dir;
 
 		pfs = &tpmi_info->tpmi_features[i];
-		snprintf(name, sizeof(name), "tpmi-id-%02x", pfs->pfs_header.tpmi_id);
+		scnprintf(name, sizeof(name), "tpmi-id-%02x", pfs->pfs_header.tpmi_id);
 		dir = debugfs_create_dir(name, tpmi_info->dbgfs_dir);
 
 		debugfs_create_file("mem_dump", 0444, dir, pfs, &tpmi_mem_dump_fops);
-- 
2.43.0

