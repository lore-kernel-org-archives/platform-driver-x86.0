Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA781279DD6
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jul 2025 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752427818; cv=none; b=rwQhr38JaEKd/Rx9ldSmz4Jybc8GfUkBU9DGur3CI7qF/r6iBR0DN5axz4xr78Mr1HEI5rpz+6io1F/Kk53ICeqgDJtzEiYdcrMZDSEoaWpHvWzFrVDHY66APoZ+ps7L/IyTLkfsjO7Yro4bGiQUbx5EPSmVr2SRAAzZGjteobk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752427818; c=relaxed/simple;
	bh=ZIclvugM+nOSJV85NwMrbVqzXojzgzSttVAU6WYraSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNrZGixr4oGOW/r+qBdEReOZQaeiyWbf9LOCKzwmtl5vEshHMh48Hze7NtOJM4yralYB4xX0lYEM5qBdP1d9bcvT4cVlWfiVnU+1iyF/MkMTJWCxVtja3pwa0JyQ7zFeQ1gVPtLQBJJ3teGQ0IUiRnUgzH9JgJGC47RpqBHA8GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzf9SHqt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzf9SHqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752427817; x=1783963817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZIclvugM+nOSJV85NwMrbVqzXojzgzSttVAU6WYraSQ=;
  b=nzf9SHqtKxGUVKi84iiGlpq0crlHKUMK7FHW10X0PQOspTxMOasAkO22
   47pPMMof0WdtKSUbh0Txtbu8jSU/0/6vwWaBeuEKMZVUUt58pY7brfJLP
   EtkwsrUQ+w/yzIC6xnBy7Hpf00Es5wZfdKdKh6X8c59KgyLSSrC0jbYFC
   vvd1K3J+mRDCxipPf9tvRkJYnbkKg1tlaH+46AgB3UUxsVkDPF7vLaYZt
   BPYouKyriduzYUSLYg2Yszgot+FfpStaAzfCVHh9Pb8VXgkkfCqRf2oAO
   urjlzbaVO4L4QnikZc+fYtj2jDwgQyQrBo6jXHGIlFnDrDF2HxhUT7kAv
   g==;
X-CSE-ConnectionGUID: Da4pgVRnSgyJCJN/mGEX4A==
X-CSE-MsgGUID: a3rlkeQNSlukIFPljHZ13w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65334159"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="65334159"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:16 -0700
X-CSE-ConnectionGUID: zUG4xqHqTW2jW7WYSA9zKw==
X-CSE-MsgGUID: mFnqJ4geSGeSnqXfNq2QOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="161069354"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.19])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:15 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v8 10/13] platform/x86/intel/pmt: add register access helpers
Date: Sun, 13 Jul 2025 13:29:40 -0400
Message-ID: <20250713172943.7335-11-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250713172943.7335-1-michael.j.ruhl@intel.com>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The control register is used in a read/modify/write pattern.
The status register is used in a read/check bit pattern.

Add helpers to eliminate common code.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 58 +++++++++++------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 23b3971da40a..ed781548e59d 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -64,20 +64,40 @@ struct pmt_crashlog_priv {
 /*
  * I/O
  */
-static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
+
+/* Read, modify, write the control register, setting or clearing @bit based on @set */
+static void pmt_crashlog_rmw(struct intel_pmt_entry *entry, u32 bit, bool set)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
+	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
+
+	reg &= ~CRASHLOG_FLAG_TRIGGER_MASK;
+
+	if (set)
+		reg |= bit;
+	else
+		reg &= ~bit;
+
+	writel(reg, entry->disc_table + CONTROL_OFFSET);
+}
+
+/* Read the status register and see if the specified @bit is set */
+static bool pmt_crashlog_rc(struct intel_pmt_entry *entry, u32 bit)
+{
+	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
+
+	return !!(reg & bit);
+}
 
+static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
+{
 	/* return current value of the crashlog complete flag */
-	return !!(control & CRASHLOG_FLAG_TRIGGER_COMPLETE);
+	return pmt_crashlog_rc(entry, CRASHLOG_FLAG_TRIGGER_COMPLETE);
 }
 
 static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
 	/* return current value of the crashlog disabled flag */
-	return !!(control & CRASHLOG_FLAG_DISABLE);
+	return pmt_crashlog_rc(entry, CRASHLOG_FLAG_DISABLE);
 }
 
 static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
@@ -98,37 +118,17 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
 static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
 				     bool disable)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
-	/* clear trigger bits so we are only modifying disable flag */
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
-
-	if (disable)
-		control |= CRASHLOG_FLAG_DISABLE;
-	else
-		control &= ~CRASHLOG_FLAG_DISABLE;
-
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_DISABLE, disable);
 }
 
 static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
-	control |= CRASHLOG_FLAG_TRIGGER_CLEAR;
-
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, true);
 }
 
 static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
-	control |= CRASHLOG_FLAG_TRIGGER_EXECUTE;
-
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, true);
 }
 
 /*
-- 
2.50.0

