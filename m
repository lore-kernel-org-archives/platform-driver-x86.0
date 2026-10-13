Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF90541E7B;
	Tue, 13 Oct 2026 19:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919816; cv=none; b=uAMkP1k0yT/DfHdBtJwZPEkAQ67iziYh26RYhfpPe2pf8ovHvbA1zRVh3YPmchUq3HljA2ZCNguDlt0asiKSZPJFe0FUrxfEcAU8LoUEpDqUWBSF1t34t/d3w3+uNoBT5OiPYfGDNCSNpPZGW6porFEgc/glYrwX+PGLdpYUWTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919816; c=relaxed/simple;
	bh=uitCWUq4bm0g0xsEAHVZ6lolIUGOQ/OkXgKhOS1T5kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F6lMCahJEn4hxa9lpzJa9DWPc0j9IKhaJWb/eoLiPQjH14TwTOEoMVtVk4RLVMDGU9lbUhWn7zZMmd692QWAoW94ulbQI6Y1ZIR9+DQ8162VgXgybKu1LTbfxHK5oU6oOjfop0rnJnz58CT74w2EMnMKonScsT5CzWi7XKYWbys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vv7wFzWV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vv7wFzWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919814; x=1823455814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uitCWUq4bm0g0xsEAHVZ6lolIUGOQ/OkXgKhOS1T5kw=;
  b=Vv7wFzWVtrWyXMdL+gwjX0HMmZlZrHJnJzCjNkbITMsDR3vKQMpobzrJ
   l5n1ugdjNwKgmg+ZrWBX27jAOdvhVxZLRf6AoQZSAeosAxLlZICSgWt1e
   IDtPQFxyWGpZa8QvV6/+ny29vvwgn3Ag1ptxciQOzgMEw0AczTIiMXXYv
   +1dNO4RmaQS3pAa4iN4YksExGW5h6ho5/n2szRvSGHmqvZ7CkYwiNkc+F
   07uPYS4zJnBybDpv+rg+uZmen8YVg5uMSoKJhaCS/pz7Buuy1olF7s6s6
   qbH2wCcX2iWycS0g7LiBFzft3UQ2apkUNPmrxDW38tZUAMRR8XDw9griU
   w==;
X-CSE-ConnectionGUID: PfFs/U7vQ3iNYLiTb2rBLg==
X-CSE-MsgGUID: L9bnGyjbSJWU++RXxFYuAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544141"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544141"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
X-CSE-ConnectionGUID: DauRAwcxS3Obk7qyU6fa4A==
X-CSE-MsgGUID: rgDnocF+QhCp9TnS3M2vtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167713"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 17/20] platform/x86/intel/tpmi: Use scnprintf() to build the debugfs names
Date: Tue, 13 Oct 2026 12:29:32 -0700
Message-ID: <20261013192935.2243291-18-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The kernel has both snprintf() and scnprintf() for formatting into a
fixed size buffer. The preference is to settle on scnprintf() and stop
adding snprintf() users, so that only one of the two remains in use.

Convert the two callers in tpmi_dbgfs_register(). Neither of them looks
at the return value, so the difference in what the two functions return
does not matter here.

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

