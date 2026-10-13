Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDD45437FD;
	Tue, 13 Oct 2026 19:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919814; cv=none; b=K2Ga061DyvzQeqKcpNJlrH1IFWn2tNDYxLnQgpZMZ5k3oU9ToqRlU4kNc/OP+6+zxH9Q+LOSCNtUsvUflbH4ORgtTQDiqWGJ+r3YDm6+NdMf3RuprWqqxS62JeqbI5fuCEFcuNh08EYEhHJW+nlyoRtGgGFIjO1xbL2tW75GAQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919814; c=relaxed/simple;
	bh=uN/Xb6k5IqC4SamJ+jaoJKYeP2rkiUiEVQKYuO6tsS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eTl0zRoeNH4SskqmoSCAB3Lw5ImCq+XEG8R4zYNCHktLiX2190k8LR2byQ+b+axie1qSojy5SBhozoxuhqpImXp2ERmf2Qam86vv4efkMHuH8R2BeeKx8d5Bj7uH40Du/lvHy5bakqTWIQtkRXhQlPLK9ar34MS/Nbu8qdoI4u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KccInL9i; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KccInL9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919811; x=1823455811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uN/Xb6k5IqC4SamJ+jaoJKYeP2rkiUiEVQKYuO6tsS4=;
  b=KccInL9iVkUwjLrHZL2OPc64iOLaAX9Vp1UyvvzRkDsL/RAbwllyaAVk
   twF4jzG6uKqJYAhVEoUqs6YibRYXTVc8cclYKfL4iGFL1YPnn7sqVwVsq
   HzXZ0wUiKudq6mVaHC7vWapBLT91EIeM8ilw5o+AdNRsVXn8oKeNQNibw
   DeUXAyNdxO1JWWChlTLhdgNZ+ikSN3gDyrVSrM4WBAAHB26hVmMvm/1T1
   vDzI1TgYh3XAcD13Kw9mdFloocEiGvSaxVZYGth7o/aRwF9tmS1GIP/aE
   oChVl42aOWjNniU83dXoM6XuIM7NeGzZHBND+n3ydG54ihKOSNmOCdb+4
   Q==;
X-CSE-ConnectionGUID: eHZ0HB5fS+aYKuSupJDDoQ==
X-CSE-MsgGUID: 5XKyWv3jQQSBGJp3kSzQYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544135"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544135"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
X-CSE-ConnectionGUID: tThKqkzYQxqZAltUGJlCpQ==
X-CSE-MsgGUID: JGFwqLIvQsaTDbvWrBUDAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167703"
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
Subject: [PATCH v5 14/20] platform/x86/intel/tpmi: Use scope based cleanup in the memory dump
Date: Tue, 13 Oct 2026 12:29:29 -0700
Message-ID: <20261013192935.2243291-15-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tpmi_mem_dump_show() frees its dump buffer and drops tpmi_dev_lock by
hand at the end of the function, so the ioremap() failure in the middle
of the loop cannot just return. It breaks out with an error stashed in
ret, which is the only reason ret exists.

Attach the buffer to __free(kfree) at its allocation and take the mutex
with guard(), then return the error directly from the loop. mem_write()
in this file already does both, so this makes the two debugfs paths
consistent.

No functional change intended.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 00f27ac0a753..5332d30aac6c 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -393,32 +393,29 @@ static int tpmi_mem_dump_show(struct seq_file *s, void *unused)
 {
 	size_t row_size = MEM_DUMP_COLUMN_COUNT * sizeof(u32);
 	struct intel_tpmi_pm_feature *pfs = s->private;
-	int count, ret = 0;
 	void __iomem *mem;
+	int count;
 	u32 size;
 	u64 off;
-	u8 *buffer;
 
 	size = tpmi_get_single_entry_size(pfs);
 	if (!size)
 		return -EIO;
 
-	buffer = kmalloc(size, GFP_KERNEL);
+	u8 *buffer __free(kfree) = kmalloc(size, GFP_KERNEL);
 	if (!buffer)
 		return -ENOMEM;
 
 	off = pfs->vsec_offset;
 
-	mutex_lock(&tpmi_dev_lock);
+	guard(mutex)(&tpmi_dev_lock);
 
 	for (count = 0; count < pfs->pfs_header.num_entries; ++count) {
 		seq_printf(s, "TPMI Instance:%d offset:0x%llx\n", count, off);
 
 		mem = ioremap(off, size);
-		if (!mem) {
-			ret = -ENOMEM;
-			break;
-		}
+		if (!mem)
+			return -ENOMEM;
 
 		memcpy_fromio(buffer, mem, size);
 
@@ -430,11 +427,7 @@ static int tpmi_mem_dump_show(struct seq_file *s, void *unused)
 		off += size;
 	}
 
-	mutex_unlock(&tpmi_dev_lock);
-
-	kfree(buffer);
-
-	return ret;
+	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(tpmi_mem_dump);
 
-- 
2.43.0

