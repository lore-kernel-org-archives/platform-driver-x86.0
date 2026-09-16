Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136F93B14CC
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 20:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589561; cv=none; b=W34cVZ4izGU8Kc9Qs8IoZsDP56ZhGeiGNcoMLkjf/5O0i82EB6fDVitxyItUxQFJiFpSeNNo730BKvX2cp2mGuJLLXLbnEYboZpSjtRR67trY3KseSZE22uKxEMIUfBTOQ6Q+xOF6Zk4iEvM8chmnGbDDx5EZ92AQvE1KYVQ0AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589561; c=relaxed/simple;
	bh=xbb2eJI1bmjXWAuvB0o3q/MNc2BDffpxKLWZUTi+1oo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqadpK2FPEGVQNAUtLVFnLhEaMTgcRep5q5M0vPViKI8GrNJ/QkKB4gSeD8Clqgqsyo/qRB8MeMEdkD4XPx0XtyoM4eBQevvVzFtcejVqJu93O2pp1dJSyXWj+4SnQgAvXg0ifPUn++h59o8O7u7i2M0weDGR8MNHXpD+s5F3Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIV+gSH0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIV+gSH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789589557; x=1821125557;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xbb2eJI1bmjXWAuvB0o3q/MNc2BDffpxKLWZUTi+1oo=;
  b=OIV+gSH0ukXuZklLEpkG6Xy1IlkHx023TCiWLnVpcqfmdwBqqxzYOcr6
   w1GroigIOIGUbqGBnM9CAR2d5zKCM8gLjTxW27V3/4nVTWUqj+3INNin8
   VG8nb4NBNnvcW42SKpM598kIM85jvGuNX8ABulSTR1XANO2diWE/p74H8
   pievW/TeVhT1yP+ZwPsWYps2LpDVFB2pli1CoVKXMaLrpFnMCrWX4lhfu
   qoWW6BNEhfoUI1nhD8yUiZ+q+PGHpuSR9uMexJiQ6UF+++OFfh3GNjlGP
   DHi0QEYv5NXldzqLbPwjn6pfPowqx2j7UHZUG2JIJWnWZgjTEA0jO2a4l
   Q==;
X-CSE-ConnectionGUID: cJpCYkDqQtGqsvmFg0ePSg==
X-CSE-MsgGUID: 18FSH6fHRjmFpxL2a4Otjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100296173"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100296173"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:12:00 -0700
X-CSE-ConnectionGUID: zbcpfJvhRJ68D9yxbk0U0g==
X-CSE-MsgGUID: T2rURzEfTqmp9aXdAl2Ybg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277574019"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:12:00 -0700
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
Subject: [PATCH v9 09/20] drm/xe/vsec: Add DOC text for VSEC
Date: Wed, 16 Sep 2026 13:11:47 -0700
Message-ID: <20260916201139.2374531-31-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the necessary files and text to use the DOC system.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 Documentation/gpu/xe/index.rst   |  1 +
 Documentation/gpu/xe/xe_vsec.rst | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.c     | 23 +++++++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_vsec.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 0247a255f7e6..89f013418cf5 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -36,3 +36,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
    xe_configfs
    xe_gt_stats
    xe_sigid
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
index 1cb9a78ee0ef..ca5d02dce818 100644
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
 
@@ -140,6 +151,18 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
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
+ * * -EINVAL for VF and PMT WATCHER requests
+ * * count   number of bytes read on success
+ */
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
 		      u32 count)
 {
-- 
2.43.0

