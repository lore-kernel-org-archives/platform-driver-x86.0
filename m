Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4164BB7E4;
	Thu, 24 Sep 2026 18:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274253; cv=none; b=H+QbRctvd9cUSZ1QANbetY8nzjH1MfRe3RMp0IcWqYiJtDouv0XDrmgW3EQqQWDoj55pNcUZfSdJQ2NXpBCt4IKrk3VEhPv4Jm7jIDr0s0P1Wb9sKgetQodhJX9M9EOsEbmmvJAm7+OYggMkRUuskqmOTY98UEsl70SWMI2aqDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274253; c=relaxed/simple;
	bh=bhpiXCR1OW8jvoiBjVtdOOydtGUNzKoRbwS/zd2mh7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCFvSYsdYo+MszMFI73so2sagT+H/p50ogkoTrz4xhPVf00hwjqpob07lnIS7ml/xQ1UCgZ/HTFoA4im2x3g8jISV9dype2xhoFQs0m9+vH6vB5QHYG81lwlLqPbSI28iF3hFbd8Mwr51/ZeSiw1DQOj5pNUcTO+d6KALxREFzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVgpjRnS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVgpjRnS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274251; x=1821810251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bhpiXCR1OW8jvoiBjVtdOOydtGUNzKoRbwS/zd2mh7g=;
  b=GVgpjRnSKPfSWoqmBSXcd8fjRN5xsfQLoDgVgwSvciZup26KEqGJ6pHL
   LVGwf81E+4AhbD7mHafoXukeCcj/OMHhVBJWVlbNzlKLoif3qlvj6UvRm
   jnqZgwQ9mqkaw3Bc+UDo0BLT2SR5enFyDfRfsG0bsDouWFGGeFATU4RQK
   95FIA0baKVQnTKc6Kz34fLPx9dL/YOPFyK8KAY8L6/nL8D2JDX18gDoRv
   z7agouTiraR8csEJgFYemNjPjIAjp4Zg1Vp5fJn+nhRRvnb2PkYBmquKG
   Npivk+H7aAInGQKh9UFockUjgNGS7RpY+F51fR8XRDgVtJyG9iZ5y3+Rd
   w==;
X-CSE-ConnectionGUID: P/9ltAB5QeKoLcPM98w6gg==
X-CSE-MsgGUID: 9wr2ghh9S1WJ6pYfwZYItQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164290"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164290"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
X-CSE-ConnectionGUID: L4dCJD7ES+qOfR5JXPsPqA==
X-CSE-MsgGUID: Ag6VP1IjQSeP++6C6Go6zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229955"
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
Subject: [PATCH v2 16/19] platform/x86/intel/tpmi: Use DEFINE_SHOW_STORE_ATTRIBUTE() for mem_write
Date: Thu, 24 Sep 2026 11:23:38 -0700
Message-ID: <20260924182342.212709-17-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mem_write debugfs file open handler and file_operations are written
out by hand, which is what DEFINE_SHOW_STORE_ATTRIBUTE() exists for. Use
it, and rename the write callback to mem_write_write() to match the name
the macro derives.

The other two files in this driver already come from
DEFINE_SHOW_ATTRIBUTE(), so this also gives mem_write the
.owner = THIS_MODULE that the open coded file_operations was missing.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index a91938024d09..b4d361f0ec44 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -432,7 +432,8 @@ static int tpmi_mem_dump_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(tpmi_mem_dump);
 
-static ssize_t mem_write(struct file *file, const char __user *userbuf, size_t len, loff_t *ppos)
+static ssize_t mem_write_write(struct file *file, const char __user *userbuf, size_t len,
+			       loff_t *ppos)
 {
 	struct seq_file *m = file->private_data;
 	struct intel_tpmi_pm_feature *pfs = m->private;
@@ -484,19 +485,7 @@ static int mem_write_show(struct seq_file *s, void *unused)
 {
 	return 0;
 }
-
-static int mem_write_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, mem_write_show, inode->i_private);
-}
-
-static const struct file_operations mem_write_ops = {
-	.open           = mem_write_open,
-	.read           = seq_read,
-	.write          = mem_write,
-	.llseek         = seq_lseek,
-	.release        = single_release,
-};
+DEFINE_SHOW_STORE_ATTRIBUTE(mem_write);
 
 static void tpmi_dbgfs_register(struct intel_tpmi_info *tpmi_info)
 {
@@ -517,7 +506,7 @@ static void tpmi_dbgfs_register(struct intel_tpmi_info *tpmi_info)
 		dir = debugfs_create_dir(name, tpmi_info->dbgfs_dir);
 
 		debugfs_create_file("mem_dump", 0444, dir, pfs, &tpmi_mem_dump_fops);
-		debugfs_create_file("mem_write", 0644, dir, pfs, &mem_write_ops);
+		debugfs_create_file("mem_write", 0644, dir, pfs, &mem_write_fops);
 	}
 }
 
-- 
2.43.0

