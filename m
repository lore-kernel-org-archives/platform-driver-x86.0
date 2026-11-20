Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141186;
	b=1d9T3NwcSdzO7dTpIJM0f1Cyr5oO/JOohhYJL5Ov/UhpJ6tSWC+WTwYZTc+eK0lf5Yii
	 REYjc9ESHG8/sC0HjUFrqCWlT1eMgOA+raP7jIqLXD7F4NnNr+im2eXGunQjpLbxcaWWf
	 85cguBhMAi6Qdiu/gKwXoLnZpfylefom4XazZKQjIMqJ1HArRHp4opzbYRZs+PyRQiT8L
	 VrI8PAHaOTD/kfDuj7IOWVZFX/9DVe8Fel8eynUEruLQQc4X2bLwyhEN3miyXw5/+XvfS
	 1Q//Q3U9nuaYFtG+dhJFjIKOUWC5lbFF4yAW72HD0UykBDbaebHVaXYdxGTh4uhRqQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141186;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zcIhMhLvqz1V7EZaXdVU5C4RHSq/J9OX65mpQmpvZGE=;
	b=xbUNqHdrVS+eDNpvRBa7yK8xJe1Uesdx2MUGx7+7tBrtUN1190Z6b+q5Z77XqfJVnMUD
	 N7xF4KsWDUR8QO+L6Rm+rjvaAv0FqY6+skT9MjS72Otae6OgM0C/hORln0Tw+k2ZBF9eN
	 PaYvNyNRz/PvCXLvR0WyRUGtm5qlOBUAUoZyMoPS9dUTY4nuY3+/5Ih/TrOs+Vke23lZE
	 vmCsOQB+34sX8JHq5SRgO5Hmbfn21F+MSOA+CIVHO8CHKqgzUpyL3jm1UrYoBpVnn5IJm
	 osPAMlLsevWdf5IqqRhjWaQ14oahLA8QqdVUHXTNsYtf+9GJCz+0ptS7TIZj7yFESCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DMuJFBwv;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9018B606A32A
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9018B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DMuJFBwv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141186; x=1826677186;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ezlzVcHtVeoHglV01p3bjkxy2KglS2VRWAzc2hftpZw=;
  b=DMuJFBwv6TLRZ3sAx6pzMfm2nRxRfKhoh++1n0nrVRMNJLXFV+PfYqRL
   JpnbpaD79Toww5G2DDMuvqeRfSCMP5AuQtnXoJMaOLCI5Jecr9IQorPKn
   Gkll5LK1j4h/XaA50yGgaYsP07PsAjLdGy8F5633bq5v1Xa/ytIPkJxq+
   iTNsac0854kKMT5yyPCE8X1zXpWAp71JTIjBx6zdhAEeo2Txe3bkb49Ll
   6fF/8NrHbf81Hcf7Pjs3FsVqAUwIiSTd3ZlGsgSvSyizffoDlrbGws7zh
   bb6KGYXOjm/CxEj6nqTMgG+JTlbch9bddHoNRzocLILccJcmuFcKFC+HE
   Q==;
X-CSE-ConnectionGUID: GE99ZK3lQuOUeI3JF/3m5Q==
X-CSE-MsgGUID: g8fLeU55SfadIQAmEAeM6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898420"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898420"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:44 -0800
X-CSE-ConnectionGUID: GGoBUqXARDCvdXZX+oGvlA==
X-CSE-MsgGUID: vEjGiwO7QXWc1kd6RNH0zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487113"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:44 -0800
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
Subject: [PATCH v20 07/19] drm/xe/vsec: Add DOC text for VSEC
Date: Thu, 19 Nov 2026 18:19:37 -0800
Message-ID: <20261120021929.473553-28-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120021929.473553-21-michael.j.ruhl@intel.com>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
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

