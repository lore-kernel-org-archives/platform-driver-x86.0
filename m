Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AEF511E93
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Sep 2026 20:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466278; cv=none; b=VXtoOUSTpDox8RoCXFoQPyiy0AqDQDfonHyfrzhx/uvQzrXcMnDuPKFC8G1RtehbQRjmyqNXTZZt2GiOihMOc2w/Tx8a/rjxRuDcSIg0qzmY1o6foabo97EzlfsCu6KEiBVnwOE0gQOVpDQerCo2G0DFcs/CAbAAp4SwjcQiVTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466278; c=relaxed/simple;
	bh=ENsIFl4KQqT2w383gsLyVLqf4ai6kvIMDweMaseKf94=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXxMlRKx6th5kknWah9ZYyzQ8swIgMlcoXNN/uH9X0xcSGbIrRyUyjD3Udu6n5627WzOGFto8TDH3bXF4XnnKBH1ffYqZ/DXtRXVTBYQv2eHCS/8pshRf9MqI5N5yaW3HPAAduMqNaKa/pwX+6ZSzG1gYuDk3fqlTyjm7yRu7OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LC5qq4mp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LC5qq4mp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788466261; x=1820002261;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ENsIFl4KQqT2w383gsLyVLqf4ai6kvIMDweMaseKf94=;
  b=LC5qq4mpLeteHxVqrDNmHDLcYjJPJ3xdQXvYlrvhOjSYMNK+PGBSFXdL
   NrXHwjc9Ewdq9yt8PcJ7u2j6z+egl2bduDmEr1mfjPJzVOXL2ZMTKb7CW
   hRdVQo87A5XnigYDWB2qMRp+RvBgPCcV5aWxtCJygwxcwdiFqZHN9K74Z
   1wN0Pdgc+2KuzCbc0C8PHls80VMYUIbCF5sLyVjCquP8DsrigtDWQmNFN
   giADfVkWvftZRmz7ayg/GES8kwc91WN53tMKLQMZ2xtwHn832Cbd1j3nZ
   ux6B+C26j6e1DsWo/9cdiMrbcFpdeC9xVOilXf/4nxGhHrioWfZcXkT5E
   g==;
X-CSE-ConnectionGUID: /VGLiO8lRZO1N/uUQ84H5g==
X-CSE-MsgGUID: kIqs1eZNSh+so6Y+5/ie+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88994620"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88994620"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:37 -0700
X-CSE-ConnectionGUID: Vm7/jR0YQFu9/97iGeqZyw==
X-CSE-MsgGUID: qVnsWBGISsGVF7k0ltjfkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273348138"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:27 -0700
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
Subject: [PATCH v5 09/18] drm/xe/vsec: Add DOC text for VSEC
Date: Thu,  3 Sep 2026 13:10:11 -0700
Message-ID: <20260903201002.1064889-29-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the necessary files and text to use the DOC system.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 Documentation/gpu/xe/xe_vsec.rst | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.c     | 22 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_vsec.rst

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
index 468a221378fa..5223bfe50ede 100644
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
+ * available, so the PMT intel_vsec_register() function can be used to setup up
+ * PMT usage.
+ */
+
 /* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
 #define BMG_DEVICE_ID 0xE2F8
 
@@ -140,6 +151,17 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
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
+ * Returns -EINVAL for VF and PMT WATCHER requests
+ *         count   number of bytes read on success
+ */
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
 		      u32 count)
 {
-- 
2.43.0

