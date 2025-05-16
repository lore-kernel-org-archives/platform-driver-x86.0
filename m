Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91621A704B
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 May 2025 15:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407874; cv=none; b=ByWWhDYPaMjv92Q3HDxQgv0nMilP00vXQsjU5TSM93e9lqovH4uHr/SssI2n9G+Z+5xR01LykeT4EOQYqUw9U3WnWillAmEQbR+4KYxqCyJHaJyMQqJ8E3gIJCEfANn5rcj62zbIJphCf+UXi/botSbsp8cqpD5KlenOC6Pd308=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407874; c=relaxed/simple;
	bh=MQKaS/dgl3tQqavcJXqjLuGhrtMoOWtTBdTaH71+mVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YygLufllTObdMOxdq5ajeUEgw9rbhy209g4zU1jFnf571TyF1dNDnYCr9iyNsh+siZnAXQEBfG2nqKq9WwjyO8/nG5Tmc0P1Pk1B8BBKxcmFon5a5Urre9acHzoFezJNfZiiEPYN+Cpq0VZpyHuOlWOtdNJgJvIsyQu4VAChT5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fv83RUTh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fv83RUTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747407873; x=1778943873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MQKaS/dgl3tQqavcJXqjLuGhrtMoOWtTBdTaH71+mVs=;
  b=Fv83RUThyJxPN0CFMoaadsShiTopKfuhHyiOkJeuqtf75ZeYldmSenQW
   IcGhMsCYyp+HAv9EhYOymERpu12Uu0sGM/jmfTlOfmqwRlf84VoHaTeof
   jDDKYMPC7jwTR76/AwNP2OpB8sS4nFsx237gdlNYm4IaZYPZu7ExBpraZ
   7vPReOuKyz0jaw1BCUQYaZ/9ZXikUlKEYbmVXf3LPmr68mmAroyFhpgtW
   SB2WF0pYVfixRK6GqArN8LBy4SsO1BJpnfdIk09+8DDKVWJrSSDHNIDpr
   CUd/+6mJ/hJfMjEZXn7k03cHgTDpsJQQDa+kE1+5nrcitySjZe2UiG9se
   g==;
X-CSE-ConnectionGUID: i33Ko3GGTsSD4rY1Am2U+g==
X-CSE-MsgGUID: fiOMoSFqTiCcFBPl5zSDJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="59612942"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="59612942"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:04:29 -0700
X-CSE-ConnectionGUID: 6QBpiyI8R8GTUm/ZgisDWw==
X-CSE-MsgGUID: q6K7GKGTRRSxim9XDzzQzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="139202931"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.225])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:04:29 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 3/4] platform/x86/intel/pmt: decouple sysfs and namespace
Date: Fri, 16 May 2025 11:04:15 -0400
Message-ID: <20250516150416.210625-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516150416.210625-1-michael.j.ruhl@intel.com>
References: <20250516150416.210625-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PMT namespace includes the crashlog sysfs attribute
information.  Other crashlog version/types may need
different sysfs attributes.  Coupling the attributes with
the namespace blocks this usage.

Decouple sysfs attributes from the name space and add them
to the specific entry.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c    | 12 ++++++------
 drivers/platform/x86/intel/pmt/class.h    |  2 +-
 drivers/platform/x86/intel/pmt/crashlog.c |  3 ++-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 7233b654bbad..7404807c3943 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -284,8 +284,8 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 
 	entry->kobj = &dev->kobj;
 
-	if (ns->attr_grp) {
-		ret = sysfs_create_group(entry->kobj, ns->attr_grp);
+	if (entry->attr_grp) {
+		ret = sysfs_create_group(entry->kobj, entry->attr_grp);
 		if (ret)
 			goto fail_sysfs_create_group;
 	}
@@ -326,8 +326,8 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
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
@@ -369,8 +369,8 @@ void intel_pmt_dev_destroy(struct intel_pmt_entry *entry,
 	if (entry->size)
 		sysfs_remove_bin_file(entry->kobj, &entry->pmt_bin_attr);
 
-	if (ns->attr_grp)
-		sysfs_remove_group(entry->kobj, ns->attr_grp);
+	if (entry->attr_grp)
+		sysfs_remove_group(entry->kobj, entry->attr_grp);
 
 	device_unregister(dev);
 	xa_erase(ns->xa, entry->devid);
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index b2006d57779d..6b3455a86471 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -41,6 +41,7 @@ struct intel_pmt_entry {
 	struct telem_endpoint	*ep;
 	struct intel_pmt_header	header;
 	struct bin_attribute	pmt_bin_attr;
+	const struct attribute_group *attr_grp;
 	struct kobject		*kobj;
 	void __iomem		*disc_table;
 	void __iomem		*base;
@@ -54,7 +55,6 @@ struct intel_pmt_entry {
 struct intel_pmt_namespace {
 	const char *name;
 	struct xarray *xa;
-	const struct attribute_group *attr_grp;
 	int (*pmt_header_decode)(struct intel_pmt_entry *entry,
 				 struct device *dev);
 	int (*pmt_add_endpoint)(struct intel_vsec_device *ivdev,
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index dba7e7c1585d..c9bfe1c26311 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -307,6 +307,8 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
 
+	entry->attr_grp = &pmt_crashlog_group;
+
 	return 0;
 }
 
@@ -314,7 +316,6 @@ static DEFINE_XARRAY_ALLOC(crashlog_array);
 static struct intel_pmt_namespace pmt_crashlog_ns = {
 	.name = "crashlog",
 	.xa = &crashlog_array,
-	.attr_grp = &pmt_crashlog_group,
 	.pmt_header_decode = pmt_crashlog_header_decode,
 	.pmt_add_endpoint = pmt_crashlog_add_endpoint,
 };
-- 
2.49.0

