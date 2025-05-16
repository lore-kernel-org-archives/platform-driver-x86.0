Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D441A704B
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 May 2025 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407867; cv=none; b=cGaAN7EutPj4Zr6Et5N8fE35nD8W5/Zja6O+EX42CzmN1G/GjqQGpVlxdnlRivIThPbEuCy7wTh8elwSwNi99hUGTRSxrrQZQODs17yM+6pl/C1HlLAnIEGCfwUIUzOcuoTc91PPqLv85E4CB6VQ+65okzUZWtw2+N3g1F45jV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407867; c=relaxed/simple;
	bh=s0WlObXVIEYe5Wjx3NIeWOhWX6kPWvzN73vC1ry1/mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjajIS/UA5o4E/dqyYogqtuXeuZpFjGvO2ytomtgLsJN1GZw5k5ZTW1axxQFhKpgLk1O0wGLeJxqAjH8Wo4bOSYnsZ2iGXZj07XkEbCjO6dwNCM9tOHHhqjnBVZefjLeBYqj195BG19j80LY+4gpQ4n7hEARPxeB+vfjndHZEA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avtZ+OOS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avtZ+OOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747407866; x=1778943866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s0WlObXVIEYe5Wjx3NIeWOhWX6kPWvzN73vC1ry1/mQ=;
  b=avtZ+OOSz4tGmogPR0M81gXE7Mv/Hooeh70sxw6AlJ0Ji+nBiV9MOGCi
   npxfQGmaCFeB/MwsE5yI9rMxHRTxP84v2cp2naEQgOXEVbEY0oKjh9hjh
   ufdscpgamwpAaZmdb2nESk5w/N4+o/aw/W2jjEWeiJzTiZ1AYthRj/H8N
   kKSwnP99JUrB0UQJop7gHd8ovYJtXfSsNbahwZwgzcLgr9AYmHYzd5Rhk
   nDyQ8QrV4P6HSY9PNZ201AiLIrF4k8//vuVZeY8JoR3VWEzc9j8J24ORq
   NrU0Jay2dQxATiusITjtHjPAYa539MfgImeS2Ffi3K6xEWaJNlmgJmK2t
   A==;
X-CSE-ConnectionGUID: D9Uk7y+FQpiunbVdSDtIdA==
X-CSE-MsgGUID: wCbBnjX3STCDoljWk/DpDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="59612919"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="59612919"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:04:25 -0700
X-CSE-ConnectionGUID: +qkathzQSNOZ+Qt/g25vFw==
X-CSE-MsgGUID: OpgNg6WjRHavr6yigZtqiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="139202918"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.225])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:04:24 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 1/4] platform/x86/intel/pmt: crashlog binary file endpoint
Date: Fri, 16 May 2025 11:04:13 -0400
Message-ID: <20250516150416.210625-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516150416.210625-1-michael.j.ruhl@intel.com>
References: <20250516150416.210625-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The export API added a requirement for end point data to be
used by the intel_pmt_read() function to access mmio data.

Without the ep, the call causes a NULL pointer exception.

BUG: kernel NULL pointer dereference, address: 0000000000000000
PGD 0 P4D 0
Oops: Oops: 0000 [#1] SMP NOPTI
CPU: 12 UID: 0 PID: 5721 Comm: cat Tainted: G           OE       6.15.0-rc4+ #3 PREEMPT(voluntary)
Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
Hardware name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS 1641 02/21/2024
RIP: 0010:intel_pmt_read+0x3b/0x70 [pmt_class]
Code:
RSP: 0018:ffffb19981ebba18 EFLAGS: 00010246
RAX: ffffffffc0ef8e08 RBX: 0000000000000800 RCX: 0000000000000800
RDX: ffff99aee03af450 RSI: ffff99ae86552000 RDI: 0000000000000000
RBP: ffffb19981ebba58 R08: 0000000000000000 R09: 0000000000000800
R10: 000000000e2f8200 R11: 0000000000000000 R12: 0000000000000000
R13: ffff99aee03af450 R14: ffff99ae8a4bbc00 R15: ffff99ae86a35a40
FS:  00007f097dd88740(0000) GS:ffff99b62fbe8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000198860005 CR4: 0000000000f72ef0
PKRU: 55555554
Call Trace:
 <TASK>
 ? sysfs_kf_bin_read+0xc0/0xe0
 kernfs_fop_read_iter+0xac/0x1a0
 vfs_read+0x26d/0x350
 ksys_read+0x6b/0xe0
 __x64_sys_read+0x1d/0x30
 x64_sys_call+0x1bc8/0x1d70
 do_syscall_64+0x6d/0x110
 ? __mod_memcg_lruvec_state+0xe7/0x240
 ? __lruvec_stat_mod_folio+0x8f/0xe0
 ? set_ptes.isra.0+0x3b/0x80
 ? do_anonymous_page+0x101/0x9c0
 ? ___pte_offset_map+0x20/0x180
 ? __handle_mm_fault+0xba3/0x1010
 ? __count_memcg_events+0xca/0x190
 ? count_memcg_events.constprop.0+0x1e/0x40
 ? handle_mm_fault+0x1a8/0x2b0
 ? do_user_addr_fault+0x2f6/0x7b0
 ? irqentry_exit_to_user_mode+0x33/0x170
 ? irqentry_exit+0x3f/0x50
 ? exc_page_fault+0x94/0x1b0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7f097db25701

Add the endpoint information to the crashlog driver to avoid
the NULL pointer exception.

Two minor white space issues are addressed as well.

Fixes: 416eeb2e1fc7 ("platform/x86/intel/pmt: telemetry: Export API to read telemetry")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 38 ++++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 6a9eb3c4b313..952bfe341f53 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -143,7 +143,7 @@ enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 
 static ssize_t
 enable_store(struct device *dev, struct device_attribute *attr,
-	    const char *buf, size_t count)
+	     const char *buf, size_t count)
 {
 	struct crashlog_entry *entry;
 	bool enabled;
@@ -177,7 +177,7 @@ trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 
 static ssize_t
 trigger_store(struct device *dev, struct device_attribute *attr,
-	    const char *buf, size_t count)
+	      const char *buf, size_t count)
 {
 	struct crashlog_entry *entry;
 	bool trigger;
@@ -222,6 +222,31 @@ static const struct attribute_group pmt_crashlog_group = {
 	.attrs	= pmt_crashlog_attrs,
 };
 
+static int pmt_crashlog_add_endpoint(struct intel_vsec_device *ivdev,
+				     struct intel_pmt_entry *entry)
+{
+	struct telem_endpoint *ep;
+
+	/* Endpoint lifetimes are managed by kref, not devres */
+	entry->ep = kzalloc(sizeof(*entry->ep), GFP_KERNEL);
+	if (!entry->ep)
+		return -ENOMEM;
+
+	ep = entry->ep;
+	ep->pcidev = ivdev->pcidev;
+	ep->header.access_type = entry->header.access_type;
+	ep->header.guid = entry->header.guid;
+	ep->header.base_offset = entry->header.base_offset;
+	ep->header.size = entry->header.size;
+	ep->base = entry->base;
+	ep->present = true;
+	ep->cb = ivdev->priv_data;
+
+	kref_init(&ep->kref);
+
+	return 0;
+}
+
 static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 				      struct device *dev)
 {
@@ -252,6 +277,7 @@ static struct intel_pmt_namespace pmt_crashlog_ns = {
 	.xa = &crashlog_array,
 	.attr_grp = &pmt_crashlog_group,
 	.pmt_header_decode = pmt_crashlog_header_decode,
+	.pmt_add_endpoint = pmt_crashlog_add_endpoint,
 };
 
 /*
@@ -262,8 +288,12 @@ static void pmt_crashlog_remove(struct auxiliary_device *auxdev)
 	struct pmt_crashlog_priv *priv = auxiliary_get_drvdata(auxdev);
 	int i;
 
-	for (i = 0; i < priv->num_entries; i++)
-		intel_pmt_dev_destroy(&priv->entry[i].entry, &pmt_crashlog_ns);
+	for (i = 0; i < priv->num_entries; i++) {
+		struct intel_pmt_entry *entry = &priv->entry[i].entry;
+
+		kfree(entry->ep);
+		intel_pmt_dev_destroy(entry, &pmt_crashlog_ns);
+	}
 }
 
 static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
-- 
2.49.0

