Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D278179A3
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 18:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149135; cv=none; b=IYDwdgkP9KxJ9+VGg76iazlV0nnk/gYDFJ5Y+tZskdvivkU6U+sQDDLnZlTpCO4cORP3lokSx3+f0zcrHXovqqeG7OnzeB2fPAz7cmAGsLULDJa13RwDIOmo7u79oq1YcY1OxzNQYYTzuAlJBsEUijiiEjFnWWahUjrnSaWKts4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149135; c=relaxed/simple;
	bh=YWvzcOB7kd04A+fImKKohiAcHLBXiNBjJexU7vJ5ZHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SClUp6kbFy4mHz7KGfbzxdf7R+DKfQ+JA41NiJRhNiCaAEanDgwPQ4Cehiwj82h65xYvg77gWZpG0PDKWPpHi21wpmPfrVWZWSTuqY3Ucx+pvU4cWVROteUYPYYXMi/Mr+U3YBEOQI7FIO/DHfR5yzOtNXH+owl7WmqVKwgDgKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbrBjGbk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbrBjGbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749149134; x=1780685134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YWvzcOB7kd04A+fImKKohiAcHLBXiNBjJexU7vJ5ZHg=;
  b=NbrBjGbkGcDFJiRl/IdlrqA3mXYvvrY4ZCb9hbw0eYEYn1AWOzugA/8z
   tKKRZdQiAhfnoTK8AKmaC7bbnUUYPx0O3zoTicCMf/eoSWGm6cSQL18Ty
   6ZFJ6GvsskGxDqvxiDDLSAQi2yEdlSLyhft7QhTtPwz9FTpEEiy2suYKt
   +gTodoTLc7trTU2hAerjyW7YMZG3iqyovJIWe3uybSEyBpp4hKyGvrwNN
   wBZnRt95RN5Y5EqTDgD2+p9YAb++cMracArOZS10ZMGbrmTpiEH46HID5
   kVpuRbbAnBHYJ89rhff+09FSKpVa8J9L7ASWyybOCNc0d454F6VwndXhS
   A==;
X-CSE-ConnectionGUID: oBRxiXL0R5m8/6XqG/sG1Q==
X-CSE-MsgGUID: WhmFlUkZSG2g2178jQK9jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38916647"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="38916647"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:45:34 -0700
X-CSE-ConnectionGUID: qhFxqYleQFyI7BZOxloMNA==
X-CSE-MsgGUID: agU0muIHRQK0RWVRGWDSWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="182782505"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.222.42])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:45:32 -0700
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
Subject: [PATCH v3 07/11] platform/x86/intel/pmt: correct types
Date: Thu,  5 Jun 2025 14:44:40 -0400
Message-ID: <20250605184444.515556-8-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605184444.515556-1-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of auto variables do not match the return types of some of
the functions.

Update the mismatched types to match.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index aa3f57fbe018..a51923d0be72 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -136,7 +136,7 @@ static ssize_t
 enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
-	int enabled = !pmt_crashlog_disabled(entry);
+	bool enabled = !pmt_crashlog_disabled(entry);
 
 	return sprintf(buf, "%d\n", enabled);
 }
@@ -167,7 +167,7 @@ static ssize_t
 trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct intel_pmt_entry *entry;
-	int trigger;
+	bool trigger;
 
 	entry = dev_get_drvdata(dev);
 	trigger = pmt_crashlog_complete(entry);
-- 
2.49.0

