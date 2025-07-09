Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839F61FAC37
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Jul 2025 18:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086739; cv=none; b=cfZdSxp+9kgZzYCAbt+qMiYuqNbpkxbd82KnbPEdGVKK/RXlziXO2RA1OcPSrAFxwOhB0pOpu4s3BPSQr4o+toaSzFX/6QpNuCh9SDtlTRYpxODAi7+G7ccMEkc2qw61TWKY9YiVmFlKMxlYX/x2dKu2a1x7eJL7dzpJ7NOvJVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086739; c=relaxed/simple;
	bh=ZIclvugM+nOSJV85NwMrbVqzXojzgzSttVAU6WYraSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B59CL3iUfQ7twIY2bGU/jiHkBPTxv2RQmHPhcrg4oBCQIHLW4CfhL1QKSKt7P7iwvBBch+asc3v8WthTcuAUL6NqLxfox5LzH9inrpIHlRXXkznu2lP8v1DNWAMJzOdntHfkxtOsQwruPOWt7SzKI3lzqiZ48s7JhyXel3RYjg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edl+7i5k; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edl+7i5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752086738; x=1783622738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZIclvugM+nOSJV85NwMrbVqzXojzgzSttVAU6WYraSQ=;
  b=edl+7i5kuByNqdAkArAJFJMtEu+uafURrBxAAhiVrVtvYuZcwtMj50y+
   IlRbebof9dm6fe7imibmk/LhOKfdIKE+VmaUiM4nHh1Ej1lJJHB90Lh8Y
   hSA1IER3Z+i4nVV1tHTyOByPogP1zNnB3z/vfPkPFuWiKI2CX3cJNgcsf
   5wPDu8dng+83vcTZ1/6MKK4FovkLGaF9FZUhWqVIU+IuO3i3O/+lzbalu
   NkVb1WTSKmpQFLJHKwfqi0zTmvkX9AcatjTK5x8vDc2KpBsJm47cV5+D1
   KpsAJcERnS2VWEVdlDOk7bkguV69O5ppbZEvFrQ+plo0f/O2moc8+FbJa
   w==;
X-CSE-ConnectionGUID: D/astR8wROK8v0MdVvU2VQ==
X-CSE-MsgGUID: hqAYgwd0QkSh3owmCOpEiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54451083"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54451083"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:38 -0700
X-CSE-ConnectionGUID: Tv4MLgJXQSKxDwQ6KgxAVw==
X-CSE-MsgGUID: 9gS/NnHJSZuYQE3tXpf1ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161404885"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.221.121])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:37 -0700
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
Subject: [PATCH v7 09/12] platform/x86/intel/pmt: add register access helpers
Date: Wed,  9 Jul 2025 14:44:55 -0400
Message-ID: <20250709184458.298283-10-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709184458.298283-1-michael.j.ruhl@intel.com>
References: <20250709184458.298283-1-michael.j.ruhl@intel.com>
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

