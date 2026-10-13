Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F0542ED0;
	Tue, 13 Oct 2026 19:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919809; cv=none; b=NVBjTBh4IuCoUNuS0c3sbPTkQ+rM25//20jwuKPKUZyfKg9WIet1vnAbQjoXECpSISqI6aGs/V2WE1CsMeExmIYi351Tg3KyNZ3F5quQZNUPfX4K6XTGB35Xvq/O3Yp3VRZbF86E+TCHCvz4YP3X98AYQoLhSHRoxnf9CyqA6hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919809; c=relaxed/simple;
	bh=pGS/xjueNzRwY7nbH4t5291BhysepFipHiXPOhdommg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tCcI7knqq+1I82kpvtU85yO7FB+DUVbgwFl7Y0NA4b6KbMyB7qvUN1YAkVvYiJ/m3rGFwdzDVUJ9cU4iK8849S9ttkbKtx7hCGD/TUiwXiwyv8NUmXd2ZCHdP2sXFmZPYxJErxrFCh9lxqd5mg+SBUlh4Ew5bzbBLZDJonoJA8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsTtDlp1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsTtDlp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919808; x=1823455808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pGS/xjueNzRwY7nbH4t5291BhysepFipHiXPOhdommg=;
  b=gsTtDlp1dU7lzE9nbcj2NY2LMuvO6EVEW03vAxL3sC28Ff8AfN4Wn4Xw
   jHeJYlAq8j2tAoqvJ/iDdPYWLJQlXgKUEdYcHVpuzhCjx04QEe60P+/B0
   HzXnUYVFlPSUi+Ad2zTeRQhVs42+5fWqgZRJlZ/jPCPS7Wy1uRoxJf2n2
   7OiOgqapZFhUw+TwlyiA3gnUcemrEm9EOc/PYK8vvbImZFtw781BFqjKw
   NH+nnGex6Jo6fa6zbpldEmwab5d+5d2B2waV0IaPWrQC8OOFWg0zbrL+8
   nY5JSD6flDXwHO+D2PXntSdp1GFmsas1hoCuqW/q1O0OeTNIP6d2gG+1/
   A==;
X-CSE-ConnectionGUID: dwfDNOK0S8WhGmflIZKI6A==
X-CSE-MsgGUID: LFAdgJGPS+qbOdZeyMbjNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544131"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544131"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
X-CSE-ConnectionGUID: fc1Gl+C5QAOzFxaK7NzSqA==
X-CSE-MsgGUID: 4o0Hyei6QUq3+uFdEHRVFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167695"
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
Subject: [PATCH v5 12/20] platform/x86/intel/tpmi: Turn TPMI_GET_SINGLE_ENTRY_SIZE() into a function
Date: Tue, 13 Oct 2026 12:29:27 -0700
Message-ID: <20261013192935.2243291-13-sathyanarayanan.kuppuswamy@linux.intel.com>
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

The macro computing a feature instance size has a few problems. Its
comment says the hardware reports the size in u32 units, but the
conversion to bytes is spelled as a shift by 2, so the comment and the
code have to be read together to see that they agree. Its body is a
single conditional expression wrapped in a statement expression that it
never needed. And it evaluates its argument twice.

Make it a plain static function, tpmi_get_single_entry_size(), which
fixes all three: the conversion becomes a multiply by sizeof(u32), there
is nothing left to wrap, and the argument is evaluated once and type
checked.

No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 83362d4bb726..7f6cd0fb23d7 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -149,13 +149,18 @@ struct tpmi_feature_state {
 } __packed;
 
 /*
- * The size from hardware is in u32 units. This size is from a trusted hardware,
- * but better to verify for pre silicon platforms. Set size to 0, when invalid.
+ * Return the size of a single feature interface instance in bytes. The
+ * hardware reports it in u32 units. The value comes from trusted hardware,
+ * but is still worth verifying on pre silicon platforms, so return 0 when
+ * it is out of range.
  */
-#define TPMI_GET_SINGLE_ENTRY_SIZE(pfs)							\
-({											\
-	pfs->pfs_header.entry_size > SZ_1K ? 0 : pfs->pfs_header.entry_size << 2;	\
-})
+static u32 tpmi_get_single_entry_size(const struct intel_tpmi_pm_feature *pfs)
+{
+	if (pfs->pfs_header.entry_size > SZ_1K)
+		return 0;
+
+	return pfs->pfs_header.entry_size * sizeof(u32);
+}
 
 /* Used during auxbus device creation */
 static DEFINE_IDA(intel_vsec_tpmi_ida);
@@ -397,7 +402,7 @@ static int tpmi_mem_dump_show(struct seq_file *s, void *unused)
 	u64 off;
 	u8 *buffer;
 
-	size = TPMI_GET_SINGLE_ENTRY_SIZE(pfs);
+	size = tpmi_get_single_entry_size(pfs);
 	if (!size)
 		return -EIO;
 
@@ -445,7 +450,7 @@ static ssize_t mem_write(struct file *file, const char __user *userbuf, size_t l
 	void __iomem *mem;
 	int ret;
 
-	size = TPMI_GET_SINGLE_ENTRY_SIZE(pfs);
+	size = tpmi_get_single_entry_size(pfs);
 	if (!size)
 		return -EIO;
 
@@ -531,7 +536,7 @@ static void tpmi_set_control_base(struct intel_tpmi_info *tpmi_info,
 	void __iomem *mem;
 	u32 size;
 
-	size = TPMI_GET_SINGLE_ENTRY_SIZE(pfs);
+	size = tpmi_get_single_entry_size(pfs);
 	if (!size)
 		return;
 
-- 
2.43.0

