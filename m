Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7D0189B8C
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jul 2025 17:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752427806; cv=none; b=a/tqnGHaOAhqd45DVFVaCBaVBnKMbWD5M+fCDJILQZufPPDXZ9Vq0KOzrqE2lSTXAJ81YC52DBWNTbv5rmMvqNVVfKVuotbvwqmLmGapVvQP5BRoqf5Q89H5+jlxWfYcruzpznQCGgb71tpl62I0zMuAXbjQFP6bvAa1P4xP2GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752427806; c=relaxed/simple;
	bh=lFJAoaBsqvLfWqq9QLWuaiPqon8ZGhk3HZHjCdijZ1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pfjvYy9O+ZffnbOWwvw8nr7q4XduwRd+llEFf0Bc4Txu/xymrqNB+R1B6Gv1qtmNvjQxuWKHIbgDP1IZ0BjTqj+jUucIigPIGwfeKVAOh9/Aa7F1YFXeRG3SkLZecmOnlRJvQ63ZExHs224Isz5OTQF4rzVqhM0cyNECDaSLXCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLTrMN0p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLTrMN0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752427805; x=1783963805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lFJAoaBsqvLfWqq9QLWuaiPqon8ZGhk3HZHjCdijZ1Y=;
  b=jLTrMN0pivJcUax3PdMknl5v5tbGQFsX+ax4J6AQrqRu8tNv7ML1fNII
   CdzdBLjEVALyYXFADtqoREaAww7AVFoGrWUwJDFQJ4srzv8z9AcqVNdNT
   +ZwxRvhwfc67nsLBbzKqFU9LhHg4MZZJ9rnthMei15ThRvW1ghYLzz4R/
   y7OHxqKzcI25bZ5e7c+Tiv6ljvIuHlSWaLcF2EO5xEynLvGC3zD+HH2Kz
   FD4UsGOp0wTaFjziC3bmoALOQJon3fay6jQKNHEHLwupJSZSx4+UUxQh+
   UyEdaxQxEmz61qqH5AK1UW4PqU/ugKUub05ZsqnuWnyw4a8JnmgTwjOku
   w==;
X-CSE-ConnectionGUID: S8HZ1pjrSVuOQCBABPPbKA==
X-CSE-MsgGUID: TGjPq85oTPGOyo1hvGTQoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65334132"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="65334132"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:05 -0700
X-CSE-ConnectionGUID: E8bk0nnISN+gVflGnuVVyA==
X-CSE-MsgGUID: 1Zxdns9KRxOK71gL3XccCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="161069290"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.19])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:03 -0700
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
Subject: [PATCH v8 05/13] platform/x86/intel/pmt: mutex clean up
Date: Sun, 13 Jul 2025 13:29:35 -0400
Message-ID: <20250713172943.7335-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250713172943.7335-1-michael.j.ruhl@intel.com>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The header file for mutex usage and mutex_destroy() cleanup code is
absent from the crashlog.c module.

Add the header file and mutex_destroy().

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index d40c8e212733..6e32fc1f8f1d 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -12,6 +12,7 @@
 #include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -262,8 +263,12 @@ static void pmt_crashlog_remove(struct auxiliary_device *auxdev)
 	struct pmt_crashlog_priv *priv = auxiliary_get_drvdata(auxdev);
 	int i;
 
-	for (i = 0; i < priv->num_entries; i++)
-		intel_pmt_dev_destroy(&priv->entry[i].entry, &pmt_crashlog_ns);
+	for (i = 0; i < priv->num_entries; i++) {
+		struct crashlog_entry *crashlog = &priv->entry[i];
+
+		intel_pmt_dev_destroy(&crashlog->entry, &pmt_crashlog_ns);
+		mutex_destroy(&crashlog->control_mutex);
+	}
 }
 
 static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
-- 
2.50.0

