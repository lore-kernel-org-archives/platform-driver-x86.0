Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37FD572673
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 15:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968883; cv=none; b=SQOrTzZMjNJS/oSWrtd0GtYQbCDlxycGBT4JBJc4tFr7OT6qKuGMBpSSNPPumgFNp+gqO0QJZxWAB+yrCeuByul7s4Oi0lCEyGnQhZmBvouu+UEEyiLAot+nO0Tcrxd7nykIolohYgBpSY6W74pZn9YgYg6Ux/uEoMDvzjkSS/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968883; c=relaxed/simple;
	bh=TX+/5Wo4wtf6WTAbSoVWd2ZJerpeXwwrH+ylaorbFJk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cnxpi1f05+QEpaFvH0GJg5nNOrwOEiPfJz8+9fWSHZ0MpEIC6eHoyO6hGZRUe5DIoW63xcCR+UlXDvR3CE9pH2+FhX+WnM2qgMILU1yZq5ZrdU+Kge5WhxFekLqedZ2e5M+BziKQb35g9Ugt15t8s8xd3v0BZX+fwCQwcEu4lxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9jR0V+x; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9jR0V+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788968882; x=1820504882;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TX+/5Wo4wtf6WTAbSoVWd2ZJerpeXwwrH+ylaorbFJk=;
  b=k9jR0V+xZ9XbQdeZGpll0x0Ho/eox9WagMBAYGMaxwmHvorJ7zMV7AIk
   +JhP4EdumX8cjO2oxXY0zd6PrUmANNX/4FQmYIw0HwWBpadTwVTXVbJ4e
   lGqaIFglO2Vqu2hCwOxSq6re5iKOYr4ugEFoprIK7gIZamy7G2w2kcqNs
   RC374pZ2Y298ky5wI+LxUO3sIpRVrc5ivw7TPdC1SqMVPlcsGsPRNI/Sy
   xaD+2rBNsuf9VqTLcLenmzV8rY8/8bON0zeFhXyC0J2yLKmeGWzpBWK5W
   yfdCqYjj9kgrR1i5Hpcy4xLTtKxtdIAnsqLijnwn6O54tW0QNJcm2d8sE
   w==;
X-CSE-ConnectionGUID: xyhnPQRzTMe9HqofY7odhw==
X-CSE-MsgGUID: 2qwKpotHQDGnNmmE8hwg1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93091813"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="93091813"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:57 -0700
X-CSE-ConnectionGUID: 7X84+C2iTPKpGFL8M/Q3xw==
X-CSE-MsgGUID: 1ulYngyuQmSmzoomNdvPNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="268102504"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:57 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com,
	anoop.c.vijay@intel.com,
	badal.nilawar@intel.com,
	matthew.d.roper@intel.com,
	james.ausmus@intel.com,
	karthik.poosa@intel.com
Subject: [PATCH v7 05/20] platform/x86/intel/pmt: Do not remap when using callbacks
Date: Wed,  9 Sep 2026 08:47:44 -0700
Message-ID: <20260909154739.1515514-27-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A callback indicates that the parent driver is responsible for accessing
the data area.  Creating a PMT memory remap is redundant.

If a read_telem callback has been provided, do not create a remap.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c | 21 +++++++++++++--------
 drivers/platform/x86/intel/pmt/class.h |  2 +-
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 402d51df834a..1c7a372b4fc4 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -12,6 +12,7 @@
 #include <linux/log2.h>
 #include <linux/intel_vsec.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/ioport.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mm.h>
@@ -373,7 +374,6 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 				  struct device *parent)
 {
 	struct intel_vsec_device *ivdev = dev_to_ivdev(parent);
-	struct resource res = {0};
 	struct device *dev;
 	int ret;
 
@@ -403,14 +403,19 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 	if (!entry->size)
 		return 0;
 
-	res.start = entry->base_addr;
-	res.end = res.start + entry->size - 1;
-	res.flags = IORESOURCE_MEM;
+	/*
+	 * The read_telem callback is responsible for this mapping, and may have
+	 * different requirements for use. If the callback is present do not
+	 * create the map.
+	 */
+	if (!(entry->cb && entry->cb->read_telem)) {
+		struct resource res = DEFINE_RES_MEM(entry->base_addr, entry->size);
 
-	entry->base = devm_ioremap_resource(dev, &res);
-	if (IS_ERR(entry->base)) {
-		ret = PTR_ERR(entry->base);
-		goto fail_ioremap;
+		entry->base = devm_ioremap_resource(dev, &res);
+		if (IS_ERR(entry->base)) {
+			ret = PTR_ERR(entry->base);
+			goto fail_ioremap;
+		}
 	}
 
 	sysfs_bin_attr_init(&entry->pmt_bin_attr);
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index 258cb460e61c..aeb04afb67cf 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -48,7 +48,7 @@ struct intel_pmt_entry {
 	const struct attribute_group *attr_grp;
 	struct kobject		*kobj;
 	void __iomem		*disc_table;
-	void __iomem		*base;
+	void __iomem		*base;  /* unused if cb->read_telem is in use */
 	struct pmt_callbacks	*cb;
 	unsigned long		base_addr;
 	size_t			size;
-- 
2.43.0

