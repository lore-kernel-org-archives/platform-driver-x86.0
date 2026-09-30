Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7617C51EE17;
	Wed, 30 Sep 2026 17:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789388; cv=none; b=sUcQC4D8IHTYywZ/YOSYihCfXRFfo3vUV2xl/fbyotXz1zqopXXB/IkS+18guciyc8RXWZ20ZIMEyWFBFvqsnJDltPrfIvrIyg1Cpk6N0OC8znqeqDH+QVfEgIR3mUF1nIpkCQDRIlb/2GC8PwDMjS8joi2CEZS4O35Ew8sQE8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789388; c=relaxed/simple;
	bh=QURcM/Sl11YV/obAy8HTQgCR2276WZ8jaBwew00fMmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QFmoFjfGdL6u0jzL5AjshlKYsqNIv3AWa3jG1rGhegIQ7YKCjoEC/BeEWVqbusY/kDQH9YM4qiKKvWbLLXcZMgarbhPRJkT6hsNJ8B3wsC+7aoiGcd0MlyMZxev6vWgY+cAXDUqXG413EVQAg70RsVgXhSf2jPBJpD6CbymI7xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAI8YT5V; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAI8YT5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789387; x=1822325387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QURcM/Sl11YV/obAy8HTQgCR2276WZ8jaBwew00fMmY=;
  b=PAI8YT5VB+qdGwuwvudPGcT5rNS8BTULkJ9Lg3tKESVQgVIqfUZfvUov
   I209kd/lgoFsOpeA9XyNC+XqgirOqzoLegtLgzrMs60yj9fOcE2HmuVDg
   ejHmABPr8UtAiXlPqPZDUpvbYpfTZKSnwKsaGM6qZVkMyykPGZlFkJlcD
   bko+nWUo8yrq4w0EkLNAR1OZEpVdOaw5ozjfAIsmWKGXhystJ2WImai15
   iQq1h1oikptBIH3eChX2sJNVx4elpxB2uLwWdLbm8ESxX3cywg1mvWknn
   wwrPNP9zdYWCBX1y0h3Ze3odUhdiiJ/JM94ocv795NiE/n34y/nmiz3wo
   g==;
X-CSE-ConnectionGUID: C2zRuQ6gSO6dE9wQOmOh7g==
X-CSE-MsgGUID: 4LxUYzpuRAeTcABwTKJTlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632079"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632079"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
X-CSE-ConnectionGUID: vz5sz5fSTzG6XuqwmyEBkA==
X-CSE-MsgGUID: wQuhXqYSRreZLTjr32TytQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959429"
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
Subject: [PATCH v3 14/20] platform/x86/intel/tpmi: Use scope based cleanup in the memory dump
Date: Wed, 30 Sep 2026 10:29:11 -0700
Message-ID: <20260930172918.743656-15-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

