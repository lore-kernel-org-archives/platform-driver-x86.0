Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4E9239E86
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Jul 2025 18:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086735; cv=none; b=tn6wncwRmyhXeM0yGxZ6g/AnyiZUKUJMQy+xiLchHJbnGU6+ZtOV2Ry39/q/LFLDryFmagF/3v1aSuYWlL9I7C6KftaZrkjamOKjOXjzSt5OYCmgDPlqszeFRH0jFf96K6TRqv15eH1T7vGbLRG8JG+GFZl9etdk4NoB2wl2f18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086735; c=relaxed/simple;
	bh=c4bzE6SLVin2A91eA3ifvGtrmu7myvbZoSsDr0AZJ/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mrjthuvVm38AnmnjGCYuZyAUmigdidkVUdxtC/LJmc2Bdc745gztp48qD88bX3tsM/5m3GlPg8Zfy8Z9nR/gZlKLtdfhG6l6s8I7Gusmv+Cs0LOYPcCu+pgUoG7CuLxvtHnOssTALyVjt7be3HaJ3TTlZ9WYfPrZhkL476JFkJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S28aB4+H; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S28aB4+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752086734; x=1783622734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c4bzE6SLVin2A91eA3ifvGtrmu7myvbZoSsDr0AZJ/8=;
  b=S28aB4+H0w9QIu68rF546PD++s+q3lhx8Ci2HWwiSttV5nLVIE6OAHqW
   fGZabeKVsuEFXgtqL4wMKDZYjLiT56Ig5ev3uuCll98zSWemRSmP6tTAC
   mXWLvkeaYtk1xnu702Nzo+zUay48CvMxtgygUEZwWKYLaziTt3ms1SLFJ
   BRAXo0QRFfHuHTttk/JkSCS2iwaf05OxsQZNbCaMd/Am+2iKLXxI9bBCx
   IoNOkjmnRdn/hj2fdg3o16wyu8ZXaRKfvBmkOPF35gK/49fkvz3QOexNY
   wCPC9gjV/CoSTuLRR7IBLO2ghpjKg8h+SiqkjDvOnbuVr9RGavG9Ti6JW
   A==;
X-CSE-ConnectionGUID: +1n+gMImSZOSuL/1kgflmQ==
X-CSE-MsgGUID: kTmBszRzQzehNYM8EHPLVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54451076"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54451076"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:34 -0700
X-CSE-ConnectionGUID: AHrhu91wTPiWbPiZHjbIDw==
X-CSE-MsgGUID: j/9hiouGQ1+al5XdUkC3GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161404881"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.221.121])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:33 -0700
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
Subject: [PATCH v7 08/12] platform/x86/intel/pmt: decouple sysfs and namespace
Date: Wed,  9 Jul 2025 14:44:54 -0400
Message-ID: <20250709184458.298283-9-michael.j.ruhl@intel.com>
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

