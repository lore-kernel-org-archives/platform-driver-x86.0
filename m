Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B3776C61
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Jul 2025 21:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751577141; cv=none; b=QAyQjY0vHbjrJVNAtxkTsT97hxCwQuxWJYOEZYIu1wj3Pyx7pzGILtfxZX+SB4vKwwwGtrw/96vQ6irnqdKhUBCGveCT3TnoLhtzUhevKnW6XjKqmrq1dms8iJfQdxvsnzb8M5ogtlmCWAMUuOlQWp4y/IJoYPrJgAmWUPnDfws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751577141; c=relaxed/simple;
	bh=Qi8VA7IyqSTyswM7OG5Q49zNovGlyjja/KwiWAM4/W0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CJmLdYN0x8DJ3OVEAfx/o98/c/hvnM2Wbo5zE8db4IKKbu9OyrpG82YkDPZSy6ONbMmiaYDgiVeEcirgl5N8ZaCxLb2snePy5Al177k4BY1Wp3mu2MK5iMmoMVpW01ELT7fAEy03P/88WQ/btz7M+SLXdsPasAmdkLSt/0OhwIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtJmzjY/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtJmzjY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751577140; x=1783113140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qi8VA7IyqSTyswM7OG5Q49zNovGlyjja/KwiWAM4/W0=;
  b=HtJmzjY/R25bjLkfL1jYraVfGZziTyEej+MlrUCbRqakJuobS++oTZVt
   OxAy9WEp2UF7Io2i9lOcY/hmWhC6AsD5l5e11/RF0TGcMQ2SgWwIAOIIz
   n0RTPEg2skTGcciWgOvFtegZH2JA4JV/Dp1tH3Yl5J2nrbi3vtY2E0S7U
   gKtW6/auAzKVV74pGIK8DF4PxHjeLo+wdvC39c2UfrYQfPDVFcttSTdaU
   D0k/o0/hV9A14YlQug3oIFErPRx3lnj2OSLz8v8Oe+KAmT8Ez9ewPAnAz
   hfMOZFbajrcUflrGiBlkuJAzg0/eSL2VpKRn+LnycdA+AORCJrP+CzAW+
   g==;
X-CSE-ConnectionGUID: EgouJMRmRaeXPG5yaRRkGA==
X-CSE-MsgGUID: BqNTahkPQsigT/05ezfEfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79353006"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="79353006"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:20 -0700
X-CSE-ConnectionGUID: CoI5qBEYT0eTvtpG4Y/SKw==
X-CSE-MsgGUID: j77FCaf/RJ+9CUQ/XJn8Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154240033"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.97])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:18 -0700
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
Subject: [PATCH v6 03/12] platform/x86/intel/pmt: white space cleanup
Date: Thu,  3 Jul 2025 17:11:41 -0400
Message-ID: <20250703211150.135320-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703211150.135320-1-michael.j.ruhl@intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Noticed two white space issues; cleaned them.

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

