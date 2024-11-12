Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3962071F2
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 16:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731429056; cv=none; b=V8Ac9U/hTuGN/PX4ygMOFCp/F2ThTfCXbH7AkjX5tkhZOyq9U/54UDggDFid05zefFP0sXv3d/ZnY1F0LGGEfNwldjt2oqCXiJuLfmxNqWNSsnDbT0R2uwvU4ZMbIU6A5FlovE2i679RPQ9y+O5m5XlMftE/BAU+rUHzA9sGg+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731429056; c=relaxed/simple;
	bh=rGCykQZe9WKOfZ0UwYQ9blUqvdNNb9hi6OzeIQ+MyVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mw2FXWX3IXdQBW1Fg7r/wXTmkr4BW3FHLWZmcd5o1LrnuYxkloyTY0aHc/hlljJlq0AUuSOGyEoIXUlU4be8TDGRLJbwavuC7dHBSqjAL1Bmz1eB4JHg2NCC3DQlYBtyM763ZP070/+CivJncQwjimhY2RhAci96HP5RImuNaAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMmCrHH9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMmCrHH9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731429054; x=1762965054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rGCykQZe9WKOfZ0UwYQ9blUqvdNNb9hi6OzeIQ+MyVQ=;
  b=jMmCrHH9jlCdtj3sl+fR5imraHgU5ChKw61M303QdyjOzBPYJngruI+4
   8PoyQ0anL3IgBO7alLYVISQYLRkSKudWzPgBKqJ1s2Bu/sVXSa1szX77Y
   O7VX0XnPQCcuGjvVI+7fns+mp/852vT3opPXgevpdKqq1lTt/Kcwunija
   PXH9L2L5PsDSV1RkdPDq+tzInjuFvRIB+yRcp0JNc9DRHhNuXWphM+1PC
   p6ZH7FPkseptwPw934lwhGBSf1xM/hJa70GiEX94mTvAGamqFtD07LG+/
   +y6rcDir/kTbY4LAqRLkbcQSWCjSGtSYW4FVqkP3KyUTc+KcVwO1be68w
   Q==;
X-CSE-ConnectionGUID: OAyIhwPwTNOJw5jD/sbvWQ==
X-CSE-MsgGUID: xvlD32HXQ4ywo8kh4WhopA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31446450"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31446450"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 08:30:53 -0800
X-CSE-ConnectionGUID: V95RRCkDTzmOsQhrihVpHw==
X-CSE-MsgGUID: h0/fnVgsQrmOhxG7GgryQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92495838"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 08:30:52 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	rodrigo.vivi@intel.com,
	lucas.demarchi@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v2 1/2] platform/x86/intel/pmt: allow user offset for PMT callbacks
Date: Tue, 12 Nov 2024 11:30:34 -0500
Message-ID: <20241112163035.2282499-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usage of the telem sysfs file allows for partial reads at
an offset.

The current callback method returns the buffer starting
from offset 0 only.

Include the requested offset in the callback.
Update the necessary address calculations with the offset.

Note: offset addition is moved from the caller to the local
usage.  For non-callback usage this unchanged behavior.

Fixes: e92affc74cd8 ("platform/x86/intel/vsec: Add PMT read callbacks")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c     | 10 +++++-----
 drivers/platform/x86/intel/pmt/class.h     |  2 +-
 drivers/platform/x86/intel/pmt/telemetry.c |  2 +-
 include/linux/intel_vsec.h                 |  3 ++-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index c04bb7f97a4d..657d72b9e675 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -59,16 +59,16 @@ pmt_memcpy64_fromio(void *to, const u64 __iomem *from, size_t count)
 }
 
 int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
-			void __iomem *addr, u32 count)
+			void __iomem *addr, loff_t off, u32 count)
 {
 	if (cb && cb->read_telem)
-		return cb->read_telem(pdev, guid, buf, count);
+		return cb->read_telem(pdev, guid, buf, off, count);
 
 	if (guid == GUID_SPR_PUNIT)
 		/* PUNIT on SPR only supports aligned 64-bit read */
-		return pmt_memcpy64_fromio(buf, addr, count);
+		return pmt_memcpy64_fromio(buf, addr + off, count);
 
-	memcpy_fromio(buf, addr, count);
+	memcpy_fromio(buf, addr + off, count);
 
 	return count;
 }
@@ -96,7 +96,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
 		count = entry->size - off;
 
 	count = pmt_telem_read_mmio(entry->ep->pcidev, entry->cb, entry->header.guid, buf,
-				    entry->base + off, count);
+				    entry->base, off, count);
 
 	return count;
 }
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index a267ac964423..b2006d57779d 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -62,7 +62,7 @@ struct intel_pmt_namespace {
 };
 
 int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
-			void __iomem *addr, u32 count);
+			void __iomem *addr, loff_t off, u32 count);
 bool intel_pmt_is_early_client_hw(struct device *dev);
 int intel_pmt_dev_create(struct intel_pmt_entry *entry,
 			 struct intel_pmt_namespace *ns,
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index c9feac859e57..0cea617c6c2e 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -219,7 +219,7 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
 	if (offset + NUM_BYTES_QWORD(count) > size)
 		return -EINVAL;
 
-	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->base + offset,
+	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->base, offset,
 			    NUM_BYTES_QWORD(count));
 
 	return ep->present ? 0 : -EPIPE;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 11ee185566c3..b94beab64610 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -74,10 +74,11 @@ enum intel_vsec_quirks {
  * @pdev:  PCI device reference for the callback's use
  * @guid:  ID of data to acccss
  * @data:  buffer for the data to be copied
+ * @off:   offset into the requested buffer
  * @count: size of buffer
  */
 struct pmt_callbacks {
-	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, u32 count);
+	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, u32 count);
 };
 
 /**
-- 
2.44.0

