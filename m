Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF445208AF;
	Wed, 30 Sep 2026 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789390; cv=none; b=tPFjY7dSotnb4k3lXprHzSEyqlgGepMR9BYHWOQQNsOKXvKISEMwd4CF+NOHAVpeOGyBySbHtEoVmP7QMl/oiMJ3lX3CnbZEiXONpKkFtVx3tNeDZj7C4L6g5IeV6o0MZ33q4ZJpSbZ9+RDqzN2kQjB6/n8HkhQx1rpXrNP64Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789390; c=relaxed/simple;
	bh=4Irtm5rYJihdan89cqRdjSiW3tTtNJL9SYjBo9SpmSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9k5XIO7a+BN7TWMFiYnuyDVtizgOuP5to4rd73cAgs1VWjLmbqKSsfE0P4GGRz1hChipuH1pV1n/HiqfY7ar+BlEjL+W2Fs05umWQZLSXN64qHSoXlcc9MxZhMTtiIGEMzFRnvnCLFbE3EK7wvUCb/aGYHgXtmAlBnnCSZfv/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FU9sUPcJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FU9sUPcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789389; x=1822325389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Irtm5rYJihdan89cqRdjSiW3tTtNJL9SYjBo9SpmSg=;
  b=FU9sUPcJlifolCWNRct67RRsOaNm6xNEsH9N2O7xTdto3RpZg0OA752W
   QdnsWPVQ4OG36HHDmi/SPcoMP0r2d5dnq7SdRZQppEn3X51Jm1ttI8mct
   R5badEucCGEDGEjfUe8/RrVfhysfcBQFjmZQRogWxlrGfi0lIODVyc8py
   H6+K07OK6YrMDmfweJciBCj//zMAS0SZIn5v7X5d3J3DzmrkZ/VnUCTsc
   Mxgik21Y/RKuyOxuyukp1evC0HiYAiZmIjRgPSxoJ0jPeVbaDML1OsMgF
   VibnqA58xLh5A7F2KN+265iW1tDo67FIUYaIhovX9SjWAqVMV32KZ2RP2
   w==;
X-CSE-ConnectionGUID: GolUwK9SQme157yXeVttMw==
X-CSE-MsgGUID: soxT1b6fTDiGxzBLOajG3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632083"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632083"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
X-CSE-ConnectionGUID: dRjj9QTvROGg+espUZnMjg==
X-CSE-MsgGUID: izO3f6AzRkGiejp1IG7wQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959435"
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
Subject: [PATCH v3 16/20] platform/x86/intel/tpmi: Use DEFINE_SHOW_STORE_ATTRIBUTE() for mem_write
Date: Wed, 30 Sep 2026 10:29:13 -0700
Message-ID: <20260930172918.743656-17-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

