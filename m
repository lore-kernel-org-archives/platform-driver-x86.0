Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103696;
	b=xnbo/miXvwALBjwNtb607bk8Zam6GMrRoXJix/J/NvZwdK0jDYgq5Yfrlt+HZH7q5CXz
	 1cy5LRRfBeXqyfw3RfOjfOJQzPYdiM1MLjwfxlaHU0DXDlVTzkaYMvjE/l2gmIVqo7DMP
	 c3JVY6s04fmxNkACxKhHq1vCVNdPfXsKzjG55cf3PqtFHpKvk+CIr67s0nq83iGzTh0X7
	 JIB69nCNC2OjjI98v2h4dCq1IUnKHdsq3ALY5hkMIHH3MSQutBW+Rh03x0AgOcd5ifAtu
	 7dbSWY7pxSzfm5ORK8rnqraaYogyOwg2GU66TLmgwngTHjtnfVeOahExdtJsznR7Csg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103696;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zcIhMhLvqz1V7EZaXdVU5C4RHSq/J9OX65mpQmpvZGE=;
	b=Zeoj+k0HM/qEvGirpBuoI7TU+LtCc6ntR0NWkpb6VMrL1EeHLukLuhfrPSlBKo+x1UWw
	 0m9DHTumtYoBZsQfWin3qTW72EST9u+mqTomadjak6vsPXcYQVmoc+cBd1akVqNhqvM80
	 nDd37ZGHJRbdd82oHD/Sl4IrCO+7HaGKABqNTcXiE5TtuJkZVjRIvWQSqiKESDOog7Hjx
	 YLmigXmozXP+pX/wFv+CjQUoert0nYutiBvlPFTk2pMIF0u6ZH4pwba5VPaHW9LmWju1M
	 IUQaHtbeHjMQNyB3u2kd6q+1ZmD4idxW2xlFMv0xQLOUpJbjNzdjQDLTHIsU43mbkhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VUHnwp1z;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655DD606A330
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655DD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VUHnwp1z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103697; x=1826639697;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ezlzVcHtVeoHglV01p3bjkxy2KglS2VRWAzc2hftpZw=;
  b=VUHnwp1zJXKt1eAbYD9dWHxxRqiV7ccF5FDsogmw2HrG9qBc5IQcLIhi
   DehS6sbOvYgokqY4h125oWsTKw4GQdrvYSkR+wqR+qF08LfDa6gCud2aV
   Hl4DkM+6nBHTO7MemjjZhy4Z2JK1+JgBu7XSJO1b9fefoBVuXameQ4aft
   C7YuHYU1wW556JSOi5EdGCparfygmQe2AW1g+FFXA5uROLdozehftV+ux
   qoeLYzRoCIMmMzXj09COCgvUdOFsX59McGPJDff0eYEvXTTraHgvuK3k9
   gvtp6hPokjFonDavP2h+z3SC3xC+vJ/W0CGkjagN5+Q4c/cWK9YceqBpX
   w==;
X-CSE-ConnectionGUID: EGIgcrmRRku1RZz9wcaRYw==
X-CSE-MsgGUID: pN33YKbLRzKA9LDfCgRt/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3848978"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3848978"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:52 -0800
X-CSE-ConnectionGUID: guHX3vWCS7iz5BzWPO3YcQ==
X-CSE-MsgGUID: 67C6HzaVT7WRoF8MoFbDlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263401"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:51 -0800
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
Subject: [PATCH v19 07/19] drm/xe/vsec: Add DOC text for VSEC
Date: Thu, 19 Nov 2026 07:54:45 -0800
Message-ID: <20261119155438.40762-28-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119155438.40762-21-michael.j.ruhl@intel.com>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
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

