Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAD04F402A
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737495; cv=none; b=CgoNgle7WBAcFMELDwNBZLq16JpkEr1OmjXPjy0JxQlZhy5UBDk5dSK7vF6ahqEVQ7Pj2Xt35whq9Rm+Alk9yQpX3fW5Ip2jfwZVY539ku2G/BkfYOMG89lA5QxjTcTzNIkMiWWBEXUdq3Epi/vodIWDd+1tqYomb4dewXgMi9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737495; c=relaxed/simple;
	bh=SlxVH0UGU4ZV7SIFZac3uz0RReQW3WCUCJlL7yXCJaw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZI7RI9QU3EbONETYrlLNALteQ1ja2EZwTz64eiWPzXObwlqIY/6hBLTCFpwdNdjSVtsHvtR/c8uM6maHzZvJ9sy24FDnt2ruC5CXh2sDLsB7xjw2IniIJhcUayTHTW/MOdnu34AJE0O+8TsO0Yr1z6c5Tdqj/JWeNo2V8H8qtJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjzwelK9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjzwelK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789737492; x=1821273492;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SlxVH0UGU4ZV7SIFZac3uz0RReQW3WCUCJlL7yXCJaw=;
  b=DjzwelK9Na3AC9q/3CWFyiGJXadzmQGkCk05dKUzblzQQX/Ij7/i7VDL
   sKi88zXvdLzF6w8nxy2ZUuk7qW/E0NyM+gbmbdLPtFwPOocB1i8N0yFmi
   Z2OrE0CsuXh4VeTWoHqpo15Q6tGMpws61YDWEu5H5UbRFjHzASI9pIjhM
   aYeRkrg6IDblKtGGICndKySX903yRkU/qCM+egVLYL6kkgD1uVMm/iWLK
   eKmYWBetCrNLOtjazM3XLNwAavE3IRnsVxexZRFxlIjwJ3/F08FPbnz29
   jmVCQi7bFzLMFkryUt7tFsUYr5snc+ydKDCs6Rm1cT7NvuflU1Stsn4Hi
   w==;
X-CSE-ConnectionGUID: wSv9UDCsQvC41q+t5qPqeQ==
X-CSE-MsgGUID: 7jS3dzVCQQek0p5Fj/IdVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89378225"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="89378225"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:18:03 -0700
X-CSE-ConnectionGUID: 7a+JSuxXTgW/kKx+cl1lqA==
X-CSE-MsgGUID: gEONBDXLQU+07RFKr5g3VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270095320"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:18:02 -0700
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
Subject: [PATCH v10 05/20] platform/x86/intel/pmt: Do not remap when using callbacks
Date: Fri, 18 Sep 2026 06:17:56 -0700
Message-ID: <20260918131751.2408883-27-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
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

Enforce API usage where necessary.

Clean up open coded resource usage.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c     | 21 +++++++++++++--------
 drivers/platform/x86/intel/pmt/class.h     |  2 +-
 drivers/platform/x86/intel/pmt/telemetry.c |  3 +++
 3 files changed, 17 insertions(+), 9 deletions(-)

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
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index 953f35b6daec..5423a4dfce08 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -329,6 +329,9 @@ int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32 count)
 	if (!ep->present)
 		return -ENODEV;
 
+	if (!ep->base)
+		return -EIO;
+
 	offset = SAMPLE_ID_OFFSET32(id);
 	size = ep->header.size;
 
-- 
2.43.0

