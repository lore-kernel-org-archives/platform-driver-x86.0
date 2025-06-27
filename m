Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E532ECEA9
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 20:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057033; cv=none; b=d0OFN9ykCnUbYZQ14/3hwMpb3jHm5zJSwXFU4HvnWbMIspRjx5B5bBvTlh36uv2stg+53NZ+GARaJMg/lEdZR1nxyLNCEdN/oR8R1Pf6wO86iHBh/jphqazB7Ihueqnw9lzht/3cxANeD9KD71+Jmc8403NLLcDsTVXkSZKQjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057033; c=relaxed/simple;
	bh=CihKS5NJnBhrEoRTv/CIRrEnuQiPhP5Os6Kpj4i3pXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vq//155KJqcBWv0Aixv6G2IokgakA+OF1sRnZ8ysi1eHdAxNwNJIL7YsoQxcOuO81dvIZxNAEafkNIUatf3Kx5fZez5dmS8+EwuJ+lEmj5Eo6WBru+hJWTa7dfia0vjYlMeBU9EcG10Vvho82rmwmBsh/EhH43nOuYjtU1UaE0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WuzYvhi1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WuzYvhi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751057031; x=1782593031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CihKS5NJnBhrEoRTv/CIRrEnuQiPhP5Os6Kpj4i3pXk=;
  b=WuzYvhi1GloUeuloLL8D4HsHWlbwS6b24zWNd2cckKFXatE+XA7xwoeV
   ZM0uLqVaww0WBxxjYVtrfefTcvtL2T9ovaIcu0zukib6lsTZxj+LnV5Fl
   oXf3AjmAhi5AQ7FlGQHuFuJfg8eRope1yGprws469lurxqm5cTRxr/t2H
   SnKRemU0gsd8DmIC26802gY/ka6jeHMwZYtciB/YdpCN9lMZ9MfRlw9ne
   cgzA6nT+6hfV+PwgGREoSc8Om1eBVwmWJH9Ll1J3oXY3+5w1684vkRKKY
   5VLGqICZX1RxwpK3Vi51fOajDpEA9lncgTn9AtJth/h3AsQ0+3f/oRpKH
   A==;
X-CSE-ConnectionGUID: csdGyH+7QUydUBOiCxZkpA==
X-CSE-MsgGUID: 6bbTxJUvR7+K2wrgGRZ9xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="41003213"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="41003213"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:51 -0700
X-CSE-ConnectionGUID: EBAWieqWSDachgIL/VXDlA==
X-CSE-MsgGUID: vuqurEl7RFCZA/tsErcwuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="156939030"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.252])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:50 -0700
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
Subject: [PATCH v5 08/12] platform/x86/intel/pmt: decouple sysfs and namespace
Date: Fri, 27 Jun 2025 16:43:17 -0400
Message-ID: <20250627204321.521628-9-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204321.521628-1-michael.j.ruhl@intel.com>
References: <20250627204321.521628-1-michael.j.ruhl@intel.com>
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
index 881f4abdae14..23b3971da40a 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -243,6 +243,8 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
 
+	entry->attr_grp = &pmt_crashlog_group;
+
 	return 0;
 }
 
@@ -250,7 +252,6 @@ static DEFINE_XARRAY_ALLOC(crashlog_array);
 static struct intel_pmt_namespace pmt_crashlog_ns = {
 	.name = "crashlog",
 	.xa = &crashlog_array,
-	.attr_grp = &pmt_crashlog_group,
 	.pmt_header_decode = pmt_crashlog_header_decode,
 };
 
-- 
2.49.0

