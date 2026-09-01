Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D97B4A2049
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 19:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290877; cv=none; b=uQ59mDLsnqgH8bHgUzkvKBcFqXOPkipfNNtP1qRzdurimiFJcfy1tmjV8T5+mNTZB8NjgTKpjqj4WcbOsrsCUu6jr7AXUXVK0grg4WPB0SNfmtHFyB1hgdVo06QQAW32CZ9bl5WJwoEUXXl4+joSqjx8KkMf5m9hT839Fc06qdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290877; c=relaxed/simple;
	bh=C9qUbqxtsoplUxq3BM5BwqcgPbGIhj11gz0jI+/Ruko=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JvfRDR11UpAp63R2V6E/dXqQb1zzJQxaj78Ft+5j7NoSX56zzb76Ss4opxD82DsIlF0EvsbT1J3j23xds+YFz5lm6mXWjD6Baax4ZMKFiO9+ylxS1oLd5vx9ByBwPt1oj92sKZcoYYiaXIg/+EVmFfnzMANhHRF00lgyqEMBeBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yi58SP+w; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yi58SP+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788290875; x=1819826875;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=C9qUbqxtsoplUxq3BM5BwqcgPbGIhj11gz0jI+/Ruko=;
  b=Yi58SP+wfLNYii5sMbFrcwh/H/EU+ic1jKkUApFGEZExG7EJIAsxGbP4
   H4c4o036QT2jzJpw3FooTxZGkmwi9LRavjR7urQhRH4wIwaBZsHcRXwqH
   8DTytpMJRASYU1FOLkXxbGgRqS7Z0Ytvja950LjAAXScT/AjsNuUcrmsp
   5pgNd2uqEWvDAFBp6g7o+6RiQjHVStTlyLmALVzzsquGrNYbkMorlz+MM
   dzyhdVufj/M/uXbabCXUcuLz6/8izGDm7sGrUPBmUj5XQ1Lr8KNrJ9E16
   hJamrkCAjm8260LonCqdVMqCRxS5pQ51A0iUSdA/rIL1qvnL/pFTTks3f
   w==;
X-CSE-ConnectionGUID: pWJyems5RwSCkCUsphlXog==
X-CSE-MsgGUID: ZCh3G9G2TnmAFW5ScTNq5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762482"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88762482"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:55 -0700
X-CSE-ConnectionGUID: b4MvIHZLSG67yg+4m8Z2MQ==
X-CSE-MsgGUID: g6pEH/OLQZew8wUhiol3xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="269776736"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:55 -0700
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
Subject: [PATCH v4 06/18] platform/x86/intel/pmt: Do not remap when using callbacks
Date: Tue,  1 Sep 2026 12:27:41 -0700
Message-ID: <20260901192736.626777-26-michael.j.ruhl@intel.com>
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

A callback indicates that the parent driver is responsible
for accessing the data area.  Creating a PMT memory remap
is redundant.

If a read_telem callback has been provided, do not create a
remap.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index af7c951b569a..350129121ff1 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -373,7 +373,6 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 				  struct device *parent)
 {
 	struct intel_vsec_device *ivdev = dev_to_ivdev(parent);
-	struct resource res = {0};
 	struct device *dev;
 	int ret;
 
@@ -403,14 +402,18 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 	if (!entry->size)
 		return 0;
 
-	res.start = entry->base_addr;
-	res.end = res.start + entry->size - 1;
-	res.flags = IORESOURCE_MEM;
+	if (!is_cb_read_telem(entry->cb)) {
+		struct resource res = {0};
 
-	entry->base = devm_ioremap_resource(dev, &res);
-	if (IS_ERR(entry->base)) {
-		ret = PTR_ERR(entry->base);
-		goto fail_ioremap;
+		res.start = entry->base_addr;
+		res.end = res.start + entry->size - 1;
+		res.flags = IORESOURCE_MEM;
+
+		entry->base = devm_ioremap_resource(dev, &res);
+		if (IS_ERR(entry->base)) {
+			ret = PTR_ERR(entry->base);
+			goto fail_ioremap;
+		}
 	}
 
 	sysfs_bin_attr_init(&entry->pmt_bin_attr);
-- 
2.43.0

