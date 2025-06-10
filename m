Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47E4269CED
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 21:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589979; cv=none; b=XETCMKKxn4ymadW08GlMMHrKE8FvbarjkWbHtRDjkKVSdXblP6M6+QXnpAUU4zftYwLgUFMuUk0xW3L2VTm4RXKJX826iAomLQb08RfyDd/td8MRyIALKq5sk65RsQhuuHIbu0mlyfeMyAV+vbceMo2jpQd5T42sR6ezra/jElY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589979; c=relaxed/simple;
	bh=pRTnx9DVpZN74EkVWOJIJj1DjiI8XPTwq7f4OXbtKv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Apy9/josYz3jsU/OHL3py2qCG5r6xHmSWpq8zAhUKXUqVJNmtk1mD2VGAvvWOqhdpbVPBxJ1dKeOilENhp1GODzVuIn0Xo9u+k9K/AiG7ThXQm13K3u4RXwV24ewd5CP5ZKQTA7O77ni+oHrG+YBBcDqBftOAiYtnzXgb6O2rH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnFJa3i+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnFJa3i+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749589978; x=1781125978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pRTnx9DVpZN74EkVWOJIJj1DjiI8XPTwq7f4OXbtKv0=;
  b=FnFJa3i+JPDyPLIitDGeicw7sKQ3jiGVdXgWmQccIkFxhcSoQCBWJ9pJ
   tkEwxjVR+HT1KpctMKXCjWtNg3qhyXLHrRwk56337Fm8gVdG2ekrv6qE4
   d2qGS2y54XK33pYUsi+z7lNZDidhGfzs+hJBmZvfVb1ynaJu3GIrrrRYG
   8GjHciqn4AeKAyjYkKxF5NjmvYYsmuTRV3k3v7GUcJK8/9Cgjpk/vDLp8
   31f5A6fQarg8ZkUszt/qfExOTiRWzmVlYomjzF5AIqjUltv3sdFszuk11
   vYhGs5QhgWoql0CTUY5LnrU5ZAv6WtDs4m4zkcwpNtQerGBpDOz6aeuNh
   A==;
X-CSE-ConnectionGUID: 5m0Hu+qYTFiZwgDqiJ5bxA==
X-CSE-MsgGUID: BrNOzsQSSHynUcbT22DFNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51816951"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51816951"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:12:57 -0700
X-CSE-ConnectionGUID: Y9b15Iy2QneDbDVfuYLNQQ==
X-CSE-MsgGUID: 484S0EuKS5OHQLBYgkyCkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="146939844"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:12:55 -0700
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
Subject: [PATCH v4 07/10] platform/x86/intel/pmt: decouple sysfs and namespace
Date: Tue, 10 Jun 2025 17:12:22 -0400
Message-ID: <20250610211225.1085901-8-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The PMT namespace includes the crashlog sysfs attribute information.
Other crashlog version/types may need different sysfs attributes.
Coupling the attributes with the namespace blocks this usage.

Decouple sysfs attributes from the name space and add them to the
specific entry.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c    | 12 ++++++------
 drivers/platform/x86/intel/pmt/class.h    |  2 +-
 drivers/platform/x86/intel/pmt/crashlog.c |  3 ++-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index d046e8752173..3b6bf2f14dcb 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -285,8 +285,8 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 
 	entry->kobj = &dev->kobj;
 
-	if (ns->attr_grp) {
-		ret = sysfs_create_group(entry->kobj, ns->attr_grp);
+	if (entry->attr_grp) {
+		ret = sysfs_create_group(entry->kobj, entry->attr_grp);
 		if (ret)
 			goto fail_sysfs_create_group;
 	}
@@ -327,8 +327,8 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 fail_add_endpoint:
 	sysfs_remove_bin_file(entry->kobj, &entry->pmt_bin_attr);
 fail_ioremap:
-	if (ns->attr_grp)
-		sysfs_remove_group(entry->kobj, ns->attr_grp);
+	if (entry->attr_grp)
+		sysfs_remove_group(entry->kobj, entry->attr_grp);
 fail_sysfs_create_group:
 	device_unregister(dev);
 fail_dev_create:
@@ -370,8 +370,8 @@ void intel_pmt_dev_destroy(struct intel_pmt_entry *entry,
 	if (entry->size)
 		sysfs_remove_bin_file(entry->kobj, &entry->pmt_bin_attr);
 
-	if (ns->attr_grp)
-		sysfs_remove_group(entry->kobj, ns->attr_grp);
+	if (entry->attr_grp)
+		sysfs_remove_group(entry->kobj, entry->attr_grp);
 
 	device_unregister(dev);
 	xa_erase(ns->xa, entry->devid);
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index f6ce80c4e051..d5d86b8a2d15 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -42,6 +42,7 @@ struct intel_pmt_entry {
 	struct pci_dev		*pcidev;
 	struct intel_pmt_header	header;
 	struct bin_attribute	pmt_bin_attr;
+	const struct attribute_group *attr_grp;
 	struct kobject		*kobj;
 	void __iomem		*disc_table;
 	void __iomem		*base;
@@ -55,7 +56,6 @@ struct intel_pmt_entry {
 struct intel_pmt_namespace {
 	const char *name;
 	struct xarray *xa;
-	const struct attribute_group *attr_grp;
 	int (*pmt_header_decode)(struct intel_pmt_entry *entry,
 				 struct device *dev);
 	int (*pmt_add_endpoint)(struct intel_vsec_device *ivdev,
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index ddb05d069fc6..99f0e85f2de6 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -242,6 +242,8 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
 
+	entry->attr_grp = &pmt_crashlog_group;
+
 	return 0;
 }
 
@@ -249,7 +251,6 @@ static DEFINE_XARRAY_ALLOC(crashlog_array);
 static struct intel_pmt_namespace pmt_crashlog_ns = {
 	.name = "crashlog",
 	.xa = &crashlog_array,
-	.attr_grp = &pmt_crashlog_group,
 	.pmt_header_decode = pmt_crashlog_header_decode,
 };
 
-- 
2.49.0

