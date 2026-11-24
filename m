Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480749;
	b=QTVF4VGxh7DkaSwfevQCnmr5vwFIm2zqYloTiAweYJ9WOOJE6/A1YYPMfL+3zzoJS6f+
	 p9EZJGusXZu2O/xNy/wEis/yIaoJaKKzA26N+6YnPHT+Lj25yqqtVLPZerAhRkKGxn9/r
	 pMCElIpvengq6W0iUR6Sby54MwfhNY1Mrv+6mV5kVQukffBAbTQYK9IKk+kweDi9h3vMF
	 e+HIdUU8vaE521lp2nEecieEuEmR9sDElSXIhUB+jdPK5NJJa7ylnog6tJnVyhB5mYFsc
	 zAb2Vxr8TrTgvinNnQn+4yvx56MN1pFU36UB/AOyNh+lHMqd9HulbC/Q7FlPfw8R2sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480749;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zcIhMhLvqz1V7EZaXdVU5C4RHSq/J9OX65mpQmpvZGE=;
	b=ygu2JD32U/eL2bdJ5YwUrXNbShyvjz1ZHlOjfmpxCpjcuIG9rvLjewnWtOjkSrcpsRNc
	 EIcrreoEOaA/vTzOboAbKXE5yKofHFDhr28Y0NjMeuzocNJ3BjhZbuxRTNCDEbBxDIVEC
	 iRqnCo878Mqq+lhNaOuXR3oMY8VU0PnjzlBOmQDl3h5MsEvon96T7FnJdLpUL20utRJYp
	 GGNWIzaSdU2k0nz9OLPjQZW7o/sevx1VpLJ/gGX5dQ3DG4yyFZzUtHaJV937GHdTmgTSl
	 oIXEPYROORjnBAP3aA7AXnlAREoHcyTQWggbgLMqN99rdESjealcVnXF/uYKOaKoX9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l+PXguhG;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F9D606A32E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16F9D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l+PXguhG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795480749; x=1827016749;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ezlzVcHtVeoHglV01p3bjkxy2KglS2VRWAzc2hftpZw=;
  b=l+PXguhG6L85nzBboPXIiaBmRU+Gjn5zCW7VoGfvcEjHxgeo8zVzMaOf
   Emd/26yC4+N057VxkXCpPRam65CpJF8yEqycoLNzAIGvZsif/Q20aIMyN
   9g6b6jOdu7qVY/muLdqzO9a2oqyZ0lRM9/VDTgtn+XYF8Z4x8RlS66kwN
   E6p4hsFhoZA1hHkgc0tb5wC7csaAh4z7MqpI3AklkpNqr+Wb6DMkmS4Ui
   lK8iMz7DlnfQWEq7AG4IkULYk0cqc05b6dX7ItlyTCSm0jssa3Svg4GH0
   WPTZKEKFCuHfC9bvmK9GIZ0NIY4REINuBbKq3Uibb35z4d64GPvE8CZK0
   A==;
X-CSE-ConnectionGUID: X7/dPAvKTkSvmLeiZsGxhw==
X-CSE-MsgGUID: fyUbKHu+R0avPpz9Faspsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4332852"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4332852"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:05 -0800
X-CSE-ConnectionGUID: PkebOAZUS8eyuSdVhGhjSQ==
X-CSE-MsgGUID: qjxu1OM1QaymydoDgU9EQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11805749"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:06 -0800
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
Subject: [PATCH v22 07/19] drm/xe/vsec: Add DOC text for VSEC
Date: Mon, 23 Nov 2026 16:39:03 -0800
Message-ID: <20261124003856.4145635-28-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
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

