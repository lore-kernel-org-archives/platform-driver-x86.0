Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3629915990C
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 May 2025 20:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637270; cv=none; b=onmywz9rBmpySqlLhV/4vNf/Zl/mK6WtiTqyaOHGZyX96saow/5LybhvAY8r1mKhKU75jFIyMSHkfb7UcsbGyi1sEPkoF1fbV0oo6czcAOov6bZIo+Dhpfz1rxxj5sSwB7+nYkaT8F00Q0i7jtGwKio5atTgaM/NBdq7CE/iReI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637270; c=relaxed/simple;
	bh=9cDQbkxmkOwg5ni8Ci2XPkw2I0HGftzC089pq0QmGlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNrfd97W5trtbCM/eKZPm7UIsDt1+6BMCG0xTK+DAq3+8eWwqRAyYYwu79luFkMVB/aVF9p+lAVauxebgQgMi8ykdKc1Q6yQxikryTZ8hXjzvsluQJ9TlIouQpM2DNYVWt99WbpUzFqS7mBfujNejJ9dgs/wQcMEKZTC+5WCxIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6JJYZ57; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6JJYZ57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748637270; x=1780173270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9cDQbkxmkOwg5ni8Ci2XPkw2I0HGftzC089pq0QmGlA=;
  b=X6JJYZ5794LZ2Hucl/IqexPZT8lzHfZcOwjZBsnrp+JmXMtFtxmQEG4W
   lpZTDSzCRPyYONoHgRoMkfQlP9/ck7glLReA6C4KcvKVKE0ys2Tg5Jw0v
   1+R2ljevdCFlwpnlYjFdzzCkK3EaffaUUbdc1pR/OaPt5QxIh445N79PJ
   Is9V0VITViwrv1QA6p+fYCxYC0pwPxytu/Ril5l+IQDYnEHAm6W+Erh4z
   cYxmX/MB9QULg5LIne0y2U/J+yGnyDY9RuPB20kuqsgp4Fy+VNK1fP41Z
   zLLCfJRz8jYiFRqXeXM3YRb/J0LjZ1v+Jw59V2or0N0Ia5d4J7zL5zTfX
   A==;
X-CSE-ConnectionGUID: lb5aCJcxTAi5iMQAPByuuw==
X-CSE-MsgGUID: Sz1+3y9oQZmVKzRaftMwjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54405778"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54405778"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:34:30 -0700
X-CSE-ConnectionGUID: a/rtaXybSZm9xHxtNeE+cg==
X-CSE-MsgGUID: Gf35lT07QbGYe+N5AhPcPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="149246677"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.23])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:34:28 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 05/10] platform/x86/intel/pmt: crashlog binary file endpoint
Date: Fri, 30 May 2025 16:33:42 -0400
Message-ID: <20250530203356.190234-5-michael.j.ruhl@intel.com>
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

Usage of the intel_pmt_read() for binary sysfs, requires an
allocated endpoint struct. The crashlog driver does not
allocate the endpoint.

Without the ep, the crashlog usage causes the following NULL
pointer exception:

BUG: kernel NULL pointer dereference, address: 0000000000000000
Oops: Oops: 0000 [#1] SMP NOPTI
RIP: 0010:intel_pmt_read+0x3b/0x70 [pmt_class]
Code:
Call Trace:
 <TASK>
 ? sysfs_kf_bin_read+0xc0/0xe0
 kernfs_fop_read_iter+0xac/0x1a0
 vfs_read+0x26d/0x350
 ksys_read+0x6b/0xe0
 __x64_sys_read+0x1d/0x30
 x64_sys_call+0x1bc8/0x1d70
 do_syscall_64+0x6d/0x110

Add the endpoint information to the crashlog driver to avoid
the NULL pointer exception.

Fixes: 416eeb2e1fc7 ("platform/x86/intel/pmt: telemetry: Export API to read telemetry")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index c6d8a7a61d39..94858bfb52f8 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -250,6 +250,7 @@ static struct intel_pmt_namespace pmt_crashlog_ns = {
 	.xa = &crashlog_array,
 	.attr_grp = &pmt_crashlog_group,
 	.pmt_header_decode = pmt_crashlog_header_decode,
+	.pmt_add_endpoint = intel_pmt_add_endpoint,
 };
 
 /*
@@ -260,8 +261,12 @@ static void pmt_crashlog_remove(struct auxiliary_device *auxdev)
 	struct pmt_crashlog_priv *priv = auxiliary_get_drvdata(auxdev);
 	int i;
 
-	for (i = 0; i < priv->num_entries; i++)
-		intel_pmt_dev_destroy(&priv->entry[i].entry, &pmt_crashlog_ns);
+	for (i = 0; i < priv->num_entries; i++) {
+		struct intel_pmt_entry *entry = &priv->entry[i].entry;
+
+		intel_pmt_release_endpoint(entry->ep);
+		intel_pmt_dev_destroy(entry, &pmt_crashlog_ns);
+	}
 }
 
 static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
-- 
2.49.0

