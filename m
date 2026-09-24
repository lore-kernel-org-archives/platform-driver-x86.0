Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8324B204D;
	Thu, 24 Sep 2026 18:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274249; cv=none; b=P4nl/4ApJ5ytkuD6yT2vDGCwUGTK6Uo+YdahnkcjEGIQfCVkFoXMYzkN4EOoV1ymHeP7AyoL1u3kAzsg6vbzYASxmB1fKSLLhdzEyidL27SS/fOY6hnc+xG/+nsiiLSflG6fjjyRJ9euojYcTNZdrFmpuH9pnWlHK37cPIQ1eu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274249; c=relaxed/simple;
	bh=LbxluZPA5Z/1RJRGXs5zHvJ1w4Hu8kOnn4bAoMnXREs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NK9Emfg8/XbI3KdCR9E/M2teUxK1m5nvIK8kmzmM3JhfvLOg2k5sJmBMb+ComVk5ZWKxN25rOQruSJh96Eul2Dr16YjgnvxHmCK0RTFu6gfW6JS0laeAP3iceRVV/WOdgMu5h4liqztds5WpewmMpBzhC7CT3QrmqVuwZsUzt8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnCE/z44; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnCE/z44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274248; x=1821810248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LbxluZPA5Z/1RJRGXs5zHvJ1w4Hu8kOnn4bAoMnXREs=;
  b=fnCE/z44RBsTlwJTry6Jlge8sST4i1MzWKPN2syXXilLNXzA4ULa/tpU
   X/m5/dJ3SAXnAhI0zAq5VuBo0gw6bMWKiswxOlDd5mH8SvN6XFWzG+GJy
   8Mz1HWAKIhAqOh65QOGRy6lgiPpyaKVENuwZPi2rAJ8Zn6jyRxhv1xejM
   /3X73Gl8ATXh7jOwxRhsCdjRxourRzL1+dvMWt+OTtH+U3qdRt0wlFfBa
   fEuQMxbCF44SmD9Ugi8KwZf0Hmj288dwf19Z3JcrEbnlzAPid5OjvHDYP
   F045sEisAPZ1f8t63Cs4t/VrTFHwcpXfBqnY93SnMlvnknDaLei5QbyHT
   A==;
X-CSE-ConnectionGUID: Makij8eNQj6a+kJOLz10QQ==
X-CSE-MsgGUID: RXnkPW9hSuCy6WFI2V601A==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164281"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164281"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
X-CSE-ConnectionGUID: Ka9lOBU9RcGpsCJIzrHj+w==
X-CSE-MsgGUID: ++amPWnuT1y8cxKJFCpeZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229943"
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
Subject: [PATCH v2 12/19] platform/x86/intel/tpmi: Turn TPMI_GET_SINGLE_ENTRY_SIZE() into a function
Date: Thu, 24 Sep 2026 11:23:34 -0700
Message-ID: <20260924182342.212709-13-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

