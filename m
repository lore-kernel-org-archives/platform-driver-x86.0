Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AB71FAEF6
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Nov 2024 13:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731589456; cv=none; b=m6cxX2DHqyanO+N5FE5/RDT9ir9JMRZ0NvMm3FXCPcXYBoJQmCnrJgx65QRXLpJaTQPy3V7Sn86+AffgIXswMpFKtF6ICLu6jMMk1PP37JXpR9CjENTvS8piyfE0TqAgLRR3UHsy66AV46DRDxQ9PxZV4AdKAjc+3CD54skOspw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731589456; c=relaxed/simple;
	bh=QBgH44q6yCMVUiBmOzAq9pIlly2WFxTtqaFnpbJVyQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxIo1v8dd0Jv7vHFWRhqrmjSig4dyc6zDnUzz2KWbAG7GX7lgV/UUaAJaSmkp3kyPArgBxAgrKi1l7Hu/83GsMjNkyz2jT+WmQhfu+mlbCVxnWcFG7kSpI+ZDtPjbwAd/e+5D/Ak+bjQrE4P86labXDq/hzqhsmJm2pptIRsFks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSsh3avO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSsh3avO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731589454; x=1763125454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QBgH44q6yCMVUiBmOzAq9pIlly2WFxTtqaFnpbJVyQ0=;
  b=OSsh3avOhIrglUvrnDnt+kk6lhEkhesTzYXN3pJrAvYOR9+qXbalECXy
   9nJI1NAvN0Y8LY0+6TC1QNAqBgkMubQoaItlhsh/KOsn5QHsYTdlsrAo4
   A12IQiXM4kimjNetLuzYj3tMYjR5XKid2dRKhr9FXvai/DnyMJ42dlYxz
   +wWOJinz3LPie3OHsSBhbBZay1MMXWvZuSOXMnaXg8/2jYwX5PoiCLifa
   neHf5YsPQiYUCjNKsi36s5COtypDAlOcRl+x6csQhxg+Zt7TTuKxtBBjd
   ka+HJLssZ7VLOzFB9W5LrqbymDORlXUvWwZ7w/mPx8zv3rBhB1uLS+bJZ
   Q==;
X-CSE-ConnectionGUID: ClWSXT0nQAeYQy3dYVK4vg==
X-CSE-MsgGUID: tc+jEeTFTvGn1g8HkvjD7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35320459"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="35320459"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 05:04:14 -0800
X-CSE-ConnectionGUID: QzVUV+YJRY+3tQczoXM7Pg==
X-CSE-MsgGUID: 0hdO6W79R0yp31dgEEAqbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="88597781"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 05:04:13 -0800
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
Subject: [PATCH v3 1/2] platform/x86/intel/pmt: allow user offset for PMT callbacks
Date: Thu, 14 Nov 2024 08:03:57 -0500
Message-ID: <20241114130358.2467787-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20241114130358.2467787-1-michael.j.ruhl@intel.com>
References: <20241114130358.2467787-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usage of the telem sysfs file allows for partial reads at an offset.

The current callback method returns the buffer starting from offset 0
only.

Include the requested offset in the callback.
Update the necessary address calculations with the offset.

Note: offset addition is moved from the caller to the local usage.  For
non-callback usage this is unchanged behavior.

Fixes: e92affc74cd8 ("platform/x86/intel/vsec: Add PMT read callbacks")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c     | 8 +++++---
 drivers/platform/x86/intel/pmt/class.h     | 2 +-
 drivers/platform/x86/intel/pmt/telemetry.c | 2 +-
 include/linux/intel_vsec.h                 | 3 ++-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index c04bb7f97a4d..c3ca2ac91b05 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -59,10 +59,12 @@ pmt_memcpy64_fromio(void *to, const u64 __iomem *from, size_t count)
 }
 
 int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
-			void __iomem *addr, u32 count)
+			void __iomem *addr, loff_t off, u32 count)
 {
 	if (cb && cb->read_telem)
-		return cb->read_telem(pdev, guid, buf, count);
+		return cb->read_telem(pdev, guid, buf, off, count);
+
+	addr += off;
 
 	if (guid == GUID_SPR_PUNIT)
 		/* PUNIT on SPR only supports aligned 64-bit read */
@@ -96,7 +98,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
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

