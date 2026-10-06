Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C374A5EC7;
	Tue,  6 Oct 2026 18:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311483; cv=none; b=daZXjlpIcS4eMcUWW94pxrhqi70MndbepJLr0EPa7YSsMha008aFkwg9OpyKVOd02hThFyoiUqokETm1zZuG9Ky0vkazK8MJP/uVMBgGvr7AgrW1bHmTOsmHmj69aY4QiRB3fW3XWLZ/rAQ+Wy/krsbNcIsBA6Gp1/1z2KaQMes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311483; c=relaxed/simple;
	bh=Rdez16SQNrnAsOBIs538ge2ufyICuhYPrKdvS7BaVd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTHzxnLhO+a8GFzCdbLI7joLuFRt+Hc+FBdufGMkw2A41R6rHNrSs0giwaNYgo42f8dXnJejTIenK13e2RPQA0WKscOEoZYydJLyTM3S+ZUrr4jWgm8mdgTNojbKlwykvd3RJZ7pneNUVrqqLLdPs8tipNauBRWU7FB6XDLnv9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIQu4G7D; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIQu4G7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311480; x=1822847480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rdez16SQNrnAsOBIs538ge2ufyICuhYPrKdvS7BaVd0=;
  b=QIQu4G7DPptVT4ZOmK20nLqhNZc8xRcFHeZdJWOVj39Z6Y3rgrqZQaVU
   3UW4TDKa0yeX1CyA0Y9ayO1nRiMSl65taLKQ785X8jLQM1fttXme3SevT
   gGuWxwhtd0RzcbNwAIyXfAhDwBWYgB1hwmh2OPrbxsvWNubicRKnWHOcn
   yBXbV9bHdV9Ai2bzeHOhjDTZEaSaSoAI3cUj8AorrxUoV/5nn24RVxvWt
   xXaW9RChNZlTuAukoiVvuu7RC+xk9CG9vwS/s71Vj4ctlk2IQjjDLlMK4
   oUqoHikU86ZwnUIyymcQUbeLOc0JKWIH2aG8HnGpy4kTTaXTfORooRZ2T
   A==;
X-CSE-ConnectionGUID: fcJg6QJoRJu3BDy5jBH92A==
X-CSE-MsgGUID: +9shSVShTHK5pPIHv8j0JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591626"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591626"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:57 -0700
X-CSE-ConnectionGUID: Xe7xO0HyQ7an1dcAidF+7A==
X-CSE-MsgGUID: p3EjVG9NRIu9DNkxtfDxOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500294"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:57 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 17/20] platform/x86/intel/tpmi: Use scnprintf() to build the debugfs names
Date: Tue,  6 Oct 2026 11:30:34 -0700
Message-ID: <20261006183037.1507007-18-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

