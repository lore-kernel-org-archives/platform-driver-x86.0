Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D767B32E12E;
	Thu, 24 Sep 2026 18:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274256; cv=none; b=BtcsgmsxhmqLBmX+2ep0xM6hWcECZqblUTdmi8vE14E4HbkMyINbBX2oNgV5bFFoKdfxbHYD+0Gb8G90CTsuEsV1ZbBlFyayHVEWV6h/LpEf0kTMMjafgyJFgMipvlP45+hTBxjV8v0B1a7ZtNZzsSQ0VoCzy1J1+p2B/r1K7Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274256; c=relaxed/simple;
	bh=bnBtokDm8BvqwE7mDG/oNOrdHhySin/q6L4oLMQ1gAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qD8r+dC2iBIZQ5fXHETflW4CYz4Iig+IHE136WRppFQMN3EyyqTo8TZ02ExkWCg0u1BJSAQXRlU89M67udYCT1b1LeBHJys7D7myxqSk5+uOie62saWBBN5/3RUFaOBULY3ZGMQVpRyJQ10kkIsa30EzQQDyRYfxgKbtZ/nhIGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUZoJxBj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUZoJxBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274254; x=1821810254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bnBtokDm8BvqwE7mDG/oNOrdHhySin/q6L4oLMQ1gAg=;
  b=OUZoJxBjx5EytCq9HSitk/54kMSQQDGg9+Ge9juNCAVSJiS5S7CpA6tI
   T8VC209B8tUQA5EWFHdHhekI218p+nqBMEtMZVoReqd9tmeAgDl2G7YSO
   /I0d0HvXhungbDLGERxBcqrUHllxZjwf4ZcyOM/FRvu8YhExm3vJ2VTrd
   fygk6ds5ofXanV0iM5NGCMw0AENDk1i5Yx2YuQBC3tpv7+Y0A7gRYxQf2
   GGw5Z1a2uJtwNFcRotaGca9RNsolFij/J+88h/EfjxoKv3DT0AS1s/H5L
   uCs/Y1DrQA1Cn5qSaXb8Z8ojDdH564WTFa8ntQm9m2vN312pEMjk+XEs7
   A==;
X-CSE-ConnectionGUID: xIUTv0VaTUO0hi1iJdgvQQ==
X-CSE-MsgGUID: 5z7Bb9fqSaa0sLJShBF+6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164292"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164292"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:46 -0700
X-CSE-ConnectionGUID: LJuJ9eJYSiW5PNj08LKEOw==
X-CSE-MsgGUID: BP1ra9h3So6DowfXZHbKDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229962"
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
Subject: [PATCH v2 18/19] platform/x86/intel/tpmi: Declare the loop counters in their loops
Date: Thu, 24 Sep 2026 11:23:40 -0700
Message-ID: <20260924182342.212709-19-sathyanarayanan.kuppuswamy@linux.intel.com>
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

Declare the loop counters in the for statements that use them, so that
they are scoped to their loops.

In tpmi_create_device() this also replaces the tmp cursor, which moved
in step with the counter, with res[i].

No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 30 +++++++++++-------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 097754365897..0ef2642bd920 100644
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
@@ -580,12 +578,12 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	feature_vsec_dev->num_resources = pfs->pfs_header.num_entries;
 	res = feature_vsec_dev->resource;
 
-	for (i = 0, tmp = res; i < pfs->pfs_header.num_entries; i++, tmp++) {
+	for (int i = 0; i < pfs->pfs_header.num_entries; i++) {
 		u64 entry_size_bytes = pfs->pfs_header.entry_size * sizeof(u32);
 
-		tmp->start = pfs->vsec_offset + entry_size_bytes * i;
-		tmp->end = tmp->start + entry_size_bytes - 1;
-		tmp->flags = IORESOURCE_MEM;
+		res[i].start = pfs->vsec_offset + entry_size_bytes * i;
+		res[i].end = res[i].start + entry_size_bytes - 1;
+		res[i].flags = IORESOURCE_MEM;
 	}
 
 	feature_vsec_dev->dev = tpmi_info->parent;
@@ -607,9 +605,9 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 
 static int tpmi_create_devices(struct intel_tpmi_info *tpmi_info)
 {
-	int ret, i;
+	int ret;
 
-	for (i = 0; i < tpmi_info->feature_count; i++) {
+	for (int i = 0; i < tpmi_info->feature_count; i++) {
 		ret = tpmi_create_device(tpmi_info, &tpmi_info->tpmi_features[i],
 					 tpmi_info->pfs_start);
 		/*
@@ -703,7 +701,7 @@ int intel_tpmi_init(struct intel_tpmi_info *tpmi_info, struct device *tpmi_dev,
 {
 	struct pci_dev *pci_dev = dev_is_pci(parent) ? to_pci_dev(parent) : NULL;
 	u64 pfs_start = 0;
-	int ret, i;
+	int ret;
 
 	tpmi_info->tpmi_dev = tpmi_dev;
 	tpmi_info->parent = parent;
@@ -724,7 +722,7 @@ int intel_tpmi_init(struct intel_tpmi_info *tpmi_info, struct device *tpmi_dev,
 	if (!tpmi_info->tpmi_features)
 		return -ENOMEM;
 
-	for (i = 0; i < tpmi_info->feature_count; i++) {
+	for (int i = 0; i < tpmi_info->feature_count; i++) {
 		struct intel_tpmi_pm_feature *pfs;
 		struct resource *res;
 		u64 res_start;
-- 
2.43.0

