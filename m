Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173B61C2330
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587439; cv=none; b=vBZUpgWPh10c4RUV3qYmC0vCXqOVDUuDsSZGrvs1dXHHAKJ7eHU2tBaHFMjENNJRvsAzBQbtgrCkV97dD3WTaxp/dNAyOcJpYg/ZK8F5jfHG1AQgtnSLPWT8gTnqufpcVMpdbpu5P89M9ZT8JDXLoUBVVD85uh5sUm6WGu/H7cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587439; c=relaxed/simple;
	bh=PzNioSfRXQpfuHXKkF+ye0zuWnIiOoNw3FQ8TQqipSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RsQeTl1F0vuqMoIKRsTEcWOMtZCXOe0KnMOqUos/TLuWgqTBxVNrpflz+Ga0+iWqAVr5oDXnVnh9AewS2qq908OogOcChfk9k7gRyJ85mGOah7QzjGxkP2KJ5L/jpj86LLg2/u6znLgar23x3nOTQ4RuuiB/uykU70rYbnxVi64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FATJMTZs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FATJMTZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719587438; x=1751123438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PzNioSfRXQpfuHXKkF+ye0zuWnIiOoNw3FQ8TQqipSU=;
  b=FATJMTZsvqdmh0l79wcLPL0uRgAYkUC0fWHQ3eEnIWrWgsILU3ke3gFz
   0/bt4Z5FQ2TYijaRhQrOu2nbqLGXBRAvs7Z/03OibnFvpU8erRcJgkHuH
   f3Z452WWJN+zJREfMjG/Oj/erUjk5GyXQesxg519EFaWtIALpuWCyxAvK
   Z3j3cJjooxPnghPvEHyU9+ZIp35Z9/jKwUOkp86scesIk/4UExamiAkOR
   2PJV2QNhXOo5e3xK+4JEB7EOhNV8GEs4gdBVYuh/kE0Z6X5VvqXWqhEgx
   RTRpq5x5We4hU+JKJ6/jNDpbm3sRwp4P80DO6qb35B1sp8oZMcY/KbQvg
   w==;
X-CSE-ConnectionGUID: /1bebCB5RECcZ8FD3rpNhA==
X-CSE-MsgGUID: hg2E7uHOT4ehY/BerFkttA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27460867"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="27460867"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:10:37 -0700
X-CSE-ConnectionGUID: 8wtfKrOoSC21IB1GrdeX9g==
X-CSE-MsgGUID: MquSr8dwQdOAj00AyvZajg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44848136"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:10:36 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v4 3/6] platform/x86/intel/pmt: Use PMT callbacks
Date: Fri, 28 Jun 2024 11:09:41 -0400
Message-ID: <20240628150945.3363575-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240628150945.3363575-1-michael.j.ruhl@intel.com>
References: <20240628150945.3363575-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "David E. Box" <david.e.box@linux.intel.com>

PMT providers may require device specific actions before their telemetry
may be read. If the read_telem() is assigned, call it instead of
memcpy_fromio() and return. Since this needs to be done in multiple
locations, add pmt_telem_read_mmio() as a wrapper function to perform this
and any other needed checks.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmt/class.c     | 26 +++++++++++++++++-----
 drivers/platform/x86/intel/pmt/class.h     |  8 +++++--
 drivers/platform/x86/intel/pmt/telemetry.c | 10 +++++----
 3 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index d7939b28e937..c04bb7f97a4d 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -58,6 +58,22 @@ pmt_memcpy64_fromio(void *to, const u64 __iomem *from, size_t count)
 	return count;
 }
 
+int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
+			void __iomem *addr, u32 count)
+{
+	if (cb && cb->read_telem)
+		return cb->read_telem(pdev, guid, buf, count);
+
+	if (guid == GUID_SPR_PUNIT)
+		/* PUNIT on SPR only supports aligned 64-bit read */
+		return pmt_memcpy64_fromio(buf, addr, count);
+
+	memcpy_fromio(buf, addr, count);
+
+	return count;
+}
+EXPORT_SYMBOL_NS_GPL(pmt_telem_read_mmio, INTEL_PMT);
+
 /*
  * sysfs
  */
@@ -79,11 +95,8 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
 	if (count > entry->size - off)
 		count = entry->size - off;
 
-	if (entry->guid == GUID_SPR_PUNIT)
-		/* PUNIT on SPR only supports aligned 64-bit read */
-		count = pmt_memcpy64_fromio(buf, entry->base + off, count);
-	else
-		memcpy_fromio(buf, entry->base + off, count);
+	count = pmt_telem_read_mmio(entry->ep->pcidev, entry->cb, entry->header.guid, buf,
+				    entry->base + off, count);
 
 	return count;
 }
@@ -239,6 +252,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
 
 	entry->guid = header->guid;
 	entry->size = header->size;
+	entry->cb = ivdev->priv_data;
 
 	return 0;
 }
@@ -300,7 +314,7 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 		goto fail_ioremap;
 
 	if (ns->pmt_add_endpoint) {
-		ret = ns->pmt_add_endpoint(entry, ivdev->pcidev);
+		ret = ns->pmt_add_endpoint(ivdev, entry);
 		if (ret)
 			goto fail_add_endpoint;
 	}
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index d6f9ccaf28c8..a267ac964423 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -24,6 +24,7 @@ struct pci_dev;
 struct telem_endpoint {
 	struct pci_dev		*pcidev;
 	struct telem_header	header;
+	struct pmt_callbacks	*cb;
 	void __iomem		*base;
 	bool			present;
 	struct kref		kref;
@@ -43,6 +44,7 @@ struct intel_pmt_entry {
 	struct kobject		*kobj;
 	void __iomem		*disc_table;
 	void __iomem		*base;
+	struct pmt_callbacks	*cb;
 	unsigned long		base_addr;
 	size_t			size;
 	u32			guid;
@@ -55,10 +57,12 @@ struct intel_pmt_namespace {
 	const struct attribute_group *attr_grp;
 	int (*pmt_header_decode)(struct intel_pmt_entry *entry,
 				 struct device *dev);
-	int (*pmt_add_endpoint)(struct intel_pmt_entry *entry,
-				struct pci_dev *pdev);
+	int (*pmt_add_endpoint)(struct intel_vsec_device *ivdev,
+				struct intel_pmt_entry *entry);
 };
 
+int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
+			void __iomem *addr, u32 count);
 bool intel_pmt_is_early_client_hw(struct device *dev);
 int intel_pmt_dev_create(struct intel_pmt_entry *entry,
 			 struct intel_pmt_namespace *ns,
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index 3478f891ea0b..c9feac859e57 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -93,8 +93,8 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
 	return 0;
 }
 
-static int pmt_telem_add_endpoint(struct intel_pmt_entry *entry,
-				  struct pci_dev *pdev)
+static int pmt_telem_add_endpoint(struct intel_vsec_device *ivdev,
+				  struct intel_pmt_entry *entry)
 {
 	struct telem_endpoint *ep;
 
@@ -104,13 +104,14 @@ static int pmt_telem_add_endpoint(struct intel_pmt_entry *entry,
 		return -ENOMEM;
 
 	ep = entry->ep;
-	ep->pcidev = pdev;
+	ep->pcidev = ivdev->pcidev;
 	ep->header.access_type = entry->header.access_type;
 	ep->header.guid = entry->header.guid;
 	ep->header.base_offset = entry->header.base_offset;
 	ep->header.size = entry->header.size;
 	ep->base = entry->base;
 	ep->present = true;
+	ep->cb = ivdev->priv_data;
 
 	kref_init(&ep->kref);
 
@@ -218,7 +219,8 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
 	if (offset + NUM_BYTES_QWORD(count) > size)
 		return -EINVAL;
 
-	memcpy_fromio(data, ep->base + offset, NUM_BYTES_QWORD(count));
+	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->base + offset,
+			    NUM_BYTES_QWORD(count));
 
 	return ep->present ? 0 : -EPIPE;
 }
-- 
2.44.0

