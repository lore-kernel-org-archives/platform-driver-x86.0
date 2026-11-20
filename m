Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208172;
	b=lRcsszHBC4jMs33D6OTf/daC3JLp609HloWVJFZH5XckGCnxbqM7M3dijS84kQFiSzTs
	 it/1+q+Y35mbY4dQEYiMqjOxJf3j78Y6eZlIyn2dfhRN9Tz1BeRAZ7i3LcT/eGAbwLBMx
	 yS4xOexzO2boOkBM6oY78kd+lCXPU6lkDTW2DimOvrt9raBgaw2LYEAwax6BhoeKMLCKp
	 Ep8xlbYaIv1A3T+jZkh+NYXrVmF7mluHzdlWPz6eCnF/WWfZP4cwv70CP8qSBvUZ3DxqP
	 9aMIfKrah2OqNDvPP7ujdIHPX+4sH1XUJbXcfAPzv5wtHIxSgksFeVQjQ3xJRjsJ0RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208172;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zHE1KXB2q/JdQGCUsfq40v7xe4dEzeFr01b+8tBDj8I=;
	b=3aYe2cwWOFZmQSxByheGSHaQqasaXjPDwHp7q5Y5ktFARpaTsciop3Ct8UpxlPLJzLSs
	 hIHes98am0boDi5ZX/whK8X55RXQx5BYYO46Ay2SI5C9tz+HhrMnMzszgoZwVpVltHkxM
	 VRZibyvPatV2NUkrkoMog5C/bw+zNVIXz6z/hEFiSWgQp+uynpSnEsRxL7uHUATLpJiOj
	 hZUKLJc98xRqT52SlOTDyG+yIWMo9FGQI5H7jEBVDZpqZqTqTJRVvwW9zZjoMBkek/VRV
	 8hIzXRj/uLoNHNovN9eusiGC6qiRoyOLIcG1N7bgI4JFm7RAT/+i0yCCWkLx4+PEO1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eWjtNEjA;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B7C606A6BF
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B7C606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eWjtNEjA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208171; x=1826744171;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4xF1evHpyznKiMIzsTeSc2qiff37ofUk6whKxWvMSsM=;
  b=eWjtNEjAbNfZ7smFdU4mJ5m1gUxW4v4mhBSaELX7Wh97wTZ5l98xiypp
   aW8+h17w1Rs8BQlwbqKd0IP06Ea8dfDGqFq24FyKZxMekCp3SUfwSFzf6
   ijcXPLUyn9s2g7nfUQeneR4/gl+EZlBCweTnAQs+u2ieTCUizbS7m5AdM
   YO5Pih2gZgM19gO48pbnYvQnvvM3ndL3HB9pajJ3tvmtdT7zbQUwXMIcy
   HeZC95k44fQSELh5oPjg/AbvjDmB4vfZZkBl6AEgIycrivSBs9qD7veGm
   OBZLlI2JVLx+0yHnvudSM9s0tqVyvbEuYAQIdk1sW+9nyyw7t8UV1Q1MR
   g==;
X-CSE-ConnectionGUID: ZKHlxu67ShW6kuFVIS12kQ==
X-CSE-MsgGUID: 0r2qpevhRA6VK3koaiMLqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136389"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136389"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:51 -0800
X-CSE-ConnectionGUID: xh9d9qEfSz+dfK8E933qyQ==
X-CSE-MsgGUID: P2tqvsb3QF6wzlpppz7K5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10908718"
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
Subject: [PATCH v21 10/19] drm/xe/vsec: Update VSEC probe order
Date: Fri, 20 Nov 2026 12:55:50 -0800
Message-ID: <20261120205540.1220643-31-michael.j.ruhl@intel.com>
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

Both debugfs and hwmon access the PMT data area before PMT is
initialized.

Hardwired offset usage allows this to work by accident.
Upcoming changes will break this usage.

Re-order the probe steps to initialize VSEC before the other
features are initialized.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index eafc66d686e2..e9a9634744ae 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1092,6 +1092,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_vsec_init(xe);
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
@@ -1102,8 +1104,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_hwmon;
 
-	xe_vsec_init(xe);
-
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_hwmon;
-- 
2.43.0

