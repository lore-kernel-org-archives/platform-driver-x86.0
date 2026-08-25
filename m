Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4696431E840;
	Tue, 25 Aug 2026 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787681740; cv=none; b=WXNBO1yjkRb2BwFtwFjANm8O3+wn0To4CixTA5UzwjsSS91IfS2VIy0zlrvvlJlrWcGVUb4SyGWr1NpR4aSqcMRHVjYaN/S1ou+PWirlIpA2oJgErRibMPaK0AgF2SeH+5hA5XsFniJ+7xmAQ5VxZnNnbkcTM5colJdCR35u158=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787681740; c=relaxed/simple;
	bh=t3PTLNz9obMAeF4bjiMPKgisR+oAPjT7blNxAzQNWLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2p2selFBclyOcX9xpmmkOVuN0dlnRigs+YigWVRbL11/welFnxjhyI9+4UVCxcxWmjzrkT4eFGQIct3x1uqPq82f2Xk3R/V2dF2pkPMuBwEOcM14h0cpGy7GrYcztPyiWRmsZz4ZgGCVTd/lK3oK2ysl/5nIt/kv0mbR56SrQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuqNN3JJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuqNN3JJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787681738; x=1819217738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t3PTLNz9obMAeF4bjiMPKgisR+oAPjT7blNxAzQNWLo=;
  b=PuqNN3JJ6H+waHCWsFG56rLnJVv0uPgyOMbFDZ/Do8mIX8vxNgZYgQRQ
   8ccGHX391Ji1Cs7IVzpsAKK8R0gGPY5UQfQ6ywmOcF0CWVThJfrcig0/7
   h7W+8mssPidaovq1NavRp+9lhNVEPcZ5Rtk1nzd2Q9Mm01vmWkNAlSZlS
   ciDUcKqDf1crVbikfq52+IH4n0GS2KP/3A1YWW+voNrcopQEcdDzfhZgs
   iyvsbwWzLvUfLkZd+eaDTuAlqHeffPf1HYd1dpDNCff2XXgrmHKUJzNyr
   g93d417cH7tEoeZmODbzAo70gntJ/h0Xu/lv7AzUv9Bh+Qzb+bXftrFZu
   w==;
X-CSE-ConnectionGUID: 6I9IZ0a1S4SCgPYbkF9U9A==
X-CSE-MsgGUID: 9OYRsYuFQCu1GzycKQcI0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88174221"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="88174221"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 11:15:34 -0700
X-CSE-ConnectionGUID: 8IepgpC7Rsa+YC0s/Bn9Sw==
X-CSE-MsgGUID: GX8QeEONRiCqpxHWvwnv4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="265559608"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.222.141])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 11:15:34 -0700
From: Tony Luck <tony.luck@intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>,
	Breno Leitao <leitao@debian.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Subject: [PATCH 5/7] platform/x86/intel/bff: Reset bitfix filter when it overflows
Date: Tue, 25 Aug 2026 11:15:24 -0700
Message-ID: <20260825181526.13203-6-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825181526.13203-1-tony.luck@intel.com>
References: <20260825181526.13203-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get notifications for all errors logged in machine check banks. Skip any
that do not indicate a bitfix filter overflow.

Reset the bitfix filter using the CPU that reported the error to get
the right scoped machine check bank.

Co-developed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 drivers/platform/x86/intel/bff.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/platform/x86/intel/bff.c b/drivers/platform/x86/intel/bff.c
index 6360bbc92347..8cc29d11e019 100644
--- a/drivers/platform/x86/intel/bff.c
+++ b/drivers/platform/x86/intel/bff.c
@@ -17,11 +17,13 @@
  */
 #define pr_fmt(fmt) "bff: " fmt
 
+#include <linux/bits.h>
 #include <linux/cpufeature.h>
 #include <linux/device-id/x86_cpu.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/printk.h>
 #include <linux/types.h>
 
@@ -32,6 +34,11 @@
 #include <asm/msr.h>
 #include <asm/msr-index.h>
 
+/* Intel bitfix filter control register defines */
+#define MSR_MC0_BFF_CTL		0x000006c0
+#define MSR_MCx_BFF_CTL(x)	(MSR_MC0_BFF_CTL + (x))
+#define  MCI_BFF_RESET		BIT_ULL(0)
+
 /* Machine check bank scope types */
 enum bff_type {
 	BFF_NONE = 0,
@@ -60,6 +67,37 @@ MODULE_DEVICE_TABLE(x86cpu, bff_cpu_ids);
 
 static const enum bff_type *bank_types;
 
+static void handle_bff(struct mce *mce)
+{
+	/* The bitfix filter overflowed, get the target CPU to reset it. */
+	if (wrmsrq_on_cpu(mce->extcpu, MSR_MCx_BFF_CTL(mce->bank), MCI_BFF_RESET))
+		pr_warn("Failed to reset bitfix filter for CPU %d Bank %d\n", mce->extcpu, mce->bank);
+}
+
+static int bff_mce_notify(struct notifier_block *nb, unsigned long val, void *data)
+{
+	struct mce *mce = (struct mce *)data;
+
+	/* TES is undefined for uncorrected errors. */
+	if (mce->status & MCI_STATUS_UC)
+		return NOTIFY_DONE;
+
+	if (MCI_STATUS_TES(mce->status) != MCI_STATUS_TES_YELLOW)
+		return NOTIFY_DONE;
+
+	if (mce->bank >= MAX_NR_BANKS || bank_types[mce->bank] == BFF_NONE)
+		return NOTIFY_DONE;
+
+	handle_bff(mce);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block bff_notifier = {
+	.notifier_call	= bff_mce_notify,
+	.priority	= MCE_PRIO_EARLY,
+};
+
 static int __init bff_init(void)
 {
 	const struct x86_cpu_id *m;
@@ -86,11 +124,14 @@ static int __init bff_init(void)
 
 	bank_types = (const enum bff_type *)m->driver_data;
 
+	mce_register_decode_chain(&bff_notifier);
+
 	return 0;
 }
 
 static void __exit bff_exit(void)
 {
+	mce_unregister_decode_chain(&bff_notifier);
 }
 
 module_init(bff_init);
-- 
2.55.0

