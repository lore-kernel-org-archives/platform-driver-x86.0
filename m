Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D27545297;
	Tue, 13 Oct 2026 19:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919817; cv=none; b=rrI3tLCMVMxR5N1YDHh+QkVkSjLXpynqsGIBBsBiM3EVWxD2Yg9yKBd380yqEd95MvoPTrNFIr/KoW2JnQRD6i6vXJ2XT5wVKrk/Auvb4lx4xFQOadMomHFLh/TC0GQDmdDfTcG4OjfG9TgUBlypBDctiLgxk15QV5xRBlR9tOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919817; c=relaxed/simple;
	bh=iDhjbgEsBWYrvJ+Q4YWTFHOKu2v3r7lQNFgG42v/7pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pq84keFnaUn58d70nsfUiawTvA52cFit5xAs7QbZS6EW4jUeko2zWlm//FhgbKww74BoXpEGWF+yUDOG+3DyIse6GzXza2p5wz5JeFxW3qW4Oks7ekIgLegjfeGy5wC7w2nx8lxW5w+Ev1dZpPNRNJhFO1RdF4zsSXolOx3Scrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KvphjD7l; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KvphjD7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919815; x=1823455815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iDhjbgEsBWYrvJ+Q4YWTFHOKu2v3r7lQNFgG42v/7pE=;
  b=KvphjD7l+9YrN1xy4J1zvsrYJvkngk79Wm7zKov2AwgtOTyZCLtWdCvq
   hMosPTSQRKMzbQwcAdTUAufAPbmECMoDT4xkYDg1BvtWcUQ4taBHDW0AR
   Y0qqlAMM5/REhuA2bs/+S8IVU/FOZwIZMH911/LefyyxN5mjZQKKqalz+
   3uxkreBM6cM0JsSezjComDBmoGvHUB+NrbcaWiEWXH2oBt9FwBuoCd58W
   QknLxjecipAfvqmjsD2Uxlw2ABBy90eJvU6JnK0IzuYLl9xIkAePeTqrc
   3u4MHFslL0Iop/o5iJN+yJuqUjIUc5PJ6juJ4oIlYwXUjH69td8CIuLHf
   Q==;
X-CSE-ConnectionGUID: 83MvThXORjm9SieMqQTOaA==
X-CSE-MsgGUID: OV8mZ4aET1GXKtG0iDkicQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544145"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544145"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
X-CSE-ConnectionGUID: xYlvpkvQTJy+LyzBynZLPw==
X-CSE-MsgGUID: 8r0dmumLRtCoN7q3KZVpqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167720"
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
Subject: [PATCH v5 19/20] platform/x86/intel/tpmi: Declare the loop counters in their loops
Date: Tue, 13 Oct 2026 12:29:34 -0700
Message-ID: <20261013192935.2243291-20-sathyanarayanan.kuppuswamy@linux.intel.com>
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

