Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CD0189B8C
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jul 2025 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752427815; cv=none; b=VJnP/nljKKXXavc2NxctlE2WiUQg/oknaBjnEh8hNb8syg1zHHj3b/YkTTSBSd7Oq14ySpFx2kDzaQ8gnUaZeCbgQIs2M+5ONP/yhHzMvOzfDqVvMisNw1C+Ju3mjWMfVYcOB0j2ww5ei9ocVJtw21w5L+KgEmPYQsRHOfVFmJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752427815; c=relaxed/simple;
	bh=c4bzE6SLVin2A91eA3ifvGtrmu7myvbZoSsDr0AZJ/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMs/f0l/50SAbJn7vKq0unbIYQgXN9VqABThgvqb11lHMvA/E0sLPD2/myDCpuhNYsj1q+dD/AHdoRf6DQmt+j4qeyyMpyzZX6pXCjmfK2KV0DEDTO8JHg2Dbh7iAB37iZqAF4anvZmcHYSLbgNKOW3S0jB4F+tgST+noIsMLTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEcpcUpD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEcpcUpD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752427814; x=1783963814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c4bzE6SLVin2A91eA3ifvGtrmu7myvbZoSsDr0AZJ/8=;
  b=kEcpcUpDajk8Bh3HrpRP8goysswK0tGm4yR1T0k9zTcVohKAEAO/H2ku
   X/4iQe7/bf048o44rLLqduHk/16Nsnsc9TML/YVT8mlfyDBh3coJxoAQT
   TUNpt1tJUzJA6MX6LPInnFjLXlo5W5pJVV5n64WlAV7sSYhZk8xFodGTe
   ptEznmuedi7ibqqVgMjynrohOIUw7t3YtBeR0AD5NOF7uKTrEm4BNC05D
   cpyUKVgwQzj3D2K7hli8xsY05X727jo333bnQPUOBz9LbwPQgcWVApJRk
   Uh1N3PgJLa4UClvZ2P0UT0QKOIazm84OwwaDet4Pv4JQIEUBy4aYQ12f3
   w==;
X-CSE-ConnectionGUID: EByhzS24Q8m6rx5kyimcjw==
X-CSE-MsgGUID: WU509MXsQSu4KiEgkAUUww==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65334153"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="65334153"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:14 -0700
X-CSE-ConnectionGUID: vd7CkE7BT0OqctLmgtxBzg==
X-CSE-MsgGUID: Hc1JMPlOSaC5QSx1xZfS/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="161069343"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.19])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:13 -0700
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
Subject: [PATCH v8 09/13] platform/x86/intel/pmt: decouple sysfs and namespace
Date: Sun, 13 Jul 2025 13:29:39 -0400
Message-ID: <20250713172943.7335-10-michael.j.ruhl@intel.com>
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
2.50.0

