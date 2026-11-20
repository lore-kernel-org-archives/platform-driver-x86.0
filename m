Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208164;
	b=MjlqgDaexs01Cgg3YqNa0t14mnD1XOSw2uUkMiy+uul1p29cikkzoPcQOcNbA0/SnJzr
	 7fhjaBEG/vzCraQyKon8KvFnkD80UJ6gr0xE7NliqDO/g/d2d81qJYiwv6idGR8bJ4BHV
	 G4ng+01PJZKFh08QzuLAwn70SKR+iCF1AUju8bpwBHjWOYhL1jqJZ539qGMhIQA9OpPp3
	 Qz5683JO0IAU3y5mTlBr6reF1QtYpxedSZMIYNp0x7Ys2xmLWSqPkLSDH56PcQvy1ENBc
	 k9dnbtXdGe3UOQlpKUyZE4tb1Ghx53z/QiUrXVGO54s7cH6/6QmWz0YrxcnqClA7+Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208164;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zcIhMhLvqz1V7EZaXdVU5C4RHSq/J9OX65mpQmpvZGE=;
	b=fhWY9Zh3/2bdrnXD7eMO6UhN8mUFz6GByCX8hQnrX81VR0y2xe9Za5lMBsXyq+IIkFyf
	 AAc3zACUqd7l8DuMP/1rr+x4ZDZKdTH6yFW85tDNSf5n36YgUivqRPDm0ABV1mWClBRA0
	 0XtGrfCYBpXe//868xmFLdS5oZ6fgneNMrPnLYQ05KtdWPmDHmcc/5BwuM+emMV8i/EaU
	 tKHfcTue+5nXcZLnf9xZ4PuTaal3ZP9YXNb7bz3NZZcu4f4kHI1zdJLM7QsX7QvRxJXpD
	 KvDktlj89cFq4M58tb3n2RfuUNo+InTfN8yVFI6TPxmbji3vgRhPeRuFJp0OV4TERfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TxsvZGR3;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673E606A6B6
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D673E606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TxsvZGR3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208161; x=1826744161;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ezlzVcHtVeoHglV01p3bjkxy2KglS2VRWAzc2hftpZw=;
  b=TxsvZGR314UGKAHqopqYOf4whUse4AqQYBs4mVmlmRuOjNz6WoEzwh9H
   qIuiSHL6LXHdLQj1ciFFvAf2S4lLoN8TD8ISel6eD2o2Pz79A1gb1ju7s
   S7b76np0ox3NYm0a/dtalwtTywgX0oT1aROOLQRlRcDK5S2cLaEp+NAD7
   B929SHS5ZiNXTlexdGS0okQDkNz2XGcEXx3QhzkUGAaz9bDZJnCTw4vkq
   npbwg4Z5wuU/uzY2c5WXJo9qVQk+sgSC4pd5/2BwgQt+daBeLjPkLphxz
   4bjkFNHAe8Z6SKo8APYFDfw6X1qpa9uVrJLMlvxiw5dLbzKh5r+uzLdg8
   A==;
X-CSE-ConnectionGUID: XJOOePQTS/eGkV4Ba1ftBQ==
X-CSE-MsgGUID: V9lcBs1+TGuTkWohd/G7hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136375"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:50 -0800
X-CSE-ConnectionGUID: HaGhK4TmSM+LpX14UsZxmw==
X-CSE-MsgGUID: HDebiBIvRMiM4+EP+5F0/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10908709"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:48 -0800
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
	james.ausmus@intel.com
Subject: [PATCH v21 07/19] drm/xe/vsec: Add DOC text for VSEC
Date: Fri, 20 Nov 2026 12:55:47 -0800
Message-ID: <20261120205540.1220643-28-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the necessary files and text to use the DOC system.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 Documentation/gpu/xe/index.rst   |  1 +
 Documentation/gpu/xe/xe_vsec.rst | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.c     | 24 ++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_vsec.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 497a0a4b12f6..de829aecf8f1 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -37,3 +37,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
    xe_gt_stats
    xe_sigid
    xe_pci_error
+   xe_vsec
diff --git a/Documentation/gpu/xe/xe_vsec.rst b/Documentation/gpu/xe/xe_vsec.rst
new file mode 100644
index 000000000000..1a87548489ea
--- /dev/null
+++ b/Documentation/gpu/xe/xe_vsec.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=====
+VSEC
+=====
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
+   :doc: VSEC
+
+Internal API
+============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
+   :internal:
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 38081dacd307..082b25b017db 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -19,6 +19,17 @@
 
 #include "regs/xe_pmt.h"
 
+/**
+ * DOC: VSEC
+ *
+ * Some GPUs support the PMT feature.  For those that do, this API provides
+ * probe, discovery and usage (control and access) for GPUs that have PMT.
+ *
+ * PMT is usually accessed through a PCI function.  However, that is not always
+ * available, so the PMT intel_vsec_register() function can be used to set up
+ * PMT usage.
+ */
+
 /* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
 #define BMG_DEVICE_ID 0xE2F8
 
@@ -140,6 +151,19 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return 0;
 }
 
+/**
+ * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a buffer
+ * @dev: valid Xe device
+ * @guid: PMT GUID (from the PMT discovery struct)
+ * @data: buffer to place data in
+ * @user_offset: a user offset relative to the beginning of the data to read
+ * @count: bytes to read
+ *
+ * Return:
+ * * -ENODATA for incorrect power state
+ * * -EINVAL for unsupported PMT feature
+ * * count   number of bytes read on success
+ */
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
 		      u32 count)
 {
-- 
2.43.0

