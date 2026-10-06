Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA374A4F0B;
	Tue,  6 Oct 2026 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311477; cv=none; b=RwC/+RIx1MEA9rTv280uRk5yJSK/5fQGII1ef+6nsYbZgbJgBG+KXEQ3TZurfan6gXgvg/IuQVeqdGLoLr97PuZ53zLLGBbRZYxLYDU8fNZcwLeYOvGugmRzjsq++W3l5oO/JVE/WIpFCp0j1DYddxBEffXRCggLfvbd+YROQcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311477; c=relaxed/simple;
	bh=pGS/xjueNzRwY7nbH4t5291BhysepFipHiXPOhdommg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g8BcAfv5E/6AzXg0ahebGsUYDAMaXn0A3x2JyJR4cd2aGs5TwAldKCDyuT5acqIrKuDIQTyPDRWEcjMLbORK4mSEXphfvDZ6TBug9MA/JqcPfCtXvGJFTrWT6k+hp1ncZHxZWnZ2xsRtNpIDi5HBTS9aDMMXjPQWtFCIL+KPDeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nze5XQLC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nze5XQLC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311463; x=1822847463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pGS/xjueNzRwY7nbH4t5291BhysepFipHiXPOhdommg=;
  b=Nze5XQLCvkfrUkOZWANz+sw1O1khqt6Euk8vr5VAFLnTz16znx73tguj
   VwK08DQWQXu7iLaB7e0SZ9BIEiquL/9HBoGo+JkQzz4kPKQ5m03hRdJhq
   ymPgipMsv4vVwLAxkOZPJAOffYszU8tk2ykCsHdSbEaCZEcDKIbKsnSJu
   UkryhCIOeV2Bt+eZ0xGRe+8/MmyaQzdlvkzJ1xhfKPG5dOOz7u18HXr9F
   3tKq6hK4OBvnltIQT1D1yTnKmRM5H29Z6zgECYrg7ThtheSrDj76oRizG
   H59lp+7BHq1uzslCt+IuV91cXSBifiSND/CFKPltF4vGcCxDUlJ+m99fT
   A==;
X-CSE-ConnectionGUID: OJq7/sQPRQeWLs2oc6Z8gw==
X-CSE-MsgGUID: WOR4cE/sSBmln2GmPyKqDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591613"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591613"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:56 -0700
X-CSE-ConnectionGUID: HGcyVJ4MSUKtqJvk1FKYMg==
X-CSE-MsgGUID: o4ZV7UhYQC+abhkoxgX2iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500279"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:56 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/20] platform/x86/intel/tpmi: Turn TPMI_GET_SINGLE_ENTRY_SIZE() into a function
Date: Tue,  6 Oct 2026 11:30:29 -0700
Message-ID: <20261006183037.1507007-13-sathyanarayanan.kuppuswamy@linux.intel.com>
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

