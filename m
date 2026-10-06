Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD64A4848;
	Tue,  6 Oct 2026 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311478; cv=none; b=ZJFspmxzRTpFZbFVzSqzWOhPHIaH7eMOEZ+6k8hPgDoVQwz6M38dN7Q7iriDVHmATWbY64qKviA/JBYbibmV8tve1jM+17pFtCAyJHA4hUeRwPRVeWAKjluPwf8wdenLB0YNHeGC7Awc361JbnHqrai1n/oFGNgNAken5gof92c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311478; c=relaxed/simple;
	bh=uN/Xb6k5IqC4SamJ+jaoJKYeP2rkiUiEVQKYuO6tsS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pA0wADBo3wVv3nEOCWnn3Ho5bmbmA90/2l4TRDzjQr1MIqXpEhGFfqr9lPvWDv8h1EbZoYq0Lh4jxxM+ssj/ehs7bz8+IVJ/LcMI3n56EID/EhOzFe07TRUXduWI4SGoQxqnFIO5s+zPM+HHkj8IVnJ+NOvrPX64qIMJ7bMJlcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcAJU9wu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcAJU9wu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311468; x=1822847468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uN/Xb6k5IqC4SamJ+jaoJKYeP2rkiUiEVQKYuO6tsS4=;
  b=JcAJU9wuGfVtOi6/ClyBByEFmuErh1w2ulm9NkKkdayh0j9RHqN2Ez3z
   usxIuhcD4gJ64AjF+WzAyweEe27v40FUtepznf1tVRt7cywUsfg5xQ+/Q
   7AUvoMpq5hnJCfGAaCViMp8y0sb4KZCxIGtOzWurnlEcQ53K+wNNATONZ
   BqjD1V5zdy3qZhZyhkS4lFJTRlTKJZGFMfnelOx4X7hFS4VYE9Zula4Wp
   3jBup0wDrGc9FMhezQhzOp210F/MCPFYRfcoItBI+vBGkqjOLq7Y5jquV
   cF9KS2hewYMpy3ME/aWWpLvA7axgYxPwS7I+jaI+hSB/pWHwQ6lon+a/x
   A==;
X-CSE-ConnectionGUID: SOtmfyEdSCWLVBPWcEFB1A==
X-CSE-MsgGUID: WxQRx3MlQDeUloSk5VNw4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591618"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591618"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:57 -0700
X-CSE-ConnectionGUID: /YIgna2kRSGdXRT/Ml9QeQ==
X-CSE-MsgGUID: NKfBES0XSImgsw6lclWbfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500285"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:57 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/20] platform/x86/intel/tpmi: Use scope based cleanup in the memory dump
Date: Tue,  6 Oct 2026 11:30:31 -0700
Message-ID: <20261006183037.1507007-15-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

