Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0BA511183
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Sep 2026 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466238; cv=none; b=uCsYC5w653hnzokedh+SY0pKLrMlZBexNF5MEejG7vxUb4Jnay4BU3CDLujdW+8mogA7uHrqMQ05CTLn9fYe0tFHY/rUcGIDYW3RD2NgdXh/R84cQ7EA7pA/h/lbpBLfwfmuND4DBXa/28RS7IbWv3w3tIspGht9mWiKFsfx0TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466238; c=relaxed/simple;
	bh=CUpqq6qRObGcYk3wxitbh9xZgftrzhSFCXbeLoQsGFk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZAkhxSzYpPgPmanv4wRUtoFfGVrpxmviTOk/OA8ZJhgz0qWTJtTzNK7HyKL3wW6xydBcCWaAFOP9SEG4tVNkRB7ivUxsamlJk9MPHMyLcn9afiDxcyHMdCAak/k4C6BH3OmWAhMJujojEjb9C4rfmNJpxl2PCEX0ezR1Na0RD1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9HOs8at; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9HOs8at"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788466218; x=1820002218;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=CUpqq6qRObGcYk3wxitbh9xZgftrzhSFCXbeLoQsGFk=;
  b=K9HOs8atDqwGxAsHIr3DTrMIwbQYvSVX6yzFWUVsCtjzLEGCj5CG3u0l
   30dYMN8beh144S+Cye4PyEumEQ6KCJqCVsQw9W1JaYNy0tqRbCSh8iuMS
   H0inyqxTZpp0gOzc2wgPzfRZ8NoWUmxy6xDI8DtrCOopGu4rMx/zB92LP
   /QdjrUdt/RT2vFRewZDSIQkdeMZ+7ojImhGneRFtIzoebVRcDOg6yTfir
   cHQtL1ZkJ0yifBBPr9gR8qdEWXSkB47UwZbzUtVIFG8Lt+4g3OVe0Figt
   Mo52lWtWr99UIRpKQriofJxaZkwwPd7u170snQG9nf3Q3Uv7uCEcZFqkz
   g==;
X-CSE-ConnectionGUID: JaqgFtFNSd67ZBwYd47BDA==
X-CSE-MsgGUID: Lm+ef75AQNWbrwGh8tmEDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88994549"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88994549"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:16 -0700
X-CSE-ConnectionGUID: vLh1nIglQGGR1uemxeQ2ng==
X-CSE-MsgGUID: /T0vHa30QAyHKfqI+1J8gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273348020"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:15 -0700
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
Subject: [PATCH v5 01/18] platform/x86/intel/pmt: complete pcidev to device update
Date: Thu,  3 Sep 2026 13:10:03 -0700
Message-ID: <20260903201002.1064889-21-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The update that moved struct pci_dev usage to struct device is
incomplete. Only telemetry endpoints are covered.

Other PMT features (crashlog) are now blocked from using the callback
mechanism.

Change struct intel_pmt_entry pci_dev member to device.

Update callback usage to use the intel_pmt_entry rather than the
telemetry endpoint.

Fixes: 353042d54d82 ("platform/x86/intel/vsec: Switch exported helpers from pci_dev to device")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c     | 5 ++---
 drivers/platform/x86/intel/pmt/class.h     | 3 +--
 drivers/platform/x86/intel/pmt/discovery.c | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index d0ab8e33c62a..402d51df834a 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -100,7 +100,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
 	if (count > entry->size - off)
 		count = entry->size - off;
 
-	count = pmt_telem_read_mmio(entry->ep->dev, entry->cb, entry->header.guid, buf,
+	count = pmt_telem_read_mmio(entry->dev, entry->cb, entry->header.guid, buf,
 				    entry->base, off, count);
 
 	return count;
@@ -286,8 +286,6 @@ static int pmt_resolve_access_pci(struct intel_pmt_entry *entry,
 		return -EINVAL;
 	}
 
-	entry->pcidev = pci_dev;
-
 	return 0;
 }
 
@@ -365,6 +363,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
 	entry->guid = header->guid;
 	entry->size = header->size;
 	entry->cb = ivdev->priv_data;
+	entry->dev = ivdev->dev;
 
 	return 0;
 }
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index a0ece4fc3837..258cb460e61c 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -20,7 +20,6 @@
 #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
 
 struct device;
-struct pci_dev;
 extern struct class intel_pmt_class;
 
 struct telem_endpoint {
@@ -42,7 +41,7 @@ struct intel_pmt_header {
 
 struct intel_pmt_entry {
 	struct telem_endpoint	*ep;
-	struct pci_dev		*pcidev;
+	struct device		*dev;
 	struct intel_pmt_header	header;
 	u32			disc_header[PMT_DISC_DWORDS];
 	struct bin_attribute	pmt_bin_attr;
diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/x86/intel/pmt/discovery.c
index c482368bfaae..f4203d240f54 100644
--- a/drivers/platform/x86/intel/pmt/discovery.c
+++ b/drivers/platform/x86/intel/pmt/discovery.c
@@ -609,7 +609,7 @@ void intel_pmt_get_features(struct intel_pmt_entry *entry)
 
 	mutex_lock(&feature_list_lock);
 	list_for_each_entry(feature, &pmt_feature_list, list) {
-		if (feature->priv->parent != entry->ep->dev)
+		if (feature->priv->parent != entry->dev)
 			continue;
 
 		pmt_get_features(entry, feature);
-- 
2.43.0

