Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2EE27AC2F
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 May 2025 20:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637498; cv=none; b=j89Q3HJPYS4Z/Pe1inVeU2DHu5FCHg2/9yRgTW5vG2RxnmAHAnMDYanCHVKdSTMRXuiCzDXyV5+RxHw8rkT9Ie/18nTSwlm6J/eZdIGl76NueK/l6CFm1Rja59pvMxLGhBqyUayYFrb/jfB5EOfZmyPGrUuzkRLzwYpUNAofjfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637498; c=relaxed/simple;
	bh=CjOnVCQN5NKVwGN0gIEWebL23xpSyncTNjPSqfj0KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9C8GFN3Hiqf8iCdOECe1iYLhgmsgNpEOr+zqIXf7YgpeOYoMEWVac8984kn3V1ri3+w3k5fU5EXkSCfGt93vtPQHRqeWvxqLdheSPu57l8GC+4EChhWXxK9PEIlmjVWQFQHNtGGyXg6A2BNBPgWcGjHb0Y2BbUJZFtszLSck08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8tGx3ko; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8tGx3ko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748637496; x=1780173496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CjOnVCQN5NKVwGN0gIEWebL23xpSyncTNjPSqfj0KUQ=;
  b=L8tGx3koACuu22GjmNWyuBVGCrPRT5833Acjwgledp0UacH35sF6jPRa
   2n5LVElCmyLkgh6v53KDuWt7svifhGPBdoGu+tY+cN1321iQBuwS81MZy
   X0DTxY14F3220SptRdLf4yMmNQ/sOQ3MjEkUsEB3sdwLOGqtTzrWEuWOE
   WvPH1rOie9zmDJJJaPr9j8bMkJSrcTWxYeV2NCZK7RziFgigRNf1YRfUG
   XczSLq9ts7nPTMUUx3QOYp/KK9YXTladzlAHKv5+9eGIsiwT0YijVxVPM
   aODpPT5joC2k/QKNm6Qc4Pfkdw2hLDjAnf+160tjRUzvAW8CVYMkn4pGt
   g==;
X-CSE-ConnectionGUID: Z+nMM9fERYWEHSxrD5P68w==
X-CSE-MsgGUID: ooQ6CWelR96cqAYDBeUsWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54406000"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54406000"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:38:16 -0700
X-CSE-ConnectionGUID: DIOCCvLpRheJc6m3u0zSkg==
X-CSE-MsgGUID: CqCFVJFCTxW9IganhPxPow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="143824206"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.23])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:38:15 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2 2/8] platform/x86/intel/pmt: white space cleanup
Date: Fri, 30 May 2025 16:37:51 -0400
Message-ID: <20250530203757.190853-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530203757.190853-1-michael.j.ruhl@intel.com>
References: <20250530203757.190853-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Noticed two white space issues; cleaned them.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 6a9eb3c4b313..d40c8e212733 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -143,7 +143,7 @@ enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 
 static ssize_t
 enable_store(struct device *dev, struct device_attribute *attr,
-	    const char *buf, size_t count)
+	     const char *buf, size_t count)
 {
 	struct crashlog_entry *entry;
 	bool enabled;
@@ -177,7 +177,7 @@ trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 
 static ssize_t
 trigger_store(struct device *dev, struct device_attribute *attr,
-	    const char *buf, size_t count)
+	      const char *buf, size_t count)
 {
 	struct crashlog_entry *entry;
 	bool trigger;
-- 
2.49.0

