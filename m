Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F8C576EB8
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968885; cv=none; b=N17mHLdCLcUk6Y0XPfnyKk2XHkl95xyHWP/g8nZ6TbZi92QJgkVxWn2QUoqmwSXO0PCc+SCi1ktWZfZUJQrU/9t6ke9Yy6Od+Zoovip4jtolQQmHp2I4ujNMzmarqQFC7HykNZW1a6a6iCnt9/fIUriyLePCJSxtkf8OD10LBcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968885; c=relaxed/simple;
	bh=eBL5J7f89MsBBd9MqmgXrNvkJ48CQ9WlCm7J1waO8rw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAlrmOYSwQiTYy0rPv3aIvNWu2EN+YW0+N97TSuoF/U1EXmX/VXC7nxES40caGNV5zD5nZZyveIJogaKI8dJvyW1LozXHJLZ8HoaCcjky80FMBYZfMfm/IEA2X/zo/3dyVuOP4aOWLi1ZrBNEQjsCaHnSyDxtOxQgwwjLpbWt74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=duGT9LQs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duGT9LQs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788968884; x=1820504884;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=eBL5J7f89MsBBd9MqmgXrNvkJ48CQ9WlCm7J1waO8rw=;
  b=duGT9LQsquy7LRmOJeVm7Yqk+diWtXec7UsdPqpPNxgtD+ltPbSt2UEv
   MBdOeZVw7Fv2eDRuLcTG7l6bTxG2Fonep+KC6CCeqqOOQz2xghEN8hfJK
   lIlq5S3xA7tmJHmjyOz86x2ftuxaarvrgTmvRPRBwqOAJ+3ol04xa0rB9
   scZKI9B5HyzqiCQpAn5aUemL3OXHgGR4uEdaW/40uY78O9WqNHnmuGExu
   Q7TOErIc6WLgYvzfHlKnlYT9SwoT3KYoC3y/Zhb694rPlmxjBjIRKimie
   ZNGID5VdI8AWV5eMWMLJx/u3VhkD9/NfOSXib8pfP2WvWtk6tRPsgKeNT
   w==;
X-CSE-ConnectionGUID: RJkIb8blQZ6jTVqmwKh0yQ==
X-CSE-MsgGUID: u2RNaeffQN2e1OTucZoFJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93091832"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="93091832"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:58 -0700
X-CSE-ConnectionGUID: nalylRgoSdirRZyJ9XgkWg==
X-CSE-MsgGUID: 1BklI6p9QWi7cd+NQVoWbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="268102518"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:57 -0700
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
Subject: [PATCH v7 09/20] drm/xe/vsec: Add DOC text for VSEC
Date: Wed,  9 Sep 2026 08:47:48 -0700
Message-ID: <20260909154739.1515514-31-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
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
index 468a221378fa..c0252f5b508f 100644
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

