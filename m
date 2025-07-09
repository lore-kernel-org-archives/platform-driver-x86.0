Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D134238C1F
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Jul 2025 18:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086726; cv=none; b=TfRPH6pol6VLanfvHRhhODYgHXmArTk3/WlMInEe1UId7w24PKJ2Vedt2OsNCm3SgRXmVE1Ox5MZZfRtifYubZbZYmxn7+PLq7Dc0K5fRHpoHb871Re1E/VEKQ7HYixoHDJE8R1y3xjaojA9fuz/CZLO6IiQRFJr767HtRLVJPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086726; c=relaxed/simple;
	bh=lFJAoaBsqvLfWqq9QLWuaiPqon8ZGhk3HZHjCdijZ1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fXAudST+Hd/EFIDoOyJ0dcDrgp4AecE5JubpunP5wpLaXg5bOWAhNqAz8TyHQbLiqmyCBP0KrwLmzjUehLhC3G2woRViis5ezFuQNwCDfPDNIdazF+s26PdXgmoH4R5HzLfFswQZU6jsmlUte3CcamI31+D9s5wbtNOsWyLqZQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9USgzp+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9USgzp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752086725; x=1783622725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lFJAoaBsqvLfWqq9QLWuaiPqon8ZGhk3HZHjCdijZ1Y=;
  b=D9USgzp+ot7ELxCq3iIOGLZtZ5AF5wTe1ghqHiUWkUoeiVDTGoPaEQik
   HZsw7ysj0o6XaLyrrzZimW/HBlRuSyJrPwFbcIc6H7oeDTcMi0D695pAH
   pn5OCkmovGvF3ycIHM8MYMEfez24Kr0WjNAsfYw9ePxTI9L7sj08rKAjX
   9MTOLmibeQwfL758eAiXZ7/mmt+u6U8Wk6Cuzi5wvKqJMD2BGVpWI8JFz
   aMjweAuj6LJGiP9LShtgTRFgVU5UkGfezfq2T9cFYr64y6vrK0wWRUuZa
   pZtAx47Iw3YUdsnuHffQQDahYZfn9n3+ZpUA5jWAAR8YonDw9SZB611nq
   Q==;
X-CSE-ConnectionGUID: Q3AabKq7QMq2iK8Ed6Cgkw==
X-CSE-MsgGUID: Fz6Dor7DR4WrayZv4WGdJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54451042"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54451042"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:25 -0700
X-CSE-ConnectionGUID: fTgrnX0oS7aqQLmFqNsdnA==
X-CSE-MsgGUID: W2shbcf+TWG0wpJ+bUXFoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161404861"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.221.121])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:24 -0700
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
Subject: [PATCH v7 04/12] platform/x86/intel/pmt: mutex clean up
Date: Wed,  9 Jul 2025 14:44:50 -0400
Message-ID: <20250709184458.298283-5-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709184458.298283-1-michael.j.ruhl@intel.com>
References: <20250709184458.298283-1-michael.j.ruhl@intel.com>
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

