Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ECF4BD78C;
	Thu, 24 Sep 2026 18:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274254; cv=none; b=CM5Yg6tierreZHU6JpSMwbVl7rqiTU82P+E1gdPkQo26jojYmALO2NdqznEQTA7G2TMN+ft22YdlzIWFKbzw8v8WLKNwJuR4CsZc6ZhMua7iYNhWvrG3jYl88e0DfvKkD3aYUkJMSLqAyhgWbbfhBITzJhzlEW8JO1SVX7iW71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274254; c=relaxed/simple;
	bh=Rdez16SQNrnAsOBIs538ge2ufyICuhYPrKdvS7BaVd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hxvjS4afjzr7PLscIIRbRwcgMjFOWkXVvhSIAkPOANI15jVTvgUcUruE6M8xCHtJsmr6jveOL0IYshHX70LlvXJNPW8QFpSnGQcBkCMJBvnOb2DWpIAyRd0k+DW7ywVSKamVji15cJ2eHoz4a6PDq/gyAMfqAo6cW1SA7JU77Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MafB+a5A; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MafB+a5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274253; x=1821810253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rdez16SQNrnAsOBIs538ge2ufyICuhYPrKdvS7BaVd0=;
  b=MafB+a5AXheuE183iRxEzRRejESXEChxcjhrTnnpRFItMZbPmK/2jDM1
   NqS7ik//g8w++nWJcJxRHNoknmJjvQnXM2S37Z3X9zrOgCcsnFc5Jex2h
   oFYLWOpBbqNpJ1bqbStwMSOcn0nKfEcNlYINZ+BDoC2i+tUtnGLSy9anp
   hVJjLjrfktE7usKvm91l4PJYNqiChrbV/lbw9X36H0KazN1mIdejsKb2V
   3HpTFIAERC/RVaVKGxTpFlxjxitGZ8Esl3Pv0NT0JZt2f05d1s5kN+K6j
   e7kOrbNO7MbFOJgVzslo122PasJPgG1y9haTCHlmuaFkBzWim0AZYTRV9
   A==;
X-CSE-ConnectionGUID: XcxcSucdR/GmrGnUNDOtSw==
X-CSE-MsgGUID: sNhEEfN8RgKR7H2nN2efqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164291"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164291"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:46 -0700
X-CSE-ConnectionGUID: AtsYsf1CSy6esR9w8cXV5A==
X-CSE-MsgGUID: T5ZoBDl4TkmqPdtVwB5ELQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229959"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/19] platform/x86/intel/tpmi: Use scnprintf() to build the debugfs names
Date: Thu, 24 Sep 2026 11:23:39 -0700
Message-ID: <20260924182342.212709-18-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

