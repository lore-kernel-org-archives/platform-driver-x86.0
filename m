Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383DE4A6890;
	Tue,  6 Oct 2026 18:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311484; cv=none; b=BhyQ0bUpdFREHKtlMEdgU53AamkDnKr4Tt9sh8VJ85UeC2sSiQPg6/iw8YCnMr6+dz54YaxtiLsrIoGke6507VxdPPiNSBATtlYwfIJY6f7X9f59yXds0taU9dHrbjl1mWzf4UuqbZqiDwN/YbfQunK8XoO84wTQ2MlhYQ+LfxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311484; c=relaxed/simple;
	bh=iDhjbgEsBWYrvJ+Q4YWTFHOKu2v3r7lQNFgG42v/7pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8/F6o628S/iUJLMBN00FLEvmB62U7XbmNBs7b6JUn9xQ+8wrEeDTBi7DCyCCS36EEvnAtjZBmA5C3PjxvccBwi0jNkLFobMWrRczWCvRCBO7sBbmEBE5N4RoH5EToZZUshwRvIqkQNPPzba5Wt5Va9DC2o+/RbWq73qkNIpifE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCTy7i/I; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCTy7i/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311482; x=1822847482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iDhjbgEsBWYrvJ+Q4YWTFHOKu2v3r7lQNFgG42v/7pE=;
  b=bCTy7i/IxHZqo2xKry4NoacsbrQhwP3IbjzFZ78/6O59W9yMcCc1F0F4
   lluW3H12zLC1yoqJ+DN2sBu37pf+p4dBcp/lQV77HsE0x389uOfXnTcR9
   HLDMmkZSnNttGXmVACtKb3W6jWCAq4OzWdL2/jCryQ9joGUcZklUUKtlx
   W11i3EkR0P6R3hrkxMyGaXPbtcTQxctU5IST85WnbZlm7tuXLYfImEQnS
   1aOvJNQq+1fhJjCPVTtFOr+Aw8pjQDloeZ1mfiG+uV4MVBW7FmvN0L3JH
   NCmlCpjzFznJsYXHVHQSC8Mw7dKGduCZPiqddkXZJUZrcnHJMl3FUZP0n
   Q==;
X-CSE-ConnectionGUID: KpxkTvnnQzCo2Irc+n5Dug==
X-CSE-MsgGUID: 12QAH7nPTjuxdY04AULoig==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591630"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591630"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:58 -0700
X-CSE-ConnectionGUID: mZxAlteNSfal+J1dJPlkAA==
X-CSE-MsgGUID: 6Mm5HtezTmu6tqEqsUHRiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500300"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:58 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 19/20] platform/x86/intel/tpmi: Declare the loop counters in their loops
Date: Tue,  6 Oct 2026 11:30:36 -0700
Message-ID: <20261006183037.1507007-20-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

While at it, use post-increment in all of them, as the other loops in
the file already do.

No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 26 +++++++++++-------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 91d8083fecc0..55c8e23dd2ce 100644
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
+	for (int i = 0; i < tpmi_info->feature_count; i++) {
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
+	for (int count = 0; count < pfs->pfs_header.num_entries; count++) {
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
+	for (int i = 0; i < tpmi_info->feature_count; i++) {
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

