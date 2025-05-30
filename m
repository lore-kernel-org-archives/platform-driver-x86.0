Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D831FF5E3
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 May 2025 20:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637261; cv=none; b=AaMhlnjpSY+j0F/sYSGE0P61v0r2MQten8xsiFWvq5H877aV1Rrnwg4L6FNWoF2Op/9pdKVMFT3ymsiBJZXTa8E8q83RtbSq88L8+bI7bjkvkA4Yb/SS/Eyj//aeyg2FnvzX7F9kQ5RAhqCXclfoSGQrmHH/526OgMUX5XALiro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637261; c=relaxed/simple;
	bh=CjOnVCQN5NKVwGN0gIEWebL23xpSyncTNjPSqfj0KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QSuO42SBr9+HKQGKmcpdJVLtvY85CUi3y8WYjE5AhDrHCMG9zCUmsOyURBr98HVV4GQRNoelVjNHJdKVsa+MtWG22819pzkQ6+accpNyiDqyZly2efyoXlDTXgoTkRMk0lx0cwruwgSu7MLZeA3ZiGanHfK1CPOQKbqcidRcp8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRru+6Hy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRru+6Hy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748637260; x=1780173260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CjOnVCQN5NKVwGN0gIEWebL23xpSyncTNjPSqfj0KUQ=;
  b=TRru+6Hy0xCGCKexeVXlKlN7jUQ81TW2TWm5NwiV9VZsrIP1sgFw/v41
   phkzVmxkqgkx8GbTamvj3/ZcIw7wLHfHg7hDbMOZ/WYBX5qSuqO38elec
   rwH3tmZxORNN5nl3McsSOhpSwiq3hhvLnz+F3jLu5Ri/98B/A4dYPL54w
   whM/lxDkTAVFG1sTK/vWXIMfER9svxx2D8N9Z4TS4OHjf0gBk2PFFw2UT
   cZNkiWVCxtq7Om2vmm2JXf3N0KJ+l90+APocFtbGX/FT091sduuBuAcVT
   647/f9xJdKeug16BunXOzXHVtg2DjK8Oqd3/ai/drDhdDB0ttsSud7zWW
   Q==;
X-CSE-ConnectionGUID: 0UHzerkjSk6A9te6Jor2bA==
X-CSE-MsgGUID: 49dUCO7rSiSfqJU4Mbe5Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54405768"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54405768"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:34:20 -0700
X-CSE-ConnectionGUID: a//o/P8wROmodZCoWLYwhg==
X-CSE-MsgGUID: Ma/wn8QnSfWt0RW2TmQcYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="149246641"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.23])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:34:18 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 02/10] platform/x86/intel/pmt: white space cleanup
Date: Fri, 30 May 2025 16:33:39 -0400
Message-ID: <20250530203356.190234-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530203356.190234-1-michael.j.ruhl@intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
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

