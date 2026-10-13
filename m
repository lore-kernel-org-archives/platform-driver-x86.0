Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE5254489B;
	Tue, 13 Oct 2026 19:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919814; cv=none; b=rzkr2JUOV5WTGiMmByoJjCbIdjIUThsxBHsFTrSZgSF0znQBGFHI2WvSve3WWGvC7o7K4NoKDlIfVLZOFF9R1E89uLjSmChQqdxunn0AU9BCVvUQYNx4XcYUxrKSE+Kmj0c1WHVr/eBtLk4N/FpimooxdEkiXhsq8qfdppw55eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919814; c=relaxed/simple;
	bh=ClNAeuVqYhJ7bYMachzrgy1uaLJer6p6392akUM6VAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5ROvZtD3w6NG8xdjYahkGJEytwJ+6qpqnozJmaNqxaHomlFqeyek43d3fsl25WQf+L+5fWje6YznbwjzOGC6ceEGTIow5JKXSA6Sp98r43ppXXDlCoVlFbdDoVO2FtV1eDcdGf9j0bndC1j7mLzxeZLnCVSe9cHpyClSsQJLOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DixSGs8A; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DixSGs8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919812; x=1823455812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ClNAeuVqYhJ7bYMachzrgy1uaLJer6p6392akUM6VAE=;
  b=DixSGs8AZa2tXlYV5HGpybjKpfg6JCFGlKXGNxsHu+fDwIrBjrD8RrKM
   E4ECFXZxvytmuMEA3HywPPgYxWyfqJxDNQOSLqnarOcqiQQsnMy2YI9gp
   EWeliEZVWAsIib5AV7iGFOJs7PfrWd8pw1jJfiBlRsmn0fiWO0RUzn7D3
   bLmHUyIev2ujqAkQwMrHmpBmSWjmiiRZC8Flg4z9HXJJn+MnvmSZOQaYj
   cflFKxFxbcJtylpmss9jjJ9Lwa4CyfGzA1wDAd+sYU0GCGJnmL/nUfTMm
   yrTHYzzbti+XlaQ8bHJ0kLDq+ybjSA4lIeSgNk6nSQXC7Fl5AVboH7G6y
   Q==;
X-CSE-ConnectionGUID: V/n9ytzDRy+koiR1U3wrJw==
X-CSE-MsgGUID: lWlHdAGHRrqrzQwUEaNeGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544139"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544139"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
X-CSE-ConnectionGUID: 4pViy1OmSXafL/QWbLashw==
X-CSE-MsgGUID: /h7iWoV6Ta2zgQZuaVgD2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167710"
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
Subject: [PATCH v5 16/20] platform/x86/intel/tpmi: Use DEFINE_SHOW_STORE_ATTRIBUTE() for mem_write
Date: Tue, 13 Oct 2026 12:29:31 -0700
Message-ID: <20261013192935.2243291-17-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

