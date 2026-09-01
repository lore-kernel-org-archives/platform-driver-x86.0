Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5A0374E6D
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 19:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290875; cv=none; b=Z3e8bdDJZ53BOpHZhUO3cOSTULJ9x3Eki3Zyji82rXx6H8kxFeRVDf0n7r7r2pvNdY1VhpQgd+70yUGgLsRiC28l4+hf9/OGqB0dyQ0K8bLLj3lU9ukdaDnWMfaTPFagvLZW6wQnXm3nbDm+V9dGDeg+dYTSu84/ruNN15dtGaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290875; c=relaxed/simple;
	bh=ZOZNZgfcko3Y/gUKybJGv4kvbZnT46ie1Po2g+DdJx4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TuqjrSalHu5A5DrWlrFSrtwsedLvLSuXoQ4hW9gWTYNbHgSeseVHA6Xqw2/v1OOll5jpCJ7+75vIVUAd12c7F7jlgkp75anCvDHTr64Enwn4DY6GZCucZ/bDvkLWuPYGK73iVhQmu5zlL7h5jD8E2Q+2NO25UhARF3IphvgaF0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgpvFJW6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgpvFJW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788290874; x=1819826874;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZOZNZgfcko3Y/gUKybJGv4kvbZnT46ie1Po2g+DdJx4=;
  b=EgpvFJW6ZUf5ZFEkuyK81XXfWurGfc1CrjjLzV60JKiZpl4dNooxzpzj
   kicv3bkPJei1kt79MK8QgNhLXqrLvi90vrn5DZsid5BLs320jKkzgQ0f2
   p3JKOsmIqC8YgS+U0BTR1eM+1wo8pxb82Zg6Y5l0zLCFxGQnRM2yrkaie
   CoevblkasOuDfRaPQs4EyTAAHh0sFUpI0BoOobhf3sPb0wIhQn5uYPCVb
   Cu5g96GfMZ0ihrIOI9qgXKkgXSY4t96PD8B195wj6PJ/1x+0PyoND/ns0
   d39SSNrb7tQGxNb64gYneA5H87HG9BKYKGyut7nZebC0Ruvcc5qshUnGe
   w==;
X-CSE-ConnectionGUID: VMv2URhhRNixsfbEQAR1uQ==
X-CSE-MsgGUID: Rf0p/2/bQrqpS6OAPbFNBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762473"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88762473"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:54 -0700
X-CSE-ConnectionGUID: c8TEZDY2T1ykH+i5Ioh/hg==
X-CSE-MsgGUID: +PDLXsMCSoyuvx1LG+ixYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="269776731"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:54 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com,
	anoop.c.vijay@intel.com,
	badal.nilawar@intel.com,
	matthew.d.roper@intel.com,
	james.ausmus@intel.com,
	karthik.poosa@intel.com
Subject: [PATCH v4 05/18] platform/x86/intel/pmt: Add helpers for callback info
Date: Tue,  1 Sep 2026 12:27:40 -0700
Message-ID: <20260901192736.626777-25-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192736.626777-20-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor some open coded checks into helpers.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c    |  2 +-
 drivers/platform/x86/intel/pmt/class.h    | 15 +++++++++++++++
 drivers/platform/x86/intel/pmt/crashlog.c |  4 ++--
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 402d51df834a..af7c951b569a 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -64,7 +64,7 @@ pmt_memcpy64_fromio(void *to, const u64 __iomem *from, size_t count)
 int pmt_telem_read_mmio(struct device *dev, struct pmt_callbacks *cb, u32 guid, void *buf,
 			void __iomem *addr, loff_t off, u32 count)
 {
-	if (cb && cb->read_telem)
+	if (is_cb_read_telem(cb))
 		return cb->read_telem(dev, guid, buf, off, count);
 
 	addr += off;
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index 258cb460e61c..d8291a5f08a7 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -71,6 +71,21 @@ struct intel_pmt_namespace {
 				struct intel_pmt_entry *entry);
 };
 
+static inline bool is_cb_read_telem(struct pmt_callbacks *cb)
+{
+	return cb && cb->read_telem ? true : false;
+}
+
+static inline bool is_cb_read_reg(struct pmt_callbacks *cb)
+{
+	return cb && cb->read_reg ? true : false;
+}
+
+static inline bool is_cb_write_reg(struct pmt_callbacks *cb)
+{
+	return cb && cb->write_reg ? true : false;
+}
+
 int pmt_telem_read_mmio(struct device *dev, struct pmt_callbacks *cb, u32 guid, void *buf,
 			void __iomem *addr, loff_t off, u32 count);
 bool intel_pmt_is_early_client_hw(struct device *dev);
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 142c368a60f8..32f6a7d42b8d 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -132,7 +132,7 @@ static int pmt_crashlog_read_reg(struct intel_pmt_entry *entry, u32 *reg, u32 of
 
 	*reg = 0;
 
-	if (entry->cb && entry->cb->read_reg) {
+	if (is_cb_read_reg(entry->cb)) {
 		ret = entry->cb->read_reg(entry->dev, entry->header.guid, reg, offset);
 		if (ret) {
 			pr_err_ratelimited("failed to read reg: %d\n", ret);
@@ -164,7 +164,7 @@ static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 	else
 		reg &= ~bit;
 
-	if (entry->cb && entry->cb->write_reg) {
+	if (is_cb_write_reg(entry->cb)) {
 		ret = entry->cb->write_reg(entry->dev, entry->header.guid, reg, control->offset);
 		if (ret) {
 			pr_err_ratelimited("failed to write reg: %d\n", ret);
-- 
2.43.0

