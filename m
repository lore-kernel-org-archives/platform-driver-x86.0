Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1584A2049
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 19:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290873; cv=none; b=b8FaUXjlUFgg8JYg5HRtv7jF2NKMRqjFV4zsuEKv9ThwMOdq/yXWn2AvXzuSL4jP0wsr7FmLkSKfePowS5JxkTnd7sdKsFoxsHJN3bbkjg0i1pCCgzXhi8Y4TN6BrOjNkM6j+sowr4VjaolUp/RA2hwoWpws/TV3KWcFkm3YyNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290873; c=relaxed/simple;
	bh=52g/ZDsFUNzHoYcw9pcztMVXQJ9uCRcM5TpMwG4krec=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2By3uUMxpnhZdlqF97bICWgayDaMNwwkgDpLLeRzc4//w/Xj4yJRulsG2Otj7Cqf9r/olvX7VPmd4bW0GjDnG/tU1BnDJwgIvD0DxCakLHwjJSKaDE9vi7bFtPDVuycB91l+2E9uq0WvA6UUQR7HRmurAjjWYq0K5Y7Xl2xy18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLKnWP6A; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLKnWP6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788290871; x=1819826871;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=52g/ZDsFUNzHoYcw9pcztMVXQJ9uCRcM5TpMwG4krec=;
  b=SLKnWP6AsZHynjU5R6BXMZr47FcuxHNWaXCWolwEZT3fOfNfJQ2KjgVw
   jGz8E4azVHKaklmNVUoai75shemQoP6fyQCkTg3IIkakYBE9Lzh/BOTy5
   ttbj+h4GyGpdwWURbzyk/LJsIn7BzItaRRjicX/KF+OZ6mG0sphxGqkgl
   Ch3Y3AMu6pGwQKHzjp1oiEa7BjSEEY6hUu1I1jHQl4M+vDcTxkcE1K63B
   0jT+kS1Bg38cVf8vm3aL3TuxAWAuAxRt4kCbEeTNyI+61+tJ6kpEtZR2s
   aybezEL68gnVQSv+d15NJI4Q46rDuiR8wmw/swj3cv/K4eGTTZSrTIQYp
   g==;
X-CSE-ConnectionGUID: dD0/NsmMR6+OHc2WAD4lfw==
X-CSE-MsgGUID: HWBm+MjEQ+SycvcH+ebBCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762450"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88762450"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:50 -0700
X-CSE-ConnectionGUID: xwALTJKpQWuGsnBf8WmpZQ==
X-CSE-MsgGUID: aUaqGuAiQwSOkjoQ5tROfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="269776706"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:50 -0700
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
Subject: [PATCH v4 01/18] platform/x86/intel/pmt: complete pcidev to device update
Date: Tue,  1 Sep 2026 12:27:36 -0700
Message-ID: <20260901192736.626777-21-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192736.626777-20-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The update that moved struct pci_dev usage to struct device
is incomplete. Only telemetry endpoints are covered.

Other PMT features (crashlog) are now blocked from using
the callback mechanism.

Change struct intel_pmt_entry pci_dev member to device.

Update callback usage to use the intel_pmt_entry rather than
the telemetry endpoint.

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

