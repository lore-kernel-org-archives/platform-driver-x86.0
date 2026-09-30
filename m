Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A865221DC;
	Wed, 30 Sep 2026 17:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789393; cv=none; b=qqy6VtSE9Ae8pC6q3+5WLNr4ctTXzlypl1nChZYzaML6QKpPsnICkVjujbXEerTrmBSowG9xsDVepBr/AT5u167JP5xM7JJTfhwjeApEI3FVkDcL6ZUD9tmxwPXJoDx0S8F3LCfe/W3OcwCuwO3dpR3MyphMAy7puVUTJjYD1EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789393; c=relaxed/simple;
	bh=MbHv1jFpCn+3FsJ0u3y1P7k+YG8H8dmE+kGy4RJfb0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NThk10XpBo4a+ffL6msf0YxUHMyZTBe/XfAweueVSm9Mzc1UxoGCCs7oUUn+fRV890B/xLnUW4UTexwQcslGMdRcOuJRbpObuaDgK1mr7Gydcu/mzX4stkSZsoTecPOsXZpL/3GJ1qAn9yztR5tt9sHYdsyLfcYdJbiXuJkEaSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cokwsYrk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cokwsYrk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789392; x=1822325392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MbHv1jFpCn+3FsJ0u3y1P7k+YG8H8dmE+kGy4RJfb0g=;
  b=cokwsYrkdC7p9pGB2twg2ehhSa4v/e0d+1/WmFyHyEbfbF32hP1Zrq1J
   SxaIUyQyFqdQdvnE0tfDcCQ6sRldERVRAlnYAJEEq8JWZp0z6MXLW766h
   lVG/OVQ1mqZA15BJ7VwqemJTAGX6W4PPylbL8gRFSXgBVNtXDWAPkQNQe
   5LHKofDx/Mezl9I4CIUfexBB9JSQHC8PgwkjlxeJQSXd14spzpYMlbr1h
   cDHVT52rh5bjZro0zXfBoniHsxRz52Bb0P7csJ/orK7eHwZ6fFHvnkEmi
   BHa1gCzGAr2bihXr6l3naPW343YB9SlEslf24MDDPj3rTM6JRccKWlDf8
   w==;
X-CSE-ConnectionGUID: 3uiSU8o5Qv+CQpn4AmUs2Q==
X-CSE-MsgGUID: RBT5dR3DSDOrnGSG0+XE9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632090"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632090"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:36 -0700
X-CSE-ConnectionGUID: 7f/HMfraRXe0w5yGVpEczQ==
X-CSE-MsgGUID: PVfpLj3VTTqGgDMlZSwneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959444"
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
Subject: [PATCH v3 19/20] platform/x86/intel/tpmi: Declare the loop counters in their loops
Date: Wed, 30 Sep 2026 10:29:16 -0700
Message-ID: <20260930172918.743656-20-sathyanarayanan.kuppuswamy@linux.intel.com>
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

Declare the loop counters in the for statements that use them, so that
they are scoped to their loops.

In tpmi_create_device() this also replaces the tmp cursor, which moved
in step with the counter, with res[i].

No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 26 +++++++++++-------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 91d8083fecc0..52d843501020 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -359,11 +359,11 @@ static int tpmi_pfs_dbg_show(struct seq_file *s, void *unused)
 	int locked, disabled, read_blocked, write_blocked;
 	struct tpmi_feature_state feature_state;
 	struct intel_tpmi_pm_feature *pfs;
-	int ret, i;
+	int ret;
 
 	seq_printf(s, "tpmi PFS start offset 0x:%llx\n", tpmi_info->pfs_start);
 	seq_puts(s, "tpmi_id\t\tentries\t\tsize\t\tcap_offset\tattribute\tvsec_offset\tlocked\tdisabled\tread_blocked\twrite_blocked\n");
-	for (i = 0; i < tpmi_info->feature_count; ++i) {
+	for (int i = 0; i < tpmi_info->feature_count; ++i) {
 		pfs = &tpmi_info->tpmi_features[i];
 		ret = tpmi_read_feature_status(tpmi_info, pfs->pfs_header.tpmi_id, &feature_state);
 		if (ret) {
@@ -395,7 +395,6 @@ static int tpmi_mem_dump_show(struct seq_file *s, void *unused)
 	size_t row_size = MEM_DUMP_COLUMN_COUNT * sizeof(u32);
 	struct intel_tpmi_pm_feature *pfs = s->private;
 	void __iomem *mem;
-	int count;
 	u32 size;
 	u64 off;
 
@@ -411,7 +410,7 @@ static int tpmi_mem_dump_show(struct seq_file *s, void *unused)
 
 	guard(mutex)(&tpmi_dev_lock);
 
-	for (count = 0; count < pfs->pfs_header.num_entries; ++count) {
+	for (int count = 0; count < pfs->pfs_header.num_entries; ++count) {
 		seq_printf(s, "TPMI Instance:%d offset:0x%llx\n", count, off);
 
 		mem = ioremap(off, size);
@@ -490,14 +489,13 @@ DEFINE_SHOW_STORE_ATTRIBUTE(mem_write);
 static void tpmi_dbgfs_register(struct intel_tpmi_info *tpmi_info)
 {
 	char name[64];
-	int i;
 
 	scnprintf(name, sizeof(name), "tpmi-%s", dev_name(tpmi_info->parent));
 	tpmi_info->dbgfs_dir = debugfs_create_dir(name, NULL);
 
 	debugfs_create_file("pfs_dump", 0444, tpmi_info->dbgfs_dir, tpmi_info, &tpmi_pfs_dbg_fops);
 
-	for (i = 0; i < tpmi_info->feature_count; ++i) {
+	for (int i = 0; i < tpmi_info->feature_count; ++i) {
 		struct intel_tpmi_pm_feature *pfs;
 		struct dentry *dir;
 
@@ -554,9 +552,9 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 {
 	struct intel_vsec_device *feature_vsec_dev;
 	struct tpmi_feature_state feature_state;
-	struct resource *res, *tmp;
+	struct resource *res;
 	const char *name;
-	int i, ret;
+	int ret;
 
 	ret = tpmi_read_feature_status(tpmi_info, pfs->pfs_header.tpmi_id, &feature_state);
 	if (ret)
@@ -580,10 +578,10 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	feature_vsec_dev->num_resources = pfs->pfs_header.num_entries;
 	res = feature_vsec_dev->resource;
 
-	for (i = 0, tmp = res; i < pfs->pfs_header.num_entries; i++, tmp++) {
+	for (int i = 0; i < pfs->pfs_header.num_entries; i++) {
 		u64 entry_size_bytes = pfs->pfs_header.entry_size * sizeof(u32);
 
-		*tmp = DEFINE_RES_MEM(pfs->vsec_offset + entry_size_bytes * i, entry_size_bytes);
+		res[i] = DEFINE_RES_MEM(pfs->vsec_offset + entry_size_bytes * i, entry_size_bytes);
 	}
 
 	feature_vsec_dev->dev = tpmi_info->parent;
@@ -605,9 +603,9 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 
 static int tpmi_create_devices(struct intel_tpmi_info *tpmi_info)
 {
-	int ret, i;
+	int ret;
 
-	for (i = 0; i < tpmi_info->feature_count; i++) {
+	for (int i = 0; i < tpmi_info->feature_count; i++) {
 		ret = tpmi_create_device(tpmi_info, &tpmi_info->tpmi_features[i],
 					 tpmi_info->pfs_start);
 		/*
@@ -701,7 +699,7 @@ int intel_tpmi_init(struct intel_tpmi_info *tpmi_info, struct device *tpmi_dev,
 {
 	struct pci_dev *pci_dev = dev_is_pci(parent) ? to_pci_dev(parent) : NULL;
 	u64 pfs_start = 0;
-	int ret, i;
+	int ret;
 
 	tpmi_info->tpmi_dev = tpmi_dev;
 	tpmi_info->parent = parent;
@@ -722,7 +720,7 @@ int intel_tpmi_init(struct intel_tpmi_info *tpmi_info, struct device *tpmi_dev,
 	if (!tpmi_info->tpmi_features)
 		return -ENOMEM;
 
-	for (i = 0; i < tpmi_info->feature_count; i++) {
+	for (int i = 0; i < tpmi_info->feature_count; i++) {
 		struct intel_tpmi_pm_feature *pfs;
 		struct resource *res;
 		u64 res_start;
-- 
2.43.0

