Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDCB2E2663
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 20:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057035; cv=none; b=orKerNOb3K/0z+El0jUQs+LYdX6pjCMvDOXOJQ06vN7pdrcnyz8uu32tuhVlqKNw3GnbbJ11CK9pTo3yxbnnzFghINZGqJ/0P0RB6FaU2QEeDTylX6LQ8heHuaBMSsJWgpPhLLgE8mPk91Jol161kBP8regoMUgIlaYdBQyMQTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057035; c=relaxed/simple;
	bh=xut52ggt4AJqsqv5+q0p7SBvn0whGlkcOgyVejEjkuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lwtPoqini01oIPBEUDgcTcEP2TK6HUC7phxXOrmm+xiL+f46Z/LWwsQpvDQNZMqCTlGMb9mqfcmOVkjmm8PDmzPrUj7UKuryzjpayhWnW/E7YTP3w2u4RgVlbGA0vVrrWgXsB3QOfC2dRxfy2PAg8G6DMskSEefNmoU+h/m4/eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f2U7RrrV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f2U7RrrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751057034; x=1782593034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xut52ggt4AJqsqv5+q0p7SBvn0whGlkcOgyVejEjkuY=;
  b=f2U7RrrVVi4k5drBFao/g+FxEGpQaSkP8RKeRJUURQ7eDXYl+IMHLTH0
   +hvvzpNaSg6N2+1XpODzhyVHsONIRyzHLGevN7SEqpMrn9Ij52ngTjZWm
   LwVjMKX1Fj/JTxHjv5tnpikVc4+jmL/tQ85uh6hl6UuD7AcDzxu14bz8w
   Dsh8Ddla9xpr9hIaw+i3b4I6E/Irt2zLDo5rHAk52nfFs5/TFIExzbqDG
   9uSxzDgp/aBElQUwoGnEWflxwUiH+25BuSeM9zU5mVMlHNxKsvhj7w4pv
   nJp0oi5LY9twZok6LvgFRM4b/RpikWutA3fo58oxfnnB4ykyr7USeCH2W
   g==;
X-CSE-ConnectionGUID: FEpNRUvaTCSRh2Ket0LCdw==
X-CSE-MsgGUID: xkjOTzwWT2a2xALu12qDnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="41003220"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="41003220"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:54 -0700
X-CSE-ConnectionGUID: 0PhkV4kFT4mMq0DV6AIOGA==
X-CSE-MsgGUID: 4PhpBuARS2SEEdYRhh/4hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="156939059"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.252])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:53 -0700
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
Subject: [PATCH v5 09/12] platform/x86/intel/pmt: add register access helpers
Date: Fri, 27 Jun 2025 16:43:18 -0400
Message-ID: <20250627204321.521628-10-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204321.521628-1-michael.j.ruhl@intel.com>
References: <20250627204321.521628-1-michael.j.ruhl@intel.com>
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
 drivers/platform/x86/intel/pmt/crashlog.c | 60 ++++++++++++-----------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 23b3971da40a..adaca7ce1ba5 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -64,20 +64,42 @@ struct pmt_crashlog_priv {
 /*
  * I/O
  */
-static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
+#define CRASHLOG_SET_BIT	true
+#define CRASHLOG_CLEAR_BIT	false
+
+/* read/modify/write */
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
+		reg &= bit;
+
+	writel(reg, entry->disc_table + CONTROL_OFFSET);
+}
+
+/* read/check */
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
@@ -98,37 +120,17 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
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
+	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, CRASHLOG_SET_BIT);
 }
 
 static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
-	control |= CRASHLOG_FLAG_TRIGGER_EXECUTE;
-
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, CRASHLOG_SET_BIT);
 }
 
 /*
-- 
2.49.0

